<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-07-13
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");%>
<html>
<head>

    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link href="/cloud/main/css/style-min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/codestatus.js"></script>
    <script src="/js/amazeui.min.js"></script>
    <style type="text/css">
        #bg_img {
            background: url('/cloud/member/images/login/bgImg.jpg') center no-repeat;
            width: 100%;
            height: 100%;
            position: fixed;
            bottom: 0;
            z-index: 3;
        }

        .ok {
            color: blue !important;
        }

        .error {
            color: red;
        }
    </style>
</head>
<% Object msg=request.getAttribute("msg");%>
<body class="am-with-topbar-fixed-top">

<div id="bg_img">
    <script type="text/javascript">
        var needAlert = false;
        if ((!!window.ActiveXObject || "ActiveXObject" in window)) {
            needAlert = true;
        } else {
            var browserName = navigator.userAgent.toLowerCase();
            if (!(/chrome/i.test(browserName) || /webkit/i.test(browserName) || /firefox/i.test(browserName)))
                needAlert = true;
        }

        if (!needAlert) {
            $('#tr-browser-tip').remove();
        }
    </script>


    <header class="am-topbar am-topbar-fixed-top">
        <div id="header">
            <table style="width: 100%;height: 100%;z-index: 98">
                <tbody>
                <tr>
                    <td width="40px" align="right">
                        <%--<div class="logo cusPoint"></div>--%>
                        <font size="5" color="#a52a2a">L</font>
                             <font size="4" color="#bdb76b">O</font>
                            <font size="5" color="#a52a2a">G</font>
                            <font size="4" color="#bdb76b">O</font>
                    </td>
                    <td width="240px">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </header>


    <div class="am-g tr-yunpan">
        <div class="tr-yunpan-container am-container am-container-collapse am-vertical-align">
            <div class="am-vertical-align-middle am-g am-g-collapse" style="width:100%;">

                <div class="tr-yunpan-login-container am-container am-u-md-4 am-u-md-push-8 am-u-sm-10 am-u-sm-push-1"
                     style="background-color:rgb(238, 246, 253)">
                    <form class="am-form am-padding-xl am-padding-bottom-sm" id="login-form"
                                                         method="post" <%--action="userlogin.action"--%>
                                                         novalidate="novalidate">
                        <input type="hidden" name="csrfmiddlewaretoken" value="EsqXEY656FapqNebOhKwV2MHu1wWdJzn">
                        <div class="am-g am-container">
                            <h2>用户登录</h2>
                        </div>
                        <div class="am-form-group am-form-icon">
                            <span id="tip"></span>
                        </div>
                        <div class="am-g am-padding-sm">
                            <div class="am-form-group am-form-icon">
                                <input type="text" name="user.name" class="am-form-field am-radius" placeholder="用户名"
                                       required="">
                            </div>
                            <div class="am-form-group am-form-icon">
                                <input type="password" name="user.password" class="am-form-field am-radius"
                                       placeholder="密码">
                            </div>
                            <button type="button" class="am-btn am-btn-danger am-btn-block am-radius"
                                    onclick="loginformAjax('login-form','userlogin')"
                                    style="background-color: #5c5c5c;border-color: #5c5c5c;">登 录
                            </button>
                            <div class="am-form-group am-center">
                                <%--<div class="am-fl">
                                    <div class="checkbox">
                                        <label>
                                            <a href="usermessage.action">aaaaa</a>
                                        </label>
                                    </div>
                                </div>--%>
                                <table>
                                <a href="javascript:void(0)" id="forgoterpwd">忘记密码?</a>
                                </table>
                            </div>
                        </div>
                    </form>
                    <div class="am-container am-g tr-yunpan-btn-block-container"
                         style="background-color: #a2a2a2;border-color: #a2a2a2;">
                        <a href="javascript:" class="am-btn am-btn-block am-btn-lg tr-yunpan-btn-block"
                           id="zhuce">立即注册</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    //    登录表单验证
    function loginformAjax(a, b) {
        a = "#" + a;
        $.ajax({
            type: "POST",
            url: b,
            data: $(a).serialize(),
            success: function (data) {
                var $tip=$("#tip");
                if(data==2000){
                    location.href="main.action";
                }else if(data==1){
                     $tip.html("用户名密码为空").addClass("error");
                }else{
                    $tip.html(codestatus(data)).addClass("error");
                }
            }
        })
    }
</script>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="findpassword">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">找回密码
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </div>
        <form id="find-form" class="am-form am-padding-xl am-padding-bottom-sm" method="post"
              action="findpassword.action" novalidate="novalidate">
            <div id="yunpan-forgotpassword-form" class="am-form am-padding" novalidate="novalidate">
                <div class="am-form-group am-input-group">
                    <div id="findpassword_tips" class="error am-center"></div>
                </div>
                <div class="am-form-group am-input-group" id="findbymail">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="text" name="mail" class="am-form-field am-radius"
                           placeholder="邮箱地址" id="find_mailcode">
		      <span class="am-input-group-btn">
		        <button id="mailfind" class="am-btn am-btn-default" type="button">找回方式</button>
		      </span>
                </div>
                <div class="am-form-group am-input-group am-hide" id="findbyphone">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="text" name="phone" class="am-form-field am-radius"
                           placeholder="手机号" id="find_phonecode">
		      <span class="am-input-group-btn">
		        <button id="phonefind" class="am-btn am-btn-default" type="button">找回方式</button>
		      </span>
                </div>

                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="text" id="fp_validate_code" name="verCode"
                           class="am-form-field am-radius js-pattern-valitecode" placeholder="验证码">
		      <span class="am-input-group-btn">
		        <button id="find_getcode" class="am-btn am-btn-default" type="button">获取验证码</button>
		      </span>
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="password" id="fp_new_password" name="newPass" class="am-form-field am-radius"
                           placeholder="新密码">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="password" id="fp_confirm_password" name="confirmPass" class="am-form-field am-radius"
                           placeholder="确认密码">
                </div>
                <p>
                    <button id="forgotPasswordBtn" type="button" class="am-btn am-btn-warning am-btn-block"
                            onclick="findformAjax('find-form','findpassword')"
                            style="background-color: #a2a2a2;border-color: #a2a2a2;">确 认
                    </button>
                </p>
            </div>
        </form>
    </div>
</div>
</div>
<script>
    //    找回方式
    $("#mailfind").click(function () {
        $("#findbymail").addClass("am-hide");
        $("#findbyphone").removeClass("am-hide");
    })

    $("#phonefind").click(function () {
        $("#findbymail").removeClass("am-hide");
        $("#findbyphone").addClass("am-hide");
    })
    //    找回发送验证码
    $("#find_getcode").click(function () {
        var $tips = $("#findpassword_tips");
        var mail = $("#find_mailcode").val();
        var phone = $("#find_phonecode").val();
        if (mail.length == 0 && phone.length == 0) {
            $tips.html("邮箱或者手机不能为空");
        } else {
            if ($("#findbymail").hasClass("am-hide")) {
                $.ajax({
                    type: "post",
                    url: "/findphonesend?phone=" + phone,
                    success: function (data) {
                        if (data == 2000) {
                            $tips.html("验证码已发送").addClass("ok");
//                            $("#findpassword_tips").html(codestatus(data));
                        } else {
                            $tips.html(codestatus(data)).addClass("error");
                        }
                    }
                })
            }
            if ($("#findbyphone").hasClass("am-hide")) {
                $.ajax({
                    type: "post",
                    url: "/findmailsend?mail=" + mail,
                    success: function (data) {
                        if (data == 2000) {
                            $tips.html("验证码已发送").addClass("ok");
//                            $("#findpassword_tips").html(codestatus(data));
                        } else {
                            $tips.html(codestatus(data)).addClass("error");
                        }
                    }
                })
            }
        }
    })
    //    找回密码表单验证
    function findformAjax(a, b) {
        a = "#" + a;
        $.ajax({
            type: "POST",
            url: b,
            data: $(a).serialize(),
            success: function (data) {
                var $tips = $("#findpassword_tips");
                if (data == 2000) {
                    $tips.html("成功找回").addClass("ok");
                    setTimeout(function () {
                        $("#findpassword").modal("close");
                    }, 2000)
                } else {
                    if ($tips.hasClass("ok")) {
                        $tips.removeClass("ok");
                        $tips.html(codestatus(data)).addClass("error");
                    }
                }
            }
        })
    }
</script>


<div class="am-modal am-modal-no-btn" tabindex="-1" id="zhucemodal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">用户注册
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </div>
        <div class="am-modal-bd">
            <form id="regeister-form" class="am-form am-padding-xl am-padding-bottom-sm" method="post"
                  action="regeister.action" novalidate="novalidate">
                <div id="zhuce-form" class="am-form am-padding" novalidate="novalidate">
                    <div id="tips" class="error am-center"></div>
                    <div class="am-form-group am-input-group">
                        <span class="am-input-group-label"><i class="am-icon"></i></span>
                        <input type="text" id="" name="user.name" placeholder="用户名(6到15位字符 由数字、_、-、汉字组成)">
                    </div>
                    <div class="am-form-group am-input-group" id="registerbymail">
                        <span class="am-input-group-label"><i class="am-icon"></i></span>
                        <input type="text" name="user.mail" class="am-form-field am-radius js-pattern-valitecode"
                               placeholder="邮箱地址" id="getcode_mail">
		      <span class="am-input-group-btn">
		        <button id="mailregister" class="am-btn am-btn-default" type="button">注册方式</button>
		      </span>
                    </div>
                    <div class="am-form-group am-input-group am-hide" id="registerbyphone">
                        <span class="am-input-group-label"><i class="am-icon"></i></span>
                        <input type="text" name="user.phone" class="am-form-field am-radius js-pattern-valitecode"
                               placeholder="手机号" id="getcode_phone">
		      <span class="am-input-group-btn">
		        <button id="phoneregister" class="am-btn am-btn-default" type="button">注册方式</button>
		      </span>
                    </div>
                    <div class="am-form-group am-input-group">
                        <span class="am-input-group-label"><i class="am-icon"></i></span>
                        <input type="text" name="verCode" class="am-form-field am-radius js-pattern-valitecode"
                               placeholder="验证码">
		      <span class="am-input-group-btn">
		        <button id="regeister_getcode" class="am-btn am-btn-default" type="button">获取验证码</button>
		      </span>
                    </div>
                    <div class="am-form-group am-input-group">
                        <span class="am-input-group-label"><i class="am-icon"></i></span>
                        <input type="password" id="new_password" name="user.password" class="am-form-field am-radius"
                               placeholder="密码(8到32位字符，数字、_、-组成)">
                    </div>
                    <div class="am-form-group am-input-group">
                        <span class="am-input-group-label"><i class="am-icon"></i></span>
                        <input type="password" id="confirm_password" name="user.confirmPass"
                               class="am-form-field am-radius" placeholder="确认密码">
                    </div>
                    <p>
                        <button id="zhaohui" type="button" class="am-btn am-btn-warning am-btn-block"
                                onclick="registerformAjax('regeister-form','regeister')"
                                style="background-color: #a2a2a2;border-color: #a2a2a2;">注 册
                        </button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

    //更换注册方式
    $("#mailregister").click(function () {
        $("#registerbymail").addClass("am-hide");
        $("#registerbyphone").removeClass("am-hide");
    })

    $("#phoneregister").click(function () {
        $("#registerbymail").removeClass("am-hide");
        $("#registerbyphone").addClass("am-hide");
    })

    //    注册发送验证码
    $("#regeister_getcode").click(function () {
        var $tips = $("#tips");
        var mail = $("#getcode_mail").val();
        var phone = $("#getcode_phone").val();
        if (mail.length == 0 && phone.length == 0) {
            $tips.html("邮箱或者手机不能为空")
        } else {
            if ($("#registerbymail").hasClass("am-hide")) {
                $.ajax({
                    type: "post",
                    url: "/phonesend?user.phone=" + phone,
                    success: function (data) {
                        if (data == 2000) {
                            $tips.html("验证码已发送").addClass("ok");
                        } else {
                            $tips.html(codestatus(data)).addClass("error");
                        }
                    }
                })
            }
            if ($("#registerbyphone").hasClass("am-hide")) {
                $.ajax({
                    type: "post",
                    url: "/mailsend?user.mail=" + mail,
                    success: function (data) {
                        if (data == 2000) {
                            $tips.html("验证码已发送").addClass("ok");
                        } else {
                            $tips.html(codestatus(data)).addClass("error");
                        }
                    }
                })
            }
            /*if (phone.length != 0) {
             $.ajax({
             type: "post",
             url: "/phonesend?user.phone=" + phone,
             success: function (data) {
             if (data == 2000)
             $("#tips").html(codestatus(data))
             }
             })
             } else if (mail.length != 0) {
             $.ajax({
             type: "post",
             url: "/mailsend?user.mail=" + mail,
             success: function (data) {
             if (data == 2000) {
             $("#tips").html("邮件已发送");
             } else {
             $("#tips").html(codestatus(data))
             }
             }
             })
             }*/
        }
    })
    //    注册表单验证
    function registerformAjax(a, b) {
        a = "#" + a;
        $.ajax({
            type: "POST",
            url: b,
            data: $(a).serialize(),
            success: function (data) {
                var $tips = $("#tips");
                if (data == 2000) {
                    $tips.html("注册成功").addClass("ok");
                    setTimeout(function () {
                        $("#zhucemodal").modal("close");
                    }, 2000)
                } else {
                    if ($tips.hasClass("ok")) {
                        $tips.removeClass("ok");
                        $tips.addClass("error");
                        $tips.html(codestatus(data)).addClass("error");
                    } else {
                        $tips.html(codestatus(data)).addClass("error");
                    }
                }
            }
        })
    }
</script>
</body>
</html>
<script>
    //    弹窗显示
    $("#forgoterpwd").click(function () {
        $("#findpassword").modal();
    })

    $("#zhuce").click(function () {
        $("#zhucemodal").modal();
    })
</script>
