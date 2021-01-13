/*是否有父级页面*/
var Parent_ = false;
/*拖动按钮*/
var dragging = false;
/*窗口位置*/
var iX, iY;
var Message_Ok = $("#Message_Ok").val();
var Message_Cancel = $("#Message_Cancel").val();
var Message_title = $("#Message_Title").val();
$(function () {
    $(".update").on("click", function () {
        alert_box("700", "390", $(this).attr('data-src'));
    });
});

function progress(allSpace, useEd, type) {
    var allProgress = $("#progress").width();
    var use = allProgress * useEd / allSpace;
    $("#progressBox .useSpace").text(useEd + type);
    $("#useEd").animate({width: use}, "slow");
    $("#progressBox .allSpace").text(allSpace + type);
}
/*云存储*/
function submitStoreForm() {
    //  alert("----------开始----------");
    var store = $("#storeDealForm").serialize();
    var space = $("#space").val();
    var loopDay = $("#loopDay").val();
    if (ageNumber(space) && ageNumber(loopDay)) {
        $.getJSON("/cloudMange/cloud_cloudM_editStore_null", store,
            function (data) {
                alert_(Message_title, d.message, Message_Ok);
                if (data.status == 1) {
                    hidden_bg();
                    refresh("#cloud_store");
                }
            }
        );
    }
}
/*云警告*/
function submitAlarmForm() {
    //alert("----------开始----------");
    var alarm = $("#alarmDealForm").serialize();
    //alert(alarm);
    var msgCapacity = $("#msgCapacity").val();
    var picCapacity = $("#picCapacity").val();
    if (ageNumber(msgCapacity) && ageNumber(picCapacity)) {
        $.getJSON("/cloudMange/cloud_cloudM_editAlarm_null",
            alarm,
            function (data) {
                alert_(Message_title, data.message, Message_Ok);
                if (data.status == 1) {
                    hidden_bg();
                    refresh("#cloud_alarm")
                }
            });
    }
}
/*流媒体*/
function submitMedaForm() {
    //alert("------Media KaiS-------");
    var media = $("#mediaDealForm").serialize();
    //alert(media)
    $.getJSON("/cloudMange/cloud_cloudM_editMedia_null",
        media,
        function (data) {
            alert_(Message_title, data.message, Message_Ok);
            if (data.status == 1) {
                hidden_bg();
                refresh("#cloud_media")
            }
        });
}
/*云共享*/
function submitShareForm() {
    //  alert("-------------share-----------");
    var share = $("#shareAdd").serialize();
    $.getJSON("/cloudMange/cloud_cloudM_addShare_null",
        share,
        function (data) {
            if (data.status == 1) {
                alert_(data.message);
                if (data.mac == "save") {
                    if (data.sharePo.store == 1)
                        var store = "yes";
                    else
                        var store = "no";
                    if (data.sharePo.alarm == 1)
                        var alarm = "yes";
                    else
                        var alarm = "no";
                    if (data.sharePo.media == 1)
                        var media = "yes";
                    else
                        var media = "no";
                    var td0 = "<tr><td>" + data.sharePo.mac + "</td>";
                    var td1 = "<td>" + data.sharePo.userName2 + "</td>";
                    var td2 = "<td>" + store + "</td>";
                    var td3 = "<td>" + alarm + "</td>";
                    var td4 = "<td>" + media + "</td>";
                    var td5 = "<td> <span class='delete icon_delete'  onclick='firmShare(" + '"' + data.sharePo.id + '"' + ",this);'</span></td></tr>";
                    var text = td0 + td1 + td2 + td3 + td4 + td5;
                    $("#shareTable tbody:last-child").append(text);
                } else if (data.mac == "update") {
                    refresh("#cloud_share");
                }
            } else {
                alert_(Message_title, b.message, Message_Ok)
            }
        });

}

function alert_(Message_title, message, Message_Ok) {
    alert_info(Message_title, message, Message_Ok, true)
}
function goBack() {
    window.history.back();
}
/*云管理修改后的刷新操作*/
function refresh(id) {
    $("body", parent.document).find(id).click();
}
/*弹框提示*/

function alert_info(title, msg, hasParent) {

    Parent_ = hasParent;
    dragging = false;
    var _html = "";
    _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
    _html += '<a id="mb_ico" onclick=$("#mb_box,#mb_con").remove() >x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
    _html += '<input id="mb_btn_ok"  onclick=$("#mb_box,#mb_con").remove();  type="button" value="确定" />';
    _html += '</div></div>';
    //将_html添加到body中
    hasParent ? $("body:eq(0)", parent.document).append(_html) : $("body:eq(0)").append(_html);

    mouseDown();
    mouseMove();
    mouseUp();

}


/*+++++ 拖曳效果 ++++++
 *原理：标记拖曳状态dragging，坐标位置iX、iY
 *   mousedown:fn(){dragging = true：记录起始坐标位置，设置鼠标捕获}
 *   mouseover:fn(){判断如果dragging = true，则当前坐标位置 - 记录起始坐标位置，绝对定位的元素获得差值}
 *   mouseup:fn(){dragging = false：释放鼠标捕获，防止冒泡}
 */
//鼠标按下事件
function mouseDown() {
    if (Parent_) {
        _parent("#mb_tit").mousedown(function (e) {
            dragging = true;
            iX = e.clientX - _parent("#mb_con").css("left").split("px")[0];
            iY = e.clientY - _parent("#mb_con").css("top").split("px")[0];
            //  alert(e.clientX + " ol " + getParent("#mb_con").css("left").split("px")[0] + "  ix" + iX);
            this.setCapture && this.setCapture();
            return false;
        });
    } else {
        $("#mb_tit").mousedown(function (e) {
            dragging = true;
            //alert(233);
            iX = e.clientX - this.offsetLeft;
            iY = e.clientY - this.offsetTop;
            this.setCapture && this.setCapture();
            return false;
        });
    }


}

//鼠标move事件
function mouseMove() {
    if (Parent_) {
        parent.document.onmousemove = function (e) {
            if (dragging) {
                // alert("move")
                var e = e || window.event;
                var oX = e.clientX - iX;
                var oY = e.clientY - iY;
                _parent("#mb_con").css({"left": oX + "px", "top": oY + "px"});
                return false;
            }
        };
    } else {
        document.onmousemove = function (e) {
            if (dragging) {
                var e = e || window.event;
                var oX = e.clientX - iX;
                var oY = e.clientY - iY;
                $("#mb_con").css({"left": e.clientX + "px", "top": e.clientY + "px"});
                return false;
            }
        };

    }


}

//鼠标按起事件
function mouseUp() {

    if (Parent_) {
        $(parent.document).mouseup(function (e) {
            //alert("up:" + iX);
            dragging = false;
            // $("#mb_tit")[0].releaseCapture();
            e.cancelBubble = true;
        });
    } else {
        $(document).mouseup(function (e) {
            dragging = false;
            $("#mb_tit")[0].releaseCapture();
            e.cancelBubble = true;
        });
    }

}


function _parent(name) {
    return $("body", parent.document).find(name)
}

/*弹框提示*/


function ageNumber(val) {
    var agr = /^[0-9]{1,}$/;
    //alert(val);
    if (!val.match(agr)) {
        alert_info("提示", "输入有误,只能是整数", true);
        // alert("输入有误,只能是整数");
        return false;
    } else {
        return true;
    }
}

function checkNum(event, val) {
    //8：退格键、46：delete、37-40： 方向键
//48-57：小键盘区的数字、96-105：主键盘区的数字
//110、190：小键盘区和主键盘区的小数
//189、109：小键盘区和主键盘区的负号
    var event = ev || window.event;                             //IE、FF下获取事件对象
    var currentKey = event.charCode || event.keyCode;             //IE、FF下获取键盘码

    //小数点处理
    if (currentKey == 110 || currentKey == 190) {
        if (el.value.indexOf(".") >= 0)
            if (window.event)                       //IE
                event.returnValue = false;                 //e.returnValue = false;效果相同.
            else                                    //Firefox
                event.preventDefault();
    } else if (currentKey != 8 && currentKey != 46 && (currentKey < 37 || currentKey > 40) && (currentKey < 48 || currentKey > 57) && (currentKey < 96 || currentKey > 105))
        if (window.event)                       //IE
            event.returnValue = false;                 //e.returnValue = false;效果相同.
        else                                    //Firefox
            event.preventDefault();
}