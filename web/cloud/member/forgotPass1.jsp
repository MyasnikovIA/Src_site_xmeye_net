<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title><s:text name="login_get_password"/></title>
    <script src="/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="/cloud/member/js/retrieve_paas.js" type="text/javascript"></script>
    <link href="/cloud/member/css/public.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/retrieve_pass.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        //发送验证码
        $(document).ready(function () {
            $('#sendMaiNO').click(function () {
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
                    url: '/cloud_mail_sendMail_member',
                    success: function (data) {
                        $(".J-tips").text(data);
                        if (data == "success") {
                            $(".J-send-code").remove();
                            $(".J-next").html(' <input class="btn bg_b3b3b3" type="submit" value="<s:text name="Next"/>"/>');
                        }


                    }
                })
            })
        });
        //返回
        function back() {
            history.go(-1);
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

    <!--获取邮箱验证码 star-->
    <div class="retrieve_box_email">

        <form action="/cloud_forgotPass_checkMail_member" method="post">
            <table class="retrieve_email_table">
                <tbody>
                <tr>
                    <td width="100px"></td>
                    <td></td>
                    <td class="prompt J-tips">
                        <s:property value="errorMessage"/>
                    </td>
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
                <tr class="J-send-code">
                    <td width="100px"></td>
                    <td colspan="2">
                        <div class="sub_box h_50">
                            <span class="send_ cursor btn bg_b3b3b3" id="sendMaiNO">&nbsp;<s:text
                                    name="tips_1393"/></span>
                        <span class="send_ cursor btn bg_b3b3b3" id="sendMaiOFF"
                              style="display: none;align-content: center"><span>60</span><s:text
                                name="tips_1331"/></span>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"></td>
                    <td class="J-next"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <!--获取邮箱验证码 end-->
</div>
</body>
</html>
