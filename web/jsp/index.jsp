<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");%>

<html>
<head>
<title></title>
    <link rel="icon" type="image/png" href="/favicon.ico">
    <link href="/cloud/main/css/style-min.css" type="text/css" rel="stylesheet">
    <link href="/css/confirm-min.css" type="text/css" rel="stylesheet">
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
            <td width="140px" >
                <font size="5" color="#a52a2a">L</font>
                <font size="4" color="#bdb76b">O</font>
                <font size="5" color="#a52a2a">G</font>
                <font size="4" color="#bdb76b">O</font>
            </td>
            <td style="width: auto">
                <div id="menuBox">
                    <ul class="menuBox">
                        <li id="mydecive" class="on"><a href="javascript:showDev()">我的设备</a></li>
                        <li><a data-href="/namemesage">个人信息</a></li>
                        <li><a data-href="/list">设备管理</a></li>
                       <%-- <li><a data-href="/select">授权系统</a></li>--%>
                    </ul>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <div style="position: absolute;right: 30px;top: 0;width: auto;display: inline-block">
        <div id="userInfo" class="layout_right fr">
            <span class="userExit fr" onclick="window.location.href='/userExit'" title="退出">              </span>
            <b class="fr">|</b>

            <div id="inforBox" class="fr inforBox" title="个人信息" onclick="showpersonInf(this)" data-href="/namemesage">
                <span style="display: inline-block" id="name"><a>${sessionScope.get("username")}</a></span>
            </div>
        </div>
    </div>

</div>
<!-- 头部--end -->

<!-- 中间--star -->
<div class="center_box" style="height: 620px;">
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
                <div class="viewport">
                    <div class="refresh" onclick="sd_refresh()">
                        刷新状态
                    </div>
                    <s:action name="list"></s:action>
                    <ul class="deviceList" style="height: 560px;">
                        <s:iterator value="#session.devicelist" var="device">
                            <li id="${device.uuid}"   data-status="0"
                                data-href="/cloud/video/index.jsp?mac=${device.uuid}&username=${device.username}&password=${device.password}">
                                <span>${device.nickname}</span>
                                <img class="viewport_img" src="/cloud/main/images/online.gif">
                            </li>
                        </s:iterator>
                    </ul>
                </div>
                <div class="cloudShare">
                    <ul>
                        <li id="cloud_store" class="v_li_back"
                            data-href="/cloudMange/cloud_cloudM_storeList_cloudManage">
                            云存储
                        </li>
                        <li id="cloud_alarm" data-href="/cloudMange/cloud_cloudM_alarmList_cloudManage">
                            云报警
                        </li>
                        <li id="cloud_media" data-href="/cloudMange/cloud_cloudM_mediaList_cloudManage">
                            流媒体
                        </li>
                        <li id="cloud_share" data-href="/cloudMange/cloud_cloudM_shareList_cloudManage"
                            data-activated="1">云共享
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 左边设备列表区域end -->
    <!-- 右边播放区域star -->
    <div class="center_right" style="width: 1222px; height: 620px; overflow: hidden;">
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
<div class="footer">
    <span>Client的Demo 1.0</span>
</div>
<!-- 底部--end -->


<script type="text/javascript" src="/cloud/main/js/ajax-min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
</body>
</html>