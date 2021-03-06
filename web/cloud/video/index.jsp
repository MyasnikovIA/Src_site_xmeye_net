﻿<%@ page import="net.xmcloud.component.URLUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" media="screen" href="m.css"/>

    <title>NETSuveillance WEB</title>
    <style type="text/css">
        .alert {
            background: url(alert_bg.gif) repeat-x left;
        }

        div.info {
            background: url(icon_info.gif) no-repeat left;
            height: 20px;
            font-weight: bold;
            padding-top: 7px;
            padding-left: 18px;
        }
    </style>
    <!-- m.js -->

    <script type="text/javascript" language="JavaScript">
        /*
         if(navigator.userAgent.indexOf('IE') < 0)
         {
         location="Login.htm";	
         }
         */
        /*
         兼容IE11
         */
        var bCrossBrow = false;
        var bnpCheck = false;
        if (navigator.userAgent.indexOf('IE') < 0) {
            if (navigator.platform != "Win32")//
            {
                location = "Login.htm";
            }
            var userAgent = navigator.userAgent,
                    rMsie = /(msie\s|trident.*rv:)([\w.]+)/,
                    rFirefox = /(firefox)\/([\w.]+)/,
                    rOpera = /(opera).+version\/([\w.]+)/,
                    rChrome = /(chrome)\/([\w.]+)/,
                    rSafari = /version\/([\w.]+).*(safari)/;
            var browserMatch = uaMatch(userAgent.toLowerCase());

            if (browserMatch.browser != "IE") {
                //location="Login.htm";
                bCrossBrow = true;
            }

        }

        function uaMatch(ua) {
            var match = rMsie.exec(ua);

            if (match != null) {
                return {browser: "IE", version: match[2] || "0"};
            }
            var match = rFirefox.exec(ua);
            if (match != null) {
                return {browser: match[1] || "", version: match[2] || "0"};
            }
            var match = rOpera.exec(ua);
            if (match != null) {
                return {browser: match[1] || "", version: match[2] || "0"};
            }
            var match = rChrome.exec(ua);
            if (match != null) {
                return {browser: match[1] || "", version: match[2] || "0"};
            }
            var match = rSafari.exec(ua);
            if (match != null) {
                return {browser: match[2] || "", version: match[1] || "0"};
            }
            if (match != null) {
                return {browser: "", version: "0"};
            }
        }

    </script>
    <%
        String mac = "";
        String username = "admin";
        String password = "";
        mac = (String) request.getParameter("mac");
        username = (String) request.getParameter("username");
        username = URLUtil.decode(username);
        password = (String) request.getParameter("password");
        password = URLUtil.decode(password);
    %>
    <script type="text/javascript" src="m.js"></script>
    <script type="text/javascript" src="config.js"></script>
    <script type="text/javascript">//m.js
    var ipaddress = document.location.hostname;
    var hostport = 34567;
    var iLanguage=100;
    <%--var iLanguage =${sessionScope.languageVos[0].number};--%>
    //var mac= "00:fe:0b:00:b9:1c";
    var mac = "<%=mac%>";
    var username = "<%=username%>";
    var password = "<%=password%>";

    var serverIP = "xmeye.net";
    var serverPort = 8000;
    var bLoginpage = false;
    var bNat = true;
    </script>


    <!-- 全局变量 -->

    <script type="text/javascript">
        var gExitChannel = new Array();
        var gExitSubType = new Array();
        var gexiti;
        var gcid = -1;
        var g_channelNum = 4;
        var g_digitalChannel = 0;
        var gsld;
        var gslda;
        var gsldb;
        var gsldc;
        var gsldd;
        var gfmu1 = 0;
        var gfmu2 = 0;
        var gfmu3 = 0;
        var g_bRecord = false;
        var g_bRealPlay = false;
        var g_bAudio = false;
        var gHashCookie = new Hash.Cookie('NetSuveillanceWebCookie', {duration: 30});
        var settings = {
            username: ''
        }
        var gca = 0;
        var gcb = 0;
        var gcc = 0;
        var gcd = 0;
        var gAutoPlayAll = false;
        var g_InstalledOCX = true;
        var g_btalk2 = false;
        switch (iLanguage) {
            case 100:
            {
                document.write('<script type="text/javascript" src="English.js">' + '<' + '/script>');
                break;
            }
            case 101:
            {
                document.write('<script type="text/javascript" src="SimpChinese.js">' + '<' + '/script>');
                break;
            }
            default:
                document.write('<script type="text/javascript" src="English.js">' + '<' + '/script>');
        }
    </script>

    <!-- 颜色滑块 -->

    <script type="text/javascript">

        function CheckMac(macinput) {
//mac地址正则表达式 
            var reg_name1 = /[/A-F/|/a-f/\d]{2}:[/A-F/|/a-f/\d]{2}:[/A-F/|/a-f/\d]{2}:[/A-F/|/a-f/\d]{2}:[/A-F/|/a-f/\d]{2}:[/A-F/|/a-f/\d]{2}/;
            var reg_name2 = /[/A-F/|/a-f/\d]{12}/;

//    if( reg_name1.test(macinput)){    
//           return true; 
//    } 
            //else
            if (reg_name2.test(macinput)) {
//             mac = macinput.substr(0,2);   
//            for(var i=2;i<12;i+=2)
//            {   
//                mac +=":";            
//                mac += macinput.substr(i,2);         
//            }
                return true;
            }
            else {
                return false;
            }

        }

        function sldtopos(sld, step) {
            sld.knob.setStyle('left', sld.toPosition(step));
        }
        function setcolorsv(f, v) {
            switch (f) {
                case 1:
                    gca = v;
                    $('ska').title = v;
                    break;
                case 2:
                    gcb = v;
                    $('skb').title = v;
                    break;
                case 3:
                    gcc = v;
                    $('skc').title = v;
                    break;
                case 4:
                    gcd = v;
                    $('skc').title = v;
                    break;
            }
        }
        function getcolors() {
            var colors = "";
            colors = ocx.GetColor();

            var t = new Array();
            if (colors != "") {
                t = colors.split(',');
                sldtopos(gslda, parseInt(t[0]));
                sldtopos(gsldb, parseInt(t[1]));
                sldtopos(gsldc, parseInt(t[2]));
                sldtopos(gsldd, parseInt(t[3]));
                setcolorsv(1, parseInt(t[0]));
                setcolorsv(2, parseInt(t[1]));
                setcolorsv(3, parseInt(t[2]));
                setcolorsv(4, parseInt(t[3]));
            }
            else//这里有待选中消息的传递
            {

                sldtopos(gslda, parseInt(0));
                sldtopos(gsldb, parseInt(0));
                sldtopos(gsldc, parseInt(0));
                sldtopos(gsldd, parseInt(0));
                setcolorsv(1, parseInt(0));
                setcolorsv(2, parseInt(0));
                setcolorsv(3, parseInt(0));
                setcolorsv(4, parseInt(0));
            }


        }
        function txreset(step) {
            setcolorsv(1, step);
            setcolorsv(2, step);
            setcolorsv(3, step);
            setcolorsv(4, step);
            sldtopos(gslda, step);
            sldtopos(gsldb, step);
            sldtopos(gsldc, step);
            sldtopos(gsldd, step);
            setcolors();
        }
        function setcolors() {
            ocx.SetColor(0, gca, gcb, gcc, gcd);
        }
    </script>

    <!-- 设备通道  -->

    <script type="text/javascript">
        function tl(s) {
            var ret;
            try {
                ret = ocx.Translate(s);
            }
            catch (e) {
                ret = "";
            }
            return ret;
        }//moving here for later function 
        function ca(o, ch) {
            var oc;
            if ($(o).hasClass('cl1')) {
                if (ocx.StartRealPlay(ch, 0, 0)) {
                    oc = $('c' + ch);
                    oc.removeClass(oc.className);
                    oc.addClass('cl2');
                }
            }
            else {
                if (ocx.StopPlayReal(ch)) {
                    oc = $('c' + ch);
                    oc.removeClass(oc.className);
                    oc.addClass('cl1');
                }
            }
            getcolors();
        }

        function getcl() {
            g_digitalChannel = ocx.GetDeviceState(1, 0);
            var t = new Array();
            var ts = new Array();
            var titles = new Array();
            titles[0] = tl('Desktop.LocalRecord');
            titles[1] = tl('Desktop.ExtStream');
            titles[2] = tl('Desktop.MainStream');
            titles[3] = tl('Desktop.StartTalk');
            titles[4] = tl('WebTitle.DigitalChannel');
            var shtml = "";

            shtml += "<li id='Talk' ><a title='" + titles[3] + "' id='talking' class='noT' href='javascript:;'  onclick='Ontalk()' ></a><span id='logoString' style='margin:0 5px 0 3px;'>NetSurveillance</span></li> "
            var strsplita = String.fromCharCode(16);
            var strsplitb = String.fromCharCode(9);
            var sc;
            sc = ocx.GetChannelName();
            if (sc != "") {
                sc = sc.substr(0, sc.length - 1);
                t = sc.split(strsplita);
                g_channelNum = t.length;

                for (var i = 0; i < t.length; i++) {
                    ts = t[i].split(strsplitb);
// 			if(i>=(g_channelNum-g_digitalChannel))
// 			{
// 			    shtml+="<li  ><a title='"+titles[0]+"' style='width:25px;margin:0,0,0,0px;outline:none;' id='re" + ts[0] + "' class='noRecord' href='javascript:;' onclick='record(this," + ts[0] 
// 		                      + ")'></a><a title='"+titles[4]+"' id='c" + ts[0] + "' class='cl1' onclick='ca(this," + ts[0] +")' ></a><span id='name"+ts[0]+"'  style='position:absolute;margin:3px 0 0 0;'>" + ts[1] + "</span></li>" //<span style='filter:;'>
// 			   		
// 			}
// 			else
                    {
                        shtml += "<li  ><a title='" + titles[0] + "' style='width:25px;margin:0,0,0,0px;outline:none;' id='re" + ts[0] + "' class='noRecord' href='javascript:;' onclick='record(this," + ts[0]
                        + ")'></a><a title='" + titles[1] + "' style='width:25px;margin:0,0,0,0px;outline:none;' id='subPlay" + ts[0] + "' class='noSubPlay' href='javascript:;' onclick='subPlay(this," + ts[0]
                        + ")'></a><a title='" + titles[2] + "' id='c" + ts[0] + "' class='cl1' onclick='ca(this," + ts[0] + ")' ></a><span id='name" + ts[0] + "'  style='position:absolute;white-space :nowrap;margin:3px 0 0 0;'>" + ts[1] + "</span></li>" //<span style='filter:;'>

                    }


                }
                $("cl").innerHTML = shtml;
                var ls = $$('#cl li');
            }
            //m_ocx.ChangeShowWndNum();
            showExit();
            showSelectNumb();
            $('logoString').setText(logoString);//
        }
        function showSelectNumb() {

            switch (g_channelNum) {

                case 1:
                {
                    $('xp1').style.display = "none";
                    $('xp2').style.display = "none";
                    $('xp3').style.display = "none";
                    $('xp4').style.display = "none";
                    $('xp5').style.display = "none";
                    $('xp6').style.display = "none";
                    break;
                }
                case 2:
                case 3:
                case 4:
                {
                    $('xp3').style.display = "none";
                    $('xp4').style.display = "none";
                    $('xp5').style.display = "none";
                    $('xp6').style.display = "none";
                    break;
                }
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                {
                    $('xp4').style.display = "none";
                    $('xp5').style.display = "none";
                    $('xp6').style.display = "none";
                    break;
                }
                case 10:
                case 11:
                case 12:
                case 13:
                case 14:
                case 15:
                case 16:
                {
                    $('xp5').style.display = "none";
                    $('xp6').style.display = "none";
                    break;
                }
                case 17:
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                {
                    $('xp6').style.display = "none";
                    break;
                }
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                {
                    break;
                }
                default:
                    break;
            }
        }
        function showExit() {


            for (var j = 1; j < gexiti + 1; j++) {
                if (gExitSubType[j] == true) {

                    var temp = "subPlay" + gExitChannel[j].toString();
                    $(temp).removeClass($(temp).className);
                    $(temp).addClass('subPlay');
                }
                else {

                    var temp = "c" + gExitChannel[j].toString();
                    $(temp).removeClass($(temp).className);
                    $(temp).addClass('cl2');

                }

            }
            gexiti = 0;
        }


    </script>

    <!-- 调整页面大小（待处理） -->

    <script type="text/javascript">
        function resizeL() {

            $('username').setStyle('width', InputName.width);
            $('username').setStyle('line-height', InputName.height);
            $('password').setStyle('line-height', InputName.height);
            $('username').setStyle('height', InputName.height);
            $('username').setStyle('margin-top', InputName.marginTop);
            $('username').setStyle('margin-right', InputName.marginRight);
            $('userNameInput').setStyle('margin-top', SpanLoginName.marginTop);
            $('password').setStyle('width', InputPassword.width);
            $('password').setStyle('height', InputPassword.height);
            $('password').setStyle('margin-top', InputPassword.marginTop);
            $('password').setStyle('margin-right', InputPassword.marginRight);

            $('loginBT').setStyle('width', LoginButton.width);
            $('loginBT').setStyle('height', LoginButton.height);


            if (1 == LogoNumbers) {
                $("logo1").setStyle('background', 'none');
            }


            wwidth = document.documentElement.clientWidth;
            wheight = document.documentElement.clientHeight;
            $('login').setStyle('width', wwidth);

            $('lm').setStyle('width', wwidth);


            if (wwidth <= 417) {
                $('lmll').style.width = 0;
                $('lmrr').style.width = 0;
                $('lml').style.width = 0;
                $('lmr').style.widht = 0;
                $('lmm').setStyle('width', wwidth);

                $('ldl').setStyle('width', 0)
                $('ldm').setStyle('width', wwidth);
                $('ldr').setStyle('width', 0)
            }
            else if (wwidth <= 1127) {
                $('lmll').style.width = 0;
                $('lmrr').style.width = 0;
                $('lml').setStyle('width', (wwidth - 417) / 2 + (355 - (wwidth - 417) / 2));
                $('lml').setStyle('margin-left', -(355 - (wwidth - 417) / 2));
                $('lmr').setStyle('width', (wwidth - 417) / 2);
                $('lmm').setStyle('width', 417);

                $('ldl').setStyle('width', ((wwidth - 417) / 2) - 1)
                $('ldm').setStyle('width', 417);
                $('ldr').setStyle('width', (wwidth - (417 + (wwidth - 417) / 2 - 1)));


            }
            else {

                $('lml').setStyle('margin-left', 0);

                $('lml').setStyle('width', 355);
                $('lmr').setStyle('width', 355);
                $('lmm').setStyle('width', 417);


                $('ldm').setStyle('width', 417);
                var w = (wwidth - (417 + 355 + 355)) / 2;
                $('ldl').setStyle('width', w + 355);
                $('ldr').setStyle('width', (wwidth - (417 + 355 + w)));

                $('lmll').setStyle('width', w);
                $('lmrr').setStyle('width', w);
            }
        }
        var g_Radio = 1.25;//1.78
        function ChangeRadio() {
            if (g_Radio == 1.25) {
                g_Radio = 1.78;
            }
            else {
                g_Radio = 1.25;
            }
            resizeM();


        }
        function resizeM() {
            var mbbw;
            var mbbh;
            wwidth = document.documentElement.clientWidth;
            wheight = document.documentElement.clientHeight - 20;
            if (wheight <= 570) wheight = 570;
            //ma31,drb24,mc13,pb26

            mbbh = wheight - $(ma).getCoordinates().height - $(pb).getCoordinates().height - 10 - 5 - 4;


            glhight = wheight - $(ma).getCoordinates().height + 4 - 5 - 4;
            //alert(glhight);
            //mcup:349
            grhight = wheight - 349 - $(ma).getCoordinates().height + 4 - 5 - 4;

            mbbw = mbbh * 64 / 51;
            mbbw = mbbh * g_Radio;
            if (bNat && g_channelNum == 1) {
                $('mb').setStyle('width', mbbw + (145 + 8));
            }
            else {
                $('mb').setStyle('width', mbbw + (145 * 2 + 8));
                $('mbal').setStyle('height', glhight);
                $('dcl').setStyle('height', glhight);
            }
            $('mbb').setStyle('width', mbbw);//yzt 0508
            $('mbb').setStyle('height', mbbh + 5);

            $('yt3').setStyle('height', grhight);

            $('backGround').setStyle('height', '100%');

            var bigWidth = 0;
            if (wwidth > (mbbw + (145 * 2 + 8))) {
                bigWidth = wwidth;
            }
            else {
                bigWidth = mbbw + (145 * 2 + 8);
            }
            $('mcc').setStyle('width', bigWidth);
            $('ma').setStyle('width', bigWidth);


        }
        function resize() {

            resizeL();
            resizeM();
        }
        window.addEvent('resize', function () {
            resize();
        });
    </script>

    <!-- 登入和翻译（待整理） -->

    <script type="text/javascript">
        var g_FirstNat = true;
        var aa = 0;
        var g_bOverFistNat = false;
        function ld() {

            gexiti = 0;
            gExitChannel[0] = 0;
            gExitSubType[0] = true;
            if (bLoginpage) {
                username = $("username").value;
                password = $("password").value;
                mac = $('macadd').value;

                if (username == "") {
                    alert("Username is null");
                    return;
                }
                else if (mac == "") {
                    alert("Macaddress is null");
                    return;
                }

                //alert(mac);
                if (!CheckMac(mac)) {
                    alert("Mac address false");
                    return;
                }
            }


            var r;
            if (bNat) {
                if (g_FirstNat) {
                    aa = setInterval("ld()", 500);
                    g_FirstNat = false;
                    g_bOverFistNat = true;
                    return;
                }
                else {
                    if (g_bOverFistNat) {
                        clearInterval(aa);
                        g_bOverFistNat = false;
                    }
                    r = ocx.Login(mac, hostport, username, password);
                }

            }
            else {

                r = ocx.Login(ipaddress, hostport, username, password);
            }
            if (r > 0) {

                getcl();
                if (g_channelNum > 1) {
                    $('talk2').style.display = 'none';
                }

                if (!bNat || g_channelNum > 1) {
                    $('mba').style.display = "";
                }
                else {
                    $('mba').style.display = "none";
                }

                $('password').value = "";
                $('login').style.display = "none";
                $('m').style.top = "0px";
                resize();
                //alert("OVER M TOP =0");
                settings['username'] = username;
                savesetting();
                //	ocx.SetSpecialParam(4);
                if (gAutoPlayAll) {
                    //alert("OVER M TOP =1");
                    resizeM();
                    ocx.PlayAll();
                    //alert("OVER M TOP =2");
                }

            }
            else {
                var error = "";
                /*  switch(r){*/
//                case 0: 
//                   {
//                     error = tl('Login.NetError');
//                     break;
//                } 
//                case -11301:
//                     {
//                     error = tl('Login.PasswdError');                                
//                     break;
//                }
//                case -11302:
//                   {
//                     error = tl('Login.UserNotExisted');
//                     break;
//                }
//                case -10005:
//                    {
//                     error = tl('Login.Timeout');
//                     break;
//                }
//                case  -11305:
//                   {
//                     error = tl('Login.InUsed');
//                     break;
//                }  
//                case -7:
//                   {
//                     error = tl('Login.SystemBusy');
//                     break;
//                }  
//                case -11307:
//                   {
//                     error = tl('Login.NotFound');
//                     break;
//                  }
//                 case -11604:
//                {
//                     error = tl('Login.ServerError');
//                     break;
//                } 
//                default:
//                   {
//                     /*error = tl('Login.UnknowError');*/
//                     break;
                /*   }*/
                /*  }*/
                if (!bLoginpage) {
                    if (r == -11301 || r == -11302) {
                        //alert(error);
                        $('macadd').value = mac;
                        $('username').valur = username;
                        bLoginpage = true;
                        $('login').style.display = "";
                        $('macaddress').style.display = "";
                        resize();
                    }
                    else {
                        $('login').style.display = "none";
                        $('errormessage').setText(error);
                        $('pageerror').style.display = "";
                    }
                }
                else {
                    //alert(error);
                }

            }
        }
        //function DownLoad()
        //{
        //	window.open("http://xmsecu.com:8080/ocx/New_Active.exe");
        //}
        function savesetting() {
            gHashCookie.extend(settings);
        }
        function getsetting() {
            if (gHashCookie.get('username')) {
                settings['username'] = gHashCookie.get('username');
            } else {
                settings['username'] = '';
            }

            $('username').setProperty('value', settings['username']);

            switch (iLanguage) {
                case 100:
                    cLanguage = "English";
                    break;
                case 101:
                    cLanguage = "SimpChinese";
                    break;
                case 102:
                    cLanguage = "TradChinese";
                    break;
                case 103:
                    cLanguage = "Italian";
                    break;
                case 104:
                    cLanguage = "Spanish";
                    break;
                case 105:
                    cLanguage = "Japanese";
                    break;
                case 106:
                    cLanguage = "Russian";
                    break;
                case 107:
                    cLanguage = "French";
                    break;
                case 108:
                    cLanguage = "German";
                    break;
                case 109:
                    cLanguage = "Portugal";
                    break;
                case 110:
                    cLanguage = "Turkey";
                    break;
                case 111:
                    cLanguage = "Poland";
                    break;
                case 112:
                    cLanguage = "Romanian";
                    break;
                case 113:
                    cLanguage = "Hungarian";
                    break;
                case 114:
                    cLanguage = "Finnish";
                    break;
                case 116:
                    cLanguage = "Korean";
                    break;
                case 117:
                    cLanguage = "Farsi";
                    break;
                case 119:
                    cLanguage = "Thai";
                    break;
                case 120:
                    cLanguage = "Greek";
                    break;
                case 121:
                    cLanguage = "Vietnamese";
                    break;
                case 123:
                    cLanguage = "Brazilian";
                    break;
                case 124:
                    cLanguage = "Hebrew";
                    break;
                case 125:
                    cLanguage = "Indonesian";
                    break;
                case 126:
                    cLanguage = "Arabic";
                    break;
                case 127:
                    cLanguage = "Swedish";
                    break;
                case 128:
                    cLanguage = "Czech";
                    break;
                case 129:
                    cLanguage = "Bulgarian";
                    break;
                case 189:
                    cLanguage = "Czech";
                    break;
                default:
                    cLanguage = "English";
                    break;
            }
            ocx.SetSpecialParamEx2(2, cLanguage, 0, 0);
            inilanguage();
        }


        function inilanguage() {

            $('macaddInput').setText(tl('ConfigNet.ID'));
            $('DVRcolor').setText(tl('Title.ImageConfig'));
            $('mthf').setText(tl('WebTitle.Playback'));
            $('mtrz').setText(tl('WebTitle.Log'));
            $('mtkhdpz').setText(tl('WebTitle.LocalConfig'));
            $('mtsbpz').setText(tl('WebTitle.RemoteCfg'));
            $('mttc').setText(tl('WebTitle.LogOut'));
            $('xbc').setText(tl('WebPtz.Step') + '(1-8):');
            if (iLanguage == 109) {
                $('xbc').setText(tl('WebPtz.Step'));
            }

            $('xbb').setText(tl('WebPtz.Zoom'));
            $('xbj').setText(tl('WebPtz.Focus'));
            $('xgq').setText(tl('WebPtz.Iris'));
            $('mbcyzd').setText(tl('WebPtz.Preset') + ':');
            $('mbcdjxh').setText(tl('WebPtz.Cruise') + ':');
            $('taba1').setText(tl('WebTitle.ImageColorConfig'));
            $('xcz').setText(tl('WebBT.SetDefault'));
            $('xcqsb').setText(tl('WebBT.Reboot'));
            $('ratio').setText(tl('WebBT.ChangeRatio'));
            $('taba2').setText(tl('WebTitle.OtherSet'));
            $('userNameInput').setText(tl('WebInput.UserName'));
            $('passWordInput').setText(tl('WebInput.Password'));
            $('loginBT').setText(tl('WebBT.LogIn'));

            $('xp0').title = tl('Desktop.SplitFull');
            $('xp1').title = tl('Desktop.Split1');
            $('xp2').title = tl('Desktop.Split4');
            $('xp3').title = tl('Desktop.Split9');
            $('xp4').title = tl('Desktop.Split16');
            $('xp5').title = tl('Desktop.Split25');
            $('xp6').title = tl('Desktop.Split36');
            $('startPlayAll').title = tl('WebBT.PlayAll');
            $('stopPlayAll').title = tl('WebBT.StopPlayAll');
            $('snap').title = tl('Desktop.Snapshot');
            $('recordAll').title = tl('WebBT.RecordAll');
            $('stopRecordAll').title = tl('WebBT.StopRecordAll');
            $('Audio').title = tl('Desktop.Audio');

            $('goPreset').title = tl('PtzControl.Goto');
            $('addPreset').title = tl('PtzControl.AddPreset');
            $('delPreset').title = tl('PtzControl.DelPreset');
            $('goCruise').title = tl('PtzControl.Start');
            $('stopCruise').title = tl('PtzControl.Stop');
            $('editCruise').title = tl('PtzControl.Edit');

            $('xtld').title = tl('ConfigEncode.Brightness');
            $('xtdbd').title = tl('ConfigEncode.Contrast');
            $('xtbhd').title = tl('ConfigEncode.Saturation');
            $('xtsd').title = tl('ConfigEncode.Hue');

            $('talk2').setText(tl('Desktop.StartTalk'));

//    $('Talk').title=tl('Desktop.StartTalk');

        }
        function stopPlayOneChannel(lChannel) {


            var tempPlay = "c" + (lChannel).toString();
            var tempRecord = "re" + (lChannel).toString();


            $(tempPlay).removeClass($(tempPlay).className);
            $(tempPlay).addClass('cl1');
            $(tempRecord).removeClass($(tempRecord).className);
            $(tempRecord).addClass('noRecord');

//  if(lChannel<g_channelNum-g_digitalChannel)
//         {
            var tempSubPlay = "subPlay" + (lChannel).toString();
            $(tempSubPlay).removeClass($(tempSubPlay).className);
            $(tempSubPlay).addClass('noSubPlay');
            /*            }*/


            getcolors();
        }

        function AllChannelCtrl(bPlay, bStopPlay, bRecord, bStopRecord) {

            if (bPlay) {
                if (bRecord)//借用于子码流播放
                {

                    for (var j = 0; j < g_channelNum; j++) {
                        var tempSubPlay = "subPlay" + (j).toString();
                        $(tempSubPlay).removeClass($(tempSubPlay).className);
                        $(tempSubPlay).addClass('subPlay');

                    }
                }
                else {

                    for (var j = 0; j < g_channelNum; j++) {
                        var temp = "c" + (j).toString();
                        $(temp).removeClass($(temp).className);
                        $(temp).addClass('cl2');

                    }

                }

            } else if (bStopPlay) {

                for (var j = 0; j < g_channelNum; j++) {

                    var temp = "c" + (j).toString();
                    $(temp).removeClass($(temp).className);
                    $(temp).addClass('cl1');

//             if(j>=g_channelNum-g_digitalChannel)
//             continue;
                    var tempSubPlay = "subPlay" + (j).toString();
                    $(tempSubPlay).removeClass($(tempSubPlay).className);
                    $(tempSubPlay).addClass('noSubPlay');
                }
            }
            else if (bRecord) {
                for (var j = 0; j < g_channelNum; j++) {
                    var tempPlay = "c" + (j).toString();
                    var tempsub = "subPlay" + (j).toString();
                    if ($(tempPlay).hasClass('cl2') || (/* j<g_channelNum-g_digitalChannel && */$(tempsub).hasClass('subPlay'))) {
                        var temp = "re" + (j).toString();
                        $(temp).removeClass($(temp).className);
                        $(temp).addClass('record');
                    }

                }
            }
            else if (bStopRecord) {
                for (var j = 0; j < g_channelNum; j++) {
                    var temp = "re" + (j).toString();
                    $(temp).removeClass($(temp).className);
                    $(temp).addClass('noRecord');
                }

            }
            getcolors();
        }

        function bSound(bs) {

            getcolors(); //获取颜色值
            if (bs) {
                g_bAudio = true;
                if ($('Audio').hasClass('p102')) {
                    $('Audio').removeClass($('Audio').className)
                    $('Audio').addClass('p10')
                }
            }
            else {
                g_bAudio = false;
                if ($('Audio').hasClass('p10')) {
                    $('Audio').removeClass($('Audio').className)
                    $('Audio').addClass('p102')
                }
            }
        }
        function RButtonDown(flag, x, y) {
            ocx.Fullscreen(false);
        }

        function startPlayExitChannel(channel, bSub) {

            gexiti++;
            gExitChannel[gexiti] = channel;
            if (bSub == true) {

                gExitSubType[gexiti] = true

            }
            else {
                gExitSubType[gexiti] = false;
            }
            getcolors();
        }

        function OneChannelOpen(channel)//打开主码流
        {

            var tempSubPlay = "subPlay" + (channel).toString();
            if ($(tempSubPlay).hasClass('subPlay')) {
                $(tempSubPlay).removeClass($(tempSubPlay).className);
                $(tempSubPlay).addClass('noSubPlay');
            }
            var tempPlay = "c" + (channel).toString();
            $(tempPlay).removeClass($(tempPlay).className);
            $(tempPlay).addClass('cl2');
            getcolors();
        }

        function oneSubOpen(channel)//打开辅码流
        {

            var tempPlay = "c" + (channel).toString();
            if ($(tempPlay).hasClass('cl2')) {
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass('cl1');
            }
            var tempSubPlay = "subPlay" + (channel).toString();
            $(tempSubPlay).removeClass($(tempSubPlay).className);
            $(tempSubPlay).addClass('subPlay');
            getcolors();
        }

        function reName(channel)//重命名
        {

            var ts = new Array();
            var t = new Array();
            var strsplita = String.fromCharCode(16);
            var strsplitb = String.fromCharCode(9);
            var sc;

            sc = ocx.GetChannelName();

            if (sc != "") {
                sc = sc.substr(0, sc.length - 1);
                t = sc.split(strsplita);


                for (var i = 0; i < t.length; i++) {
                    ts = t[i].split(strsplitb);
                    var temp = "name" + (i).toString();
                    $(temp).setText(ts[1]);

                }

            }

        }

        function ReBoot() {

            $('talking').removeClass($('talking').className);
            $('talking').addClass('noT');
            $('talking').title = tl('Desktop.StartTalk');//关闭对讲

            for (var j = 0; j < g_channelNum; j++)//关闭录像
            {
                var temp = "re" + (j).toString();
                $(temp).removeClass($(temp).className);
                $(temp).addClass('noRecord');
            }
        }
        function AutoPlayAll(bPlay) {

            if (bPlay) {
                gAutoPlayAll = true;
            }
            else {
                gAutoPlayAll = false;
            }
        }

        function DigitalStatus(nStatus, channel)//数字通道状态
        {

            if (1 == nStatus) {
                var tempSubPlay = "subPlay" + (channel).toString();
                $(tempSubPlay).removeClass($(tempSubPlay).className);
                $(tempSubPlay).addClass('forbitsubPlay');

                var tempRecord = "re" + (channel).toString();
                $(tempRecord).removeClass($(tempRecord).className);
                $(tempRecord).addClass("forbitRecord");

                var tempPlay = "c" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("forbitPlay");

            }
            if (0 == nStatus) {
                var tempSubPlay = "subPlay" + (channel).toString();
                $(tempSubPlay).removeClass($(tempSubPlay).className);
                $(tempSubPlay).addClass('noSubPlay');

                var tempRecord = "re" + (channel).toString();
                $(tempRecord).removeClass($(tempRecord).className);
                $(tempRecord).addClass("noRecord");

                var tempPlay = "c" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("cl1");
            }
            if (2 == nStatus) {
                var tempPlay = "c" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("cl2");
            }
            if (3 == nStatus) {
                var tempPlay = "subPlay" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("noSubPlay");
            }
            if (4 == nStatus) {
                var tempPlay = "subPlay" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("subPlay");
            }
            if (5 == nStatus) {
                var tempPlay = "re" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("record");
            }
            if (6 == nStatus) {
                var tempPlay = "re" + (channel).toString();
                $(tempPlay).removeClass($(tempPlay).className);
                $(tempPlay).addClass("noRecord");
            }

            getcolors();
        }

        function StopPosition() {
            $('menu').removeClass($('menu').className);
            $('menu').addClass('PositionStop');
        }

        function StartPosition() {
            $('menu').removeClass($('menu').className);
            $('menu').addClass('PositionStart');
        }
        function ForbitLanguage() {
            $('langlist').disabled = true;
        }
        function HideQS(bHide) {
            if (bHide == true) {
                $('QS').style.display = 'none';
                g_bQS = false;
            } else {
                $('QS').style.display = '';
                g_bQS = true;

            }
        }
    </script>

    <!-- 下拉框 -->

    <script type="text/javascript">
        function showmu1() {
            if (gfmu1 == 0) {
                gfmu1 = 1;
                $('smu1').style.display = "";
            }
            else {
                closemu1();
            }
        }

        function closemu1() {
            gfmu1 = 0;
            $('smu1').style.display = "none";
        }
        function onmu1(v) {
            $('ps').value = v;
            closemu1();
        }
    </script>

    <!-- 全播放，录像，声音，对讲 -->

    <script type="text/javascript">
        function startPlayAll() {
            ocx.PlayAll();
        }
        function StopPlayAll() {

            ocx.StopRealPlayAll();
        }
        function recordAll() {

            if (ocx.startRecordAll("C:\\record")) {
            }
        }
        function stopRecordAll() {
            if (ocx.stopRecordAll()) {
            }
        }

        function openAudio() {
            if (g_bAudio) {
                if (ocx.CloseSound(1)) {
                    g_bAudio = false;
                    $('Audio').removeClass($('Audio').className);
                    $('Audio').addClass('p102')
                }
            }
            else {
                if (ocx.OpenSound(-1)) {
                    $('Audio').removeClass($('Audio').className);
                    $('Audio').addClass('p10')
                    g_bAudio = true;
                }
            }

        }
        function Ontalk() {
            if ($('talking').hasClass('noT') || (!g_btalk2)) {
                if (ocx.StartTalk()) {
                    $('talking').removeClass($('talking').className);
                    $('talking').addClass('t');
                    $('talking').title = tl('Desktop.StopTalk');
                    $('talk2').setText(tl('Desktop.StopTalk'));
                    g_btalk2 = true;

                }

            }
            else {
                if (ocx.StopTalk()) {
                    $('talking').removeClass($('talking').className);
                    $('talking').addClass('noT');
                    $('talking').title = tl('Desktop.StartTalk');
                    $('talk2').setText(tl('Desktop.StartTalk'));
                    g_btalk2 = false;

                }

            }

        }
    </script>

    <!-- 录像，退出,子码流播放... -->

    <script>
        function subPlay(ob, channel) {

            if ($(ob).hasClass('noSubPlay')) {

                if (ocx.StartRealPlay(channel, 0, 1)) {
                    $(ob).removeClass($(ob).className);
                    $(ob).addClass('subPlay');
                    getcolors();

                }
            }
            else {
                if (ocx.StopPlayReal(channel)) {
                    $(ob).removeClass($(ob).className);
                    $(ob).addClass('noSubPlay');

                }

            }

        }
        function record(ob, channel) {

            if ($(ob).hasClass('noRecord')) {

                if (ocx.StartRecordByChannel(channel)) {
                    $(ob).removeClass($(ob).className);
                    $(ob).addClass('record');

                }
            }
            else {
                if (ocx.StopRecordBychannel(channel)) {
                    $(ob).removeClass($(ob).className);
                    $(ob).addClass('noRecord');

                }

            }

        }
        function Logout() {
            if (ocx.Logout()) {
                $('m').style.top = "-10000px";
                $('login').style.display = "";
                $('preSet').value = 1;
                $('cruise').value = 1;
                $('ps').value = 5;
            }

        }


        function recordCtrl()//点击对应窗口录像（暂时没应用）
        {
            if (!g_bRecord) {
                if (ocx.StartRecord('C:\\record')) {
                    $('record').removeClass($('record').className);
                    $('record').addClass('p92')
                    g_bRecord = true;
                }

            }
            else {
                if (ocx.StopRecord()) {
                    $('record').removeClass($('record').className);
                    $('record').addClass('p9')
                    g_bRecord = false;
                }

            }
        }
        function StopRealPlay() //根据当前窗口关闭播放（暂时没应用）
        {
            if (ocx.StopRealPlay()) {
                $('stop').removeClass($('stop').className)
                $('stop').addClass('p7')
            }

        }


    </script>

    <!-- 事件 -->

    <script language="javascript" for="ocx" event="reName(channel)">
        reName(channel)
    </script>

    <script language="javascript" for="ocx" event="oneSubOpen(channel)">
        oneSubOpen(channel);

    </script>

    <script language="javascript" for="ocx" event="OneChannelOpen(channel)">//某个通道打开，比如报警
    OneChannelOpen(channel);

    </script>

    <script language="javascript" for="ocx" event="startPlayExitChannel(channel,bSub)">//开始播放上回退出视频
    startPlayExitChannel(channel, bSub);
    </script>

    <script language="javascript" for="ocx" event="RButtonDown(flag,x,y)">//右键退出（退出全屏）
    ocx.Fullscreen(false);
    </script>

    <script language="javascript" for="ocx" event="stopPlayOneChannel(lChannel)">//停止一个通道的播放（图标变色）

    var tempPlay = "c" + (lChannel).toString();
    var tempRecord = "re" + (lChannel).toString();


    $(tempPlay).removeClass($(tempPlay).className);
    $(tempPlay).addClass('cl1');
    $(tempRecord).removeClass($(tempRecord).className);
    $(tempRecord).addClass('noRecord');

    //             if(lChannel<g_channelNum-g_digitalChannel)
    //             {
    var tempSubPlay = "subPlay" + (lChannel).toString();
    $(tempSubPlay).removeClass($(tempSubPlay).className);
    $(tempSubPlay).addClass('noSubPlay');
    /*            }*/


    getcolors();
    </script>

    <script language="javascript" for="ocx" event="bRecordAndRealPlay(bRecord, bRealPlay)">//选中一个窗口（翻译当前窗口的录像，和播放开关状态）
    if (bRealPlay == true) {

    }
    {

    }

    //getcolors(); //获取颜色值
    </script>

    <script language="javascript" for="ocx"
            event="AllChannelCtrl( bPlay, bStopPlay, bRecord,bStopRecord)">//全通道录像，播放开关,(子码播放用到，record两个变量)
    if (bPlay) {
        if (bRecord)//借用于子码流播放
        {

            for (var j = 0; j < g_channelNum; j++) {
                var tempSubPlay = "subPlay" + (j).toString();
                $(tempSubPlay).removeClass($(tempSubPlay).className);
                $(tempSubPlay).addClass('subPlay');

            }
        }
        else {

            for (var j = 0; j < g_channelNum; j++) {
                var temp = "c" + (j).toString();
                $(temp).removeClass($(temp).className);
                $(temp).addClass('cl2');

            }

        }

    } else if (bStopPlay) {

        for (var j = 0; j < g_channelNum; j++) {

            var temp = "c" + (j).toString();
            $(temp).removeClass($(temp).className);
            $(temp).addClass('cl1');

//             if(j>=g_channelNum-g_digitalChannel)
//             continue;
            var tempSubPlay = "subPlay" + (j).toString();
            $(tempSubPlay).removeClass($(tempSubPlay).className);
            $(tempSubPlay).addClass('noSubPlay');
        }
    }
    else if (bRecord) {
        for (var j = 0; j < g_channelNum; j++) {
            var tempPlay = "c" + (j).toString();
            var tempsub = "subPlay" + (j).toString();
            if ($(tempPlay).hasClass('cl2') || (/* j<g_channelNum-g_digitalChannel && */$(tempsub).hasClass('subPlay'))) {
                var temp = "re" + (j).toString();
                $(temp).removeClass($(temp).className);
                $(temp).addClass('record');
            }

        }
    }
    else if (bStopRecord) {
        for (var j = 0; j < g_channelNum; j++) {
            var temp = "re" + (j).toString();
            $(temp).removeClass($(temp).className);
            $(temp).addClass('noRecord');
        }

    }
    getcolors();
    </script>

    <script language="javascript" for="ocx" event="bSound(bs)">//选择窗口是否有播放声音
    bSound(bs);
    </script>

    <script language="javascript" for="ocx" event="ReBoot()">
        ReBoot();

    </script>

    <script language="javascript" for="ocx" event="AutoPlayAll(bPlay)">
        AutoPlayAll(bPlay);

    </script>

    <!-- 加载效果 -->

    <script>
        window.addEvent('domready', function () {

            resizeM();


//颜色滑块
            gslda = new Slider($('saa'), $('ska'), {
                steps: 128,
                onChange: function (step) {
                    setcolorsv(1, step);
                    setcolors();
                }
            });

            gsldb = new Slider($('sab'), $('skb'), {
                steps: 128,
                onChange: function (step) {
                    setcolorsv(2, step);
                    setcolors();
                }
            });

            gsldc = new Slider($('sac'), $('skc'), {
                steps: 128,
                onChange: function (step) {
                    setcolorsv(3, step);
                    setcolors();
                }
            });

            gsldd = new Slider($('sad'), $('skd'), {
                steps: 128,
                onChange: function (step) {
                    setcolorsv(4, step);
                    setcolors();
                }
            });
            //********************************


            var taba1 = $('taba1');
            var taba2 = $('taba2');
            taba1.addEvent('click', function (e) {
                new Event(e).stop();
                if (this.hasClass('t3')) {
                    this.removeClass(this.className);
                    this.addClass('t1');
                    taba2.removeClass(taba2.className);
                    taba2.addClass('t2');
                    $('yt3t1').style.display = "";
                    $('yt3t2').style.display = "none";
                }
            });

            taba2.addEvent('click', function (e) {
                new Event(e).stop();
                if (this.hasClass('t2')) {
                    taba1.removeClass(taba2.className);
                    taba1.addClass('t3');
                    this.removeClass(this.className);
                    this.addClass('t4');
                    $('yt3t1').style.display = "none";
                    $('yt3t2').style.display = "";
                }
            });
//主菜单
            var kwicks = $$('#kwick .kwick');
            var fx = new Fx.Elements(kwicks, {wait: false, duration: 300, transition: Fx.Transitions.Back.easeOut});
            kwicks.each(function (kwick, i) {
                kwick.addEvent('mouseenter', function (e) {
                    var obj = {};
                    obj[i] = {
                        'width': [kwick.getStyle('width').toInt(), 155]
                    };
                    kwicks.each(function (other, j) {
                        if (other != kwick) {
                            var w = other.getStyle('width').toInt();
                            if (w != 80) obj[j] = {'width': [w, 110]};
                        }
                    });
                    fx.start(obj);
                });
            });

            $('kwick').addEvent('mouseleave', function (e) {
                var obj = {};
                kwicks.each(function (other, j) {
                    obj[j] = {'width': [other.getStyle('width').toInt(), 120]};
                });
                fx.start(obj);
            });
            inilanguage();
            getsetting();


            if (!DetectActiveX()) {
                return;
            }
            else {
                if (!bCrossBrow && !bnpCheck) {
                    $('downLoad').style.display = "none";
                }
                ;

                $('win_install_activex').style.top = "-10000px";
                if (bNat) {

                    if (0 < ocx.SetSpecialParamEx2(1, serverIP, serverPort, "")) {

                    }

                    if (!bLoginpage) {
                        resizeM();
                        ld();

                    }
                    else {
                        $('login').style.display = "";
                        resize();
                    }
                }
                else {
                    $('login').style.display = "";
                    resize();
                }


                if (bLoginpage || !bNat) {
                    $('mttc').style.display = "";
                }

                if (!bNat || g_channelNum > 1) {
                    $('mba').style.display = "";
                }

            }

        });
    </script>

    <script type="text/javascript">
        function DetectActiveX() {
            try {
                var comActiveX = new ActiveXObject("WEB.WebCtrl.1");
                comActiveX = null;
            }
            catch (e) {
                if (bCrossBrow) {
                    return true;
                }
                ;
                return false;
            }
            return true;
        }

        function Download() {
            window.open("/download/ocx/Active.exe");
            // window.open("/index");
        }
    </script>

</head>
<body>
<div id="pageerror" style="width: 200px; height: 20px; display: none; margin-left: auto;
        margin-right: auto; margin-top: 350px;">
    <span id="errormessage" style="color: Black; font-size: 16px;"></span>
</div>
<div id="login" style="display: none">
    <div style="position: absolute; top: -2000px; width: 0px;">
        <a style="background: url(play.gif)"></a><a style="background: url(noPlay.gif)">
    </a><a style="background: url(record.gif)"></a><a style="background: url(noRecord.gif)">
    </a><a style="background: url(noSubPlay.gif)"></a><a style="background: url(subPlay.gif)">
    </a><a style="background: url(noTalk.gif)"></a><a style="background: url(Talk.gif)">
    </a><a style="background: url('btn_blue_left.gif')"></a><a style="background: url(btn_blue_right.gif)"></a>
    </div>
    <!-- <div style="position: absolute; width: 100%; height: 228px; top: 0px; left: 0px;
            right: 0;">-->
    <div id='lt' style="position: relative; width: 100%; height: 228px; background: url(t.jpg) repeat-x #FFF;">
    </div>
    <!--  </div>-->
    <div id="lm" style="height: 299px; width: 1345px; position: absolute; top: 228px;
            left: 0; right: 0;">
        <div id="lmll" style="position: relative; width: 102px; height: 100%; background: url(lr.jpg) repeat-x;
                float: left;">
        </div>
        <div id="lml" style="width: 355px; height: 299px; background: url(ml.jpg); float: left;
                margin: 0 0 0 0;">
        </div>
        <div id="lmm" style="width: 417px; height: 299px; float: left; margin: 0 0px 0 0;">
            <div style="width: 417px; height: 223px; float: left; background: url(l_bgm.gif)">
                <div style="width: 417px; height: 223px; background: url('../logo/webLogo/l_bgm2.gif');
                        position: relative;">
                    <div style="width: 11px; height: 100%; float: left;">
                    </div>
                    <div style="width: 406px; height: 100%; float: left; margin: 0 0 0 0; color: #000000;
                            font-size: 15px; font-family: Arial, '宋体';">
                        <div id='DownLoadPlug'
                             style="margin:10px 0px 0px 340px;padding:3px 0px 0px 2px; width: 56px; height: 14px;overflow:hidden;cursor:pointer;background: url(board.gif);"
                             onclick="DownLoadLo();">
                            <div style="color: #000;width:100%;height:100%;border: 0;">
                            </div>
                        </div>
                        <div style="width: 100%; display: inline;">
                            <div id='logo1' style="float: right; margin: 15px 122px 0 0; width: 135px; display: inline;
                                    height: 31px; background: url(logo.gif);">
                            </div>
                        </div>
                        <div style="margin: 7px 0 0 0px; float: right; width: 100%">
                            <input id="username" type='text' style="color: #000; font-size: 15px; line-height: 25px;
                                    margin: 0 120px 0 0; padding: 0px 0 0 0px; width: 133px; height: 25px; float: right;"
                                   onkeydown="javascript:if (event.keyCode==13) event.keyCode=9;"/>
                                <span id='userNameInput' style="padding-top: 12px; float: right; font-size: 15px;
                                    margin: 0px 3px 0 0; font-family: Arial, '宋体'; color: #fff;"></span>
                        </div>
                        <div style="margin: 5px 0 0 0px; float: right; width: 100%">
                            <input id="password" type="password" style="color: #000; font-size: 15px; line-height: 25px;
                                    margin: 0 120px 0 0; padding: 0px 0 0 0px; width: 133px; height: 25px; float: right;"
                                   onkeydown="javascript:if (event.keyCode==13) ld();"/>
                                <span id='passWordInput' style="padding-top: 12px; float: right; font-size: 15px;
                                    margin: 0px 3px 0 0; font-family: Arial, '宋体'; color: #fff;"></span>
                        </div>
                        <div id='macaddress' style="margin: 5px 0 0 0px; float: right; width: 100%; display: none">
                            <input id="macadd" style="color: #000; font-size: 15px; line-height: 25px; margin: 0 120px 0 0;
                                    padding: 0px 0 0 0px; width: 133px; height: 25px; float: right;"/>
                                <span id='macaddInput' style="padding-top: 12px; float: right; font-size: 15px; margin: 0px 3px 0 0;
                                    font-family: Arial, '宋体'; color: #fff;"></span>
                        </div>
                        <div style="margin: 0px 0px 0 174px;">
                            <button id='loginBT' onclick="ld()" style="margin: 10px 0 0 0; color: #000; width: 88px;
                                    height: 28px; padding: 4px 0 0 0; border: 0; background: url(bt.gif)">
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div style="width: 417px; height: 76px; float: left; background: url(l_bgmd.gif)">
            </div>
        </div>
        <div id="lmr" style="width: 355px; height: 299px; background: url(mr.jpg); float: left;">
        </div>
        <div id="lmrr" style="position: relative; width: 114px; height: 100%; background: url(lr.jpg) repeat-x;
                float: left;">
        </div>
    </div>
    <div style="position: absolute; width: 100%; height: 266px; top: 527px; left: 0;">
        <div id="ldl" style="height: 66px; width: 34.2%; background: url(dlr.jpg) repeat-x;
                float: left">
        </div>
        <div id="ldm" style="height: 66px; width: 31%; background: url(dm.jpg); float: left">
        </div>
        <div id="ldr" style="height: 66px; width: 34.8%; background: url(dlr.jpg) repeat-x;
                float: left">
        </div>
        <div style="height: 200px; width: 100%; background: url(dlr.jpg) repeat-x; float: left">
        </div>
    </div>
</div>
<div id="downLoad" style="width: 100%; height: 100%; margin-top: 0; display: none;
        background-color: #FFFFFF;">
    <div id="dlText" style="float: left; margin: 300px 0 0 30px; width: 540px; text-align: center;
            color: #000;">
    </div>
    <button id="dlbutton" style="float: left; margin: 300px 0 0 0px; color: #000; width: 100px;"
            onclick="Download();">
    </button>
</div>
<div id="win_install_activex" style="background-color: White; width: 100%; height: 100%;
        top: -10000px; left: 0px; position: absolute;">
    <div style="text-align: left; padding: 10px 20px; margin-left: auto; margin-right: auto;
            width: 800px; height: 500px; margin-top: 100px;">
        <div id='needOCX' style="font-family: Arial; color: #5b91ac; font-weight: bold; font-size: 18px;
                line-height: normal;">
            需要 ActiveX...
        </div>
        <div id='reason' style="font-family: Arial; font-size: 14px; margin-top: 0px; color: black;">
            需要安装一些 ActiveX 控件才能观看实时视频。
        </div>
        <table border="0" cellspacing="3" cellpadding="0" style="margin-top: 10px">
            <tr>
                <td style="vertical-align: top; padding-right: 30px; width: 300px; font-size: 14px;
                        font-family: Arial;">
                    <h2 id='step1' style="border: 1px solid #CCC; margin: 3px; padding: 2px 10px; font-weight: bold;
                            font-size: 14px; color: black; line-height: 22px; height: 22px;">
                        步骤 1:</h2>

                    <div id='step11' style="display: inline; color: black;">
                        如果屏幕顶端显示此消息，请单击消息并选择
                    </div>
                    <strong id="step12" style="">安装 ActiveX 控件...</strong><br/>
                    <br/>
                    <img src="activex-0831-1.gif"/><br/>
                    <br/>
                    <img src="activex-0831-2.gif"/><br/>
                </td>
                <td style="vertical-align: top; width: 300px; font-size: 14px;">
                    <h2 id='step2' style="border: 1px solid #CCC; margin: 3px; padding: 2px 10px; font-weight: bold;
                            font-size: 14px; color: black; line-height: 22px; height: 22px; font-family: Arial;">
                        步骤 2:</h2>

                    <div id='step21' style="display: inline; color: black;">
                        当出现此窗口时，单击
                    </div>
                    <strong id='step22'>安装</strong>

                    <div id='step23'>
                    </div>
                    <br/>
                    <br/>
                    <img src="activex-2.gif"/><br/>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>

        <div class="alert" style="margin-top:20px;">
            <div id='if1' class="info" style="color: black;">
                如果未出现此消息栏...
            </div>
        </div>
        <img src="activex-0831-1.gif" style="margin-top: 5px"/>
        <br/>
        <br/>
        <ul style="font-size: 14px; font-family: Arial; margin-top:10px; margin-bottom:10px">
            <li>
                <div id='clickrefresh' style="display: inline; color: black;">
                    单击
                </div>
                <strong id='clickrefresh1' style="color: black;">刷新</strong>

                <div id='clickrefresh2' style="display: inline; color: black;">
                    按钮刷新此页面，并再次检查警告栏是否出现。
                </div>
                <br/>
            </li>
            <li>
                <div id='if2' style="display: inline; color: black;">
                    如果消息栏仍然未出现，请单击下方的
                </div>
                <strong id='if21' style="color: black">下载安装程序</strong>

                <div id='if22' style="display: inline; color: black;">
                    按钮下载 ActiveX 控件的安装程序以手动安装这些控件。
                </div>
                <br/>
            </li>
        </ul>
        <p>
        </p>

        <p>
            &nbsp;</p>

        <div>
            <div id="refresh" style="float: left; cursor: pointer; width: 64px;
                    font-weight: bold; text-align: center; background: url(btn_white_left.gif) no-repeat; 
                    height: 20px;" onclick="window.location.reload()"
                 onmouseover="javascript:$('refresh').setStyle('background','url(btn_blue_left.gif)')"
                 onmouseout="javascript:$('refresh').setStyle('background','url(btn_white_left.gif)')">

                <div id='btnrefresh' style="text-align: center; float: left; margin-top: 4px; width: 100%;
                        font-size: 12px; color: black;">
                    刷新
                </div>
            </div>


            <div id="downloadexe" style="float: left; width: 113px; height: 20px; color: black;
                    margin-left: 20px; font-weight: bold; text-align: center; background: url('btn_white_right.gif') no-repeat; 
                    cursor: pointer;" onclick="Download()"
                 onmouseover="javascript:$('downloadexe').setStyle('background-image','url(btn_blue_right.gif)')"
                 onmouseout="javascript:$('downloadexe').setStyle('background-image','url(btn_white_right.gif)')">
                <div id='btndownload' style="text-align: center; float: left; margin-top: 4px; width: 100%;
                        font-size: 12px; color: black;">
                    下载安装程序
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //	
    $('needOCX').setText(Translate.NeedOCX);
    $('reason').setText(Translate.Reason);
    $('step1').setText(Translate.Step1);
    $('step11').setText(Translate.Situation1);
    $('step12').setText(Translate.InstallActiveX);
    $('step2').setText(Translate.Step2);
    $('step21').setText(Translate.Situation2);
    $('step22').setText(Translate.Install);
    $('if1').setText(Translate.If1);
    $('clickrefresh').setText(Translate.click);
    $('clickrefresh1').setText(Translate.refresh);
    $('clickrefresh2').setText(Translate.check);
    $('if2').setText(Translate.If2);
    $('if21').setText(Translate.Download);
    $('if22').setText(Translate.Mannual);
    $('btnrefresh').setText(Translate.refresh);
    $('btndownload').setText(Translate.Download);
    var g_whitePage = false;
    if (false == DetectActiveX()) {

        if (LoardAddress != "") {
            g_whitePage = true;
        }
        else {
            g_InstalledOCX = false;
        }
        if (bCrossBrow)//跨浏览器
        {
            g_InstalledOCX = true;
        }

    }
    if (!g_InstalledOCX) {
        $('win_install_activex').style.top = "0px";
    }

    if (!g_whitePage) {

        if (bLoginpage && bNat) {
            $('macaddress').style.display = "";
        }
        var len = navigator.mimeTypes.length;
        for (var i = 0; i < len; i++) {
            if (navigator.mimeTypes[i].type.toLowerCase() == "application/nptest-plugin") {
                bnpCheck = true;
                $('DownLoadPlug').style.display = "none";
                $('logo1').setStyle('margin-top', 31);
                break;
            }
        }
    }
    else {

        var userla = navigator.browserLanguage;
        if (userla == "zh-cn") {
            $('dlText').setText("请安装随机光盘中的IE控件或者从网络下载IE控件");
            $('dlbutton').setText("下载");

        }
        else {
            $('dlText').setText("Please install IE ActiveX: IE_Plugins.exe from CD or download from internet");
            $('dlbutton').setText("Download");
        }
        $('downLoad').style.display = '';
    }
    if (!g_whitePage && bLoginpage && g_InstalledOCX || !bNat) {
        $('login').style.display = '';
        resizeL();

    }
</script>

<div id="m">
    <div id="backGround" style="background: url(bg.jpg) repeat-x;">
        <div id="ma">
            <div style="width: 950px;">
                <div id="maa">
                </div>
                <div id="mab">
                </div>
                <div id="mac">
                    <div style="background: url('../logo/webLogo/logo.gif'); width: 126px; height: 100%;
                            position: relative;">
                    </div>
                </div>
                <div id="mad">
                </div>
                <div id="kwick">
                    <ul class="kwicks">
                        <li><span id='mthf' class="kwick b" onclick="ocx.ShowPlayBack()">回放</span></li>
                        <li><span id='mtrz' class="kwick c" onclick="ocx.ShowLog()">日志</span></li>
                        <li><span id='mtsbpz' class="kwick a" onclick="ocx.ShowDeviceConfig()">设备配置</span></li>
                        <li><span id='mtkhdpz' class="kwick d" onclick="ocx.ShowClientConfig()">客户端配置</span></li>
                        <li><span id='mttc' class="kwick e" onclick="Logout()">退出</span></li>
                    </ul>
                </div>
                <div id="mae">
                </div>
            </div>
        </div>
        <div id="mb">
            <div id="mba" style="float: left; padding: 0 0 0 5px; display: none">
                <div class="mpad">
                    <!--  <div id='dra' style="height: 29px; background: url(m_dram.jpg); position: relative;">
                            <div style="height: 29px; width: 8px; background: url(m_dral.jpg); float: left">
                            </div>
                            <div style="height: 29px; width: 8px; background: url(m_drar.jpg); float: right;
                                margin: 0 0px 0 0; cursor: move;">
                            </div>
                        </div>-->
                    <div id='dcl'>
                        <div id='mbal' style="height: 533px; position: relative; background: url(mb_bg.jpg) repeat-x;
                                overflow: auto; margin: 0px; padding: 0px;">
                            <ul id='cl'>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mbb" style="width: 650px; height: 500px; float: left; left: 120px; padding: 0 0 0 5px;">
                <!--<div id="drb" style="width: 100%; float: left; height: 29px; background: url(m_dram.jpg)">
                        <div style="height: 29px; width: 8px; background: url(m_dral.jpg); float: left">
                        </div>
                        <div style="height: 29px; width: 8px; background: url(m_drar.jpg); float: right;
                            margin: 0 0 0 0;">
                        </div>
                    </div>-->
                <div id='pla' style="width: 100%; height: 100%; float: left; padding: 0">

                    <script>

                        if (g_whitePage) {

                        } else {
                            var cLanguage;
                            switch (iLanguage) {
                                case 100:
                                    cLanguage = "English";
                                    break;
                                case 101:
                                    cLanguage = "SimpChinese";
                                    break;
                                case 102:
                                    cLanguage = "TradChinese";
                                    break;
                                case 103:
                                    cLanguage = "Italian";
                                    break;
                                case 104:
                                    cLanguage = "Spanish";
                                    break;
                                case 105:
                                    cLanguage = "Japanese";
                                    break;
                                case 106:
                                    cLanguage = "Russian";
                                    break;
                                case 107:
                                    cLanguage = "French";
                                    break;
                                case 108:
                                    cLanguage = "German";
                                    break;
                                case 109:
                                    cLanguage = "Portugal";
                                    break;
                                case 110:
                                    cLanguage = "Turkey";
                                    break;
                                case 111:
                                    cLanguage = "Poland";
                                    break;
                                case 112:
                                    cLanguage = "Romanian";
                                    break;
                                case 113:
                                    cLanguage = "Hungarian";
                                    break;
                                case 114:
                                    cLanguage = "Finnish";
                                    break;
                                case 116:
                                    cLanguage = "Korean";
                                    break;
                                case 117:
                                    cLanguage = "Farsi";
                                    break;
                                case 119:
                                    cLanguage = "Thai";
                                    break;
                                case 120:
                                    cLanguage = "Greek";
                                    break;
                                case 121:
                                    cLanguage = "Vietnamese";
                                    break;
                                case 123:
                                    cLanguage = "Brazilian";
                                    break;
                                case 124:
                                    cLanguage = "Hebrew";
                                    break;
                                case 125:
                                    cLanguage = "Indonesian";
                                    break;
                                case 126:
                                    cLanguage = "Arabic";
                                    break;
                                case 127:
                                    cLanguage = "Swedish";
                                    break;
                                case 128:
                                    cLanguage = "Czech";
                                    break;
                                case 129:
                                    cLanguage = "Bulgarian";
                                    break;
                                default:
                                    cLanguage = "English";
                                    break;
                            }
                            document.write("<div style='position: absolute; top: -1020px;'><a style='backGround:url(mb_bg.jpg)'></a></div>")
                            document.write(" <div style='position: absolute; top: -1000px;'><a style='background:url(yta11.jpg)'></a> <a style='background: url(yt-1.gif)'></a><a style='background: url(yt+1.gif)'></a><a style='background: url(11.jpg)'></a><a style='background: url(91.jpg)'></a><a style='background: url(41.jpg)'></a><a style='background: url(stopRecordAll1.jpg)'></a> <a style='background: url(m_img21.jpg)'></a><a style='background: url(m_img41.jpg)'>      </a><a style='background: url(audio.jpg)'></a><a style='background: url(yt11.jpg)'></a>        <a style='background: url(yt21.jpg)'></a><a style='background: url(yt31.jpg)'></a>        <a style='background: url(yt41.jpg)'></a><a style='background: url(yt51.jpg)'></a>        <a style='background: url(yt61.jpg)'></a><a style='background: url(yt71.jpg)'></a>        <a style='background: url(yt81.jpg)'></a><a style='background: url(yt91.jpg)'></a>        <a style='background: url(yt+1.png)'></a><a style='background: url(yt-1.png)'></a>        <a style='background: url(goPreSet1.jpg)'></a><a style='background: url(addPreSet1.jpg)'>        </a><a style='background: url(editCruise1.jpg)'></a><a style='background: url(delPreSet1.jpg)'>        </a><a style='background: url(goCruise1.jpg)'></a><a style='background: url(stopCruise1.jpg)'>        </a><a style='background: url(t1t.jpg)'></a><a style='background: url(yy11.jpg)'></a>        <a style='background: url(full1.jpg)'></a><a style='background: url(sar.png)'></a>        <a style='background: url(sar1.png)'></a><a style='background: url(sal.png)'></a>        <a style='background: url(sal1.png)'></a><a style='background: url(stopAll1.jpg)'></a>        <a style='background: url(startAll1.jpg)'></a><a style='background: url(snap1.jpg)'></a>        <a style='background: url(recordAll1.jpg)'></a><a style='background: url(stopRecordAll.jpg)'></a><a style='background: url(361.jpg)'></a><a style='background: url(251.jpg)'></a><a style='background: url(161.jpg)'></a>    </div>");
                            //document.write("<object  id='ocx' width='100%' height='100%' classid='CLSID:FD3BEB0C-AB43-4253-9146-C371D48FBE0D'  codebase='"+cabAddress+"'><param name='Language' value='"+cLanguage+"'><param name='passPort' value='1'></object>");
                            if (bCrossBrow)//crossBrow
                            {
                                document.write("<object id='ocx' type='application/nptest-plugin' width='100%' height='100%' ></object>")


                                if (!bnpCheck) {
                                    /*$('DownLoadPlug').style.display='';
                                     $('logo1').setStyle('margin-top',0);
                                     var userla=navigator.browserLanguage;
                                     $('DownLoadPlug').setStyle('margin-left',-2);
                                     $('DownLoadPlug').setStyle('width',400);
                                     $('DownLoadPlug').setStyle('height',27);
                                     $('DownLoadPlug').setStyle('margin-top',2);
                                     if(userla=="zh-cn")
                                     {
                                     $('DownLoadPlug').setText("点击下载Plugin,安装完请先关闭再启动浏览器"); 
                                     $('DownLoadPlug').style.background='#f00';

                                     }
                                     else
                                     {
                                     $('DownLoadPlug').setText("点击下载Plugin,安装完请先关闭再启动浏览器");
                                     $('DownLoadPlug').style.background='#969ea8';
                                     $('DownLoadPlug').style.color='#f00';
                                     $('DownLoadPlug').style.fontSize='20px';
                                     }*/
                                    var userla = navigator.language;
                                    if (userla == "zh-CN") {
                                        $('dlText').setText("点击下载Plugin,安装完请先关闭再启动浏览器");
                                        $('dlbutton').setText("下载");

                                    }
                                    else {
                                        $('dlText').setText("Click on the download plug-in, please close to launch a browser installed");
                                        $('dlbutton').setText("Download");
                                    }
                                    $('downLoad').style.display = '';
                                }
                            } else {
                                document.write("<object  id='ocx' width='100%' height='100%' classid='CLSID:FD3BEB0C-AB43-4253-9146-C371D48FBE0D'  codebase='" + cabAddress + "'><param name='Language' value='" + cLanguage + "'></object>");

                            }


                        }
                    </script>

                </div>
                <div id='plc' style="width: 100%; float: left; height: 33px; background: url(plcb11.jpg);
                        margin: 2px 0 0 0;">
                    <div style="width: 7px; height: 33px; float: left; background: url(plcbl.jpg);">
                    </div>
                    <div style="width: 7px; height: 33px; float: right; background: url(plcbr.jpg);">
                    </div>
                    <!--	<div id='pbh' style="background:url(plcb.jpg);width:580px;height:33px;position:absolute;"></div>-->
                    <div id='pb' style="height: 26px; margin: 2px 0 0 10px; position: relative;">
                        <div id='pc'>
                            <div style="margin: 0 0 0 0px">
                                <a id='xp0' class="p0" href="javascript:;" onclick="ocx.Fullscreen(true)"></a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='xp1' class="p1" href="javascript:;" onclick="ocx.ChangeShowWndNum(1,true,0,0)">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='xp2' class="p2" href="javascript:;" onclick="ocx.ChangeShowWndNum(4,true,0,0)">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='xp3' class="p3" href="javascript:;" onclick="ocx.ChangeShowWndNum(9,true,0,0)">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='xp4' class="p4" href="javascript:;" onclick="ocx.ChangeShowWndNum(16,true,0,0)">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='xp5' class="p5" href="javascript:;" onclick="ocx.ChangeShowWndNum(25,true,0,0)">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='xp6' class="p6" href="javascript:;" onclick="ocx.ChangeShowWndNum(36,true,0,0)">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='startPlayAll' class="p7" href="javascript:;" onclick="ocx.PlayAll()"></a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='stopPlayAll' class="p72" href="javascript:;" onclick="ocx.StopRealPlayAll()"></a>
                            </div>
                            <div style="margin: 0 0 0 5px;">
                                <a title='snap' id='snap' class="p8" href="javascript:;"
                                   onclick="ocx.BMPCapturePicture('C:\\BMP')">
                                </a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='recordAll' class="p9" href="javascript:;"
                                   onclick="ocx.startRecordAll('C:\\record')"></a>
                            </div>
                            <div style="margin: 0 0 0 5px">
                                <a id='stopRecordAll' class="p92" href="javascript:;" onclick="ocx.stopRecordAll()">
                                </a>
                            </div>
                            <div style="margin: 0 17px 0 0; float: right">
                                <a id='Audio' class="p102" href="javascript:;" onclick="openAudio()"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mbc" style="float: left; padding: 0 0 0 5px; width: 140px;">
                <div id="mrtop" style="background: url(mb_bg.jpg); width: 140px; overflow: hidden;">
                    <!--<div id='drc' style="height: 29px; width: 100%; background: url(m_dram.jpg); position: relative;">
                            <div style="height: 29px; width: 8px; background: url(m_dral.jpg); float: left">
                            </div>
                            <div style="height: 29px; width: 8px; background: url(m_drar.jpg); float: right;
                                margin: 0 0px 0 0; cursor: move;">
                            </div>
                        </div>-->
                    <div id='yt' style="height: 130px; width: 125px; position: relative; padding: 8px 8px 0 8px">
                        <div style="width: 40px; height: 35px; padding: 0px 0 0 0px;">
                            <a class="y1" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,4,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,4,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 45px; height: 35px; padding: 0px 0 0 0px;">
                            <a class="y2" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,0,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,0,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 39px; height: 35px; padding: 0px 0 0 0px;">
                            <a class="y3" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,6,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,6,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 40px; height: 50px; padding: 0px 0 0 0px;">
                            <a class="y4" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,2,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,2,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 45px; height: 50px;">
                            <a class="y5" href="javascript:;" onclick="ocx.OnBntEntermenu();"></a>
                        </div>
                        <div style="width: 39px; height: 50px; padding: 0px 0 0 0px;">
                            <a class="y6" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,3,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,3,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 40px; height: 45px; padding: 0 0 0 0px;">
                            <a class="y7" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,5,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,5,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 45px; height: 35px; padding: 0 0 0 0px;">
                            <a class="y8" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,1,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,1,parseInt($('ps').value))"></a>
                        </div>
                        <div style="width: 39px; height: 35px; padding: 0 0 0 0px;">
                            <a class="y9" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,7,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,7,parseInt($('ps').value))"></a>
                        </div>
                    </div>
                    <div style="width: 132px; height: 20px; padding: 0 0 0 8px; position: relative; overflow: hidden;">
                        <div id='xbc' class="divt" style="color: #FFFFFF; float: left;">
                            步长(1-8):
                        </div>
                        <div style="width: 53px; height: 18px; background: url(ytabg.jpg); padding: 0 0 0 3px;
                                float: left;">
                            <input class="inputyt" type="text" id="ps" value="5" maxlength="1"
                                   onkeyup="value=value.replace(/[^\d]/g,'')"
                                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            <a href="javascript:;" class="yta1" onclick="showmu1()"></a>
                        </div>
                    </div>
                    <div id="smu1" style="display: none">
                        <ul>
                            <li><a href='javascript:;' onclick='onmu1(1)'>1</a></li>
                            <li><a href='javascript:;' onclick='onmu1(2)'>2</a></li>
                            <li><a href='javascript:;' onclick='onmu1(3)'>3</a></li>
                            <li><a href='javascript:;' onclick='onmu1(4)'>4</a></li>
                            <li><a href='javascript:;' onclick='onmu1(5)'>5</a></li>
                            <li><a href='javascript:;' onclick='onmu1(6)'>6</a></li>
                            <li><a href='javascript:;' onclick='onmu1(7)'>7</a></li>
                            <li><a href='javascript:;' onclick='onmu1(8)'>8</a></li>
                        </ul>
                    </div>
                    <div id='yt1' style="width: 132px; height: 90px; position: relative; margin: 0 5px 0 5px;">
                        <div style="padding: 0 0 5px 14px;">
                            <a class="y1" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,9,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,9,parseInt($('ps').value))"></a>
                        </div>
                        <div id='xbb' style="color: #FFFFFF; height: 18px; width: 50px; padding: 8px 0 0 0;
                                text-align: center;">
                            变倍
                        </div>
                        <div style="padding: 0 0 5px 0;">
                            <a class="y2" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,8,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,8,parseInt($('ps').value))"></a>
                        </div>
                        <div style="padding: 0 0 5px 14px;">
                            <a class="y1" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,11,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,11,parseInt($('ps').value))"></a>
                        </div>
                        <div id='xbj' style="color: #FFFFFF; height: 18px; width: 50px; padding: 8px 0 0 0;
                                text-align: center;">
                            变焦
                        </div>
                        <div style="padding: 0 0 5px 0;">
                            <a class="y2" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,10,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,10,parseInt($('ps').value))"></a>
                        </div>
                        <div style="padding: 0 0 5px 14px;">
                            <a class="y1" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,12,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,12,parseInt($('ps').value))"></a>
                        </div>
                        <div id='xgq' style="color: #FFFFFF; height: 18px; width: 50px; padding: 8px 0 0 0;
                                text-align: center;">
                            光圈
                        </div>
                        <div style="padding: 0 0 5px 0;">
                            <a class="y2" href="javascript:;"
                               onmousedown="ocx.PTZCtrlStart(-1,13,parseInt($('ps').value))"
                               onmouseup="ocx.PTZCtrlStop(-1,13,parseInt($('ps').value))"></a>
                        </div>
                    </div>
                    <div id='yt2' style="height: 100%; position: relative; padding: 0 0 0 4px;">
                        <div>
                            <!-- 预置点处理 -->
                            <div id="ytPoint">
                                <div id='mbcyzd' style="color: #FFFFFF; padding: 0 80px 0 0px; margin: 0 0 0 3px;">
                                    预置点：
                                </div>
                                <div>
                                    <input id="preSet" value="1" maxlength="3"
                                           onkeyup="value=value.replace(/[^\d]/g,'')"
                                           style="margin: 3px 0 0 5px; color: #555; border: none; background: #F4F4F4; width: 30px;
                                            height: 17px;"/>
                                </div>
                                <div id="goPreset">
                                    <a style="width: 24px; height: 25px;" href="javascript:;"
                                       onclick="ocx.PTZCtrlGotoPreset(-1,parseInt($('preSet').value))">
                                    </a>
                                </div>
                                <div id="addPreset">
                                    <a style="width: 24px; height: 25px;" href="javascript:;"
                                       onclick="ocx.PTZCtrlSetPreset(-1,parseInt($('preSet').value),true)">
                                    </a>
                                </div>
                                <div id="delPreset">
                                    <a style="width: 24px; height: 25px;" href="javascript:;"
                                       onclick="ocx.PTZCtrlSetPreset(-1,parseInt($('preSet').value),false)">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div>
                            <!-- 轮询处理 -->
                            <div id="ytCruise">
                                <div id='mbcdjxh'
                                     style="width:80px;color: #FFFFFF; padding: 0 70px 0 0px; margin: 0px 10px 0 3px;">
                                    点间巡航：
                                </div>
                                <div>
                                    <input id="cruise" value="1" maxlength="3"
                                           onkeyup="value=value.replace(/[^\d]/g,'')"
                                           style="margin: 2px 0 3px 5px; color: #555; border: none; background: #F4F4F4;
                                            width: 30px; height: 17px;"/>
                                </div>
                                <div id="goCruise">
                                    <a style="width: 24px; height: 25px;" href="javascript:;"
                                       onclick="ocx.PTZCtrlTour(-1,parseInt($('cruise').value),true)">
                                    </a>
                                </div>
                                <div id="stopCruise">
                                    <a style="width: 24px; height: 25px;" href="javascript:;"
                                       onclick="ocx.PTZCtrlTour(-1,parseInt($('cruise').value),false)">
                                    </a>
                                </div>
                                <div id="editCruise">
                                    <a style="width: 24px; height: 25px;" href="javascript:;"
                                       onclick="ocx.PTZEditTure(parseInt($('cruise').value))">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id='taba' style="float: left; margin: 0px 0 0 0; width: 140px;">
                    <div style="float: left;">
                        <a id='taba1' class="t1" href="javascript:;">图像设置</a></div>
                    <div style="float: left;">
                        <a id='taba2' class="t2" href="javascript:;">其他设置</a></div>
                </div>
                <div class="mpad2" style="float: left;">
                    <!--<div id='yt3' style=" height:287px;position:relative; overflow:hidden; margin:0 0 0 4px;">-->
                    <div id='yt3' style="height: 187px; position: relative; overflow: hidden; margin: 0 0 0 4px;">
                        <div id='yt3t1' style="height: 100%;">
                            <div id='yt3t1a'>
                                <div style="margin: 5px 0 0 0;">
                                    <div id='xtld' style='width: 21px; height: 21px; background: url(tx1.jpg)'
                                         title='亮度'>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sal" href="javascript:;" onclick="gslda.set(gca-1)"></a>
                                    </div>
                                    <div id='saa' class="sax">
                                        <div id='ska' class="skx">
                                        </div>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sar" href="javascript:;" onclick="gslda.set(gca+1)"></a>
                                    </div>
                                </div>
                                <div style="margin: 5px 0 0 0;">
                                    <div id='xtdbd' style='width: 21px; height: 21px; background: url(tx2.jpg)'
                                         title='对比度'>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sal" href="javascript:;" onclick="gsldb.set(gcb-1)"></a>
                                    </div>
                                    <div id='sab' class="sax">
                                        <div id='skb' class="skx">
                                        </div>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sar" href="javascript:;" onclick="gsldb.set(gcb+1)"></a>
                                    </div>
                                </div>
                                <div style="margin: 5px 0 0 0;">
                                    <div id='xtbhd' style='width: 21px; height: 21px; background: url(tx3.jpg)'
                                         title='饱和度'>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sal" href="javascript:;" onclick="gsldc.set(gcc-1)"></a>
                                    </div>
                                    <div id='sac' class="sax">
                                        <div id='skc' class="skx">
                                        </div>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sar" href="javascript:;" onclick="gsldc.set(gcc+1)"></a>
                                    </div>
                                </div>
                                <div style="margin: 5px 0 0 0;">
                                    <div id='xtsd' style='width: 21px; height: 21px; background: url(tx4.jpg)'
                                         title='色度'>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sal" href="javascript:;" onclick="gsldd.set(gcd-1)"></a>
                                    </div>
                                    <div id='sad' class="sax">
                                        <div id='skd' class="skx">
                                        </div>
                                    </div>
                                    <div style="margin: 4px 0 0 4px;">
                                        <a class="sar" href="javascript:;" onclick="gsldd.set(gcd+1)"></a>
                                    </div>
                                </div>
                            </div>
                            <div style="padding: 5px 0 0 0;">
                                <a id='xcz' class="cbt" href="javascript:;" onclick="txreset(64);">重置</a></div>
                        </div>
                        <div id='yt3t2' style="height: 100%; display: none;">
                            <div class='cbtd'>
                                <a id='xcqsb' class="cbt" style="margin: 20px 0 0 0px;" href="javascript:;"
                                   onclick="ocx.RebootServer();"
                                   title="">重启设备</a></div>
                            <div class='cbtd'>
                                <a id='DVRcolor' class="cbt" style="margin: 20px 0 0 0px;" href="javascript:;"
                                   onclick="ocx.EditDVRColor(-1);"
                                   title=""></a>
                            </div>
                            <div class='cbtd'>
                                <a id='ratio' class="cbt" style="margin: 20px 0 0 0px;" href="javascript:;"
                                   onclick="ChangeRadio();"
                                   title=""></a>
                            </div>
                            <div class='cbtd'>
                                <a id='talk2' class="cbt" style="margin: 20px 0 0 0px;" href="javascript:;"
                                   onclick="Ontalk();"
                                   title=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="mcc" style="height:5px;overflow:hidden;"></div>
    </div>
</div>
</body>
</html>
