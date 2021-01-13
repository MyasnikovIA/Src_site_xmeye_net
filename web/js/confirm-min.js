(function (e) {
    e.MsgBox = {
        Alert: function (s, r, q, p) {
            n("alert", s, r, q, "Cancle", p);
            o();
            a();
            f();
            l();
            g()
        }, MacLoginAlert: function (r, q, p, s) {
            n("alert", r, q, p, "Cancle", false);
            d(s);
            h(s);
            f();
            l();
            g()
        }, Confirm: function (t, s, q, r, p, u) {
            n("confirm", t, s, q, r, p);
            o(u);
            a();
            f();
            l();
            g()
        }
    };
    var b = false;
    var m = false;
    var k, i;
    var n = function (t, v, u, r, s, p) {
        var q = "";
        q += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + v + "</span>";
        q += '<a id="mb_ico">x</a><div id="mb_msg">' + u + '</div><div id="mb_btnbox">';
        if (t == "alert") {
            q += '<input id="mb_btn_ok" type="button" value=' + r + " />"
        }
        if (t == "confirm") {
            q += '<input id="mb_btn_ok" type="button" value=' + r + " />";
            q += '<input id="mb_btn_no" type="button" value=' + s + " />"
        }
        q += "</div></div>";
        b = p;
        p ? e("body:eq(0)", parent.document).prepend(q) : e("body:eq(0)").prepend(q)
    };
    var o = function (p) {
        if (b) {
            c("#mb_btn_ok").click(function () {
                e("body", parent.document).find("#mb_box").remove();
                e("body", parent.document).find("#mb_con").remove();
                if (typeof(p) == "function") {
                    p()
                }
            })
        } else {
            e("#mb_btn_ok").click(function () {
                e("#mb_box,#mb_con").remove();
                if (typeof(p) == "function") {
                    p()
                }
            })
        }
    };
    var a = function () {
        var p = b ? c("#mb_btn_no") : e("#mb_btn_no");
        var q = b ? c("#mb_ico") : e("#mb_ico");
        p.click(function () {
            j()
        });
        q.click(function () {
            j()
        })
    };
    var d = function (p) {
        e("#mb_btn_ok").click(function () {
            e("#mb_box,#mb_con").remove();
            if (typeof(p) == "function") {
                p()
            }
        })
    };
    var h = function (p) {
        e("#mb_ico").click(function () {
            j();
            if (typeof(p) == "function") {
                p()
            }
        })
    };

    function j() {
        if (b) {
            c("#mb_box").remove();
            c("#mb_con").remove()
        } else {
            e("#mb_box,#mb_con").remove()
        }
    }

    function f() {
        if (b) {
            c("#mb_tit").mousedown(function (p) {
                m = true;
                k = p.clientX - c("#mb_con").css("left").split("px")[0];
                i = p.clientY - c("#mb_con").css("top").split("px")[0];
                this.setCapture && this.setCapture();
                return false
            })
        } else {
            e("#mb_tit").mousedown(function (p) {
                m = true;
                k = p.clientX - e("#mb_con").css("left").split("px")[0];
                i = p.clientY - e("#mb_con").css("top").split("px")[0];
                this.setCapture && this.setCapture();
                return false
            })
        }
    }

    function l() {
        parent.document.onmousemove = function (r) {
            if (m) {
                r = r || window.event;
                var q = r.clientX - k;
                var p = r.clientY - i;
                if (b) {
                    c("#mb_con").css({left: q + "px", top: p + "px"});
                    return false
                } else {
                    e("#mb_con").css({left: q + "px", top: p + "px"});
                    return false
                }
            }
        }
    }

    function g() {
        if (b) {
            e(parent.document).mouseup(function (p) {
                m = false;
                p.cancelBubble = true
            })
        } else {
            e(document).mouseup(function (p) {
                m = false;
                p.cancelBubble = true
            })
        }
    }

    function c(p) {
        return e("body", parent.document).find(p)
    }
})(jQuery);
