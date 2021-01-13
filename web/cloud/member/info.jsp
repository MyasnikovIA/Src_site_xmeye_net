<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="/cloud/member/css/personal_inf-min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/cloud/member/js/pInformation-min.js"></script>

</head>
<script type="text/javascript">
//    $(function () {
        <%--if (0 ==${user.sex}) {--%>
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
</script>
<body>
<input type="hidden" id="sex_m" value="<s:text name="user_sex_male"/>">
<input type="hidden" id="sex_w" value="<s:text name="user_sex_female"/>">
<input type="hidden" id="giveUp" value="<s:text name="tips_1355"/>">
<input type="hidden" id="updatePass" value="<s:text name="tips_1353"/>">
<input type="hidden" id="userId" value="${user.id}">

<div class="personal_box">
    <div class="content_box_header">
        <span style="margin-left: 55px;" class="fl"><s:text name="user_info"/></span>

        <div style="margin-right: 55px;margin-left: 10px;cursor: pointer"
             class="fr updatePass">
            <s:text name="tips_1353"/></div>
        <span class="icon_updatePass updatePass fr"></span>
    </div>
    <table class="personal_box_table">
        <tbody>
        <tr class="height_30">
            <td class="personal_box_top left_color" width="20%"><s:text name="login_username"/></td>
            <td width="80%" class="personal_box_top disable" id="username">${user.username}</td>
        </tr>
        <%--<tr class="height_30">
            <td class="left_color"><s:text name="user_truename"/></td>
            <td class="td_right" id="truename">${user.truename}</td>
        </tr>--%>
        <%--<tr class="height_30">
            <td class="left_color"><s:text name="user_sex"/></td>
            <td class="disable" data="sex" id="sex"><span class="sex"></span>
            </td>
        </tr>--%>
        <tr class="height_30">
            <td class="left_color"><s:text name="user_contact"/></td>
            <td class="td_right" id="phone">${user.phone}</td>
        </tr>
        <%--<tr class="height_30">
            <td class="left_color"><s:text name="user_address"/></td>
            <td class="td_right" id="address">${user.address}</td>
        </tr>--%>
        <tr class="height_30">
            <td class="left_color"><s:text name="user_mail"/></td>
            <td class="disable" id="mail">${user.mail}</td>
        </tr>
        </tbody>
    </table>

    <span id="tips" class="update_tips" style="color: #ff0000;padding-bottom: 10px"></span>
</div>
<div class="fixed_0_0 update_pass">

    <table style="width: 100%; margin-top: 1%; margin-bottom: 1%;">
        <tbody>
        <tr>
            <td width="30%" align="right"><s:text name="tips_1350"/>:&nbsp;&nbsp;</td>
            <td width="70%"><input class="pass00" name="password" id="password" type="password"></td>
        </tr>
        <tr>
            <td align="right"><s:text name="tips_1351"/>:&nbsp;&nbsp;</td>
            <td><input class="pass01" name="password1" id="password1" type="password"></td>
        </tr>
        <tr>
            <td align="right"><s:text name="tips_1352"/>:&nbsp;&nbsp;</td>
            <td><input class="pass02" name="password2" id="password2" type="password"></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: right">

                <span class="btn bg_b3b3b3 update_ok" onclick="editUserInfoPass('cloud_user_editUserInfoPass_member')">
                    <s:text name="tips_1354"/>
                </span>
                <span style="margin-right: 10%;" class="btn bg_b3b3b3 update_Cancel"><s:text name="Cancel"/></span>

            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>