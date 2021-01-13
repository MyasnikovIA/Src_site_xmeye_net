<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java"  pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-6.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">

        function setIP() {

        }


        function load() {
            parent.goStep(6);
            document.getElementById("ipvalue").value = parent.getSelectedIP();
            document.getElementById("portvalue").value = parent.getSelectedPort();
            document.getElementById("snvalue").value = parent.getSelectedSN();

        }

        function ref(e) {
            $('#verif').attr('src', '/verification_produce?jsessionid=' + Math.random(100))
        }

        function save() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var alias = document.getElementById("alias").value;

            if (username == "") {
                alert("<s:text name="error_username_null"/>");
                return 1;
            } else if (password == "") {
                alert("<s:text name="error_password_null" />");
                return 1;
            } else if (alias == ""){
              alert("<s:text name="device_eidt_name_null"/>");
                return 1;
            } else {
                $.ajax({
                    type: "POST",
                    url: "/cloud_guide_login_null",
                    data: $('#form1').serialize(),
                    success: function (msg) {
                        if (msg == '1200') {
                            parent.goStep(7);
                            self.location = "/cloud_guide_guide7_guide";
                        }
                        else  alert(msg);
                    }
                });
                return 0;
            }

        }
    </script>
</head>
<body onload="load()">
<br/>
<br/>
<br/>
<br/>

<form id="form1" id="form1" method="post" action="/">
    <input type="hidden" id="ipvalue" name="deviceMy.ip" value=""/>
    <input type="hidden" id="portvalue" name="deviceMy.port" value=""/>
    <input type="hidden" id="snvalue" name="deviceMy.mac" value=""/>
    <input type="hidden"  name="deviceMy.username" value="admin"/>
    <input type="hidden"  name="deviceMy.password" value=""/>
    <table cellpadding="10px" align="center">
        <tr>
            <td colspan="2" style="text-align: center;"><span style="color: rgb(254,179,0); font-weight: bold;"><s:text
                    name="login_hint"/> </span></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="username"/></td>
            <td><input id="username" type="text" name="log.name" value="${log.name}"/></td>
        </tr>

        <tr id="row_password">
            <td><s:text name="password"/></td>
            <td><input id="password" type="password" style="width: 152px" name="log.password"
                       value="${log.password}"/>${tips}</td>
        </tr>

        <tr>
            <td><s:text name="device_alias"/></td>
            <td><input id="alias" type="text" style="width: 152px" name="deviceMy.name" value=""/></td>
        </tr>

        <tr>
            <td><s:text name="login_verify"/></td>
            <td><input class="yzm_50 h_20" type="text" name="log.verificationCode">${tips}
                <a href="javascript:ref(this)">
                    <img class="resh_img" id="verif" src="/verification_produce"/>
                </a>
            </td>
        </tr>
    </table>
</form>
<div style="position: absolute;top: 400px;left: 550px;">
    <a href="/cloud_register_register_member" style="text-decoration: none;" target="_blank">
		<span style="color: rgb(254,179,0); font-weight: bold;">
			<s:text name="regist_need"/>
		</span>
    </a>
</div>
</body>
</html>
