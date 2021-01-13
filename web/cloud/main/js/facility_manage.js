/**
 * Created by yuannianqing on 2015-02-09.
 */


var Message_Ok = $("#Message_Ok").val();
var Message_Cancel = $("#Message_Cancel").val();
var Message_title = $("#Message_Title").val();
$(function () {
    allChoice();
    addFacility();
    dele();
    update();
});
//$(document).ready--end

function update() {
    var oldvalue, id, mac, name, username, uuid;
    $(".content_box_table").delegate(".td_bg", "dblclick", function () {
        oldvalue = $(this).text();
        var input = "<input class='update_input' type='text ' value='" + oldvalue + "'/>";
        id = $(this).parent().find("td").eq(0).text();
        uuid = $(this).parent().find("td").eq(2).text();
        mac = $(this).parent().find("td").eq(2).text();
        name = $(this).parent().find("td").eq(3).text();
        username = $(this).parent().find("td").eq(4).text();
        $(this).html(input);
        $(".td_bg input").focus();
    });
    $(".content_box_table").delegate(".td_bg input", "blur", function () {
        var newvalue = $(this).val();
        if (newvalue == null || newvalue == "" || newvalue == oldvalue) {
            newvalue = oldvalue;
        } else {
            if (oldvalue == name) {
                $.post('/update', {
                    'device.uuid': uuid,
                    'device.username': username,
                    'device.nickname': newvalue
                });
            } else if (oldvalue == username) {
                $.post('/update', {
                    'device.uuid': uuid,
                    'device.username': newvalue,
                    'device.nickname': name
                });
            }
        }
        $(this).parent().html(newvalue);
        //   alert("oldvalue: " + oldvalue + " name : " + name);
        if (oldvalue == name) {
            window.parent.editMacName(mac, newvalue);
        }


    })


}


//全选
function allChoice() {
    $(".all_select").click(function () {
        if ($(this).prop("checked")) {
            allChoice_yes();
        } else {
            allChoice_no();
        }
    });
    idex()
}
//全部勾选
function allChoice_yes() {
    $(" :checkbox").prop("checked", true);
    $(".center_box_top1  span").text("取消已选");
}
//取消已选
function allChoice_no() {
    $(" :checkbox").removeProp("checked");
    $(".center_box_top1  span").text($('#quxiao').val());
}


//添加设备--star
function addFacility() {
    $(".add_device").click(function () {
        /*添加设备时数据这里清空*/
        $("#addForm").find(".f_number").val('');
        $("#addForm").find(".f_name").val('');
        $("#addForm").find(".f_uname1").val('');
        $("#addForm").find(".f_uname").val('admin');
        $(".fixed_0_0").slideDown(800);
    });
    $(".add_Cancel").click(function () {
        $(".fixed_0_0").slideUp(800);
    });
    $(".add_ok").click(function () {
        $(".fixed_0_0").attr("data", "add_yes");
        $(".fixed_0_0").hide();
        // $(".add_button1").text($("#tianjia").val());
        var device = $("#addForm").serialize();
        var name = $("#deviceName").val();
        if (name == "" || name==null) {
            $.MsgBox.Alert(Message_title, "用户名不能为空", Message_Ok, " ", true);
            return;
        }
        $.ajax({
            type: "post",
            url: '/add',
            data: device,
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.code == 2000) {
                    data = data.data;
                    var mac1 = data.uuid;
                    var message1 = data.msg;
                    var td0 = "<tr><td class='hidden'>" + data.msg + "</td>";
                    var td1 = "<td> <span class='td_index'>" + "</span></td>";
                    var td2 = " <td  class= 'td_bg_1'>" + $(".f_number").val() + "</td >";
                    var td3 = "<td class='td_bg'>" + $(".f_name").val() + "</td>";
                    var td4 = "<td class = 'td_bg' >" + $(".f_uname").val() + "</td>";
                    var td5 = "<td><span class='delete icon_delete'  onclick='firm(" + '"' + data.uuid + '"' + "," + '"' + data.msg + '"' + ",this);'></span></td></tr > ";
                    var text = td0 + td1 + td2 + td3 + td4 + td5;
                    $(".content_box_table tbody:last-child").append(text);
                    idex();
                    window.parent.addMacAjax(data.uuid, data.nickname, data.username, data.password);
                } else {
                    $.MsgBox.Alert(Message_title, codestatus(data.code), Message_Ok, " ", true);
                    //  alert(data.message);
                }
            }
        })

    })

}

//删除设备--star
function dele() {
    //删除已选的设备
    $(".delete_button").click(function () {
        var n = 0;
        var n_check = $(".input_checkbox").length - 1;
        // alert(n_check)
        //为了保证可以删除任意已选设备 必须从后往前开始删除（为了保证在删除的过程中不改变下标）
        for (var i = n_check; i >= 0; i--) {
            if ($(".input_checkbox:eq(" + i + ")").prop("checked")) {
                n++;
                if (n == 1) {
                    //判断是否存在需要删除的设备，如果存在则从第一个删除的时候(实际上是下标最后的)开始二次确定
                    if (confirm("确定要删除已选设备？")) {
                        dele_all(i);
                    } else {
                        allChoice_no();
                        return;
                    }
                } else {
                    dele_all(i);
                }
            }
        }
        allChoice_no();
        idex();
    });
//点击单个删除
    /*   $(".content_box table").delegate("tr td img", "click", function () {
     if (confirm("确定要删除？")) {
     var parent = $(this).parent().parent('tr');
     var t = parent.children(".dev_id");
     alert(t);
     // $(this).parent().parent('tr').remove();
     }
     idex();
     });*/
}
/*function firm(id,evn) {
 if(confirm('<s:text name="device_delete_confirm"/>')){
 //   alert("<s:text name='device_delete_confirm'/>");
 $.get('/cloud_device_delete_null?id='+id);
 $(evn).parent().parent().parent().remove();
 idex();
 }
 }*/
//删除被选中的input所在的tr
function dele_all(i) {
    var tr_i = i + 1;
    var key = ".content_box tr:eq(" + tr_i + ")";
    $(key).remove();
}
//保证每个设备前面的idex随不同操作刷新
function idex() {
    var n = $(".content_box tr").length;
    for (var i = 0; i < n; i++) {
        var classname = ".td_index:eq(" + i + ")";
        $(classname).text(i + 1);
    }
}
//删除设备--end