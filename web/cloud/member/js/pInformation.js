/**
 * Created by yuannianqing on 2015-02-09.
 */
    //个人信息的密码修改
$(function () {
    $(".updatePass").click(function () {
        $(".update_pass").slideDown(500);

    });
    $(".update_Cancel").click(function () {

        $(".update_pass").slideUp(500);
    });


// undefined
    $(".td_right").dblclick(function () {
        var s = $(this).text();
        if ($(this).find("input").val() != undefined) {
            //  alert("已经是input了")
        } else {
            var input = "<input  class='height_30 'type='text' id='input_" + $(this).attr('id') + "' value='" + $(this).text() + "'>";
            $(this).html(input);
            $(this).find("input").focus();
            $(this).find("input").change(function () {
                var userId = $("#userId").val();
                var value1 = $(this).parent().attr('id');
                var value2 = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "cloud_user_updateUserInfo_member",
                    data: {
                        userId: userId,
                        key1: value1,
                        key2: value2
                    },
                    success: function (data) {
                        var jsonData = $.parseJSON(data);
                        if (jsonData.status == 1200) {
                            $("#" + value1).html("<span>" + value2 + "</span>");
                            $('#tips').text(jsonData.message);
                        } else {
                            $("#" + value1).html("<span>" + s + "</span>");
                            $('#tips').text(jsonData.message);
                        }
                    }
                })
            });
            $(this).find("input").blur(function () {
                $(this).parent().html("<span>" + $(this).val() + "</span>");
            });

        }
    });

});
