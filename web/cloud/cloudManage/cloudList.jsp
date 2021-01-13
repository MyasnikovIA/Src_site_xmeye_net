<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hzxx
  Date: 2015-06-10
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>云列表</title>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/cloud/cloudManage/js/flip_window.js"></script>
    <link href="/cloud/cloudManage/css/cloudList.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<table id="cloud_s_a_m" style="">
  <tr><td></td></tr>
    <tr><td class="on"><a href="#" src="/cloudMange/cloud_cloudM_storeList_cloudManage"><s:text name="cloud_store"/></a></td></tr>
    <tr><td><a href="#" src="/cloudMange/cloud_cloudM_alarmList_cloudManage"><s:text name="cloud_alarm"/></a></td></tr>
    <tr><td><a href="#" src="/cloudMange/cloud_cloudM_mediaList_cloudManage"><s:text name="cloud_media"/></a></td></tr>
    <tr><td><a href="#" src="/cloudMange/cloud_cloudM_shareList_cloudManage"><s:text name="cloud_share"/></a></td></tr>
</table>
</body>
</html>
