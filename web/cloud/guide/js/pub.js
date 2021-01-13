//set table alernete color
function SetAlterBG()
{
	var tables = document.getElementsByTagName("table");
	for (var i = 0; i < tables.length; i++)
	{
		var t = tables[i];
		for (var j = 1; j < t.rows.length; j++)
		{
			t.rows[j].className = "list-item-" + (j % 2);
		}
	}
}

//Switch img element's image
function SwitchImg()
{
	var e = event.srcElement;
	var imgPath = e.src;
	//get the ".gif" position;
	var extGif = ".gif";
	var tailName = "-over";
	
	var tailPos = imgPath.indexOf(tailName + extGif);
	if (tailPos > 0)
	{
		var newImgPath = imgPath.substring(0, tailPos) + extGif;
		e.src = newImgPath;
		
		return;
	}
	
	var extPos = imgPath.indexOf(extGif);
	if (extPos > 0)
	{
		var newImgPath = imgPath.substring(0, extPos) + tailName + extGif;
		e.src = newImgPath;
	
		return;
	}
}

function validateNum(msg)
{
	var ele = event.srcElement;
	var val = ele.value;
	if (!isNum(val))
	{
		showError(msg, ele);
	}
	else
	{
		hideErrorInfo();
	}
	
}

function validateRange(msg, vMix, vMax)
{
	var ele = event.srcElement;
	var val = ele.value;
	
	if (!valNumRange(val, vMix, vMax))
	{
		showError(msg, ele);
	}
	else
	{
		hideErrorInfo();
	}
}

function validateRangeWithDef(msg, vMix, vMax, vDef)
{
	var ele = event.srcElement;
	var val = ele.value;
	
	if (!valNumRange(val, vMix, vMax))
	{
		alert(msg);
		ele.value = vDef;
		ele.select();
	}

}

function hideErrorInfo()
{
	with (erroInfo.style)
	{
		visibility = 'hidden';
	}
}

function showError(msg, ele)
{
	setText(msg);
	
	var p = new Point();
	p = getPos(ele);
	
	with (erroInfo.style)
	{
		left = p.x;
		top  = p.y + ele.offsetHeight;
		visibility = 'visible';
	}
	
	ele.focus();
	ele.select();
}

function setText(text)
{
	erroInfo.innerText = text;
}

function isNum(val)
{
	
	//var reNum = /\D/;
	//var reNum = /^[1-9][\d]{1,}$/;
	//var reNum=/^[0-9]{1,20}$/; 
	var reNum = /^[\d]{0,}$/;
	if (reNum.test(val))
	{
		return true;
	}
	
	return false;
}

function valNumRange(val, vMix, vMax)
{
	if (isNum(val))
	{
		if ((val >= vMix) && (val <= vMax))
		{
			return true;	
		}
		else
		{
			return false;	
		}
	}
	else
	{
		return false;	
	}
}

function Point(iX, iY){
    this.x = iX;
    this.y = iY;
}

function getPos(aTag){
    var e = aTag;
    var pt = new Point(0,0);
/*	
	pt.y=e.offsetTop;
	pt.x = e.offsetLeft;
   	while(e=e.offsetParent)
   	{
		pt.y += e.offsetTop;  //获取X坐标
	  	pt.x += e.offsetLeft; //获取Y坐标
   	}
*/	  

    oRect = e.getBoundingClientRect();   
	//calculate the crollbar position, modified by ryan zhang on 2010-01-20;
	var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);    
	var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
    pt.x=oRect.left +   scrollLeft;
    pt.y=oRect.top  + scrollTop;
	
    return pt;
}


with (document) 
{
    write("<Div id='erroInfo'>");
    write("</Div>");
}

function checkMe(va)
{
	var e = event.srcElement;
	var val = e.value;
	alert(val);
	if ((event.keyCode < 48)
		|| (event.keyCode > 57)
		|| ((event.keyCode == 48) && (getPosition(e) ==0)))//第一个数不能为“0”;
	{
		event.returnValue=false;
	}


	//var reg = /[\D]{0,}$/;
	//var reg = /^[1-9][\d]*$/;
	//alert(reg.test(val));
}

//get the cursor posion in text box;
function getPosition(obj)
{
	var result = 0;
	if(obj.selectionStart)
	{ //非IE浏览器
   		result = obj.selectionStart
	}
	else
	{ //IE
   		var rng;
   		if(obj.tagName == "TEXTAREA")
		{ //如果是文本域
    		rng = event.srcElement.createTextRange();
    		rng.moveToPoint(event.x,event.y);
   		}
   		else
   		{ //输入框
    		rng = document.selection.createRange();
   		}

   		rng.moveStart("character", -event.srcElement.value.length);
   		result = rng.text.length;
	}

	return result;
}

function forceNum()
{
	if (!isNum(event.srcElement.value))
	{
		event.srcElement.value = event.srcElement.value.replace(/\D/g, "");		
	}
}
function froceTextAreaNum(maxNum)
{
	if (event.srcElement.value.length > maxNum)
	{
		event.srcElement.value = event.srcElement.value.substring(0, maxNum);
	}
}

function isFunctionKey(kd)
{
	var val =  ((kd == 8)		//back space
		 		|| (kd == 46)	//delet
		 		|| (kd == 27)	//esc
		 		|| (kd == 9)	//tab
				|| (kd == 144 )	//Num Lock
		 		|| ((kd >= 33) && (kd <= 40))) //up,down,left,right,home,end,Page Up,Page Down
	
	return val;
}

function forceCountWhenKeyDown(count)
{
	//alert(event.keyCode);
	if ((event.srcElement.value.length < count) 
		 || isFunctionKey(event.keyCode))
	{
		event.returnValue = true;
	}
	else
	{
		event.returnValue = false;
	}
}

function forceNumWhenKeyDown()
{
	if (((event.keyCode >= 48) && (event.keyCode <= 57))
		|| ((event.keyCode >= 96) && (event.keyCode <= 105))
		|| isFunctionKey(event.keyCode))
	{
		event.returnValue = true;
	}
	else
	{
		event.returnValue = false;	
	}
}

function isAllSpace(val)
{
	var parten = /^\s*$/ ; 
	if(parten.test(val)) 
	{
		return true;	
	}
	else 
	{
		return false;	
	}
}

function trim(val)
{
	return val.replace(/^\s+|\s+$/g,"");
}

String.prototype.trim = function()
{
	return this.replace(/^\s+|\s+$/g,"");
}

function hideEle(ele)
{
	ele.className = "hidden";
}

function showEle(ele)
{
	ele.className = "show"
}

function setDisable(ele)
{
	ele.readOnly = true;
	ele.className= "disable_input";
	ele.onblur = ""
}

function isMac(val)
{
	//var pattern=/^([0-9A-Fa-f]{2})(-[0-9A-Fa-f]{2}){5}|([0-9A-Fa-f]{2})(:[0-9A-Fa-f]{2}){5}/ //FF-FF-FF-FF-FF-FF-FF 或者"FF:FF:FF:FF:FF:FF:FF"
	//var macRule = /^[0-9a-fA-F]{12}$|([0-9A-Fa-f]{2})(:[0-9A-Fa-f]{2}){5}/;
	var macRule1 = /^[0-9a-fA-F]{12}$/;
	var macRule2 = /^[0-9a-fA-F]{16}$/;
	
	return (macRule1.exec(val) || macRule2.exec(val));
}

function getMacColon(val)
{
	var mac = "";
	for (var i = 0; i < (val.length); i = i + 2)
	{
		if (i != val.length - 2)
		{
			mac += val.substring(i, i + 2) + ":";
		}
		else
		{
			mac += val.substring(i, i + 2);
		}
		
	}
	
	return mac;
}

function isEMail(val)
{
	var emailRule= /^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$/;
	
	return emailRule.exec(val);
}

function setEleDisable(ele, b)
{
	ele.disabled = b;
}

var mac_fun = null;
var mac_seq = 0;
var interval = null;
var isStop = false;
function getMacInfo(macStr, fun)
{
	clearInterval(interval);
	mac_fun = fun;
	var url = "/login.do?method=getSeq&mac=" + macStr;
	//document.getElementById("test1").value += macStr + "  ";
	var loader = new net.ContentLoader(url, seqCB, null, "POST", "");
}

function seqCB()
{
	isStop = false;
	mac_seq = this.req.responseText;
	//document.getElementById("test2").value += this.req.responseText + "  ";
	interval = setInterval("getMac(" + this.req.responseText + ");", 500);
}

function getMac(seq)
{
	if (isStop)
	{
		return;
	}
	var url = "/login.do?method=getMac&seq=" + mac_seq;
	//document.getElementById("test3").value += mac_seq + "  ";
	var loader = new net.ContentLoader(url, macCB, null, "POST", "");
	isStop = true;
}

function macCB()
{
	
	var res = this.req.responseText;
	//document.getElementById("test4").value += res + "  ";
	mac_fun(res);
}

