(function ($) {
    $.MsgBox = {
        Alert: function (title, msg, ok, hasParent) {
            GenerateHtml("alert", title, msg, ok, "Cancle", hasParent);
            btnOk(); //alert只是弹出消息，因此没必要用到回调函数callback
            btnNo();
            mouseDown();
            mouseMove();
            mouseUp();
        },
        Confirm: function (title, msg, ok, cancle, hasParent, callback) {
            GenerateHtml("confirm", title, msg, ok, cancle, hasParent);
            btnOk(callback);
            btnNo();
            mouseDown();
            mouseMove();
            mouseUp();

        }
    };
    /*是否有父级页面*/
    var Parent_ = false;
    /*拖动按钮*/
    var dragging = false;
    /*窗口位置*/
    var iX, iY;

    //生成Html
    var GenerateHtml = function (type, title, msg, ok, cancle, hasParent) {
        var _html = "";
        _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
        _html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
        if (type == "alert") {
            _html += '<input id="mb_btn_ok" type="button" value=' + ok + ' />';
        }
        if (type == "confirm") {
            _html += '<input id="mb_btn_ok" type="button" value=' + ok + ' />';
            _html += '<input id="mb_btn_no" type="button" value=' + cancle + ' />';
        }
        _html += '</div></div>';
        Parent_ = hasParent;
        //将_html添加到body中
        hasParent ? $("body:eq(0)", parent.document).prepend(_html) : $("body:eq(0)").prepend(_html);
    };

    //确定按钮事件
    var btnOk = function (callback) {
        // alert(Parent_)
        if (Parent_) {
            getParent("#mb_btn_ok").click(function () {

                $("body", parent.document).find("#mb_box").remove();
                $("body", parent.document).find("#mb_con").remove();

                if (typeof (callback) == 'function') {
                    callback();
                }
            });
        } else {
            $("#mb_btn_ok").click(function () {
                $("#mb_box,#mb_con").remove();
                if (typeof (callback) == 'function') {
                    callback();
                }
            });
        }
    };

    //取消按钮事件
    var btnNo = function () {
        var mb_btn_no = Parent_ ? getParent("#mb_btn_no") : $("#mb_btn_no");
        var mb_ico = Parent_ ? getParent("#mb_ico") : $("#mb_ico");
        mb_btn_no.click(function () {
            removeMb_box();
        });
        mb_ico.click(function () {
            removeMb_box();
        });
    };
    //删除窗口
    function removeMb_box() {
        if (Parent_) {
            getParent("#mb_box").remove();
            getParent("#mb_con").remove();
        } else {
            $("#mb_box,#mb_con").remove();
        }
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
            //  alert( getParent("#mb_con").css("left"));
            getParent("#mb_tit").mousedown(function (e) {
                dragging = true;
                iX = e.clientX - getParent("#mb_con").css("left").split("px")[0];
                iY = e.clientY - getParent("#mb_con").css("top").split("px")[0];
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

                    getParent("#mb_con").css({"left": oX + "px", "top": oY + "px"});
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


    //获取父级body
    function getParent(name) {
        return $("body", parent.document).find(name);
    }
})(jQuery);
 
