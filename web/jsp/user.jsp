<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/admin.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/cloud/member/css/personal_inf-min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/cloud/member/js/pInformation-min.js"></script>
<style>
    .ok {
        color: blue!important;
    }

    .error {
        color: red;
    }
</style>
</head>
<%--<script type="text/javascript">
    //    $(function () {
    &lt;%&ndash;if (0 ==${user.sex}) {&ndash;%&gt;
    //            $(".sex").text($("#sex_m").val())
    //        } else {
    //            $(".sex").text($("#sex_w").val())
    //        }
    //    });
    function editUserInfoPass(ajaxCallUrl) {
        var pass0 = $("#password").val();
        var pass1 = $("#password1").val();
        var pass2 = $("#password2").val();
        var userId = $("#userId").val();
        $.ajax({
            type: "POST",
            url: ajaxCallUrl,
            data: {
                userId: userId,
                password: pass0,
                password1: pass1,
                password2: pass2
            },
            success: function (data) {
                var jsonData = $.parseJSON(data);
                if (jsonData.status == "1200") {
                    $(".update_pass").slideUp(500);
                    $(".pass00").val("");
                    $(".pass01").val("");
                    $(".pass02").val("");
                }
                $('#tips').text(jsonData.message);
            }
        })
    }
</script>--%>
<body>
<%--<input type="hidden" id="sex_m" value="<s:text name="user_sex_male"/>">
<input type="hidden" id="sex_w" value="<s:text name="user_sex_female"/>">
<input type="hidden" id="giveUp" value="<s:text name="tips_1355"/>">
<input type="hidden" id="updatePass" value="<s:text name="tips_1353"/>">--%>
<input type="hidden" id="userId" value="${user.id}">
<div class="personal_box">
    <div class="content_box_header">
        <span style="margin-left: 55px;" class="fl"><%--<s:text name="user_info"/>--%>用户信息</span>
    </div>
    <table class="personal_box_table">
        <tbody>
        <tr class="height_30">
            <td class="personal_box_top left_color" width="20%">用户名</td>
            <td width="80%" class="personal_box_top disable" id="username">${user.name}</td>
        </tr>
        <tr class="height_30">
            <td class="left_color">联系方式</td>
            <td class="td_right" id="phone">${user.phone}</td>
        </tr>
        <tr class="height_30">
            <td class="left_color">电子邮箱</td>
            <td class="disable" id="mail">${user.mail}</td>
        </tr>
        <tr class="height_30">
            <td class="left_color">修改密码</td>
            <td>
                <button
                        type="button"
                        class="am-btn"
                        data-am-modal="{target: '#update_name', closeViaDimmer: 0, width: 500, height: 600}">
                    修改用户密码
                </button>
               <%-- <button
                        type="button"
                        class="am-btn"
                        data-am-modal="{target: '#update_device_name', closeViaDimmer: 0, width: 500, height: 600}">
                    修改设备登录密码
                </button>--%>
            </td>
        </tr>
        </tbody>
    </table>

    <span id="tips" class="update_tips" style="color: #ff0000;padding-bottom: 10px"></span>
</div>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="update_name">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">修改用户密码
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </div>
        <form id="update_name_form" class="am-form am-padding-xl am-padding-bottom-sm" method="post" action="updatebyname.action" novalidate="novalidate">
            <div id="yunpan-forgotpassword-form" class="am-form am-padding" novalidate="novalidate">
                <div id="name_tips" class="error"></div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="password" name="oldPwd" class="am-form-field am-radius js-pattern-valitecode" placeholder="旧密码">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="password" id="fp_new_password" name="newPwd" class="am-form-field am-radius" placeholder="新密码">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon"></i></span>
                    <input type="password" id="fp_confirm_password" name="confirmPwd" class="am-form-field am-radius" placeholder="确认密码">
                </div>
                <p><button type="button" class="am-btn am-btn-warning am-btn-block"
                           onclick="nameformAjax('update_name_form','updatebyname')"
                           style="background-color: #a2a2a2;border-color: #5c5c5c;">确  认</button></p>
            </div>
        </form>
    </div>
</div>
</div>
<%--<div class="am-modal am-modal-no-btn" tabindex="-1" id="update_device_name">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">修改设备登录密码
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </div>
        <form id="update_device_form" class="am-form am-padding-xl am-padding-bottom-sm" method="post" action="updatebyphone.action" novalidate="novalidate">
            <div class="am-form am-padding" novalidate="novalidate">
                <div id="code_tips" class="error"></div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon am-icon-lock"></i></span>
                    <input type="text" name="uuid" class="am-form-field am-radius" placeholder="设备uuid">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon am-icon-lock"></i></span>
                    <input type="password" name="oldDevicePwd" class="am-form-field am-radius" placeholder="旧密码">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon am-icon-lock"></i></span>
                    <input type="password" name="newDevicePwd" class="am-form-field am-radius" placeholder="新密码">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon am-icon-lock"></i></span>
                    <input type="password" name="deviceConfirmPassword" class="am-form-field am-radius" placeholder="确认密码密码">
                </div>
                <p><button type="button" class="am-btn am-btn-warning am-btn-block"
                           onclick="deviceformAjax('update_device_form','updatepwd')"
                           style="background-color: #a2a2a2;border-color: #5c5c5c;">确  认</button></p>
            </div>
        </form>
    </div>
</div>--%>

<div class="am-modal am-modal-no-btn closeViaDimmer: 0" tabindex="-1" id="relogin">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">已成功修改密码，请重新登录
            <a href="javascript: void(0)" class="am-close am-close-spin"></a>
        </div>
        <div class="am-modal-bd">
            <a href="javascript:void(0)" id="tiaozhuan">确定</a>
        </div>
    </div>
</div>

<script>
    $("#getcode_phone").click(function(){
        var phone= $("#get_phone").val();
        $.ajax({
          type:"post",
          url:"/findphonesend?phone="+phone,
          success:function(data){
              if (data == 2000)
                  $("#phone_tips").html(codestatus(data));
            }
        })
    })
    $("#getcode_mail").click(function(){
        var mail= $("#get_mail").val();
        $.ajax({
            type:"post",
            url:"/findmailsend?mail="+mail,
            success:function(data){
                if (data == 2000)
                    $("#mail_tips").html(codestatus(data));
            }
        })
    })

    //修改用户密码
    function nameformAjax(a, b) {
        a = "#" + a;
        $.ajax({
            type: "POST",
            url: b,
            data: $(a).serialize(),
            success: function (data) {
                if (data == 2000)
                {
                    $("#update_name").modal("close");
                    $("#relogin").modal();
                }else if(data==4011){
                    $("#name_tips").html("密码不一致");
                }else if(data==4014){
                    $("#name_tips").html("密码为空");
                }else if(data==4015){
                    $("#name_tips").html("确认密码为空");
                }else if(data==4026){
                    $("#name_tips").html("原密码错误");
                }else{
                    $("#name_tips").html("未知错误");
                }
            }
        })
    }
    $("#tiaozhuan").click(function (){
        parent.document.location.href="/index.jsp";
    })
//    修改设备登录密码
    /*function deviceformAjax(a, b) {
        a = "#" + a;
        $.ajax({
            type: "POST",
            url: b,
            data: $(a).serialize(),
            success: function (data) {
                if (data == 2000)
                    $("#code_tips").html(codestatus(data));
            }
        })
    }*/
</script>
<script src="/js/jquery.min.js"></script>
<script src="/js/amazeui.min.js"></script>
<script type="text/javascript" src="/js/codestatus.js"></script>

</body>
</html>