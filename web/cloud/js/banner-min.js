(function (g) {
    var p = 462;
    var f = 0;
    var b = null;
    var k = 0;
    var j;
    var c;
    var o;
    var d;
    g.Banner = {
        banner: function (r, s, u, l) {
            c = g("#" + r);
            o = s;
            p = u;
            d = l;
            k = c.find("li").length * 2;
            a(k / 2);
            c.append(c.html()).css({width: k * p, left: -k * p / 2});
            b = setInterval(q, d);
            m();
            n();
            e()
        }
    };
    var a = function (r) {
        var t = "<ul id=" + o + " class=" + o + ">";
        for (var l = 0; l < r; l++) {
            t += "<li></li>"
        }
        t += "</ul>";
        var s = g(c).parent();
        g(t).appendTo(s);
        g("." + o + " li:eq(0)").addClass("on")
    };
    var n = function () {
        g("#" + o).find("li").each(function (l) {
            g(this).hover(function () {
                clearInterval(b);
                if (g(this).hasClass("on")) {
                    return
                }
                g(this).attr("class", "on").siblings().removeAttr("class");
                var r = g("#" + o).find(".on").index();
                j = r;
                f = -(k / 2 + j) * p;
                h(f)
            }, function () {
                b = setInterval(q, d)
            })
        })
    };
    var m = function () {
        c.find("li").hover(function () {
            clearInterval(b)
        }, function () {
            b = setInterval(q, d)
        })
    };
    var e = function () {
        g("#bannerBox .prev").click(function () {
            f = parseInt(c.css("left")) + p;
            h(f)
        })
    };
    var i = function () {
        g("#bannerBox .next").click(function () {
            f = parseInt(c.css("left")) - p;
            h(f)
        })
    };

    function q() {
        f = parseInt(c.css("left")) - p;
        h(f)
    }

    function h(r) {
        j = -(r / p) - (k / 2);
        g("." + o + " li:eq(" + j + ")").attr("class", "on").siblings().removeAttr("class");
        if (c.is(":animated")) {
            return
        }
        c.animate({left: r}, 500, function () {
            if (r == 0) {
                c.css("left", -k * p / 2)
            } else {
                if (r == (1 - k) * p) {
                    c.css("left", (1 - k / 2) * p)
                }
            }
        })
    }
})(jQuery);
