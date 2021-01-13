<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-4.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

<style type="text/css">

.row_over{
	background-color: rgb(239,239,239);
}

.row_out{
	
	
	background-color: white;
}

.row_selected{
	background-color: rgb(225,225,225);
}

td{
	height: 28px;
}

</style>

<script type="text/javascript">

var selectedRow;

function test()
{
	parent.maintest();
	parent.getDeviceList();
	
}



function rowMouseOver(obj)
{
	if (obj.className != "row_selected")
		obj.className = "row_over";
}
function rowMouseOut(obj)
{
	if (obj.className != "row_selected")
		obj.className = "row_out";
}

function rowClick(obj)
{
	if (selectedRow != null)
		selectedRow.className = "row_out";
		
	obj.className = "row_selected";
	selectedRow = obj;
	
	
	document.getElementById(obj.id+"_1").checked = true;
	//alert(obj.cells[0].innerHTML);
	
}


function loadList()
{
	var data = parent.getWifiList();
	
	var table = document.getElementById("list");
	var devices = data.split("&&");

	for (var i = 0; i < devices.length -1; i++)
	{
		var device = devices[i].split("*");
		var newRow = table.insertRow(table.rows.length);
		newRow.id = "row_" + i;
		
		
		newRow.setAttribute("onmouseover", "rowMouseOver(this);");
		newRow.setAttribute("onmouseout", "rowMouseOut(this);");
		newRow.setAttribute("onclick", "rowClick(this);");
		
	
		
		var cell = null;
		
		cell = newRow.insertCell(0);
		cell.innerHTML = device[0];
		
		cell = newRow.insertCell(1);
		cell.innerHTML = device[1];
		
		cell = newRow.insertCell(2);
		cell.innerHTML = device[1];
	}

}


function load()
{
	///loadList();
	
	parent.goStep(4);
}

function getSSID()
{
	var radios = document.getElementsByName("wifi_ssid");
	if (!radios)
		return "";
	for(var i =0; i< radios.length; i++)
	{
		if (radios[i].checked)
			return radios[i].value;
	}
	return "";
}

function getPassword()
{
	var obj =document.getElementById("wifi_password");
	if (obj != null)
		return obj.value;
	else 
		return "";
}

</script>
</head>

<body onload="load();">

<table id="list"  style="width: 600px; border: 0px" cellpadding="0px" cellspacing="0px" align="center">
<tr style="font-family: -webkit-pictograph;">
	<td></td>
	<td  width="30%"><s:text name="ConfigNet_SSID" /></td>
	<td width="30%"><s:text name="ConfigNet_AuthMode" /></td>
	<td width="40%"><s:text name="ConfigNet_Signal" /></td>
</tr>
<tr>
	<td colspan="4" style="background-image: url('/cloud/guide/image/table-space.jpg'); height: 10px;"></td>
</tr>
<script>
var data = parent.getWifiList();
var devices = data.split("&&");

var curSSID = parent.getCurrentWifi();

var printCount = 0;
for (var i = 0; i < devices.length -1; i++)
{
	var device = devices[i].split("*");
	var html = "<tr id='row_"+i+"' onmouseout='rowMouseOut(this)' onmouseover='rowMouseOver(this)' onclick='rowClick(this)' >";
	if (curSSID == device[0])
		html = html + "<td><input type='radio' id='row_"+i+"_1' name='wifi_ssid' value='"+device[0]+"' checked='checked' ></td>";
	else
		html = html + "<td><input type='radio' id='row_"+i+"_1' name='wifi_ssid' value='"+device[0]+"'></td>";	
	html = html + "<td>" + device[0] +"</td>";
	html = html + "<td>" + device[1] +"</td>";
	if (device[2] == 1)
		html = html + "<td>" + "<s:text name="ConfigNet_NoSignal" />" +"</td>";
	else if (device[2] == 2)
		html = html + "<td>" + "<s:text name="ConfigNet_VeryLow" />" +"</td>";
	else if (device[2] == 3)
		html = html + "<td>" + "<s:text name="ConfigNet_Low" />" +"</td>";
	else if (device[2] == 4)
		html = html + "<td>" + "<s:text name="ConfigNet_Good" />" +"</td>";
	else if (device[2] == 5)
		html = html + "<td>" + "<s:text name="ConfigNet_VeryGood" />" +"</td>";
	else 
		html = html + "<td>" + devcie[2] +"</td>";
		
	html = html + "</tr>";
	document.write(html);	
	
	printCount++;
}



</script>

</table>

<br />
<br />

<script type="text/javascript">
if (printCount > 0)
{
	var html = "<s:text name="password" /><input type='password' id='wifi_password' /> ";
	document.write(html);
}
else
{
	var html = "<table align='center'><tr><td><span style='color: rgb(240,174,33); font-size: 36px; font-weight: bold;'><s:text name="wifi_find_none" /></span> </td></tr></table>";
	document.write(html);
}

</script>


</body>
</html>
