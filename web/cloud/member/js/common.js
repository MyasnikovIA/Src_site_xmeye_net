/**
 * Created by mrava on 2015-6-27.
 */
/**
 * 刷新验证码
 * @param imgId
 */
function refreshVerification(imgId) {
    imgId = '#' + imgId;
    $(imgId).attr('src', '/verification_produce?jsessionid=' + Math.random(100));
}
/**
 * 语言切换
 */
function changeLanguage(selectId){
    selectId='#'+selectId;
    $(selectId).change(function () {
        $.ajax({
            type: "POST",
            url: "langSwitch_execute",
            data: "request_locale=" + $(this).val(),
            success: function (msg) {
                location.href = '/index'
            },
            error: function () {
                alert('error:500,语言切换失败！')
            }
        });
    });
}