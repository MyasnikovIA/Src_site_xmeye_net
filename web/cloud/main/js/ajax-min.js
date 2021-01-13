var srcon = "/cloud/main/images/online.gif";
var srcof = "/cloud/main/images/offline.gif";
var srcol = "/cloud/main/images/loading.gif";
var lis;
var size;
var sling = 30;
var count;
$(document).ready(function () {
    zd_refresh();
    timeInt(2, 12)
});
function sd_refresh() {
    lis = $(".viewport li");
    size = lis.size();
    $(".viewport_img").attr("src", srcol);
    lis.attr("status", "0");
    count = 0;
    execute();
    timeInt(1, 3)
}
function zd_refresh() {
    lis = $(".viewport li[data-status=0]");
    size = lis.size();
    lis.children("img").attr("src", srcol);
    count = 0;
    execute()
}
function timeInt(c, d) {
    var b = 1000;
    var a = window.setInterval(function () {
        zd_refresh()
    }, b * c);
    window.setTimeout(function () {
        window.clearInterval(a)
    }, b * d)
}
function execute() {
    var b = "";
    var c = size / sling;
    if (size <= sling) {
        lis.each(function (d) {
            b += $(this).attr("id") + "**"
        })
    } else {
        for (var a = count * sling; a < count * sling + sling; a++) {
            if (a < size) {
                b += lis.eq(a).attr("id") + "**"
            }
        }
    }
    if (count < c) {
        ajaxJQUERY("", b)
    }
    count++
}
function ajaxJQUERY(b, a) {
    $.ajax({
        type: "POST", url: "/status", data: "webMac=" + a, success: function (c) {
            $.each($.parseJSON(c), function (d, f) {
                var e = $("#" + f.uuid);
                e.attr("data-status", f.status);
                if (f.status == 1) {
                    e.find("img").attr("src", srcon)
                } else {
                    //e.find("img").attr("src", srcon)
                    e.find("img").attr("src", srcof)
                }
            });
            execute()
        }
    })
}
function ajaxJQUERYSIGN(b, a) {
    $.ajax({
        type: "POST", url: "/status", data: "webMac=" + a, success: function (c) {
            $.each($.parseJSON(c), function (d, f) {
                var e = $("#" + f.uuid);
                e.attr("data-status", f.status);
                if (f.status == 1) {
                    e.find("img").attr("src", srcon)
                } else {
                    e.children("img").attr("src", srcof)
                }
            })
        }
    })
}
function addMacAjax(e, c, d, b) {
    var a = '<li id="' + e + '" status="0" data-href="/cloud/video/index.jsp?mac=' + e + "&username=" + d + "&password=" + b + '"><span>' + c + '</span><img class="viewport_img" src="' + srcol + '"></li>';
    $(".viewport ul").append(a);
    ajaxJQUERYSIGN("", e + "**")
}
function deleteMacAjax(a) {
    $("#" + a).remove()
}
function editMacName(b, a) {
    $("#" + b).children("span").html(a)
};
