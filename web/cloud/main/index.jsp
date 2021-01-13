<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <link href="/cloud/main/css/style-min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/cloud/main/js/public-min.js"></script>
    <%--<script type="text/javascript" src="/cloud/cloudManage/js/flip_window-min.js"></script>--%>
    <style type="text/css">
        body {
            min-width: 1024px;
            min-height: 700px;
        }
    </style>

</head>
<body>
<!-- 头部--star -->
<div id="header">

    <table style="width: 100%;height: 100%;z-index: 98">
        <tbody>
        <tr>
            <td width="40px"></td>
            <td width="140px">
                <div onclick="window.location.href='/index'" class="logo cusPoint"></div>
            </td>
            <td style="width: auto">
                <div id="menuBox">
                    <ul class="menuBox">
                        <li id="mydecive" class="on"><a href="javascript:showDev()"><s:text name="device_my"/></a></li>
                        <s:iterator value="menus" var="menu">
                            <li><a data-href="${menu.src}">${menu.name}</a></li>
                        </s:iterator>
                        <%-- <li id="cloud"><a href="javascript:void(0)">
                             <s:text name="cloud_manager"/></a>
                         </li>--%>
                    </ul>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <div style="position: absolute;right: 30px;top: 0;width: auto;display: inline-block">
        <div id="userInfo" class="layout_right fr">
        <span class="userExit fr" onclick="window.location.href='/userExit'"
              title="<s:text name="login_logout"/>">              </span>
            <b class="fr">|</b>

            <div id="inforBox" class="fr inforBox" title="个人信息" onclick="showpersonInf(this)"
                 data-href="/cloud_user_info_member">
                <span style="display: inline-block" id="username"><a>${sessionScope.user.username}</a></span>
            </div>
        </div>
        <%--语言框--%>
        <div class="language_box fr">
            <div class="languageList">
                <ul>
                    <s:iterator value="#attr.languageVos" var="languageVo">
                        <li data-val="${languageVo.code}">
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

</div>
<!-- 头部--end -->

<!-- 中间--star -->
<div class="center_box">
    <!-- 左边设备列表区域star -->
    <div class="center_left">
        <div class="switchBox_off">.<br>.<br>.<br>.<br>.<br>.<br>
            <span style="width: 100%;height: 30px;display: block"></span>.<br>.<br>.<br>.<br>.<br>.
        </div>
        <div class="show_switch on"></div>
        <div class="switchBox hide">
            <div class="show_switch on"></div>
        </div>

        <div class="center_left_box ">
            <!-- 竖向滚动条start -->
            <!-- 竖向滚动条end -->
            <div class="scr_con">
                <%--设备列表--%>
                <div class="viewport">
                    <div class="refresh" onclick="sd_refresh()">
                        <s:text name="pub_refresh_state"/>
                    </div>
                    <ul class="deviceList">
                        <s:iterator value="devices" var="device">
                            <li id="${device.mac}" status="1"
                                data-href="/cloud/video/index.jsp?mac=${device.mac}&username=${device.username}&password=${device.password}">
                                <span>${device.name}</span>
                                <img class="viewport_img" src="/cloud/main/images/loading.gif"/>
                            </li>
                        </s:iterator>
                    </ul>
                </div>
                <%--设备列表--%>
                <%--云共享功能列表--%>
                <div class="cloudShare">
                    <ul>
                        <li id="cloud_store" class="v_li_back"
                            data-href="/cloudMange/cloud_cloudM_storeList_cloudManage">
                            <s:text name="cloud_store"/></li>
                        <li id="cloud_alarm" data-href="/cloudMange/cloud_cloudM_alarmList_cloudManage">
                            <s:text name="cloud_alarm"/></li>
                        <li id="cloud_media" data-href="/cloudMange/cloud_cloudM_mediaList_cloudManage">
                            <s:text name="cloud_media"/></li>
                        <li id="cloud_share" data-href="/cloudMange/cloud_cloudM_shareList_cloudManage"
                            data-activated="1"><s:text name="cloud_share"/>
                        </li>
                    </ul>
                </div>
                <%--云共享功能列表--%>
            </div>
        </div>
    </div>
    <!-- 左边设备列表区域end -->
    <!-- 右边播放区域star -->
    <div class="center_right">
        <div id="center_box" class="center_right_box">
            <iframe id="center_iframe" frameborder="0" src="/cloud_device_videoIfo_main"></iframe>
            <iframe id="center_iframe_alert" frameborder="0" src=""></iframe>
        </div>
    </div>
    <!-- 右边播放区域end -->
</div>
<!-- 中间--end -->

<!--弹窗--star-->
<div id="bg"></div>
<div class="alert_content">
    <div class="alert_box_iframe">
        <span id="alert_close" class="alert_close">x</span>
        <iframe frameborder="0" id="bg_iframe"></iframe>
    </div>
</div>
<!--弹窗--end-->
<!-- 底部--star -->
<div class="footer fixed_bottom">
    <span>浙ICP备09096251号-3</span>
</div>
<!-- 底部--end -->
</body>
</html>
<script type="text/javascript" src="/cloud/main/js/ajax.js"></script>
<%--<script type="text/javascript" src="/cloud/js/uc-min.js"></script>--%>
<link href="/css/confirm-min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/js/confirm-min.js"></script>




