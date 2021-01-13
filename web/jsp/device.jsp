<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=utf-8"%>
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

<input type="hidden" id="Message_Ok" value="确定" >
<input type="hidden" id="Message_Cancel" value="取消">
<input type="hidden" id="Message_Title" value="提示">
<input type="hidden" id="quxiao" value="全部勾选">
<input type="hidden" id="giveUp" value="取消">
<input type="hidden" id="MacError" value="uuid地址不对">
<input type="hidden" id="tianjia" value="添加"/>
<div class="content_box">
    <div class="content_box_header">
        <span style="margin-left: 55px;" class="fl">设备管理</span>

        <div style="margin-right: 55px;margin-left: 10px;cursor: pointer" class="fr add_device">
            添加
        </div>
        <span class="icon_addFac add_device fr"></span>
    </div>
    <table class="content_box_table">
        <thead>
        <th>
            序号
        </th>
        <th>
            设备序列号
        </th>
        <th>
            设备名称
        </th>
        <th>
            设备用户名
        </th>
        <th>
            操作
        </th>
        </thead>
        <tbody>
                 <s:iterator value="#session.devicelist" var="device">
                 <td style="display:none;" class="dev_id">${device.id}</td>
                 <td><input class="input_checkbox height_30" type="checkbox" style="display: none;"><span
                         class="td_index"></span></td>
                 <td class="td_bg_1">${device.uuid}</td>
                 <td class="td_bg">${device.nickname}</td>
                 <td class="td_bg">${device.devicename}</td>
                 <td>
                     <span class="delete icon_delete" onclick="firm('${device.uuid}','${device.id}',this);"></span>
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
                        <td width="20%">设备序列号</td>
                        <td width="40%"><input type="text" name="device.uuid" class="f_number " onblur="blackExit();">
                        </td>
                        <td width="40%" class="error" id="mac_error"></td>
                    </tr>
                    <tr>
                        <td>设备用户名</td>
                        <td><input type="text" name="device.username" class="f_uname" value="admin"></td>
                        <td class="error">(设备用户名默认为admin)</td>
                    </tr>
                    <tr>
                        <td>设备名称</td>
                        <td><input type="text" name="device.nickname" class="f_name" id="deviceName" onblur="nameExit();">
                        </td>
                        <td class="error" id="name_error"></td>
                    </tr>
                    <tr>
                        <td>设备密码</td>
                        <td><input type="password" name="device.password" class="f_uname1"></td>
                        <td class="error">(设备密码默认为空)</td>
                    </tr>
                    </tbody>
                </table>
            </form>


            <div class="add_">
                <span class="btn bg_b3b3b3 add_ok">确定</span>
                <span class="btn bg_b3b3b3 add_Cancel">取消</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript" src="/cloud/main/js/facility_manage.js"></script>
<script type="text/javascript" src="/js/codestatus.js"></script>
<script type="text/javascript">
    function blackExit() {
        var mac = $(".f_number").val();
        if (mac == "") {
            $("#mac_error").text("设备uuid不能为空");
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
            $("#name_error").text("设备名不能为空");
        }
    }

    function firm(uuid, id, evn) {
        var tips = "确定删除？";
        $.MsgBox.Confirm(Message_title, tips, "确定", "取消", true, function () {
            $.get('/delete?id=' + id + '&device.uuid=' + uuid);
            $(evn).parent().parent().remove();
            idex();
            window.parent.deleteMacAjax(uuid);
        })
    }
</script>