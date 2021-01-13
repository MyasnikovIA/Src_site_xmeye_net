<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-1.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<script type="text/javascript">


function load()
{
/*	<logic:present name="username">
		parent.setUsername("<bean:write name='username' />");
		parent.setPassword("<bean:write name='password' />");
	</logic:present>*/

	parent.goStep(7);
}

</script>
</head>
<body onload="load();">

<div style="height: 100px">
</div>

<table align="center">
<tr>
	<td><div style="background-image: url('/cloud/guide/image/finish.jpg'); width: 53px; height: 44px"></div></td>
	<td><span style="color: rgb(240,174,33); font-size: 36px; font-weight: bold;"><s:text name="the_end" /></span></td>
</tr>

</table>


</body>
</html>
