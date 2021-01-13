/**
 * Created by hejieming on 2015-04-15.
 */
var sum = $(".total").val();
$(".submit_div .giveup").click(function () {
    hideAdd()
});
$(".add").click(function () {
    $(".add_input").val("");
    var a_href = $(this);
    if (a_href.attr('href') == '#0') {
        $(".add_div").show(200);
        a_href.text('-');
        a_href.attr('href', '#1')
    } else {
        hideAdd();
    }
});
function hideAdd() {
    $(".add_div").hide(200);
    $(".add").text('+');
    $(".add").attr('href', '#0')
    $(".add_input").val("");
    $(".error_div").text("");
}
$('#BWStatus').change(function () {
    $.post("/cloud_device_bwStatus_null");
});
//alert(sum)
function sPage(tempSum) {
    var n = 20;//默认是20条一页
    sum = parseInt(tempSum);

    var number = parseInt(sum / n).toString();
    if (sum % n != 0) {
        number = parseInt(number) + 1;
    }
    splitPage(number);
    init();
    //用户点击选择的
}

function firm(even) {
    var mac = $(even).attr("data-mac");
    $.MsgBox.Confirm("温馨提示", $(".delete_error").val(), true, function () {
        $.post(ajax_url, {mac: mac});
        $(even).parent().parent('tr').remove();
        sum--;
        $(".number_sum").text(sum);
    });
}
$('.submit_div .submit').click(function () {
    var mac = $(".add_input").val();
    if (mac != '')
        $.getJSON(json_url + mac,
            function (data) {
                if (data.status != 1200) {
                    $(".error_div").text(data.message);
                } else {
                    var nu = parseInt($(".black_table tr:last-child td:first-child").text()) + 1;
                    var tr = '<tr><td>' + nu + '</td><td>' + data.mac + '</td><td><span data="' + data.mac + '" class="delete icon_delete" onclick="firm(' + item.mac + ',this)"></span></td></tr>';
                    $(".black_table tbody:last-child").append(tr);
                    hideAdd();
                    sum++


                }
            });

});
$("#pg_list").change(function () {
    var n = parseInt($(this).val());
    var number;
    if ((sum % n) != 0) {
        number = parseInt(parseInt(sum / n).toString()) + 1;
    } else {
        number = parseInt(parseInt(sum / n).toString());
    }
    //  alert(sum % n + "  " + number);
    splitPage(number);
    this_page(1);
});
function splitPage(number) {//页数
    // alert(sum + "  " + n + "  " + sum % n + " |" + sum / n + "||" + number)
    $(".pg_sum").text(number);
    $(".pageinfo").attr("data", number);
    $("#pagelist li").removeClass("current");
    $("#pg1").addClass("current");
    for (var i = 1; i < 6; i++) {//防止总共页数不超过5页
        if (i <= parseInt($("#all_page").attr("data"))) {
            $("#pg" + i).css("display", "block");
            $("#pg" + i).attr("data", i);
            $("#pg" + i).text(i);
        } else {
            $("#pg" + i).css("display", "none");
        }
    }
}

function init() {
    $("#pg1,#pg2,#pg3,#pg4,#pg5").click(function () {
        $("#pagelist li").removeClass("current");
        $(this).addClass("current");
        this_page($(".current").attr("data"));//显示页面数据-以current这个样式类所在的li的data值为依据
    });

//上一页·
    $("#up_page").click(function () {
        if ($("#pg1").attr("data") > 1) {
            var pi;
            var data;
            for (var i = 1; i < 6; i++) {
                pi = "#pg" + i;
                data = $(pi).attr("data") - 1;
                $(pi).attr("data", data);
                $(pi).text(data);
            }
            this_page($(".current").attr("data")); //显示页面数据-以current这个样式类所在的li的data值为依据
        } else {
            var i = parseInt($(".current").attr("data")) - 1;
            if (i >= 1) {
                $("#pagelist li").removeClass("current");
                $("#pg" + i).addClass("current");
                this_page($(".current").attr("data")); //显示页面数据-以current这个样式类所在的li的data值为依据
            }
        }
    })
//下一页
    $("#next_page").click(function () {
        all_pg = parseInt($("#all_page").attr("data"));
        if (5 < all_pg) {
            var pi;
            var data;
            if ($("#pg5").attr("data") < all_pg) {
                for (var i = 1; i < 6; i++) {
                    pi = "#pg" + i;
                    data = parseInt($(pi).attr("data")) + 1;
                    $(pi).attr("data", data);
                    $(pi).text(data);
                }
            } else {
                var i = parseInt($(".current").attr("data")) + 1;
                var _index = parseInt($(".current").attr("id").split("g")[1]) + 1;
                //alert(_index)
                if (i <= all_pg) {
                    $("#pagelist li").removeClass("current");
                    $("#pg" + _index).addClass("current");
                } else {
                    $(".Page_error").css("display", "block");
                    $(".Page_error").text($(".sp_page_last_").val());
                    setTimeout(' $(".Page_error").css("display", "none")', 2000);
                    return;
                }
            }
        } else {
            var i = parseInt($(".current").attr("data")) + 1;
            // alert(i)
            if (i <= all_pg) {
                $("#pagelist li").removeClass("current");
                $("#pg" + i).addClass("current");
            } else return;
        }
        this_page($(".current").attr("data"));//显示页面数据-以current这个样式类所在的li的data值为依据
    });

//首页
    $("#home_page").click(function () {
        all_pg = parseInt($("#all_page").attr("data"));
        $("#pagelist li").removeClass("current");
        $("#pg1").addClass("current");
        for (var i = 1; i < 6; i++) {
            if (i <= all_pg) {
                $("#pg" + i).attr("data", i);
                $("#pg" + i).text(i);
            } else {
                $("#pg" + i).css("display", "none");
            }
        }
        this_page(1) //显示页面数据
    });
//尾页
    $("#end_page").click(function () {
        all_pg = parseInt($("#all_page").attr("data"));
        if (all_pg < 5) {

        } else {
            $("#pagelist li").removeClass("current");
            $("#pg5").addClass("current");
            var pi;
            var data;
            for (var i = 1; i < 6; i++) {
                pi = "#pg" + i;
                $(pi).attr("data", all_pg - 5 + i);
                $(pi).text(all_pg - 5 + i);
            }
        }
        this_page(all_pg);//显示页面数据
    });
//第几页
    $("#go_page").click(function () {
        var num = parseInt($(".page_number").val());
        all_pg = parseInt($("#all_page").attr("data"));
        if (isNaN(num) || num.toString().indexOf("0") == 0) {
            $(".Page_error").css("display", "block");
            $(".Page_error").text($(".sp_page_error").val());
            setTimeout(' $(".Page_error").css("display", "none")', 2000);
        } else if (num > all_pg) {
            $(".Page_error").css("display", "block");
            $(".Page_error").text($(".sp_page_max_").val());
            setTimeout(' $(".Page_error").css("display", "none")', 2000);
        } else if (num <= 5) {//数据条数小于5条
            $("#pagelist li").removeClass("current");
            $("#pg" + num).addClass("current");
            for (var i = 1; i < 6; i++) {
                if (i <= all_pg) {
                    $("#pg" + i).attr("data", i);
                    $("#pg" + i).text(i);
                } else {
                    $("#pg" + i).css("display", "none");
                }
            }
            this_page($(".current").attr("data"));//显示页面数据-以current这个样式类所在的li的data值为依据
        } else {//数据条数大于5条
            $("#pagelist li").removeClass("current");
            $("#pg5").addClass("current");
            var pi;
            var data;
            for (var i = 0; i < 5; i++) {
                pi = "#pg" + (5 - i);
                $(pi).attr("data", num - i);
                $(pi).text(num - i);
            }
            this_page($(".current").attr("data"));//显示页面数据-以current这个样式类所在的li的data值为依据
        }
        // setTimeout('$(".page_number").val("")', 2000);
    });
}