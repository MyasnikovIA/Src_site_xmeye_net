<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="/cloud/main/css/facility_manage.css" type="text/css" rel="stylesheet">
    <style>
        .hidden {
            display: none !important;
        }
    </style>
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">
<input type="hidden" id="quxiao" value="全部勾选">
<input type="hidden" id="giveUp" value="<s:text name='Cancel'/>">
<input type="hidden" id="MacError" value="<s:text name="tips_1380"/>">
<input type="hidden" id="tianjia" value="<s:text name='pub_add'/>"/>

<div class="content_box">
    <div class="content_box_header">
        <span style="margin-left: 55px;" class="fl"><s:text name="device_manage"/></span>

        <div style="margin-right: 55px;margin-left: 10px;cursor: pointer" class="fr add_device">
            <s:text name="pub_add"/>
        </div>
        <span class="icon_addFac add_device fr"></span>
    </div>
    <table class="content_box_table">
        <thead>
        <th>
            <s:text name="device_index"/>
        </th>
        <th>
            <s:text name="device_mac"/>
        </th>
        <th>
            <s:text name="device_name"/>
        </th>
        <th>
            <s:text name="device_username"/>
        </th>
        <th>
            <s:text name="pub_operation"/>
        </th>
        </thead>
        <tbody>
        <s:iterator value="deviceMyPos" var="device">
            <tr>
                <td style="display:none;" class="dev_id">${device.id}</td>
                <td><input class="input_checkbox height_30" type="checkbox" style="display: none;"><span
                        class="td_index"></span></td>
                <td class="td_bg_1">${device.mac}</td>
                <td class="td_bg">${device.name}</td>
                <td class="td_bg">${device.username}</td>
                <td>
                    <span class="edit hide icon_edit" onclick="firm('${device.mac}','${device.id}',this);"></span>

                    <span class="delete icon_delete" onclick="firm('${device.mac}','${device.id}',this);"></span>

                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
    <div style="height: 50px;"></div>
    <div class="fixed_0_0">
        <div class="add_fac">
            <form id="addForm">
                <table>
                    <tbody>
                    <tr>
                        <td width="20%"><s:text name="device_mac"/></td>
                        <td width="40%"><input type="text" name="deviceMy.mac" class="f_number" onblur="blackExit();">
                        </td>
                        <td width="40%" class="error" id="mac_error"></td>
                    </tr>
                    <tr>
                        <td><s:text name="device_name"/></td>
                        <td><input type="text" name="deviceMy.name" class="f_name" id="deviceName" onblur="nameExit();">
                        </td>
                        <td class="error" id="name_error"></td>
                    </tr>
                    <tr>
                        <td><s:text name="device_username"/></td>
                        <td><input type="text" name="deviceMy.username" class="f_uname" value="admin"></td>
                        <td class="error">(<s:text name="device_username_tip"/>)</td>
                    </tr>
                    <tr>
                        <td><s:text name="device_password"/></td>
                        <td><input type="password" name="deviceMy.password" class="f_uname"></td>
                        <td class="error">(<s:text name="device_password_tip"/>)</td>
                    </tr>

                    </tbody>
                </table>
            </form>

            <div class="add_">
                <span class="btn bg_b3b3b3 add_ok"><s:text name="pub_ok"/></span>
                <span class="btn bg_b3b3b3 add_Cancel"><s:text name="Cancel"/></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript" src="/cloud/main/js/facility_manage-min.js"></script>
<script type="text/javascript">
    function blackExit() {
        var mac = $(".f_number").val();
        if (mac == "") {
            $("#mac_error").text("<s:text name='device_period_error_id_null'/>");
        } else if (mac.length != 16) {
            $("#mac_error").text($("#MacError").val());
        } else {
            $("#mac_error").text("");
            $.getJSON('/cloud_device_blackexit_null?mac=' + mac,
                    function (data) {
                        if (data.status == 1 || data.status == 2 || data.status == 4 || data.status == 5 || data.status == 6 || data.status == 7) {
                            $("#mac_error").css('color', '#ff0000');
                            $("#mac_error").text(data.message);
                        }
                    });
        }
    }
    function nameExit() {
        var name = $("#deviceName").val();
        if (name == null || name == "") {
            $("#name_error").text("<s:text name='device_eidt_name_null'/>");
        }
    }

    function firm(mac, id, evn) {
        var tips = "<s:text name="device_delete_confirm"/>";
        $.MsgBox.Confirm(Message_title, tips, Message_Ok, Message_Cancel, true, function () {
            $.get('/cloud_device_delete_null?id=' + id + '&mac=' + mac);
            $(evn).parent().parent().remove();
            idex();
            window.parent.deleteMacAjax(mac);

        })
    }
</script>