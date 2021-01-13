/**
 * Created by mrava on 2015-6-11.
 */
$(function () {
    var scrollTimer = null;
    var delay = 2000;
//1.鼠标对新闻触发mouseout事件后每2s调用scrollNews()
//2.鼠标对新闻触发mouseover事件后停止调用scrollNews()
//3.初次加载页面触发鼠标对新闻的mouseout事件
    $('#scrollNews').hover(function () {
        clearInterval(scrollTimer);
    }, function () {
        scrollTimer = setInterval(function () {
            scrollNews();
        }, delay);
    }).triggerHandler('mouseout');
});
//滚动新闻
function scrollNews() {
    var $news = $('#scrollNews>ul');
    var $lineHeight = $news.find('li:first').height();
    $news.animate({'marginTop': -$lineHeight + 'px'}, 600, function () {
        $news.css({margin: 0}).find('li:first').appendTo($news);
    });
}
