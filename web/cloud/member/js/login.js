/**
 * Created by yuannianqing on 2015-03-18.
 * @art 2015-6-27 by mrava
 * @context
 */
$(function () {
    if ($("#bannerBox  ul li").length == 1) {
        return
    } else {
        $.Banner.banner(462);

    }

    // changeLanguage('LanguageSwitch');
    change_men();
    userLogin();
    macLogin();

    $(".language").click(function () {
        $(".language").hide();
        $(".languageList").slideDown(200);
    });
    $(".languageList").hover(function () {
    }, function () {
        $(".languageList").slideUp(200, function () {
            $(".language").show();
        });
    });


    $(".languageList li").click(function () {
        if ($(this).attr("data-val") != "null") {
            changeLanguage($(this).attr("data-val"))
        }
    })

});


/**
 * 刷新验证码
 * @param imgId
 */

function refreshVerification(imgId) {
    imgId = '#' + imgId;
    $(imgId).attr('src', '/verification_produce?jsessionid=' + Math.random(100));
}
/**
 * 语言切换
 */

function changeLanguage(val) {
    $.ajax({
        type: "POST",
        url: "langSwitch_execute",
        data: "request_locale=" + val,
        success: function (msg) {
            location.href = '/index'
        },
        error: function () {
            alert('error:500,语言切换失败！')
        }
    });

}


/**
 * 登录切换
 */
function change_men() {
    $('.transform_nav li').click(function () {
        $('.transform_box .transform_container').hide();
        $('.transform_nav li').removeClass("block");
        $(this).addClass("block");
        $($(this).attr('dist')).show();
    });
}
/**
 * 用户登录
 */
function userLogin() {
    $('#userLoginBut').click(function () {
        userNameLogin();
    });
}

function userNameLogin() {
    $.ajax({
        type: 'post',
        url: "/cloud_user_login_member",
        data: $('#userLogin').serialize(),
        success: function (data) {
            data = eval('(' + data + ')');
            if (data.status == 1201) {
                location.href = '/main';
            } else if (data.status == 1202) {
                location.href = '/update2uc';
            }
            else {
                $('#loginErrorTips').text(data.tips);
                refreshVerification('verif')
            }
        }
    });
}
/**
 * 设备登录
 */
function macLogin() {
    $('#macLoginBut').click(function () {
        macNameLogin();
    });
}

function macNameLogin() {
    $.ajax({
        type: 'post',
        url: "/cloud_device_macLogin_main",
        data: $('#macLogin').serialize(),
        success: function (data) {
            data = eval('(' + data + ')')
            //alert(data.status)
            if (data.status == 1200) {
                location.href = '/macLogin';
            } else {
                $('#macErrorTips').text(data.tips);
                refreshVerification('verif2')
            }
        }
    });
}

function userOnKeyUp(event) {
    var theEvent = event || window.event;
    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
        userNameLogin();
    }
}
function macOnKeyUp(event) {
    var theEvent = event || window.event;
    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
        macNameLogin();
    }
}
