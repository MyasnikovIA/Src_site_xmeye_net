/**
 * Created by yuannianqing on 2015-03-17.
 */
var srcon = "images/online.gif";
var srcof = "images/offline.gif";
var srcol= "images/loading.gif";
$(function () {
    zd_refresh();
})

//手动刷新
function sd_refresh() {
    var size = $(".viewport_img").size();
    alert("手动刷新" );
    $(".viewport_img").attr("src",srcol);
    $(".viewport li").attr("start","0");
    var macss = "";
    for (var ai = 0; ai < size; ai++) {
        macss += $(".viewport li:eq(" + ai + ")").attr("id") + ";";//收集所有设备mac地址
    }
    alert(macss)
    for (var ai = 0; ai < size; ai++) {

        ajax(ai, srcon, srcof, macss)
    }
}

//每隔3秒钟自动刷新
self.setInterval("zd_refresh()", 3000);
function zd_refresh() {
    var size = $(".viewport_img").size();
   alert("自动刷新");
    var macs = "";
    for (var i = 0; i < size; i++) {
        if ($(".viewport li:eq(" + i + ")").attr("start") == 0) {
            macs += $(".viewport li:eq(" + i + ")").attr("id") + ";";//收集刷新失败的设备mac地址
        }
    }
    alert(macs)
    for (var i = 0; i < size; i++) {
        if ($(".viewport li:eq(" + i + ")").attr("start") == 0) {//连接刷新失败的设备

            ajax(i, srcon, srcof, macs);
        }
    }
}

function request(method, url, macs, callback, isAsy) {
    var xmlhttp;
    if (isAsy == undefined) {
        isAsy = true;
    }
    if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState != 4) {
            return;
        }
        if (xmlhttp.status != 200) {
            if (callback.fail) {
                callback.fail();
            }
            return;
        }
        if (!callback.success) {
            return;
        }
        if (callback.type == "plain") {
            callback.success(xmlhttp.responseText);
        } else if (callback.type == "xml") {
            callback.success(xmlhttp.responseXML);
        } else {
            callback.success(xmlhttp.responseText);
        }
    };
    try {
        if (method.toLowerCase() == "get") {
            xmlhttp.open("get", url + "?" + macs, isAsy);
            xmlhttp.send(null);
        } else {
            xmlhttp.open("post", url, true);
            xmlhttp.setRequestHeader("Content-Type",
                "application/x-www-form-urlencoded");
            xmlhttp.send(macs);
        }
    } catch (e) {
        if (callback.fail) {
            callback.fail();
        }
    }
}

var data = [
    {"mac": "avc1", "stat": "1"},
    {"mac": "avc2", "stat": "0"},
    {"mac": "avc3", "stat": "1"},
    {"mac": "avc4", "stat": "0"},
    {"mac": "avc5", "stat": "1"},
    {"mac": "avc6", "stat": "0"},
    {"mac": "avc7", "stat": "1"},
    {"mac": "avc8", "stat": "0"}
];

function ajax(index, srcon, srcof, macs) {
    var cls = $(".viewport_img:eq(" + index + ")");
    //  alert(cls.attr("src"))
    var ids = cls.parent().attr("id");
    //alert(ids)
    var callback = {
        success: function (res) {
            for (var i2 = 0; i2 < data.length; i2++) {
                if (data[i2].mac == ids) {
                    if (data[i2].stat == 1) {
                        cls.attr("src", srcon);
                        cls.parent().attr("start", "1")
                    } else if (data[i2].stat == 0) {
                        cls.attr("src", srcof);
                        cls.parent().attr("start", "0")
                    }
                    return;
                } else {
                    cls.attr("src", srcof);
                }
            }
        },
        fail: function () {
            //alert(fail)
        }
    };
    request("post", "1.xml", macs, callback);
}
