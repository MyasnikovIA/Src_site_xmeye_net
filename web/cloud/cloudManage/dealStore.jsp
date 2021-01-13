<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hzxx
  Date: 2015-06-23
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="/cloud/cloudManage/css/table.css" type="text/css" rel="stylesheet"/>

    <style type="text/css">
        td {
            border: none;
        }

        td:last-child {
            text-align: left;
        }

    </style>
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">
<h2 style="text-align: center;padding-bottom: 26px">
    <s:text name="store_cloud_management"/>
</h2>

<form id="storeDealForm" method="post">
    <input type="hidden" name="storePo.id" value="${storePo.id}"/>
    <input type="hidden" name="storePo.userId" value="${storePo.userId}"/>
    <table class="edit" align="center">
        <tr>
            <td><s:text name="mac_address"/></td>
            <td><input type="text" name="storePo.mac"
                       value="${storePo.mac}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="time_begin"/></td>
            <td><input type="text" name="storePo.beginDate"
                       value="${storePo.beginDate}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="time_end"/></td>
            <td><input type="text" name="storePo.endDate"
                       value="${storePo.endDate}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="store_size"/></td>
            <td><input type="text" name="storePo.space" id="space"
                       onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                       onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"
                       value="${storePo.space}"/>
            <td>G</td>
            </td>
        </tr>
        <tr>
            <td><s:text name="store_loop"/></td>
            <td><input type="text" name="storePo.loopDay" id="loopDay" onblur="ageNumber(this.value);"
                       onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                       onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"
                       value="${storePo.loopDay}"/></td>
            <td><s:text name="store_day"/></td>
        </tr>

        <tr>
            <td colspan="3" class="operation" style="padding: 10px 0">

                <input onclick='submitStoreForm();' class="btn bg_000" type="button"
                       style=" padding: 5px 30px"
                       value="<s:text name='cloud_ok'/>"/>
        </tr>
    </table>
</form>

</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/flip_window.js"></script>
<script type="text/javascript" src="/cloud/js/alert-min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/setting-min.js"></script>