<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-5.jsp' starting page</title>
    
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
	parent.goStep(5);
}


function getSelectedIndex()
{
	if (document.getElementById("toaccount").checked)
		return 0;
	else
		return 1;
		
}
</script>
</head>
<body onload="load()">

<div style="height: 100px">

</div>

<table align="center">
<tr>
	<td><input id="toaccount" type="radio" name="select" />&nbsp;<s:text name="device_add_account" /></td>
</tr>
<tr>
	<td height="30px"></td>
</tr>
<tr>
	<td><input  type="radio"  checked="checked"  name="select" />&nbsp;<s:text name="device_access" /></td>
</tr>
</table>
</body>
</html>
