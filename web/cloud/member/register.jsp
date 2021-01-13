<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="/cloud/member/css/public-min.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/register_css-min.css" type="text/css" rel="stylesheet">
    <title><s:text name="login_register"/></title>

</head>
<body>
<input id="emailNull" type="hidden" value="<s:text name="tips_1470"/>">
<input id="emailFormat" type="hidden" value="<s:text name="tips_1471"/>">
<input id="emailExist" type="hidden" value="<s:text name="tips_1472"/>">
<input id="usernameFormat" type="hidden" value="<s:text name="tips_1344"/>">
<input id="usernameNull" type="hidden" value="<s:text name="tips_1410"/>">
<input id="usernameExist" type="hidden" value="<s:text name="tips_1413"/>">
<input id="truenameNull" type="hidden" value="<s:text name="tips_1440"/>">
<input id="truenameFormat" type="hidden" value="<s:text name="tips_1340"/>">
<input id="contactNull" type="hidden" value="<s:text name="tips_1450"/>">
<input id="contactFormat" type="hidden" value="<s:text name="tips_1451"/>">
<input id="phoneExist" type="hidden" value="联系方式不存在">
<input id="addressNull" type="hidden" value="<s:text name="tips_1460"/>">
<input id="addressFormat" type="hidden" value="<s:text name="tips_1461"/>">
<input id="passwordNull" type="hidden" value="<s:text name="tips_1420"/>">
<input id="passwordFormat" type="hidden" value="<s:text name="tips_1345"/>">
<input id="nameAndPassNoSame" type="hidden" value="<s:text name="tips_1491"/>">
<input id="cPasswordNull" type="hidden" value="<s:text name="tips_1424"/>">
<input id="confirmPasswordNoSame" type="hidden" value="<s:text name="tips_1423"/>">
<input id="codeNull" type="hidden" value="<s:text name="tips_1430"/>">
<input id="codeError" type="hidden" value="<s:text name="tips_1431"/>">


<div id="header">
    <div onclick="window.location.href='/index'" class="logo cusPoint"></div>
</div>

<div class="center">
    <div class="register_box_top">
        <div class="register_box__log icon_book fl"><s:text name="login_register"/></div>

        <div class="ab_right"><a href="/cloud/index.jsp"><s:text name="tips_1320"/></a></div>
        <div class="unline"></div>
    </div>
    <div class="register_box">


        <form id="cloud_member_registerForm" method="post">
            <table class="register_table">
                <tbody>
                <tr>
                    <td></td>
                    <td id="tips" style="color: #ff0000;height: 20px;margin-bottom:10px"></td>
                </tr>
                <tr>
                    <td><s:text name="login_username"/></td>
                    <td><input type="text" id="usernameId" class="input_" name="user.username">
                        <span style="color: #808080" id="usernameTips"><s:text name="tips_1344"/></span></td>
                </tr>
                <%--<tr>
                    <td><s:text name="user_truename"/></td>
                    <td><input type="text" id="truenameId" class="input_" name="user.truename">
                        <span style="color: #808080" id="truenameTips"><s:text name="tips_1340"/></span></td>
                </tr>--%>
                <%--<tr>
                    <td><s:text name="user_sex"/></td>
                    <td><select class="input_" id="sex" name="user.sex">
                        <option value="0"><s:text name="user_sex_male"/></option>
                        <option value="1"><s:text name="user_sex_female"/></option>
                    </select></td>
                </tr>--%>
                <%--<tr>
                    <td><s:text name="user_contact"/></td>
                    <td><input type="text" id="contactId" class="input_" name="user.phone">
                        <span style="color: #808080" id="contactTips"><s:text name="tips_1341"/></span></td>
                </tr>--%>
                <%--<tr>
                    <td><s:text name="input_hint_verify"/></td>
                    <td><input class="input_" type="text" name="code">
                        <span class="send_ cursor" id="sendPhoneNO" style="display: none">&nbsp;<s:text
                                name="tips_1330"/></span>
                        <span class="send_ cursor" id="sendPhoneOFF" style="display: none"><span>60</span><s:text
                                name="tips_1331"/></span>
                        <span style="color: red" id="codeTips"></span></td>
                    </td>
                </tr>--%>
                <%--<tr>
                    <td><s:text name="user_address"/></td>
                    <td><input type="text" id="addressId" class="input_" name="user.address">
                        <span style="color: #808080" id="addressTips"><s:text name="tips_1347"/></span></td>
                </tr>--%>
                <tr>
                    <td><s:text name="user_mail"/></td>
                    <td><input type="text" class="input_" id="mail" name="user.mail">
                        <span style="color: #808080" id="mailTips"><s:text name="tips_1342"/></span></td>
                </tr>
                <tr>
                    <td><s:text name="input_hint_verify"/></td>
                    <td><input class="input_" type="text" name="code">
                        <span class="send_ cursor" id="sendMaiNO" style="display: none">&nbsp;<s:text
                                name="tips_1330"/></span>
                        <span class="send_ cursor" id="sendMaiOFF" style="display: none"><span>60</span><s:text
                                name="tips_1331"/></span>
                        <span style="color: red" id="codeTips"></span></td>
                    </td>
                </tr>
                <tr>
                    <td><s:text name="login_password"/></td>
                    <td><input type="password" id="passwordId" class="input_" name="user.password">
                        <span style="color: #808080" id="passwordTips"><s:text name="tips_1345"/></span></td>
                </tr>
                <tr>
                    <td><s:text name="user_password_confirm"/></td>
                    <td><input type="password" id="confirmPasswordId" class="input_" name="password2">
                        <span style="color: #808080" id="confirmPasswordTips"><s:text name="tips_1346"/></span></td>
                </tr>
                <tr style="height: 60px">
                    <td colspan="2" style="height: 60px">
                        <div class="operation">
                            <input class="btn fr bg_b3b3b3 " type="button" value="<s:text name="pub_ok"/>"
                                   onclick="formAjax('cloud_member_registerForm','cloud_register_userAdd_member')"/>
                        </div>
                        <div class="operation">
                            <input class="btn fl bg_b3b3b3" type="button"
                                   value="<s:text name="pub_cancel"/>" onclick="back()"/></div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

</body>
</html>
<script src="/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/cloud/member/js/retrieve_paas-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#usernameId").blur(function () {
        var username = $("#usernameId").val();
        updateStatus('usernameTips', false);
        if ("" == username) {
            $("#usernameTips").text($("#usernameNull").val());
        } else if (!/^[\u4e00-\u9fa5\w_-]{4,15}$/g.test(username)) {
            $("#usernameTips").text($("#usernameFormat").val());
        } else {
            $.ajax({
                type: "post",
                url: '/cloud_register_checkUsernameUnique_member',
                data: {'user.username': encodeURI(username)},
                success: function (data) {
                    if (data == 1413) $("#usernameTips").text($("#usernameExist").val());
                    else updateStatus('usernameTips', true);
                }
            })
        }
        $("#usernameTips").css("color", "red");
    });
    $("#truenameId").blur(function () {
        var turename = $("#truenameId").val();
        updateStatus('truenameTips', false);
        if ("" == turename) {
            $("#truenameTips").text($("#truenameNull").val());
        } else if (!/[^\s][\w\W]{1,50}/.test(turename)) {
            $("#truenameTips").text($("#truenameFormat").val());
        } else updateStatus('truenameTips', true);
        $("#truenameTips").css("color", "red");
    });
    /*手机号校验*/
    $("#contactId").blur(function () {
        var phone = $("#contactId").val();
        updateStatus('contactTips', false);
        if ("" == phone || !/[\d\+_\-]{4,20}/.test(phone) || phone.length > 20) {
            $("#contactTips").text($("#contactFormat").val());
        } else {
            $.ajax({
                type: "POST",
                url: "/cloud_register_checkPhoneUnique_member",
                data: {"user.phone": encodeURI(phone)},
                success: function (b) {
                    if (b == 1200) {
                        if (timedNumber == undefined) {
                            $("#sendPhoneNO").show();
                            updateStatus('mailTips', true)
                        }
                    } else {
                        $("#contactTips").text($("#phoneExist").val())
                    }
                }
            })

            updateStatus('contactTips', true);

        }

        $("#contactTips").css("color", "red");
    });
    $("#addressId").blur(function () {
        var address = $("#addressId").val();
        updateStatus('addressTips', false);
        if (!(/[^\s][\w\W]{1,50}/).test(address)) {
            $("#addressTips").text($("#addressFormat").val());
        } else updateStatus('addressTips', true);
        $("#addressTips").css("color", "red");
    });
    $("#passwordId").blur(function () {
        var password = $("#passwordId").val();
        updateStatus('passwordTips', false);
        if (!(/^[a-zA-Z0-9_-]{8,32}$/g.test(password))) {
            $("#passwordTips").text($("#passwordFormat").val());
        } else updateStatus('passwordTips', true);
        $("#passwordTips").css("color", "red");
    });
    $("#confirmPasswordId").blur(function () {
        var pass = $("#passwordId").val();
        var confirmPassword = $("#confirmPasswordId").val();
        updateStatus('confirmPasswordTips', false);
        if (!(/^[a-zA-Z0-9_-]{8,32}$/g.test(confirmPassword))) {
            $("#confirmPasswordTips").text($("#passwordFormat").val());
        } else if (confirmPassword != pass) {
            $("#confirmPasswordTips").text($("#confirmPasswordNoSame").val());
        } else updateStatus('confirmPasswordTips', true);
        $("#confirmPasswordTips").css("color", "red");
    });
    /*邮箱校验*/

    $("#mail").blur(function () {
        var a = $("#mail").val();
        updateStatus('mailTips', false);
        if ("" == a) {
            $("#mailTips").text($("#emailNull").val())
        } else {
            if (!(/^[a-zA-Z0-9][a-zA-Z0-9_\.\-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(a))) {
                $("#mailTips").text($("#emailFormat").val())
            } else {
                $.ajax({
                    type: "POST",
                    url: "/cloud_register_checkMailUnique_member",
                    data: {"user.mail": encodeURI(a)},
                    success: function (b) {
                        if (b == 1200) {
                            if (timedNumber == undefined) {
                                $("#sendMaiNO").show();
                                updateStatus('mailTips', true)
                            }
                        } else {
                            $("#mailTips").text($("#emailExist").val())
                        }
                    }
                })
            }
        }
        $("#mailTips").css("color", "red");
    }).focus(function () {
        $("#sendMaiNO").hide();
        $("#tips").text("")
    });
    /*邮箱校验*/


    function updateStatus(nodeId, ok) {
        var imgNode = '<img src="/cloud/member/images/wait.gif"/>';
        if (ok)
            imgNode = '<img src="/cloud/member/images/ok.png"/>';
        $("#" + nodeId).html(imgNode);
    }
</script>
