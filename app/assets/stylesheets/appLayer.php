<?php
session_start();
header('Content-type: application/json');
require_once __DIR__ . '/dataLayer.php';
$action = $_POST["action"];

switch ($action) {
    case "login":
        Login();
    break;
    case "register":
        Register();
    break;
    case "loadComments":
        LoadComments();
    break;
    case "addComment":
        AddComment();
    break;
    case "loadProfile":
        LoadProfile();
    break;
    case "checkForCookie":
        checkForCookie();
    break;
    case 'doSearchUsers':
        searchUsers();
    break;
    case 'sendFriendRequest':
        sendFriendRequest();
    break;
    case 'loadFriendRequests':
        loadFriendRequests();
    break;
    case 'acceptFriends':
        acceptFriend();
    break;
    case 'cancelFriendRequest':
        cancelFriend();
    break;
    case 'loadFriends':
        loadFriends();
    case 'logout':
        logOut();
    break;
}

//CAMBIAR LOGIN
function Login(){
    // echo "hello";
    //echo "\n";
    $username = $_POST["uName"];
    $pass = $_POST["uPassword"];
    $rememberMe = $_POST["rememberMe"];

    $do = doEncryptLogin($username,$pass);
    //echo "hi";
    if($do["status"] == "Work"){
        //echo "works?";
        if($rememberMe){
            //create cookie
            setcookie("cookieuName", $username,time() + (86400 * 30), "/","",0);
            //echo "hola";
        }
        $result = array("message" => "Login Sucessfull");
        echo json_encode($result);
    }else{
        //echo "debug";
        header('HTTP/1.1 500' . $do["status"]);
        die($do["status"]);
    }
}

function Register(){
    $fName = $_POST["fName"];
    $lName = $_POST["lName"];
    $username = $_POST["uName"];
    $uPassword = $_POST["uPassword"];
    $uEmail = $_POST["uEmail"];
    $uGenero = $_POST["uGenero"];
    $uCountry = $_POST["uCountry"];
    $do = doEncryptRegister($username,$uPassword,$fName,$lName,$uEmail,$uGenero,$uCountry);
    if($do["status"] == "Work"){
        $result = array("message" => "Thank you! Your registration was sucessfull");
        echo json_encode($result);
    }else{
        header('HTTP/1.1 500' . $do["status"]);
        die($do["status"]);
    }
}

function LoadComments(){
    //echo "hi";
    $do = doLoadComments();
    if($do != NULL){
        echo json_encode($do);
    }else{
        header('HTTP/1.1 500' . "Was not able to load comments");
        die("Was not able to load comments");
    }
}


function AddComment(){
    $text = $_POST["text"];
    $do = doAddComment($text);
    if($do["status"] == "Work"){
        $result = array("message" => "Thank you! Your comment sucessfully uploaded");
        echo json_encode($result);
    }else{
        echo $do;
        header('HTTP/1.1 500' . $do["status"]);
        die($do["status"]);
    }
}

function LoadProfile(){
    $do = doLoadProfile();
    if($do != NULL){
        echo json_encode($do);
    }
    else{
        header('HTTP/1.1 500' . "Was not able to load profile");
        die("Was not able to load profile");
    }
}

function loadFriendRequests(){
    $currentUser = $_SESSION['uName']; // Who is the current user
    $friendRequests = doLoadFriendRequests($currentUser);

    // If the query on the DB was successful, $friendRequests is an array of friend requests
    // Otherwise, $friendRequests is an empty array

    if(sizeof($friendRequests) > 0) { // this means that there are friend requests
        $response = array("success" => "success", "data" => $friendRequests);
        echo json_encode($response);
    }
    else {
        // There were no results OR the query failed
        // TODO: Separate this into an error and 0 friend requests (BUG)
        echo json_encode($friendRequests);
    }
    // If error:
    // header('HTTP/1.1 500' . "Was not able to load profile");
    // die("Was not able to load profile");
}
function loadFriends(){
    $currentUser = $_SESSION['uName']; // Who is the current user
    $friends = doLoadFriends($currentUser);

    if(sizeof($friends) > 0) { // this means that there are friend requests
        $response = array("success" => "success", "data" => $friends);
        echo json_encode($response);
    }
    else {
        // There were no results OR the query failed
        // TODO: Separate this into an error and 0 friend requests (BUG)
        echo json_encode($friends);
    }
}
function acceptFriend(){
    $friend = $_POST['data'];
    $currentUser = $_SESSION['uName'];
    $accept = doAcceptRequest($friend, $currentUser);
    if($accept){
        echo json_encode(array("success"=>"success"));
    }
    else{
        echo json_encode(array("error"=>"error"));
    }
}
function cancelFriend(){
    $friend = $_POST['data'];
    $currentUser = $_SESSION['uName'];
    $accept = doCancelRequest($friend, $currentUser);
    if($accept){
        echo json_encode(array("success"=>"success"));
    }
    else{
        echo json_encode(array("error"=>"error"));
    }
}

function searchUsers(){
    $friend = $_POST['friend'];
    $currentUser = $_SESSION['uName'];
    $users = doSearchUsers($friend, $currentUser);
    if(is_array($users)){
        // yes results
        echo json_encode(array('success' => 'success', 'data' => $users));
    }else{
        // Query failed
        die("Failed to load query");
    }
}

function sendFriendRequest(){
    $newFriend = $_POST["idNewFriend"];
    $currentUser = $_SESSION['uName'];
    $do = doAddFriend($newFriend,$currentUser);
    if($do["status"] == "Work"){
        $result = array("success" => "success", "message" => "Thank you! Your friend request was sent to ".$newFriend);
        echo json_encode($result);
    }else{
        header('HTTP/1.1 500' . $do["status"]);
        die($do["status"]);
    }
}

function checkForCookie(){
    if(isset($_COOKIE["cookieuName"])){
        //echo "hi";
        echo json_encode(array("uName"=>$_COOKIE["cookieuName"]));
    }
    else{
        header('HTTP/1.1 500' . "No cookies where found");
        die("Not cookie found");
    }
}

function logOut(){
    unset($_SESSION['is_open']);
    unset($_SESSION['uName']);
    session_destroy();
    //echo json_encode(array('status' => "NoizxD"););
}
