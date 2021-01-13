<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title><s:text name="guide_enter"/></title>
	
	<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="/css/style.css" />
	

<style type="text/css">

.row_over{
	background-color: rgb(239,239,239);
}

.row_out{
	background-color: white;
}

.button{
	background-image: url("/cloud/guide/image/button.jpg");
	width: 118px;
	height: 39px;
	border: 0px;
}

.button-HOVER {
	background-image: url("/cloud/guide/image/button-hover.jpg");
	width: 118px;
	height: 39px;
	border: 0px;
}
</style>

    <script type="text/javascript" language="JavaScript">
	
	 var bCrossBrow=false;
	 var bnpCheck = false;
	
	if(navigator.userAgent.indexOf('IE') < 0)
	{
		if(navigator.platform != "Win32")//
		{
			location="Login.htm";
		}
		var userAgent = navigator.userAgent,   
                rMsie = /(msie\s|trident.*rv:)([\w.]+)/,   
                rFirefox = /(firefox)\/([\w.]+)/,   
                rOpera = /(opera).+version\/([\w.]+)/,   
                rChrome = /(chrome)\/([\w.]+)/,   
                rSafari = /version\/([\w.]+).*(safari)/;
		var browserMatch = uaMatch(userAgent.toLowerCase());
		 
		if(browserMatch.browser!="IE")
		{
		    // location="Login.htm";
			 bCrossBrow=true;
		}
		
	}
	
	function uaMatch(ua) 
	{  
                    var match = rMsie.exec(ua);
		      
                    if (match != null) {  
                        return { browser : "IE", version : match[2] || "0" };  
                   }  
                    var match = rFirefox.exec(ua);  
                   if (match != null) {  
                       return { browser : match[1] || "", version : match[2] || "0" };  
                    }  
                    var match = rOpera.exec(ua);  
                    if (match != null) {  
                       return { browser : match[1] || "", version : match[2] || "0" };  
                    }  
                   var match = rChrome.exec(ua);  
                   if (match != null) {  
                       return { browser : match[1] || "", version : match[2] || "0" };  
                   }  
                    var match = rSafari.exec(ua);  
                    if (match != null) {  
                       return { browser : match[2] || "", version : match[1] || "0" };  
                    }  
                  if (match != null) {  
                        return { browser : "", version : "0" };  
                   }  
    }  
	var len = navigator.mimeTypes.length;	
					
	for(var i = 0; i <= len; i++) 
	{
		//alert(navigator.mimeTypes[i].type.toLowerCase());
		//if(navigator.mimeTypes[i].type.toLowerCase() == "application/npguide-plugin") 
		//{
			bnpCheck = true;		
		//	break;
		//}
	}
	
    </script>

<script type="text/javascript">

var selectedIP;
var selectedSN;
var selectedPort;
var selectedNetMask;
var selectedGateWay;
var username;
var password;

function setUsername(value)
{
	username = value;	
}

function setPassword(value)
{
	password = value;	
}

function getUsername()
{
	return username;	
}

function getPassword()
{
	return password;	
}


var step = 1;

/*  
 * public
 */
function getSelectedPort()
{
	return selectedPort;	
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
	return selectedNetMask;	
}
function getSelectedGateWay()
{
	return selectedGateWay;	
}
function test()
{
	//var obj = document.frames["itest"].document.getElementById("bridge");
	var obj = document.getElementById("itest").contentDocument.getElementById("bridge");
	alert(obj.value);
}

function test2()
{
	var obj = document.getElementById("itest").contentWindow.getButton();
	alert(obj.value);
}

function maintest()
{
	alert("MESSAGE");	
}

/*
 * 
 */
function forward()
{
	var itemFrame = document.getElementById("itemFrame");

	if (step == 1)
		return;
	if (step == 5)
	{
		if (getWifiEnable() !=  1)
		step--;
		step--;
		itemFrame.src = "guide-"+step+".jsp";
		return;
	}		
	
	step--;
	itemFrame.src = "guide-"+step+".jsp";
}

function next()
{
	var itemFrame = document.getElementById("itemFrame");
	
	if (step > 7)
		return;
/*
	if (step == 1)
	{
		document.getElementById("area").style.display = "none";
		document.getElementById("device").style.display = "block";
		
		loadDeviceList();
	}
*/
	if (step == 2)
	{
		if (itemFrame.contentWindow.getSelectedIP() == null)
		{
			alert("<s:text name='device_unselected'/>");
			return;
		}
		else
		{
			selectedIP = itemFrame.contentWindow.getSelectedIP();
			selectedSN = itemFrame.contentWindow.getSelectedSN();
			selectedPort = itemFrame.contentWindow.getSelectedPort();
			selectedNetMask = itemFrame.contentWindow.getSelectedNetMask();
			selectedGateWay = itemFrame.contentWindow.getSelectedGateWay();
		}
	}
	
	if (step == 3)
	{
		if (updateDeviceIp() != 0)	
		{
			alert("error");
			return ;
		}
		
		if (getWifiEnable() !=  1)
		{
			step++;
			step++;
			itemFrame.src = "guide-"+step+".jsp";
			return;
		}
	}
	
	if (step == 4)
	{
		setWifi();
	}
	
	if (step == 5)
	{
		if (itemFrame.contentWindow.getSelectedIndex() == 1)
			self.location = "/video/index.jsp?mac=" + selectedSN + "&username=" + "admin" + "&password=" ;
		
	}
	
	if (step == 6)
	{
		itemFrame.contentWindow.save();
		return ;
	}
	
	if (step == 7)
	{
		var url = "/login.do?method=loginFromGuide&username=" + username + "&password=" + password;
		self.location = url;
		return;
	}
	
//	waiting();
	
	
	step++;
	itemFrame.src = "guide-"+step+".jsp";
}

function getEnd()
{
	var itemFrame = document.getElementById("itemFrame");
	
	step = 7;
	itemFrame.src = "guide-"+step+".jsp";
		
}

function goStep(no)
{
	step = no;
	if (step == 7)
		document.getElementById("nextStep").value = "<s:text name='login' />";
		else
			document.getElementById("nextStep").value = "<s:text name='next' />";
	var stepFrame = document.getElementById("stepFrame");
	stepFrame.contentWindow.goStep(step);
	
//	showarea();
}

function waiting()
{
	document.getElementById("wait").style.height = "100%";
	document.getElementById("area").style.height = "0px";
}

function showarea()
{
	document.getElementById("wait").style.height = "0px";
	document.getElementById("area").style.height = "100%";
}

function getDeviceList()
{
	var ocx = document.getElementById("ocx");
	
	var devices = ocx.getLanDevices();
	

	return devices;
}

function getWifiList()
{
	var ocx = document.getElementById("ocx");
	var wifi = ocx.getWifiList(selectedSN);
	return wifi;
}

function getCurrentWifi()
{
	var ocx = document.getElementById("ocx");
	return  ocx.getWifiConfig(selectedSN) ;
}

function setWifi()
{
	var ocx = document.getElementById("ocx");
	var itemFrame = document.getElementById("itemFrame");
	var ssid = itemFrame.contentWindow.getSSID();
	var password = itemFrame.contentWindow.getPassword();
	if (ssid != "")
	{
	
	//var result = ocx.setWifiConfig(selectedSN, ssid, password);
		ssid = ssid + "&"+password;
		var result = ocx.setWifiConfig(selectedSN, ssid);
	}
	
	return result;
}
function updateDeviceIp()
{
	var itemFrame = document.getElementById("itemFrame");
	
	if (itemFrame.contentWindow.getIP() != selectedIP || 
			itemFrame.contentWindow.getGateWay() != selectedGateWay ||
			itemFrame.contentWindow.getNetMask() != selectedNetMask)
	{
	
		var ip = itemFrame.contentWindow.getIP() +"&&"+itemFrame.contentWindow.getGateWay() + "&&"+itemFrame.contentWindow.getNetMask();
		var ocx = document.getElementById("ocx");
		
		return ocx.updateDeviceIp(selectedSN, ip);
		selectedIP = itemFrame.contentWindow.getIP();
	}
	else
		return 0;
}

function  getWifiEnable()
{
	var ocx = document.getElementById("ocx");
	
	var result = ocx.getWifiEnable(selectedSN);
	return result;
}

function getSameToPC()
{
	var ocx = document.getElementById("ocx");
	var result = ocx.getSameToPC();
	return result;
}

function init()
{
	ocx.setlanguage(100);
}
</script>

</head>


<body >


<div style="height: 93px; width: 100%; background-image: url('/cloud/guide/image/top.jpg'); ">
	<table border="0" cellpadding="0px" cellspacing="0px">
	<tr>
		<td width="50%"></td>
		<td >
			<div style="padding-top:20px; float: left; height: 93px; width: 1028px; font-size: 48px; font-weight: bold; color: rgb(253, 170, 6) ">
				&nbsp;&nbsp;<s:text name="wizard" />
			</div>	
		</td>
		<td width="50%"></td>
	</tr>
	</table>
	
</div>
	

<table cellpadding="0px" cellspacing="0px" width="100%"  border="0">
<tr>
	<td width="50%" style="background-repeat: repeat-x; background-image: url('/cloud/guide/image/border-shadow.jpg')"></td>
	<td >
		<table cellpadding="0px" cellspacing="0px" border="0" width="1028px">
		<tr>
			<td colspan="4" style=" background-image: url('/cloud/guide/image/border-top.jpg'); height: 18px;"></td>
		</tr>
		<tr>
			<td>
				<iframe id="stepFrame" width="270px" height="620px" src="step.jsp" frameborder="0" scrolling="no"></iframe>
			</td>
			<td>
				<div id="area" style="width: 700px; height: 500px ">
					<iframe id="itemFrame" src="guide-1.jsp" style="width: 100%; height: 100%;" frameborder="0" scrolling="auto"></iframe>
				</div>
				
				<br />
				<br />
				<div style="float: right">
					<input type="button" class="button" value="<s:text name="forward"/>" onClick="forward()" onMouseOver="this.className = 'button-hover'; " onMouseOut="this.className = 'button'; " />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="nextStep" type="button" class="button" value="<s:text name="next" />" onClick="next()" onMouseOver="this.className = 'button-hover'; " onMouseOut="this.className = 'button'; "/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</td>
			<td style="background-image: url('/cloud/guide/image/border-right.jpg'); width: 19px">
			</td>
		</tr>
		<tr>
			<td colspan="4" style=" background-image: url('/cloud/guide/image/border-bottom.jpg'); height: 23px;"></td>
		</tr>
		
		</table>		
	</td>
	
	<td width="50%" style="background-repeat: repeat-x; background-image: url('/cloud/guide/image/border-shadow.jpg')"></td>
</tr>
</table>

<div id="downLoad" style="width:100%;height:100%;margin-top:0;display:none; background-color: #FFFFFF;">
    <div id="dlText" style="float:left;margin:300px 0 0 30px;width:540px;height:12px;text-align:center;color:#000;"></div>
    <button id="dlbutton" style="float:left;margin:300px 0 0 0px;color:#000;width:100px;height:12px" onclick="Download();"></button>
</div>
<script>
				alert(navigator.language);
	 			var userla=navigator.language;
	
				if(userla=="zh-CN")
				{
					 var dlT = document.getElementById("dlText");
					var dlB = document.getElementById("dlbutton");

					dlT.innerHTML="<s:text name="guide_dlText"/>";
					dlB.innerHTML ="<s:text name="guide_dlbutton"/>";
					
				}
				else
				{	
				        var dlT = document.getElementById("dlText");
					var dlB = document.getElementById("dlbutton");

				   	dlT.innerHTML="Click on the download guide plug-in, please close to launch a browser installed";
					dlB.innerHTML ="Download";					
				}
</script>

<br />

<script>
	if(!bCrossBrow)
		document.write("<object style='vertical-align:middle' id='ocx' width='0px' height='0px' classid='CLSID:F0CCC1CB-42D6-4357-B667-64E8563C2620' codebase='/video/web.cab#version=3,0,0,0'></object>")
	else
		document.write("<object id='ocx' type='application/npGuide-plugin' width='0px' height='0px' ></object>") 
</script>
<script>
	
	if(bCrossBrow&&!bnpCheck)
	{
	  var guide = document.getElementById("downLoad");
	  guide.style.display='';
	 
	//  var view = document.getElementById("topView");
	 // view.style.display='none';	
	}
</script>
</body>
</html>