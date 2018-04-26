$(document).on('turbolinks:load', function () {
    // $("#homeQuestions").resizable({
    //     handles: 'e',
    //     maxWidth: $("#homeWrapper").width() * .8,
    //     minWidth: $("#homeWrapper").width() * .4,
    // });

    // $(window).resize(function () {
    //     $('#homePanel').width($("#parent").width() - $("#homeQuestions").width());
    //     $('#homeQuestions').height($("#parent").height());
    // });

    $('.new-post-button').on('click', function() { 
        $(".submit-file-button").val(null);
        $("#name-file").text("");
        $("#preview-image").attr("src",""); 
     });

    $(".submit-file-button").on('change', (e) => {
        var reader  = new FileReader();
        var fileName = e.target.files[0].name;
        var file = e.target.files[0];
        $("#name-file").text(fileName);

        reader.onloadend = function () {
            $("#preview-image").attr("src",reader.result); 
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            $("#preview-image").attr("src",""); 
        }
        
    });

});
