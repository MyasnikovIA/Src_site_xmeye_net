<%--
  Created by IntelliJ IDEA.
  User: hzxx
  Date: 2015-06-10
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>云管理</title>
    <link href="/cloud/cloudManage/css/cloud1.css" type="text/css" rel="stylesheet"/>

</head>
<body>
<iframe id="cloud_list" src="/cloudMange/cloud_cloudM_cloudList_cloudManage" frameborder="0"></iframe>
<iframe id="cloud_manage" src="/cloudMange/cloud_cloudM_storeList_cloudManage" frameborder="1"></iframe>
<%--<iframe id="cloud_manage" src="/cloud/cloudManage/storelist.jsp" frameborder="1"></iframe>--%>

</body>
</html>
