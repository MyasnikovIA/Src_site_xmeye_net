/**
 * Created by yuannianqing on 2015-02-05.
 */

var key;
$(window).bind('resize load', function () {
    windowResize();
});

$(function () {

    /*左侧收放事件*/
    $(".show_switch").click(function () {
        key = false;
        $(this).hasClass("on") ? switchBox_off() : switchBox_on();
    });


    /*左侧收放事件*/


    //菜单切换
    $("#menuBox li").click(function () {


        key = false;
        $(".layout_right a:eq(0)").removeClass("on");
        $("#menuBox li").removeClass("on");
        $(this).addClass("on");
        if ($(this).attr("id") == "cloud") {
            $(".viewport").hide();
            switchBox_on();
            $(".cloudShare").show();
            $("#center_iframe_alert").attr("src", $(".cloudShare .v_li_back").attr("data-href"));
        } else if ($(this).attr("id") == "mydecive") {
            $(".cloudShare").hide();
            $(".viewport").show();
            switchBox_on();
        } else {
            switchBox_off();
            $("#center_iframe_alert").attr("src", $(this).find("a").attr('data-href'));
        }
        $("#center_iframe").hide();
        $("#center_iframe_alert").show();
        key = true;
    });

    //根据不同的设备切换
    $(".viewport ul").delegate("li", "click", function () {
        $("#menuBox li").removeClass("on");
        $("#mydecive").addClass("on");
        $(".viewport li").removeClass("v_li_back");
        $(this).addClass("v_li_back");
        var data = $(this).attr("data-href");
        var status = $(this).attr("status");
        $("#center_iframe_alert").hide();
        if (status == 1) {
            $("#center_iframe").attr("src", data);
        } else {
            $("#center_iframe").attr("src", '/cloud_device_offLine_main');
        }
        $("#center_iframe").show();
    });

    //云共享功能切换
    $(".cloudShare ul").delegate("li", "click", function () {
        $("#menuBox li").removeClass("on");
        $("#cloud").addClass("on");
        $(".cloudShare li").removeClass("v_li_back");
        $(this).addClass("v_li_back");
        var data_href = $(this).attr("data-href");
        $("#center_iframe_alert").hide();

        $("#center_iframe").attr("src", data_href);
        $("#center_iframe").show();
    });
});

function switchBox_on() {
    if (key)return;
    $(".switchBox_off").hide();
    var w = $(window).width() - 201;
    $(".center_right").animate({width: w}, "slow");
    $(".center_left_box").animate({marginLeft: 0}, "slow", function () {
        $(".show_switch").removeClass("off");
        $(".show_switch").addClass("on");
    });
}
function switchBox_off() {
    var w = $(window).width() - 15;
    $(".center_right").animate({width: w}, "slow");
    $(".center_left_box").animate({marginLeft: -200}, "slow", function () {
        $(".switchBox_off").show();
        $(".show_switch").addClass("off");
        $(".show_switch").removeClass("on");

    });
}


function windowResize() {
    var window_w = $(window).width();
    if ($(window).height() < 700) {
        $(".footer").removeClass("fixed_bottom");
    } else {
        $(".footer").addClass("fixed_bottom");
    }
    var center_h = ( $(window).height() < 700 ? 700 : $(window).height()) - get_w_h("#header", "height") - get_w_h(".footer", "height");
    var center_right_w = (window_w < 1024 ? 1024 : window_w) - get_w_h(".center_left", "width") - 1;
    $(".center_right").css({"width": center_right_w + 'px', "height": center_h + "px", "overflow": "hidden"});
    $(".center_box").css("height", center_h + "px");
    $(".deviceList").css("height", center_h - 60 + "px");
}

function showpersonInf(this_) {
    this_.addClass("on");
    var href_ = this_.attr('data-href');
    $("#menuBox li").removeClass("on");
    this_.addClass("on");
    $("#center_iframe_alert").attr("src", href_);
    $("#center_iframe").hide();
    $("#center_iframe_alert").show();
}
function showDev() {
    $("#center_iframe_alert").hide();
    switchBox_on();
    $("#center_iframe").attr("src", "/cloud_device_videoIfo_main");
    $("#center_iframe").show();
}
function get_w_h(classneme, w_h) {
    var w_h = parseInt($(classneme).css(w_h).split("px")[0]);
    return w_h;
}
