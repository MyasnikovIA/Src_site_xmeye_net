function modifyInput(a) {
    $.each(a, function (d, e) {
        var b = $("#" + e + " input[type='text']");
        for (var d = 0; d < b.length; d++) {
            var c = b.eq(d);
            c.val(c.attr("tips"))
        }
        b.focus(function () {
            if ($(this).val() == $(this).attr("tips")) {
                if ($(this).attr("type-label") == "password") {
                    $(this).attr("type", "password")
                }
                $(this).val("")
            }
        }).blur(function () {
            if ($(this).val() == "") {
                $(this).val($(this).attr("tips"));
                if ($(this).attr("type-label") == "password") {
                    $(this).attr("type", "text")
                }
            }
        })
    })
};
