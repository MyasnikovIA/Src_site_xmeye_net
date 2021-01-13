/**
 * Created by yuannianqing on 2015-03-31.
 */
function _parent(name) {
    return $("body", parent.document).find(name)
}


function alert_box(w, h, ifSrc) {
    show_bg();
    show_box(w, h, ifSrc);
    _parent(".alert_content").show(200);
    /*    _parent(".alert_close td h2").css({"display": "none"});*/
    _parent("#alert_close").click(function () {
        hidden_bg();
    });
}
//遮罩背景样式及显示控制
function show_bg() {
    var _body = _parent("body").eq(0);

    if (_parent("#bg").length == 0) {
        _body.append("<div id=\"bg\"></div>");
        _parent("#bg").css("height", _body.height());
    } else {
        _parent("#bg").show(200);
    }
}
//弹窗大小带参显示控制
function show_box(w, h, _src) {

    _parent(".alert_content").css({
        "width": w,
        "height": h,
        "margin-left": '-' + w / 2 + 'px',
        "margin-top": '-' + h / 2 + 'px'
    });

    _parent("#bg_iframe").attr("src", _src);
}
//弹窗关闭
function hidden_bg() {
    _parent("#bg").fadeOut();
    _parent(".alert_content").fadeOut();
}
$(function () {
    $("#cloud_s_a_m td").on("click", function () {
        $("#cloud_s_a_m td").removeClass("on");
        $(this).addClass("on");
    });

    $("#cloud_s_a_m td a").on("click", function () {
        _parent("#cloud_manage").attr("src", "");
        _parent("#cloud_manage").attr("src", $(this).attr("src"));
    });

});


