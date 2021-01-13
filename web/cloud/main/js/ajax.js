/***
 *@author mrava
 *@version 0.1
 *查询设备状态
 */
var srcon = "/cloud/main/images/online.gif";
var srcof = "/cloud/main/images/offline.gif";
var srcol = "/cloud/main/images/loading.gif";
var lis;//整个设备列表对象
var size;//列表长度
var sling = 30;//一次查询多少个设备
var count;//查询计数器
$(document).ready(function () {
    zd_refresh();
    timeInt(2, 12)
});

/**
 * 手动刷新设备在线状态.
 */
function sd_refresh() {
    lis = $(".viewport li");
    size = lis.size();
    $(".viewport_img").attr("src", srcol);
    lis.attr("status", "0");
    count = 0;
    execute();
    timeInt(1, 4);
}
/**
 * 加载自动刷新设备状态。
 */
function zd_refresh() {
    lis = $(".viewport li[status=0]");
    size = lis.size();
    lis.children("img").attr("src", srcol);
    count = 0;
    execute();
}
/**
 * 定时刷新
 * @param t
 * @param n
 */
function timeInt(t, n) {
    var ms = 1000;
    var timInterval = window.setInterval(function () {
        zd_refresh();
    }, ms * t);
    window.setTimeout(function () {
        window.clearInterval(timInterval);
    }, ms * n);
}

/**
 * 刷新设备执行函数。
 * @param boolean
 * @param size
 */
function execute() {
    var macs = "";
    var sizeDel = size / sling;
    if (size <= sling) {
        lis.each(function (i) {
            macs += $(this).attr("id") + "**";//收集刷新失败的设备mac地址
        })
    }
    else {
        for (var j = count * sling; j < count * sling + sling; j++) {
            if (j < size)
                macs += lis.eq(j).attr("id") + "**";//收集所有设备mac地址
        }
    }
    if (count < sizeDel)
        ajaxJQUERY('', macs);
    count++;
}
/**
 * 异步获取设备状态,自动检查一下刷新多少个设备。
 * @param rul 访问url地址
 * @param data 按规则排好的地址格式数据
 */
function ajaxJQUERY(rul, data) {
    $.ajax({
        type: "POST",
        url: "/cloud_device_status_null",
        data: 'webMac=' + data,
        success: function (msg) {
            $.each($.parseJSON(msg), function (idx, item) {
                var temp = $('#' + item.mac)
                temp.attr('status', item.status);
                if (item.status == 1)
                    temp.children('img').attr('src', srcon);
                else temp.children('img').attr('src', srcof);
            })
            execute();
        }
    });
}
/**
 * 单个设备刷新状态
 * @param rul
 * @param data
 */
function ajaxJQUERYSIGN(rul, data) {
    $.ajax({
        type: "POST",
        url: "/cloud_device_status_null",
        data: 'webMac=' + data,
        success: function (msg) {
            $.each($.parseJSON(msg), function (idx, item) {
                var temp = $('#' + item.mac)
                temp.attr('status', item.status);
                if (item.status == 1)
                    temp.children('img').attr('src', srcon);
                else temp.children('img').attr('src', srcof);
            })
        }
    });
}
/**
 * 对框架内部js接口提供添加方法
 * @param mac
 * @param name
 * @param username
 * @param password
 */
function addMacAjax(mac, name, username, password) {
    alert(11111)
    var li = '<li id="' + mac + '" status="1"  /* data="/cloud/video/index.jsp?mac=' + mac + '&username=' + username + '&password=' + password + '"*/ >'
        + '<span>' + name + '</span>' +
        '<img class="viewport_img" src="/cloud/main/images/online.gif"></li>'
    $('.viewport ul').append(li);

    //ajaxJQUERYSIGN('', mac + '**');
}
/**
 * 对框架内部js接口提供删除方法
 * @param mac
 */
function deleteMacAjax(mac) {
    $('#' + mac).remove();
}
/**
 * 对框架内部js接口提供修改方法
 * @param mac
 * @param name
 */
function editMacName(mac, name) {
    $('#' + mac).children('span').html(name);
}