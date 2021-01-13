<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <title></title>
    <link href="/cloud/member/css/public-min.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/login-min.css" type="text/css" rel="stylesheet">
    <link href="/css/confirm-min.css" type="text/css" rel="stylesheet">
    <script src="/js/jquery-1.11.1.min.js"></script>
    <script src="/cloud/js/inputLabel-min.js"></script>
    <script type="text/javascript" src="/cloud/member/js/login-min.js"></script>
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">
<input type="hidden" id="Message_mac_passLogin_tips" value="<s:text name='tips_1482'/>">
<input type="hidden" id="Message_Login" value="<s:text name="login_hint" />">

<div id="header" class="header">
    <div onclick="window.location.href='/index'" class="logo cusPoint"></div>
    <div class=" layout_right ">
        <%--<span class="fr"><a href="/message/news/${languageVos[0].code}/bug_${languageVos[0].code}.html" target="_blank"><s:text
                name="bug_feedback"/></a></span>
        <b class="fr">|</b>--%>
        <span id="DownLoadApp" class="fr cursor">APP <s:text name="app_download"/>
            <div id="showDownLoadApp">
                <img src="/cloud/member/images/icon_app.png"><br>
                <img src="/cloud/member/images/icon_app_test.png">
            </div>
        </span>
        <b class="fr">|</b>
        <span class="fr cursor" onclick="showDownLoadCode()"><s:text name="ocx_download"/></span>
        <%--语言框--%>
        <div class="language_box fr">
            <div class="languageList">
                <ul>
                    <s:iterator value="#attr.languageVos" var="languageVo">
                        <li data-val="${languageVo.code}">
                            <input class="lan_code" type="text" style="display: none" value="${languageVo.code}">
                            <img class="languageListImg" src="/cloud/img/lan/${languageVo.code}.png">${languageVo.text}
                        </li>
                    </s:iterator>
                </ul>
            </div>
            <div class="language">
                <img class="languageImg" src="/cloud/img/lan/${languageVos[0].code}.png"> ${languageVos[0].text}
                <span class="switchOpen"></span>
            </div>
        </div>
        <%--语言框--%>
    </div>
    <%--    <div class="OcxDown " id="OcxDown">
            <div style="width: 50px;height: 100%" class="fr"></div>
            <input type="button" class="btn bg_b3b3b3 fr" value="<s:text name="pub_cancel"/>" onclick="hideDown()">
            <input type="button" class="btn bg_b3b3b3 fr" id="webDownLoad" value="<s:text name="pub_ok"/>"
                   onclick="download_file()">
            <a class="fr" href="javascript:refreshVerification('verif3')">
                <img class="resh_img" id="verif3" src="/verification_produce?_=3"/>
            </a>
            <input class="yzm_70 h_25 fr" style="padding-left: 10px;" type="text" name="verificationCode3"
                   id="verificationCode3">${tips}
            <div id="errorMessage" class="errorMessage fr"></div>
        </div>--%>
</div>
<div id="bg_img_Top"></div>
<div id="bg_img"></div>
<div id="bg_img_Bottom"></div>
<div id="content" class="center">
    <div class="erweima_box hide">
        <div class="erweima_1">
            <h3>Android App</h3>
            <img src="/cloud/member/images/icon_app.png">

            <div class="delete" onclick="$('.erweima_1').hide()" title="CLOSED"><span class="delete_img"></span></div>
        </div>

        <div class="erweima_2">
            <h3>Android App</h3>
            <img src="/cloud/member/images/icon_app_test.png">

            <div class="delete" onclick="$('.erweima_2').hide()" title="CLOSED"><span class="delete_img"></span></div>
        </div>
    </div>

    <table id="contentTable">
        <tr>
            <td>
                <div id="loginMain" class="main">
                    <div class="login_main">
                        <%--轮播框--%>
                        <div class="scroll bannerBox">
                            <ul id="zhBox" class="hide">
                                <li><a target="_blank" href="http://www.xm030.com/goods.php?id=97">
                                    <img src="/cloud/member/images/login/product2.jpg"></a>
                                </li>
                                <li><a target="_blank" href="http://www.xiongmaitech.com/index.php/news/info/10/69">
                                    <img src="/cloud/member/images/login/product0.jpg"></a>
                                </li>
                                <%--<li><a target="_blank" href="https://xiongmai.tmall.com/">
                                    <img src="/cloud/member/images/login/product4.jpg"></a>
                                </li>--%>
                            </ul>
                            <ul id="bannerBox" style="left: 0">
                                <li><a target="_blank" href="/message/feature/zh/intro.jsp">
                                    <img src="/cloud/member/images/login/banner/banner_${languageVos[0].code}.png"></a>
                                </li>
                                <li class="Tips">
                                    <div class="TipsBox">
                                        <span class="TipsBoxHead"><s:text name="tips_1312"/></span>
                                        <h4><a target="_blank" href="/message/news/${languageVos[0].code}/1.html">
                                            <s:text name="news_1"/></a></h4>
                                        <h4><a target="_blank" href="/message/news/${languageVos[0].code}/2.html">
                                            <s:text name="news_2"/></a></h4>
                                        <h4><a target="_blank" href="/message/news/${languageVos[0].code}/3.html">
                                            <s:text name="news_3"/></a></h4>
                                        <h4><a target="_blank" href="/message/news/${languageVos[0].code}/notice.html">
                                            <s:text name="news_4"/></a></h4>
                                    </div>
                                </li>
                            </ul>
                            <a href="#" class="prev hide"></a>
                            <a href="#" class="next hide"></a>
                        </div>
                        <%--轮播框--%>
                        <%--阴影--%>
                        <div class="iconShadow shadow_L_T"></div>
                        <div class="shadow_C_T"></div>
                        <div class="iconShadow shadow_R_T"></div>
                        <div class=" shadow_C_L"></div>
                        <div class=" shadow_C_R"></div>
                        <div class="iconShadow shadow_L_D"></div>
                        <div class=" shadow_C_D"></div>
                        <div class="iconShadow shadow_R_D"></div>
                        <%--阴影--%>

                        <div id="MoaiBox">
                            <div id="loginBOX">
                                <div class="login_main_top letter-spacing_${languageVos[0].code}">
                                    <ul class="transform_nav">
                                        <li class="login_main_top_1 block" dist="#LOGINUSERID">
                                            <s:text name="login_type_user"/></li>
                                        <li class="login_main_top_2" dist="#LOGINMACID">
                                            <s:text name="login_type_device"/></li>
                                    </ul>
                                </div>
                                <div class="bg_right_login transform_box">
                                    <!-- 按用户star-->
                                    <div class="login_main_box1 transform_container" id="LOGINUSERID">
                                        <form action="/cloud_user_login_member" method="post" id="userLogin">
                                            <table class="login_table">
                                                <tbody>
                                                <tr class="tipsError">
                                                    <td><span id="loginErrorTips"></span></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 0 15px;border: 1px solid #aeafb1;">
                                                        <div class="tableMain">
                                                            <span class="icon_login icon_user"></span>
                                                            <label><s:text name="login_username"/></label>
                                                            <input type="text" autocomplete="off" name="log.name"
                                                                   value="${log.name}">
                                                        </div>

                                                        <div class="tableMain" style="border-bottom:none;">
                                                            <span class="icon_login icon_pass"></span>
                                                            <label><s:text name="login_password"/></label>
                                                            <input type="password" name="log.Password"
                                                                   value="${log.password}">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr style="height: 55px">
                                                    <td style="height: 45px;padding-top: 10px;position: relative">
                                                        <label class="label-verify"><s:text
                                                                name="login_verify"/></label>
                                                        <input onkeyup="userOnKeyUp(event)" class="yzm_70"
                                                               style="height: 35px;line-height: 35px" type="text"
                                                               name="log.verificationCode" id="verify_user">
                                                        <img class="resh_img" id="verif"
                                                             onclick="refreshVerification('verif')"
                                                             src="/verification_produce?_=1"/>
                                                    </td>
                                                </tr>

                                                <tr style="height: 35px">
                                                    <td class="labelBox">
                                                        <label>
                                                            <input style=" vertical-align: middle" type="checkbox"
                                                                   name="log.rememberMe" value="true">
                                                            <s:text name="login_remember"/></label>
                                                        <a class="fr a_4092da"
                                                           style="position: absolute;right: 0;bottom: 0;"
                                                           href="/cloud_forgotPass_forgotPass_member">
                                                            <s:text name="login_get_password"/>?</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <input style="width: 100%;padding: 10px 0;font-size: 20px"
                                                               class=" btn bg_blue " type="button" id="userLoginBut"
                                                               value="<s:text name="login_hint" />">
                                                        <a class="fl hide" href="/guide" target="_blank">
                                                            <input class="btn bg_b3b3b3" type="button"
                                                                   value="<s:text name="index_newer_guide"/>">
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr style="clear: both;height: 30px;line-height: 30px">
                                                    <td align="left">
                                                        <a href="/guide" style="font-size: 12px;" target="_blank">
                                                            <s:text name="login_first_tip"/></a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                    <!-- 按用户end-->

                                    <!-- 按设备star-->
                                    <div class="login_main_box2 transform_container" id="LOGINMACID">
                                        <%-- ${macLog.mac}${macLog.username}${macLog.password}--%>
                                        <form action="/cloud_device_macLogin_main" method="post" id="macLogin">
                                            <table class="login_table">
                                                <tbody>
                                                <tr class="tipsError">
                                                    <td><span id="macErrorTips"></span></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 0 15px;border: 1px solid #aeafb1;">
                                                        <div class="tableMain">
                                                            <span class="icon_login icon_device"></span>
                                                            <label><s:text name="device_mac"/></label>
                                                            <input type="text" name="deviceMy.mac"
                                                                   value="${macLog.mac}">
                                                        </div>

                                                        <div class="tableMain">
                                                            <span class="icon_login icon_device_user"></span>
                                                            <label><s:text name="device_username"/></label>
                                                            <input type="text" name="deviceMy.username"
                                                                   value="${macLog.username}">
                                                        </div>
                                                        <div class="tableMain" style="  border-bottom:none;">
                                                            <span class="icon_login icon_pass"></span>
                                                            <label><s:text name="device_password"/></label>
                                                            <input id="macPassword" type="password"
                                                                   name="deviceMy.password"
                                                                   value="${macLog.password}">
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr style="height: 45px">
                                                    <td style="height: 35px;padding-top: 10px">
                                                        <label class="label-verify">
                                                            <s:text name="login_verify"/></label>
                                                        <input onkeyup="macOnKeyUp(event)" class="yzm_70"
                                                               style="height: 35px;line-height: 35px"
                                                               type="text" name="verificationCode2" id="verify_mac">

                                                        <a href="javascript:refreshVerification('verif2')">
                                                            <img class="resh_img" id="verif2"
                                                                 src="/verification_produce?_=2"/></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input style="width: 100%;padding: 10px 0;font-size: 20px"
                                                               class=" btn bg_blue " type="button" id="macLoginBut"
                                                               value="<s:text name="login_hint" />">
                                                    </td>
                                                </tr>
                                                <tr style="clear: both;height: 30px;line-height: 30px">
                                                    <td align="left">

                                                        <a href="/guide" style="font-size: 12px;" target="_blank">
                                                            <s:text name="login_first_tip"/></a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                    <!-- 按设备end-->
                                </div>
                                <%--注册--%>
                                <div onclick="location.href='/cloud_register_register_member'"
                                     class="register_box cursor"><s:text name="login_register"/>
                                </div>
                                <%--注册--%>
                                <div class="switch-ErWeiMA" title="APP Download"></div>
                            </div>
                            <div id="erWeiMaBox" tabindex="1"></div>
                        </div>
            </td>
        </tr>
    </table>
</div>

<form name="ocxDownloadform" id="ocxDownload" action="/download_downloadFile" method="post">
    <input style="display: none" name="checkCode">
</form>
</body>
</html>
<script type="text/javascript">
    var isZh = $(".languageList li:eq(0) ").attr("data-val") == "zh" ? $("#bannerBox").prepend($("#zhBox").html()) : "";
</script>
<script type="text/javascript" src="/cloud/js/banner-min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript" src="/cloud/member/js/ocx_download-min.js"></script>
<%--<script type="text/javascript" src="/cloud/js/uc-min.js"></script>--%>
<script type="text/javascript" src="//hm.baidu.com/hm.js?397de29c96cc0d71df2b66e92999b6e3"></script>
