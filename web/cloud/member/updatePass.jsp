<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="/cloud/member/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="/cloud/member/js/retrieve_paas.js" type="text/javascript"></script>
    <link href="/cloud/member/css/public.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/retrieve_pass.css" type="text/css" rel="stylesheet">
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
                        <span>当前密码过于简单，存在安全风险，请立即修改密码!</span><br>
                        <span id="tips"></span>
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="tips_1350"/></td>
                    <td><input class="yzm_200 h_25" name="password" id="password" type="password">
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="tips_1351"/></td>
                    <td><input class="yzm_200 h_25" name="password1" id="password1" type="password">
                        <span style="color: #808080"><s:text name="tips_1345"/></span>
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="tips_1352"/></td>
                    <td><input class="yzm_200 h_25" name="password2" id="password2" type="password"></td>
                </tr>
                <tr class="retrieve_table_tr">
                    <td colspan="2"></td>
                    <td>
                        <input class="btn bg_b3b3b3" type="submit"
                               onclick="editUserInfoPass('cloud_user_validatorUpdate_member')"
                               value="<s:text name="pub_ok"/>"/>
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
    function editUserInfoPass(ajaxCallUrl) {
        var pass0 = $("#password").val();
        var pass1 = $("#password1").val();
        var pass2 = $("#password2").val();
        $.ajax({
            type: "POST",
            url: ajaxCallUrl,
            data: {
                password: pass0,
                password1: pass1,
                password2: pass2
            },
            success: function (data) {
                var jsonData = $.parseJSON(data);
                if (jsonData.status == "1200") {
                    location.href = "/main";
                }
                $('#tips').text(jsonData.message);
            }
        })
    }
</script>

