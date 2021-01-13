/**
 * Created by ynq on 2015-05-14.
 */
$(function () {

        $('#LanguageSwitch').change(function () {
            $.ajax({
                type: "POST",
                url: "langSwitch_execute",
                data: "request_locale=" + $(this).val(),
                success: function (msg) {
                    location.href='/index'
                },
                error: function () {
                    //alert('语言切换失败！')
                }
            });
        });

/*    $(".selectbox").hover(function () {
        //   alert(111);
        $(".lists").slideDown();
    }, function () {
        $(".lists").slideUp();
    });*/
    /*记住密码的选择框*/

    $("#check_Box").click(function () {
        var class_name = $(this).attr("class");
        if (class_name == 'check_Box_off') {
            class_name = 'check_Box_on';
            $(".check_Box_input").prop("check", "true");
        }
        else {
            class_name = 'check_Box_off';
            $(".check_Box_input").prop("check", "false");
        }
        $(this).attr("class", class_name);
        alert($(".check_Box_input").prop("check"))

    });
    /* 性别选择 下拉特效*/
    $(".click_sex").click(function () {
        if ($(this).attr("data") == "1") {
            $(this).attr("data", "0");
            $(".sex_box").slideDown(500);
        } else {
            $(this).attr("data", "1");
            $(".sex_box").slideUp(500);
        }
    });

    $(".sex_box li").click(function () {
        $(".sex").text($(this).text());
        $("#sex").val($(this).attr("data"));
        //alert($("#sex").val());
        $(this).attr("data", "1");
        $(".sex_box").slideUp(500);
    });
    /*   input输入框获取焦点边框样式变化*/
    $(".inp").focus(function () {
        $(this).parent().removeClass("iup3");
        $(this).parent().addClass("iup4");
    });
    $(".inp").blur(function () {
        $(this).parent().removeClass("iup4");
        $(this).parent().addClass("iup3");
    });
    /*   显示密码功能*/
    $(".look_pass").hover(function () {
        var value = $(this).siblings(".inp").val();
        if (value != "") {
            var src = $(this).attr("src").replace("pass1", "pass2");
            $(this).attr("src", src);
            var inp = '<input type="text" class="inp w_211" value="' + value + '">';
            $(this).siblings(".inp").remove();
            $(this).parent().append(inp);
        }

    }, function () {
        var value = $(this).siblings(".inp").val();
        if (value != "") {
            var inp = '<input type="password" class="inp w_211" value="' + value + '">';
            $(this).siblings(".inp").remove();
            $(this).parent().append(inp);
            var src = $(this).attr("src").replace("pass2", "pass1");
            $(this).attr("src", src);
        }
    })

});

function ref(e) {
    $('#verif').attr('src', '/verification_produce?jsessionid=' + Math.random(100))
}
function ref2(e) {
    $('#verif2').attr('src', '/verification_produce?jsessionid=' + Math.random(100))
}