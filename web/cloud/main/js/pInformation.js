/**
 * Created by yuannianqing on 2015-02-09.
 */
    //个人信息的密码修改
$(function () {
    $(".update").click(function () {
        if ($(".update").attr("data") == "y") {
            $(".update").attr("data", "n");
            $(".update_pass").slideDown(1000);
            $(".update").text("放弃修改");
            $(".yes_update").show();
        } else {
            $(".update").attr("data", "y");
            $(".update_pass").slideUp(1000);
            $(".update").text("修改密码");
            $(".yes_update").hide();
        }
    });
// undefined
    $(".td_right").dblclick(function () {
        if ($(this).find("input").val() != undefined) {
            //  alert("已经是input了")
        } else {
            if ($(this).attr("data") == "sex") {
                $(".select").fadeIn(200);
                $(".select").mouseleave(function () {
                    // alert("放弃操作")
                    $(".select").fadeOut(200);
                });
                choice_sex(".sex_m", "男");
                choice_sex(".sex_w", "女");
            } else {
                var input = "<input  class='height_30'type='text' value='" + $(this).text() + "'>";
                $(this).html(input);
                $(this).find("input").focus();
                $(this).find("input").change(function () {
                    // alert("修改为:" + $(this).val())
                });
                $(this).find("input").blur(function () {
                    $(this).parent().html("<span>" + $(this).val() + "</span>");
                });
            }
        }
    });

});

//点击获取性别事件
function choice_sex(classname, Sex) {
    $(classname).click(function () {
        $(".sex").text(Sex);
        $(".select").fadeOut(200)

    });
}
