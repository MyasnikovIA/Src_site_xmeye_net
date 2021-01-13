
/**
 * @version Reversion: x.x, Date: 2013-8-2, Author: bridge;
 * @version Reversion: x.x, Date: 2013-10-29, Author: bridge;
 * */

/*
 * @author: bridge;
 * import snow.valid.js
 * import snow.cookie.js
 * import general/index_variable.js
 * */

function getUsername()
{
	return document.getElementById("username").value;
}
function setUsername(username)
{
	document.getElementById("username").value = username;
}

function getPassword()
{
	return document.getElementById("password").value;
}
function setPassword(password)
{
	document.getElementById("password").value = password;
}

function getDeviceId()
{
	return document.getElementById("deviceId").value;
}
function setDeviceId(deviceId)
{
	document.getElementById("deviceId").value = deviceId;
}

function getRandCode()
{
	return document.getElementById("randcode").value;
}
function getVerification()
{
	return document.getElementById("verification").value;
}

function hasRemember()
{
	return document.getElementById("remember") != null;
}
function getRemember()
{
	var remember = document.getElementById("remember");
	if (remember != null)
		return remember.checked;
	else
		return false;
}
function setRemember(isRemember)
{
	var remember = document.getElementById("remember");
	if (remember != null)
		remember.checked = isRemember;
}

function hasLanguage()
{
	return document.getElementById("language") != null;
}
function getLanguage()
{
	var language = document.getElementById("language");
	if (language != null)
		return language.value;
	else
		return null;
}
function setLanguage(value)
{
	var language = document.getElementById("language");
	if (language != null)
		language.value = value;
}

/********* Cookie ***************/
function getCookieLanguage()
{
	return getCookie("xmeye.language");
}
function setCookieLanguage(language)
{
	setCookie("xmeye.language", language);
}
function getCookieCountry()
{
	return getCookie("xmeye.country");
}
function setCookieCountry(country)
{
	setCookie("xmeye.country", country);
}

function getCookieUsername()
{
	return getCookie("xmeye.username");
}
function setCookieUsername(username)
{
	setCookie("xmeye.username", username);
}
function getCookiePassword()
{
	return getCookie("xmeye.password");
}
function setCookiePassword(password)
{
	setCookie("xmeye.password", password);
}

function getCookieDeviceId()
{
	return getCookie("xmeye.deviceId");
}
function setCookieDeviceId(deviceId)
{
	setCookie("xmeye.deviceId", deviceId);
}

function getCookieRemember()
{
	return getCookie("xmeye.remember");
}
function setCookieRemember(remember)
{
	return setCookie("xmeye.remember", remember);
}

/***********/

function loadCookieData()
{
	if (hasLanguage() && getCookieLanguage() != null)
		setLanuage(getCookieLanguage());
	if (hasRemember() && getCookieRemember())
	{
		setRemember(getCookieRemember());
		setUsername(getCookieUsername());
		setPassword(getCookiePassword());
	}
	setDeviceId(getCookieDeviceId());
}
function loadDefaultLanguage(locale_language, locale_country)
{
	var language = getCookieLanguage();
	var country = "";
	if (language != null)
	{
		var params = language.split(",");
		language = params[0];
		if (params.length > 1)
			country = params[1];
	}
	
	if (language != null && language != "")
	{
		if (language != locale_language || country != locale_country)
			switchLanguage(language+","+country);
	}
	//else
	//	setCookieLanguage(locale_language+","+locale_country);
}


/**
 * @param 	language 	��������ȷ�Ĳ����ڴ���֮ǰ���������жϡ� ��ʽ����:  zh,HANT	�������Ŀ�Ϊ��
 * */
function switchLanguage(language)
{
	setCookieLanguage(language);
	/* the old url;  */
	//self.location = "/login.do?method=switchLan&lan="+language;
	
	/* new url, 
	 * author: bridge;
	 * */
	//self.location = "/login.do?method=switchLan&lan="+language;
	

	/*
	 * use juinfo.struts.action.LocaleAction
	 * */
	var params = language.split(",");
	var language = params[0];
	var country = "";
	if (params.length > 1)
		country = params[1];
	
	var forward = "login";
	self.location = "/locale.do?method=goLocale&language="+language+"&country="+country+"&forward="+forward;
}

function loadLocale(locale_language, locale_country)
{
	//TODO
}

function checkInputByUser()
{
	if (getUsername() == "")
		return false;
	
	saveCookieByUser();
	return true;
}
function checkInputByDevice()
{
	if (getDeviceId() == "")
		return false;
	if (!isMac(getDeviceId()))
	{
		alert(Translate.ERROR_MAC_RULE);
		return false;
	}
	
	saveCookieByDevice();
	return true;
}

function saveCookieByUser()
{
	if (getRemember())
	{
		setCookieUsername(getUsername());
		setCookiePassword(getPassword());
		setCookieRemember(true);
	}
	else
	{
		setCookieUsername("");
		setCookiePassword("");
		setCookieRemember(false);
	}
}
function saveCookieByDevice()
{
	setCookieDeviceId(getDeviceId());
}

/******** go url *******/
function goGuide()
{
	window.open("/guide/guide_index.jsp","_blank");
}
function goRegister()
{
	self.location = "/login.do?method=register";
}
function goDownload()
{
	window.open("\/ocx\/Active.exe", "_blank");	
}
function goMiitbeian()
{
	var url = "http://www.miitbeian.gov.cn/";
	window.open(url, "_blank");
}
