var closeWindow;
$(function () {
    var b = true;
    $("#DownLoadApp").hover(function () {
        b ? $("#showDownLoadApp").slideDown() : "";
        b = false
    }, function () {
        $("#showDownLoadApp").slideUp(function () {
            b = true
        })
    });
    showErWeiMaBox();
    modifyInput(["userLogin", "macLogin"]);
    var a = ($(document).width() - $("#loginMain").width() - 600) / 2;
    $("#contentTable").css({"margin-right": a});
    if ($("#bannerBox  ul li").length == 1) {
        return
    } else {
        $.Banner.banner("bannerBox", "bannerIndex", 462, 3000);
        var c = -$("#bannerIndex").width() / 2;
        $("#bannerIndex").css("margin-left", c + "px")
    }
    change_men();
    userLogin();
    macLogin();
    $(".language").click(function () {
        $(".language").hide();
        $(".languageList").slideDown(200)
    });
    $(".languageList").hover(function () {
    }, function () {
        $(".languageList").slideUp(200, function () {
            $(".language").show()
        })
    });
    $(".languageList li").click(function () {
        if ($(this).attr("data-val") != "null") {
            changeLanguage($(this).attr("data-val"))
        }
    })
});
function showErWeiMaBox() {
    $("#erWeiMaBox").mouseout(function () {
        $("#loginBOX").animate({opacity: "1", left: 0}, 500)
    });
    var b = $("#loginBOX").width();
    var a = $("#loginBOX").height();
    $("#erWeiMaBox").css({width: b, height: a});
    $("#MoaiBox .switch-ErWeiMA").click(function () {
        $("#loginBOX").animate({opacity: "0", left: -b}, 200)
    })
}
function refreshVerification(a) {
    a = "#" + a;
    $(a).attr("src", "/verification_produce?jsessionid=" + Math.random(100))
}
function changeLanguage(b) {
    $.ajax({
        type: "POST", url: "langSwitch_execute", data: "request_locale=" + b, success: function (a) {
            location.reload()
        }, error: function () {
            alert("error:500,\u7487\ue161\u2588\u9352\u56e8\u5d32\u6fb6\u8fab\u89e6\u951b\ufffd")
        }
    })
}
function change_men() {
    $(".transform_nav li").click(function () {
        $("#loginErrorTips,#macErrorTips").text("");
        $(".transform_box .transform_container").hide();
        $(".transform_nav li").removeClass("block");
        $(this).addClass("block");
        $($(this).attr("dist")).show();
        showErWeiMaBox()
    })
}
function userLogin() {
    $("#userLoginBut").click(function () {
        userNameLogin()
    })
}
function userNameLogin() {
    $("#userLoginBut").val($("#Message_Login").val() + "......");
    $.ajax({
        type: "post",
        url: "/cloud_user_login_member",
        data: $("#userLogin").serialize(),
        dataType: "json",
        success: function (a) {
            $("#userLoginBut").val($("#Message_Login").val());
            if (a.status == 1201) {
                location.href = "/main"
            } else {
                if (a.status == 1202) {
                    location.href = "/update2uc"
                } else {
                    $("#loginErrorTips").text(a.tips);
                    $("#verify_user").val("");
                    refreshVerification("verif")
                }
            }
        },
        error: function () {
            $("#userLoginBut").val($("#Message_Login").val())
        }
    })
}
function macLogin() {
    $("#macLoginBut").click(function () {
        showAlertMac();
        closeWindowFun()
    })
}
function closeWindowFun() {
    closeWindow = setTimeout(function () {
        $("#mb_btn_ok").click()
    }, 1000)
}
function showAlertMac() {
    var a = $("#macPassword").val();
    if (a == "" || a == null) {
        $("#macLoginBut,#verify_mac").blur();
        $.MsgBox.MacLoginAlert($("#Message_Title").val(), $("#Message_mac_passLogin_tips").val(), $("#Message_Ok").val(), function () {
            macNameLogin()
        })
    } else {
        macNameLogin()
    }
}
function macNameLogin() {
    clearTimeout(closeWindow);
    $("#macLoginBut").val($("#Message_Login").val() + "......");
    $.ajax({
        type: "post",
        url: "/cloud_device_macLogin_main",
        data: $("#macLogin").serialize(),
        dataType: "json",
        success: function (a) {
            $("#macLoginBut").val($("#Message_Login").val());
            if (a.status == 1200) {
                location.href = "/macLogin"
            } else {
                $("#macErrorTips").text(a.tips);
                $("#verify_mac").val("");
                refreshVerification("verif2")
            }
        },
        error: function () {
            $("#macLoginBut").val($("#Message_Login").val())
        }
    })
}
function userOnKeyUp(b) {
    var c = b || window.event;
    var a = c.keyCode || c.which || c.charCode;
    if (a == 13) {
        userNameLogin()
    }
}
function macOnKeyUp(b) {
    var c = b || window.event;
    var a = c.keyCode || c.which || c.charCode;
    if (a == 13) {
        showAlertMac();
        closeWindowFun()
    }
};
