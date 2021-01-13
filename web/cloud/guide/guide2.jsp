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
    <title>My JSP 'guide-2.jsp' starting page</title>
    
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
var selectedIP;
var selectedSN;
var selectedGateWay;
var selectedNetMask;
var selectedPort;

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
	
	//alert(obj.cells[0].innerHTML);
	
	selectedIP = obj.cells[0].innerHTML;
	selectedPort = obj.cells[1].innerHTML;
	selectedSN = obj.cells[2].innerHTML;
	
	selectedNetMak = obj.cells[4].innerHTML;
	selectedGateWay = obj.cells[3].innerHTML;
	
	
}

function getSelectedIP()
{
	return selectedIP;	
}

function getSelectedSN()
{
	return selectedSN;	
}
function getSelectedNetMask()
{
	return selectedNetMak;	
}
function getSelectedGateWay()
{
	return selectedGateWay;	
}
function getSelectedPort()
{
	return selectedPort;
}

function loadList()
{
	var data = parent.getDeviceList();
	
	var table = document.getElementById("list");
	var devices = data.split("&&");

	for (var i = 0; i < devices.length -1; i++)
	{
		var device = devices[i].split("*");
		var newRow = table.insertRow(table.rows.length);
		newRow.id = "row_" + i;
		
		//newRow.setAttribute("className", "content");
		//newRow.setAttribute("onmouseover", "rowMouseOver(this);");
		//newRow.setAttribute("onmouseout", "rowMouseOut(this);");
		//newRow.setAttribute("onclick", "rowClick(this);");
		
		newRow.onmouseover = function() { rowMouseOver(newRow.id); };
		newRow.onmouseout = function() { rowMouseOut(newRow.id); };
		
		var cell = null;
		
		cell = newRow.insertCell(0);
		cell.innerHTML = device[0];
		
		cell = newRow.insertCell(1);
		cell.innerHTML = device[3];
		
		cell = newRow.insertCell(2);
		cell.innerHTML = device[4];
	}

}

function load()
{
//	loadList();
	parent.goStep(2);
}



</script>
</head>
<body onload="load();">

<table id="list" style=" width: 600px; border: 0px" cellpadding="0px" cellspacing="0px" align="center">
<tr style="font-family: -webkit-pictograph;">
	<td width="30%" >&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="device_ip" /></td>
	<td width="30%" >&nbsp;&nbsp;<s:text name="device_port" /></td>
	<td width="40%" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="device_sn" /></td>
</tr>
<tr >
	<td colspan="3" style="background-image: url('/cloud/guide/image/table-space.jpg'); height: 10px;"></td>
</tr>
<script>
	var data = parent.getDeviceList();
	var devices = data.split("&&");
	for (var i = 0; i < devices.length -1; i++)
	{
		var device = devices[i].split("*");
		var html = "<tr onmouseout='rowMouseOut(this)' onmouseover='rowMouseOver(this)' onclick='rowClick(this)' >";
		html = html + "<td>" + device[0] +"</td>";
		html = html + "<td>" + device[3] +"</td>";
		html = html + "<td>" + device[4] +"</td>";
		html = html + "<td style='display: none'>" + device[1] +"</td>";
		html = html + "<td style='display: none'>" + device[2] +"</td>";
		html = html + "</tr>";
		document.write(html);
		//newRow.setAttribute("className", "content");
		//newRow.setAttribute("onmouseover", "rowMouseOver(this);");
		//newRow.setAttribute("onmouseout", "rowMouseOut(this);");
		//newRow.setAttribute("onclick", "rowClick(this);");
		/*
		newRow.onmouseover = function() { rowMouseOver(newRow.id); };
		newRow.onmouseout = function() { rowMouseOut(newRow.id); };
		var cell = null;
		cell = newRow.insertCell(0);
		cell.innerHTML = device[0];
		cell = newRow.insertCell(1);
		cell.innerHTML = device[3];
		cell = newRow.insertCell(2);
		cell.innerHTML = device[4];
		*/
	}


</script>

</table>


</body>
</html>
