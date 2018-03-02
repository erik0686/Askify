$(document).ready(function () {
    $("#homeQuestions").resizable({
        handles: 'e',
        maxWidth: $("#homeWrapper").width() * .8,
        minWidth: $("#homeWrapper").width() * .4,
    });

    $(window).resize(function () {
        $('#homePanel').width($("#parent").width() - $("#homeQuestions").width());
        $('#homeQuestions').height($("#parent").height());
    });

});
