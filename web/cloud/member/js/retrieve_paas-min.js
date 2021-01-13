var t;
var timedNumber;
$(function () {
    show_hide();
    $(".send_").click(function () {
        if ($(this).attr("data") == 1) {
            $(this).removeClass("cursor");
            t = setInterval("timedCount()", 1000)
        }
    });
    $("#sendMaiNO").click(function () {
        var a = $("#mail").val();
        $(this).hide();
        $("#sendMaiOFF").show();
        var b = 59;
        timedNumber = setInterval(function () {
            $("#sendMaiOFF").children("span").text(b);
            b--;
            if (b < 0) {
                b = 59;
                $("#sendMaiOFF").hide().children("span").text(b + 1);
                $("#sendMaiNO").show();
                clearInterval(timedNumber);
                timedNumber = undefined
            }
        }, 1000);
        $.ajax({
            type: "POST", url: "/cloud_mail_sendCode_member", data: {"user.mail": a}, success: function (c) {
            }
        })
    })
    $("#sendPhoneNO").click(function () {
        var a = $("#mail").val();
        $(this).hide();
        $("#sendPhoneOFF").show();
        var b = 59;
        timedNumber = setInterval(function () {
            $("#sendPhoneOFF").children("span").text(b);
            b--;
            if (b < 0) {
                b = 59;
                $("#sendPhoneOFF").hide().children("span").text(b + 1);
                $("#sendPhoneNO").show();
                clearInterval(timedNumber);
                timedNumber = undefined
            }
        }, 1000);
        $.ajax({
            type: "POST", url: "/cloud_mail_sendPhoneCode_member", data: {"user.phone": a}, success: function (c) {
            }
        })
    })
});
function formAjax(a, b) {
    a = "#" + a;
    $.ajax({
        type: "POST", url: b, data: $(a).serialize(), error: function (c) {
        }, success: function (c) {
            if (c == 1200) {
                location.href = "/message/ok.html"
            } else {
                if (c == 1410) {
                    $("#usernameTips").text($("#usernameNull").val());
                    $("#usernameTips").css("color", "red");
                } else if (c == 1411) {
                    $("#usernameTips").text($("#usernameFormat").val());
                    $("#usernameTips").css("color", "red");
                } else if (c == 1440) {
                    $("#truenameTips").text($("#truenameNull").val());
                    $("#truenameTips").css("color", "red");
                } else if (c == 1441) {
                    $("#truenameTips").text($("#truenameFormat").val());
                    $("#truenameTips").css("color", "red");
                } else if (c == 1450) {
                    $("#contactTips").text($("#contactNull").val());
                    $("#contactTips").css("color", "red");
                } else if (c == 1451) {
                    $("#contactTips").text($("#contactFormat").val());
                    $("#contactTips").css("color", "red");
                } else if (c == 1460) {
                    $("#addressTips").text($("#addressNull").val());
                    $("#addressTips").css("color", "red");
                } else if (c == 1461) {
                    $("#addressTips").text($("#addressFormat").val());
                    $("#addressTips").css("color", "red");
                } else if (c == 1470) {
                    $("#mailTips").text($("#emailNull").val());
                    $("#mailTips").css("color", "red");
                } else if (c == 1471) {
                    $("#mailTips").text($("#emailFormat").val());
                    $("#mailTips").css("color", "red");
                } else if (c == 1472) {
                    $("#mailTips").text($("#emailExist").val());
                    $("#mailTips").css("color", "red");
                } else if (c == 1430) {
                    $("#codeTips").text($("#codeNull").val());
                    $("#codeTips").css("color", "red");
                } else if (c == 1431) {
                    $("#codeTips").text($("#codeError").val());
                    $("#codeTips").css("color", "red");
                } else if (c == 1420) {
                    $("#passwordTips").text($("#passwordNull").val());
                    $("#passwordTips").css("color", "red");
                } else if (c == 1421) {
                    $("#passwordTips").text($("#passwordFormat").val());
                    $("#passwordTips").css("color", "red");
                } else if(c==1491){
                    $("#passwordTips").text($("#nameAndPassNoSame").val());
                    $("#passwordTips").css("color", "red");
                }else if (c == 1423) {
                    $("#confirmPasswordTips").text($("#confirmPasswordNoSame").val());
                    $("#confirmPasswordTips").css("color", "red");
                } else if (c == 1424) {
                    $("#confirmPasswordTips").text($("#cPasswordNull").val());
                    $("#confirmPasswordTips").css("color", "red");
                } else if (c == 1425) {
                    $("#confirmPasswordTips").text($("#passwordFormat").val());
                    $("#confirmPasswordTips").css("color", "red");
                }

                //$("#tips").text(c)
            }
        }
    })
}
function back() {
    location.href = "/index"
}
function timedCount() {
    var b = $(".time").html();
    if (b > 0) {
        b--;
        $(".send_").attr("data", "0");
        $(".time").html(b)
    } else {
        clearInterval(t);
        var a = "\u9359\u6226\ufffd\u4f80\u7359\u7487\u4f7a\u721c\u9477\u62bd\u5056\u7ee0\ufffd";
        $(".send_").addClass("cursor");
        $(".send_").html(a);
        $(".send_").attr("data", "1")
    }
}
function show_hide() {
    $(".retrieve_user_table .next ").click(function () {
        $(".retrieve_box_user").hide();
        $(".retrieve_box_email").show()
    });
    $(".retrieve_email_table .next").click(function () {
        $(".retrieve_box_user").hide();
        $(".retrieve_box_email").hide();
        $(".retrieve_box_pass").show()
    })
};
