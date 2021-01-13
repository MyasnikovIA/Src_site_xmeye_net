<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: mrava
  Date: 2015-6-10
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="/cloud/member/css/public.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/retrieve_pass.css" type="text/css" rel="stylesheet">
    <script src="/cloud/member/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="/cloud/member/js/retrieve_paas.js" type="text/javascript"></script>
</head>
<body>
<div id="header">
    <div onclick="window.location.href='/index'" class="logo cusPoint"></div>
</div>
<div class="center">


    <div class="retrieve_box_top">
        <div class="retrieve_box__log  icon_data fl"><s:text name="tips_1400"/></div>
        <div class="ab_right"><a href="/cloud/index.jsp"><s:text name="tips_1320"/></a></div>
        <div class="unline"></div>
    </div>


    <!--填写用户名 star-->
    <div class="retrieve_box_user">
        <form action="/cloud_user_update2uc_member" method="post">
            <table class="retrieve_user_table" align="center" style="width: auto">
                <tbody>
                <tr>
                    <td width="100px"></td>
                    <td></td>
                    <td class="prompt">
                        ${sessionScope.user.ucmessage}
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="login_username"/></td>
                    <td><input class="yzm_200 h_25" type="text" name="log.name" value="${sessionScope.user.username}">
                        <span style="color: #808080"><s:text name="tips_1344"/></span>
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="login_password"/></td>
                    <td><input class="yzm_200 h_25" type="password" name="log.password"
                               value="${sessionScope.user.password}">
                        <span style="color: #808080"><s:text name="tips_1345"/></span>
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="user_mail"/></td>
                    <td><input class="yzm_200 h_25" type="text" id="uc_mail" name="log.mail"
                               value="${sessionScope.user.mail}"></td>
                </tr>

                <tr>
                    <td width="100px"></td>
                    <td><s:text name="input_hint_verify"/></td>
                    <td><input class="yzm_100 h_25" type="text" name="log.verificationCode">
                        <span class="send_ cursor" id="sendMaiNO">&nbsp;<s:text name="tips_1330"/></span>
                        <span class="send_ cursor" id="sendMaiOFF" style="display: none"><span>60</span><s:text
                                name="tips_1331"/></span>
                        <%-- <a href="javascript:ref(this)"><img id="verif" src="/verification_produce"/></a>--%>
                    </td>
                </tr>

                <tr class="retrieve_table_tr">
                    <td colspan="2"></td>
                    <td>
                        <input id="submitUC" class="btn bg_b3b3b3" type="submit" value="<s:text name="pub_ok"/>"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </form>
    </div>
    <!--填写用户名 end-->
</div>
<div class="footer"><span>浙ICP备09096251号-3 </span></div>
</body>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $('#sendMaiNO').click(function () {
            var mail = $('#uc_mail').val();
            if (/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(mail)) {
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
                    }
                }, 1000);
                $.ajax({
                    type: "POST",
                    url: '/cloud_mail_sendCode_member',
                    data: {'user.mail': mail},
                    success: function (data) {
                        // alert(data);
                    }
                })
            }
        })
    });
</script>

