var Parent_ = false;
var dragging = false;
var iX, iY;
var Message_Ok = $("#Message_Ok").val();
var Message_Cancel = $("#Message_Cancel").val();
var Message_title = $("#Message_Title").val();
$(function () {
    $(".update").on("click", function () {
        alert_box("700", "405", $(this).attr("data-src"))
    })
});
function progress(a, d, e) {
    var b = $("#progress").width();
    var c = b * d / a;
    $("#progressBox .useSpace").text(d + e);
    $("#useEd").animate({width: c}, "slow");
    $("#progressBox .allSpace").text(a + e)
}
function submitStoreForm() {
    var c = $("#storeDealForm").serialize();
    var a = $("#space").val();
    var b = $("#loopDay").val();
    if (ageNumber(a) && ageNumber(b)) {
        $.getJSON("/cloudMange/cloud_cloudM_editStore_null", c, function (d) {
            alert_(Message_title, d.message, Message_Ok);
            if (d.status == 1) {
                hidden_bg();
                refresh("#cloud_store");
            }
        })
    }
}
function submitAlarmForm() {
    var b = $("#alarmDealForm").serialize();
    var c = $("#msgCapacity").val();
    var a = $("#picCapacity").val();
    if (ageNumber(c) && ageNumber(a)) {
        $.getJSON("/cloudMange/cloud_cloudM_editAlarm_null", b, function (d) {
            alert_(Message_title, d.message, Message_Ok);
            //alert(d.status)
            if (d.status == 1) {
                hidden_bg();
                refresh("#cloud_alarm")
            }
        })
    }
}
function submitMedaForm() {
    var a = $("#mediaDealForm").serialize();
    $.getJSON("/cloudMange/cloud_cloudM_editMedia_null", a, function (b) {
        alert_(Message_title, b.message, Message_Ok);
        if (b.status == 1) {
            hidden_bg();
            refresh("#cloud_media")
        }
    })
}
function submitShareForm() {
    var a = $("#shareAdd").serialize();
    $.getJSON("/cloudMange/cloud_cloudM_addShare_null", a, function (b) {
        if (b.status == 1) {
            alert_(Message_title, b.message, Message_Ok);
            if (b.mac == "save") {
                if (b.sharePo.store == 1) {
                    var c = "YES"
                } else {
                    var c = "NO"
                }
                if (b.sharePo.alarm == 1) {
                    var e = "YES"
                } else {
                    var e = "NO"
                }
                if (b.sharePo.media == 1) {
                    var h = "YES"
                } else {
                    var h = "NO"
                }
                var l = "<tr><td>" + b.sharePo.mac + "</td>";
                var k = "<td>" + b.sharePo.userName2 + "</td>";
                var j = "<td>" + c + "</td>";
                var i = "<td>" + e + "</td>";
                var g = "<td>" + h + "</td>";
                var f = "<td> <span class='delete icon_delete'  onclick='firmShare(\"" + b.sharePo.id + "\",this);'</span></td></tr>";
                var d = l + k + j + i + g + f;
                $("#shareTable tbody").append(d)
            } else {
                if (b.mac == "update") {
                    refresh("#cloud_share")
                }
            }
        } else {
            alert_(Message_title, b.message, Message_Ok)
        }
    })
}
function alert_(e, a, f) {
    alert_info(e, a, f, true)
}
function goBack() {
    window.history.back()
}
function refresh(a) {
    $("body", parent.document).find(a).click();
}
function alert_info(j, d, c, a) {
    Parent_ = a;
    dragging = false;
    var b = "";
    b += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + j + "</span>";
    b += '<a id="mb_ico" onclick=$("#mb_box,#mb_con").remove() >x</a><div id="mb_msg">' + d + '</div><div id="mb_btnbox">';
    b += '<input id="mb_btn_ok"  onclick=$("#mb_box,#mb_con").remove();  type="button" value=' + c + ">";
    b += "</div></div>";
    a ? $("body:eq(0)", parent.document).append(b) : $("body:eq(0)").append(b);
    mouseDown();
    mouseMove();
    mouseUp()
}
function mouseDown() {
    if (Parent_) {
        _parent("#mb_tit").mousedown(function (a) {
            dragging = true;
            iX = a.clientX - _parent("#mb_con").css("left").split("px")[0];
            iY = a.clientY - _parent("#mb_con").css("top").split("px")[0];
            this.setCapture && this.setCapture();
            return false
        })
    } else {
        $("#mb_tit").mousedown(function (a) {
            dragging = true;
            iX = a.clientX - this.offsetLeft;
            iY = a.clientY - this.offsetTop;
            this.setCapture && this.setCapture();
            return false
        })
    }
}
function mouseMove() {
    if (Parent_) {
        parent.document.onmousemove = function (b) {
            if (dragging) {
                var b = b || window.event;
                var a = b.clientX - iX;
                var c = b.clientY - iY;
                _parent("#mb_con").css({left: a + "px", top: c + "px"});
                return false
            }
        }
    } else {
        document.onmousemove = function (b) {
            if (dragging) {
                var b = b || window.event;
                var a = b.clientX - iX;
                var c = b.clientY - iY;
                $("#mb_con").css({left: b.clientX + "px", top: b.clientY + "px"});
                return false
            }
        }
    }
}
function mouseUp() {
    if (Parent_) {
        $(parent.document).mouseup(function (a) {
            dragging = false;
            a.cancelBubble = true
        })
    } else {
        $(document).mouseup(function (a) {
            dragging = false;
            $("#mb_tit")[0].releaseCapture();
            a.cancelBubble = true
        })
    }
}
function _parent(a) {
    return $("body", parent.document).find(a)
}
function ageNumber(b) {
    var a = /^[0-9]{1,}$/;
    if (!b.match(a)) {
        alert_info("\u93bb\u612e\u305a", "\u6748\u64b3\u53c6\u93c8\u590e\ue1e4,\u9359\ue047\u5158\u93c4\ue21b\u66a3\u93c1\ufffd", true);
        return false
    } else {
        return true
    }
}
function checkNum(c, b) {
    var c = ev || window.event;
    var a = c.charCode || c.keyCode;
    if (a == 110 || a == 190) {
        if (el.value.indexOf(".") >= 0) {
            if (window.event) {
                c.returnValue = false
            } else {
                c.preventDefault()
            }
        }
    } else {
        if (a != 8 && a != 46 && (a < 37 || a > 40) && (a < 48 || a > 57) && (a < 96 || a > 105)) {
            if (window.event) {
                c.returnValue = false
            } else {
                c.preventDefault()
            }
        }
    }
};
