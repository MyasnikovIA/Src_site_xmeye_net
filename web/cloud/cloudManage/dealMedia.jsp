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

        label {
            margin-right: 15px
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
    <s:text name="media_cloud_management"/>
</h2>

<form id="mediaDealForm" method="post">
    <table class="edit" align="center">
        <tr>
            <td><s:text name="mac_address"/></td>
            <td><input type="text" name="mediaPo.mac"
                       value="${mediaPo.mac}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="time_begin"/></td>
            <td><input type="text" name="mediaPo.beginDate"
                       value="${mediaPo.beginDate}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="time_end"/></td>
            <td><input type="text" name="mediaPo.enddate"
                       value="${mediaPo.enddate}"
                       readonly="readonly"/></td>
            <td></td>
        </tr>
        <tr>
            <td><s:text name="open_yes_no"/></td>
            <td>
                <label class="fl curpoin"><input name="mediaPo.isOpen" type="radio" value="1"/>Yes</label>
                <label class="fl curpoin"><input name="mediaPo.isOpen" type="radio" value="0"/>No </label>

                <%--     <input class="fl" type="radio" value="1">Yes
                 <input class="fl" type="radio" value="1">No
                 <s:radio list="#{1:'Yes',0:'No'}" name="mediaPo.isOpen" value="0"></s:radio>--%>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3" class="operation" style="padding: 10px 0">

                <input onclick="submitMedaForm();" class="btn bg_000" type="button"
                       style="padding: 5px 30px" value="<s:text name='cloud_ok'/>"/>
            </td>
        </tr>
        <input type="hidden" name="mediaPo.id" value="${mediaPo.id}"/>
        <input type="hidden" name="mediaPo.userId" value="${mediaPo.userId}"/>
    </table>
</form>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/flip_window.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/setting-min.js"></script>