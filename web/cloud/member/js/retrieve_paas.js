/**
 * Created by yuannianqing on 2015-03-19.
 */
var t;
var timedNumber;
$(function () {
    show_hide();
    $(".send_").click(function () {
        if ($(this).attr("data") == 1) {
            $(this).removeClass("cursor");
            t = setInterval("timedCount()", 1000);
        }
    })


    $("#mail").blur(function () {
        var mail = $("#mail").val();
        if ("" == mail) {
            $("#tips").text($("#emailNull").val());
        } else if (!(/^[a-zA-Z0-9][a-zA-Z0-9_\.\-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(mail))) {
            $("#tips").text($("#emailFormat").val());
        } else {
            $.ajax({
                type: "POST",
                url: '/cloud_register_checkMailUnique_member',
                data: {"user.mail": encodeURI(mail)},
                success: function (data) {
                    if (data == 1200) {
                        if (timedNumber == undefined)
                            $('#sendMaiNO').show();
                    }
                    else $('#tips').text($("#emailExist").val());
                }
            })
        }
    }).focus(function () {
        $('#sendMaiNO').hide();
        $('#tips').text('');
    });
    $('#sendMaiNO').click(function () {
        var mail = $("#mail").val();
        $(this).hide();
        $('#sendMaiOFF').show();
        var number = 59
        timedNumber = setInterval(function () {
            $('#sendMaiOFF').children('span').text(number);
            number--;
            if (number < 0) {
                number = 59
                $('#sendMaiOFF').hide().children('span').text(number + 1);
                $('#sendMaiNO').show();
                clearInterval(timedNumber);
                timedNumber = undefined;
            }
        }, 1000);
        /* $.ajax({
         type: "POST",
         url: '/cloud_mail_sendCode_member',
         data: {'user.mail': mail},
         success: function (data) {
         // alert(data);
         }
         })*/
    })
});
function formAjax(formId, ajaxCallUrl) {
    formId = '#' + formId;
    $.ajax({
        type: "POST",
        url: ajaxCallUrl,
        data: $(formId).serialize(),
        error: function (request) {
            //alert("注册失败");
        },
        success: function (data) {
            if (data == 1200) {
                //alert("注册成功，点击确定进行登录")
                location.href = '/message/ok.html'
            }
            else $('#tips').text(data);

        }
    })
}
function back() {
    location.href = "/index";
}


function timedCount() {
    var c = $(".time").html();
    if (c > 0) {
        c--;
        $(".send_").attr("data", "0");
        $(".time").html(c);
    } else {
        clearInterval(t);
        var text = "发送验证码至邮箱";
        $(".send_").addClass("cursor");
        $(".send_").html(text);
        $(".send_").attr("data", "1");
    }
}


function show_hide() {
    $(".retrieve_user_table .next ").click(function () {
        $(".retrieve_box_user").hide();
        $(".retrieve_box_email").show();
    })
    $(".retrieve_email_table .next").click(function () {
        $(".retrieve_box_user").hide();
        $(".retrieve_box_email").hide();
        $(".retrieve_box_pass").show();

    })
}
