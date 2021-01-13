$(function () {
    $(".updatePass").click(function () {
        $(".update_tips").text("");
        $(".update_pass").slideDown(500)
    });
    $(".update_Cancel").click(function () {
        $(".update_pass").slideUp(500)
    });
    $(".td_right").dblclick(function () {
        var b = $(this).text();
        if ($(this).find("input").val() != undefined) {
        } else {
            var a = "<input class='height_30 'type='text' id='input_" + $(this).attr("id") + "' value='" + $(this).text() + "'>";
            $(this).html(a);
            $(this).find("input").focus();
            $(this).find("input").change(function () {
                var e = $("#userId").val();
                var d = $(this).parent().attr("id");
                var c = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "cloud_user_updateUserInfo_member",
                    data: {userId: e, key1: d, key2: c},
                    success: function (g) {
                        var f = $.parseJSON(g);
                        if (f.status == 1200) {
                            $("#" + d).html("<span>" + c + "</span>");
                            $("#tips").text(f.message)
                        } else {
                            $("#" + d).html("<span>" + b + "</span>");
                            $("#tips").text(f.message)
                        }
                    }
                })
            });
            $(this).find("input").blur(function () {
                $(this).parent().html("<span>" + $(this).val() + "</span>")
            })
        }
    })
});
