<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hzxx
  Date: 2015-06-10
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="/cloud/cloudManage/css/table.css" type="text/css" rel="stylesheet">
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">

<div class="content_box_header">
    <span style="margin-left: 55px;" class="fl"> <s:text name="cloud_manager"/></span>

    <ul id="progressBox" class="fr progressBox">
        <li><%--空间使用情况:--%></li>
        <li>
            <div id="progress" class="progress">
                <span id="useEd" class="useEd"></span>
            </div>
        </li>
        <li><span class="useSpace">0G</span>/<span class="allSpace">0G</span></li>
    </ul>
</div>
<table border="0" cellspacing="1" cellpadding="0">
    <thead>
    <tr>
        <th><s:text name="mac_address"/></th>
        <th><s:text name="store_size"/></th>
        <th><s:text name="time_begin"/></th>
        <th><s:text name="time_end"/></th>
        <th><s:text name="cloud_operat"/></th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="storePoList" var="deviceStore">
        <tr>
            <td>${deviceStore.mac}</td>
            <td>${deviceStore.space}</td>
            <td>${deviceStore.beginDate}</td>
            <td>${deviceStore.endDate}</td>
            <td>
                <span class="update  icon_edit"
                      data-src="/cloudMange/cloud_cloudM_dealStore_cloudManage?mac=${deviceStore.mac}"></span>
                <span class="delete icon_delete" onclick="firm('${deviceStore.mac}',this);"></span>
            </td>
        </tr>
    </s:iterator>
    </tbody>
</table>
<div><span class="del"></span></div>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript" src="/cloud/js/alert-min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/flip_window-min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/setting-min.js"></script>
<script type="text/javascript">
    progress(${totalSpace}, ${usedSpace}, "G");
    function firm(mac, even) {
        // $.MsgBox.Alert("消息", "测试", true);
        $.MsgBox.Confirm(Message_title, "<s:text name="device_delete_confirm"/>", Message_Ok, Message_Cancel, true, function () {
            $.getJSON('/cloudMange/cloud_cloudM_deleteStore_null?mac=' + mac,
                    function (data) {
                        if (data.status == 1) {
                            $(even).parent().parent().remove();
                        } else if (data.status == 2) {

                        } else if (data.status == 3) {

                        }
                        $.MsgBox.Alert(Message_title, data.message, Message_Ok, " ", true);
                    });
        });
    }
</script>
