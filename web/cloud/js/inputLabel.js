/**
 * Created by mrava on 2015-10-21.
 */

function modifyInput(ids) {
    $.each(ids, function (i, id) {
        var inputs = $('#' + id + " input");
        var labels = $('#' + id + " label");
        labels.click(function () {
            $(this).next("input").focus();
        });
        inputs.focus(function () {
            $(this).prev("label").animate({opacity: "0.4"}, "normal");
        }).keyup(function () {
            var label = $(this).prev('label');
            if ($(this).val() == "") {
                label.animate({opacity: "0.4",marginLeft:"0px"}, "fast");
            } else {
                label.animate({opacity: "0",marginLeft:"9em"}, "normal");
            }
        }).blur(function () {
            if ($(this).val() == "") {
                $(this).prev().animate({opacity: "1",marginLeft:"0px"}, "normal");
            }
        })
    });
}