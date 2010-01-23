jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function ()
{
    function ajaxPost()
    {
        $.post($(this).attr('action'), $(this).serialize(), null, "script");
        return false;
    }

    $("#new_response").submit(ajaxPost);

    $("#nice_question").click(function()
    {
        $("#question_vote").submit(ajaxPost).submit();
        return false;
    });

    $("#flag_question").click(function()
    {
        $("#question_flag").submit(ajaxPost).submit();
        return false;
    });

    $(".niceanswer").click(function()
    {
        var idx = $(this).attr("id").split('_')[1];
        $("#answervote_"+ idx).submit(ajaxPost).submit();
        return false;
    });

    $(".flaganswer").click(function()
    {
        var idx = $(this).attr("id").split('_')[1];
        $("#answerflag_"+ idx).submit(ajaxPost).submit();
        return false;
    });

});
