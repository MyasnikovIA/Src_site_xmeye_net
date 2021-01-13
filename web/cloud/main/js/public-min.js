var key;
$(window).bind("resize load", function () {
    windowResize()
});
$(function () {
    $(".show_switch").click(function () {
        key = false;
        $(this).hasClass("on") ? switchBox_off() : switchBox_on()
    });
    $(".language").click(function () {
        $(".language").hide();
        $(".languageList").slideDown(200)
    });
    $(".languageList").hover(function () {
    }, function () {
        $(".languageList").slideUp(200, function () {
            $(".language").show();
        })
    });
    $(".languageList li").click(function () {
        if ($(this).attr("data-val") != "null") {
            changeLanguage($(this).attr("data-val"))
        }
    })
    $("#menuBox li").click(function () {
        key = false;
        $(".layout_right a:eq(0)").removeClass("on");
        $(this).addClass("on").siblings("li").removeClass("on");
        if ($(this).attr("id") == "cloud") {
            $(".viewport").hide();
            switchBox_on();
            $(".cloudShare").show();
            $("#cloud_store").click()
        } else {
            if ($(this).attr("id") == "mydecive") {
                $(".cloudShare").hide();
                $(".viewport").show();
                switchBox_on();
                $("#center_iframe").hide();
                $("#center_iframe_alert").show()
            } else {
                switchBox_off();
                $("#center_iframe").hide();
                $("#center_iframe_alert").attr("src", $(this).find("a").attr("data-href"));
                $("#center_iframe_alert").show()
            }
        }
        key = true
    });
    $(".viewport ul").delegate("li", "click", function () {
        $("#mydecive").addClass("on").siblings("li").removeClass("on");
        $(this).addClass("v_li_back").siblings("li").removeClass("v_li_back");
        var b = $(this).attr("data-href");
        var a = $(this).attr("data-status");
        $("#center_iframe_alert").hide();
        if (a == 1) {
            $("#center_iframe").attr("src", b);
        } else {
            $("#center_iframe").attr("src", "/cloud_device_offLine_main")
        }
        $("#center_iframe").show()
    });
    $(".cloudShare ul").delegate("li", "click", function () {
        $("#cloud").addClass("on").siblings("li").removeClass("on");
        $(this).addClass("v_li_back").siblings("li").removeClass("v_li_back");
        $("#center_iframe_alert").hide();
        $("#center_iframe").attr("src", $(this).attr("data-href"));
        $("#center_iframe").show()
    })
});
function changeLanguage(b) {
    $.ajax({
        type: "POST", url: "langSwitch_execute", data: "request_locale=" + b, success: function (a) {
            location.reload();
        }, error: function () {
            alert("error:500,\u7487\ue161\u2588\u9352\u56e8\u5d32\u6fb6\u8fab\u89e6\u951b\ufffd")
        }
    })
}

function switchBox_on() {
    if (key) {
        return;
    }
    $(".switchBox_off").hide();
    var a = $(window).width() - 201;
    $(".center_right").animate({width: a}, "slow");
    $(".center_left_box").animate({marginLeft: 0}, "slow", function () {
        $(".show_switch").removeClass("off");
        $(".show_switch").addClass("on")
    })
}
function switchBox_off() {
    var a = $(window).width() - 15;
    $(".center_right").animate({width: a}, "slow");
    $(".center_left_box").animate({marginLeft: -200}, "slow", function () {
        $(".switchBox_off").show();
        $(".show_switch").addClass("off");
        $(".show_switch").removeClass("on")
    })
}
function windowResize() {
    var a = $(window).width();
    if ($(window).height() < 700) {
        $(".footer").removeClass("fixed_bottom")
    } else {
        $(".footer").addClass("fixed_bottom")
    }
    var b = ($(window).height() < 700 ? 700 : $(window).height()) - get_w_h("#header", "height") - get_w_h(".footer", "height");
    var c = (a < 1024 ? 1024 : a) - get_w_h(".center_left", "width") - 1;
    $(".center_right").css({width: c + "px", height: b + "px", overflow: "hidden"});
    $(".center_box").css("height", b + "px");
    $(".deviceList").css("height", b - 60 + "px")
}
function showpersonInf(b) {
    $("#username a").addClass("on");
    var a = $(b).attr("data-href");
    $("#menuBox li").removeClass("on");
    $("#center_iframe_alert").attr("src", a);
    $("#center_iframe").hide();
    $("#center_iframe_alert").show()
}
function showDev() {
    $("#center_iframe_alert").hide();
    switchBox_on();
    $("#center_iframe").attr("src", "/cloud_device_videoIfo_main");
    $("#center_iframe").show()
}
function get_w_h(a, b) {
    var b = parseInt($(a).css(b).split("px")[0]);
    return b
};
