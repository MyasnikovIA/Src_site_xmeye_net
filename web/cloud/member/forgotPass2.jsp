<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="/cloud/member/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="/cloud/member/js/retrieve_paas.js" type="text/javascript"></script>
    <link href="/cloud/member/css/public.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/retrieve_pass.css" type="text/css" rel="stylesheet">
    <title><s:text name="login_get_password"/></title>

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body>
<div id="header">
    <div onclick="window.location.href='/index'" class="logo cusPoint"></div>
</div>
<div class="center">
    <div class="retrieve_box_top">
        <div class="retrieve_box__log  icon_key fl"><s:text name="tips_1392"/></div>
        <div class="ab_right"><a href="/cloud/index.jsp"><s:text name="tips_1320"/></a></div>
        <div class="unline"></div>
    </div>

    <!--重置密码 star-->
    <div class="retrieve_box_pass">

        <form action="/cloud_forgotPass_updatePass_member" method="post">

            <table class="retrieve_pass_table">
                <tbody>
                <tr>
                    <td width="100px"></td>
                    <td></td>
                    <td class="prompt"><s:property value="errorMessage"/></td>
                </tr>

                <tr>
                    <td width="100px"></td>
                    <td><s:text name="login_username"/></td>
                    <td class="username">${sessionScope.userByName.username}</td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="user_mail"/></td>
                    <td><span class="email">${sessionScope.mails} </span></td>
                </tr>

                <tr>
                    <td></td>
                    <td><s:text name="input_hint_verify"/></td>
                    <td><input class="input_" type="text" name="code"></td>
                </tr>

                <tr class="reset_pass">
                    <td width="100px"></td>
                    <%--<td style="display: none"><input class="yzm_200 h_25" type="text" name="userId"
                                                     value="${sessionScope.uid}"/></td>--%>
                    <td><s:text name="user_password_new"/></td>
                    <td><input class="input_" type="password" name="password">
                        <span style="color: #808080"><s:text name="tips_1345"/></span></td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><s:text name="user_password_new_confirm"/></td>
                    <td><input class="input_" type="password" name="password2"></td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td><input class="btn bg_b3b3b3" type="submit" value="<s:text name="pub_ok"/>"/></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <!--重置密码 end-->
</div>
</body>
</html>
