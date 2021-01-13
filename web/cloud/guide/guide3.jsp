<%@ taglib prefix="s" uri="/struts-tags" %>
<!--
@version Reversion: x.x, Date: 2013-8-6, Author: bridge;
	change netmask and gateway
-->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-3.jsp' starting page</title>
    

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.ip{
	width: 30px; 
	border: 0px; 
	text-align: center;
}


</style>
	
<script type="text/javascript">

function setIP(ip)
{
	var ips = ip.split(".");
	
	document.getElementById("ip1").value = ips[0];
	document.getElementById("ip2").value = ips[1];
	document.getElementById("ip3").value = ips[2];
	document.getElementById("ip4").value = ips[3];
}

function setNetMask(ip)
{
	ips = ip.split(".");
	
	document.getElementById("code1").value = ips[0];
	document.getElementById("code2").value = ips[1];
	document.getElementById("code3").value = ips[2];
	document.getElementById("code4").value = ips[3];
}

function setGateWay(ip)
{
	ips = ip.split(".");
	document.getElementById("net1").value = ips[0];
	document.getElementById("net2").value = ips[1];
	document.getElementById("net3").value = ips[2];
	document.getElementById("net4").value = ips[3];
	
}
function load()
{
	var ip = parent.getSelectedIP();
	setIP(ip);	
	ip = parent.getSelectedNetMask();
	setNetMask(ip);
	ip = parent.getSelectedGateWay();
	setGateWay(ip);	
	
	parent.goStep(3);
	if (confirm("<s:text name="ip_tosame"/>"))
	{
		var ss = parent.getSameToPC();
		alert("ss;" + ss);
		if (ss != "")
		{
			var ips = ss.split("*");
			setIP(ips[0]);
			setNetMask(ips[2]);
			setGateWay(ips[1]);
		}
	}
}


function ipKeyDown(obj)
{    
	code=event.keyCode;   
	if(!((code>=48&&code<=57)||(code>=96&&code<=105)||code==190||code==110||code==13||code==9||code==39||code==8||code==46||code==99|| code==37))
		event.returnValue=false;   
	if(code==13)   
    	event.keyCode=9;   
	if(code==110||code==190)   
    	if(obj.value)   
        	event.keyCode=9;   
    	else   
        	event.returnValue=false;   
}

function ipKeyUp(obj)
{
	if (obj.value > 255)
		obj.value = "";
}

function getIP()
{
	return document.getElementById("ip1").value + "." +
		document.getElementById("ip2").value + "." +
		document.getElementById("ip3").value + "." +
		document.getElementById("ip4").value;
}

function getNetMask()
{
	return document.getElementById("code1").value + "." +
	document.getElementById("code2").value + "." +
	document.getElementById("code3").value + "." +
	document.getElementById("code4").value;
}

function getGateWay()
{
	return document.getElementById("net1").value + "." +
	document.getElementById("net2").value + "." +
	document.getElementById("net3").value + "." +
	document.getElementById("net4").value;
}


</script>
</head>
<body onload="load()">

<br />
<br />
<br />
<br />
<br />
<br />
<br />

<table style="background-image: url('/cloud/guide/image/edit-bg.jpg');width: 580px; height: 240px;" align="center">
<tr>
	<td style="height: 30px"></td>
</tr>
<tr>
	<td style="width: 125px"></td>
	<td style="width: 90px;font-family: -webkit-pictograph;"><s:text name="ipaddress" /></td>
	<td>
		<div style="border-style: outset; border-width: 1px; background-color: white; padding-left: 10px">
			<input id="ip1" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"  />.
			<input id="ip2" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>.
			<input id="ip3" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>.
			<input id="ip4" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>
		</div>
	</td>
	<td style="width: 150px;"></td>
</tr>

<tr>
	<td></td>
	<td><s:text name="netmask" /></td>
	<td>
		<div style="border-style: outset; border-width: 1px;  background-color: white; padding-left: 10px">
			<input id="code1" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"  />.
			<input id="code2" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>.
			<input id="code3" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>.
			<input id="code4" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>
		</div>
	</td>
</tr>

<tr>
	<td></td>
	<td><s:text name="gateway" /></td>
	<td>
		<div style="border-style: outset; border-width: 1px;  background-color: white; padding-left: 10px">
			<input id="net1" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"  />.
			<input id="net2" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>.
			<input id="net3" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>.
			<input id="net4" type="text" maxlength="3" class="ip" onkeydown="ipKeyDown(this)" onkeyup="ipKeyUp(this)"/>
		</div>
	</td>
</tr>

<tr>
	<td style="height: 30px"></td>
</tr>

</table>



</body>
</html>
