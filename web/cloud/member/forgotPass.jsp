<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="/cloud/member/css/public-min.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/retrieve_pass.css" type="text/css" rel="stylesheet">
    <title><s:text name="login_get_password"/></title>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript">
        //刷新
        function ref(e) {
            $('#verif').attr('src', '/verification_produce?jsessionid=' + Math.random(100))
        }
    </script>
</head>
<body>
<div id="header">
    <div onclick="window.location.href='/index'" class="logo cusPoint"></div>
</div>
<div class="center">
    <div class="retrieve_box_top">
        <div class="retrieve_box__log  icon_key fl"><s:text name="login_get_password"/></div>
        <div class="ab_right"><a href="/cloud/index.jsp"><s:text name="tips_1320"/></a></div>
        <div class="unline"></div>
    </div>
    <!--填写用户名 star-->
    <div class="retrieve_box_user">
        <form action="/cloud_forgotPass_checkUsername_member" method="post">
            <table class="retrieve_user_table" width="auto">
                <tbody>
                <tr>
                    <td width="100px"></td>
                    <td></td>
                    <td class="prompt">
                        <s:property value="errorMessage"/>
                    </td>
                </tr>
                <tr>
                    <td width="100px"></td>
                    <td><%--<s:text name="login_username"/>--%>用户Id</td>
                    <td><input class="yzm_200 h_25" type="text" name="user.id">
                        <span style="color: #808080"><s:text name="tips_1348"/></span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><s:text name="input_hint_verify"/></td>
                    <td><input class="yzm_100 h_25" type="text" name="pictureCode">
                        <a href="javascript:ref(this)"><img id="verif" src="/verification_produce"/></a>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"></td>
                    <td>
                        <input class="btn bg_b3b3b3" type="submit" value="<s:text name="Next"/>"/>

                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <!--填写用户名 end-->
</div>
</body>
</html>
<script src="/cloud/member/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/cloud/member/js/retrieve_paas-min.js" type="text/javascript"></script>