/**
 * Created by ynq on 2015-10-19.
 */

(function ($) {

    //兼容各种浏览器
    var w = 462;
    var l = 0;
    var timer = null;
    var len = 0;
    $.Banner = {
        banner: function (w_div) {
            w = w_div;
            len = $("#bannerBox  ul li").length * 2; //复制了一份图片，长度变为2倍。
            $("#bannerBox ul").append($("#bannerBox ul").html()).css({'width': len * w, 'left': -len * w / 2});
            timer = setInterval(init, 5000); //自动每5秒切换一次
            hover_();
            prev();
        }
    };


    function init() {
        l = parseInt($("#bannerBox ul").css("left")) - w;  //这里要转成整数，因为后面带了px单位
        showCurrent(l);

    }

    var hover_ = function () {
        $("#bannerBox ul li").hover(function () {
            clearInterval(timer);
        }, function () {
            timer = setInterval(init, 5000);
        });
    };

    var prev = function () {
        $("#bannerBox .prev").click(function () {

            l = parseInt($("#bannerBox ul").css("left")) + w;  //这里要转成整数，因为后面带了px单位
            showCurrent(l);
        });
    };
    var next = function () {
        $("#bannerBox .next").click(function () {
            l = parseInt($("#bannerBox ul").css("left")) - w;  //这里要转成整数，因为后面带了px单位
            showCurrent(l);
        });
    };

    function showCurrent(l) {     //把图片的左右切换封装成一个函数
        // alert(index + 1);
        if ($("#bannerBox ul").is(':animated')) { //当ul正在执行动画的过程中，阻止执行其它动作。关键之处，不然图片切换显示不完全，到最后图片空白不显示。
            return;
        }
        $("#bannerBox ul").animate({"left": l}, 500, function () {
            if (l == 0) { //当图片位置到第一份图片第二张时，马上把图片定位到第二份的第一张。注意这里的设置的css一定到写在animate动画完成时的执行  //函数里。否则图片只是一瞬间回到第一张，但是没有向右的动画效果。 我在做的时候，用的不是css,而是用animate()定位到第二个第一张，结果切换时，是反方向的运动，一直觉得无论怎样，图片方向都会发生变化 ，弄得花了一天时间才找到原因，所以一定 要用css。
                $("#bannerBox ul").css("left", -len * w / 2);
                // index = 0;
            } else if (l == (1 - len) * w) { //图片位置到最后一张时（第二份最后一张）时，就把图片定位到第一份最后一张。从而显示的是第一份最后一张。
                $("#bannerBox ul").css('left', (1 - len / 2) * w);
                // index = len / 2;
            }
        });
        // alert(index)
    }

})(jQuery);