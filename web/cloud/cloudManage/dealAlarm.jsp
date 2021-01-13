<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hzxx
  Date: 2015-06-23
  Time: 10:18
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

<h2 style="text-align: center;padding-bottom: 20px">
    <s:text name="alarm_cloud_management"/>
</h2>

<form id="alarmDealForm">
    <input type="hidden" name="alarmPo.id" value="${alarmPo.id}"/>
    <input type="hidden" name="alarmPo.userId" value="${alarmPo.userId}"/>
    <table class="edit" align="center">
        <tbody>
        <tr>
            <td><s:text name="mac_address"/></td>
            <td><input type="text" name="alarmPo.mac"
                       value="${alarmPo.mac}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="time_begin"/></td>
            <td><input type="text" name="alarmPo.beginDate"
                       value="${alarmPo.beginDate}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="time_end"/></td>
            <td><input type="text" name="alarmPo.endDate"
                       value="${alarmPo.endDate}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="alarm_photo"/></td>
            <td><input type="text" name="alarmPo.picCapacity" id="picCapacity"
                       onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                       onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"
                       value="${alarmPo.picCapacity}"/></td>
            <td><s:text name="alarm_number"/></td>
        </tr>
        <tr>
            <td><s:text name="alarm_text"/></td>
            <td><input type="text" name="alarmPo.msgCapacity" id="msgCapacity"
                       onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                       onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"
                       value="${alarmPo.msgCapacity}"/></td>
            <td><s:text name="alarm_number"/></td>
        </tr>

        <tr>
            <td colspan="3" class="operation" style="padding: 10px 0">

                <input onclick="submitAlarmForm();" class="btn bg_000" type="button"
                       style=" padding: 5px 30px" value="<s:text name='cloud_ok'/>"/>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/flip_window.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/setting-min.js"></script>
