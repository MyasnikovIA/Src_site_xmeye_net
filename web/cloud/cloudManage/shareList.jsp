<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hzxx
  Date: 2015-06-10
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="/cloud/cloudManage/css/table.css" type="text/css" rel="stylesheet">
    <style>
        input[type="text"] {
            width: 200px;
            height: 30px;
            padding-left: 10px;
            line-height: 30px;
            margin-right: 15px;
            font-size: 20px;
            color: #808080
        }

        select {
            width: 17%;
            height: 30px;
            margin-right: 15px;
            font-size: 16px;
        }

        select option {
            height: 30px;
            line-height: 30px;
        }

        input[type="checkbox"] {
            margin-left: 10px;
            height: 15px;
            cursor: pointer;
            width: 15px;
        }

        a {
            text-decoration: none;
        }

        table tr th {
            border-top: dotted 1px #e0e0e0;
        }

        .checkUser {
            float: right;
            margin-right: 20px;
            font-size: 16px;
            color: red;
        }
    </style>
</head>
<body>

<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">

<div class="content_box_header" style="color: #666">
    <form method="post" id="shareAdd">
        <span style="margin-left:20px;"><s:text name="cloud_username"/>：</span>
        <input type="text" name="sharePo.userName2" value="" id="userName2" onblur="checkUserName2();"/>
        <s:select label="Mac地址" name="sharePo.mac" list="deviceMyPoList" listKey="mac" listValue="mac"
                  headervalue="请选择"/>
        <input type="checkbox" id="sharePo_store" name="sharePo.store" value="1"/>
        <label for="sharePo_store"><s:text name="cloud_store"/></label>
        <input type="checkbox" id="sharePo_alarm" name="sharePo.alarm" value="1"/>
        <label for="sharePo_alarm"><s:text name="cloud_alarm"/></label>
        <input type="checkbox" id="sharePo_media" name="sharePo.media" value="1"/>
        <label for="sharePo_media"><s:text name="cloud_media"/></label>
        <input type="button" class="btn bg_b3b3b3" value="<s:text name='cloud_ok'/>" onclick="submitShareForm();"/>

        <div class="checkUser"></div>
    </form>
</div>
<table border="0" cellspacing="1" cellpadding="0" id="shareTable">
    <thead>
    <tr>
        <th><s:text name="mac_address"/></th>
        <th><s:text name="cloud_username"/></th>
        <th><s:text name="cloud_store"/></th>
        <th><s:text name="cloud_alarm"/></th>
        <th><s:text name="cloud_media"/></th>
        <th><s:text name="cloud_operat"/></th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="sharePoList" var="deviceShare">
        <tr>
            <td>${deviceShare.mac}</td>
            <td>${deviceShare.userName2}</td>
            <td><s:if test='#deviceShare.store==1'>Yes</s:if>
                <s:else>No</s:else>
            </td>
            <td><s:if test='#deviceShare.alarm==1'>Yes</s:if>
                <s:else>No</s:else>
            </td>
            <td><s:if test='#deviceShare.media==1'>Yes</s:if>
                <s:else>No</s:else>
            </td>
            <td>
                <span class="delete icon_delete" onclick="firmShare('${deviceShare.id}',this);"></span>

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
<script type="text/javascript" src="/cloud/cloudManage/js/setting-min.js"></script>
<script>
    function firmShare(id, even) {
        $.MsgBox.Confirm(Message_title, "<s:text name="device_delete_confirm"/>", Message_Ok, Message_Cancel, true, function () {
            $.getJSON('/cloudMange/cloud_cloudM_deleteShare_null?id=' + id,
                    function (data) {
                        if (data.status == 1) {
                            $(even).parent().parent().remove();
                        } else if (data.status == 2) {

                        } else if (data.status == 3) {

                        }
                        $.MsgBox.Alert("消息", data.message, "确定", " ", true);
                    });
        })
    }
    function checkUserName2() {
        var username2 = $("#userName2").val();
        $.getJSON("/cloudMange/cloud_cloudM_checkUserName_null?userName2=" + username2,
                function (data) {
                    $.MsgBox.Alert(Message_title, data.message, Message_Ok, " ", true);
                }
        );
    }
</script>
