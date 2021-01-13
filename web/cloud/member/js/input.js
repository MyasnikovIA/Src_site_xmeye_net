/**
 * Created by mrava on 2015-10-21.
 */
function modifyInput(ids) {
    $.each(ids, function (i, id) {
        var inputs = $('#' + id + " input");
        for (var i = 0; i < inputs.length; i++) {
            var input = inputs.eq(i);
            input.val(input.attr("tips"));
        }
        inputs.focus(function () {
            if ($(this).val() == $(this).attr('tips')) {
                if ($(this).attr('type-label') == "password") {
                    $(this).attr('type', 'password')
                }
                $(this).val('');

            }
        }).blur(function () {
            if ($(this).val() == "") {
                $(this).val($(this).attr('tips'));
                if ($(this).attr('type-label') == "password") {
                    $(this).attr('type', 'text')
                }
            }
        })
    });
}