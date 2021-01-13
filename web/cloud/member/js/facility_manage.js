/**
 * Created by yuannianqing on 2015-02-09.
 */

$(function () {
    allChoice();
    addFacility();
    dele();

    $(".content_box_table").delegate(".td_bg", "dblclick", function () {
        var oldvalue = $(this).text();
        var input = "<input class='update_input'  type='text ' value='" + oldvalue + "'/>";
        $(this).html(input);
        $(".td_bg input").focus();
        $(this).parent().delegate("input", "change", function () {
            //alert("改变")
        });
        $(this).delegate("input", "blur", function () {
            $(this).parent().html("<span >" + $(this).val() + "</span>");
        })
    })
});
//$(document).ready--end
//全选
function allChoice() {
    $(".all_select").click(function () {
        if ($(this).prop("checked")) {
            allChoice_yes();
        } else {
            allChoice_no();
        }
    });
    idex()
}
//全部勾选
function allChoice_yes() {
    $(" :checkbox").prop("checked", true);
    $(".center_box_top1  span").text("取消已选");
}
//取消已选
function allChoice_no() {
    $(" :checkbox").removeProp("checked");
    $(".center_box_top1  span").text("全部勾选");
}

//添加设备--star
function addFacility() {
    $(".add_button1").click(function () {
        if ($(".fixed_0_10").attr("data") == "add_yes") {
            $(".fixed_0_10").attr("data", "add_no");
            $(".fixed_0_10").slideDown(800);
            $(".f_number").focus();
            $(".add_button1").css("color", "red");
            $(".add_button1").text("放弃添加")
        } else {
            $(".fixed_0_10").attr("data", "add_yes");
            $(".fixed_0_10").slideUp(800);
        }
    });
    $(".add_ span").click(function () {
        $(".fixed_0_10").attr("data", "add_yes");
        $(".fixed_0_10").hide();
        $(".add_button1").text("添加设备");
        //  alert($(".f_number").val() + "    " + $(".f_name").val() + "    " + $(".f_uname").val())
     /*   var number = $(".content_box tr").length;*/
        var td1 = "<tr><td><input class='input_checkbox' type='checkbox'> <span class='td_index'>" + "</span></td>";
        var td2 = " <td  class= 'td_bg'><span>" + $(".f_number").val() + "</span></td >";
        var td3 = "<td class='td_bg'><span>" + $(".f_name").val() + "</span></td>";
        var td4 = "<td class = 'td_bg' ><span>" + $(".f_uname").val() + "</span></td>";
        var td5 = "<td><img class='del_img' src='images/del.png'></td></tr > ";
        var text = td1 + td2 + td3 + td4 + td5;
        $(".content_box_table tbody:last-child").append(text);
        idex();
    })
}

//删除设备--star
function dele() {
    //删除已选的设备
    $(".delete_button").click(function () {
        var n = 0;
        var n_check = $(".input_checkbox").length - 1;
        // alert(n_check)
        //为了保证可以删除任意已选设备 必须从后往前开始删除（为了保证在删除的过程中不改变下标）
        for (var i = n_check; i >= 0; i--) {
            if ($(".input_checkbox:eq(" + i + ")").prop("checked")) {
                n++;
                if (n == 1) {
                    //判断是否存在需要删除的设备，如果存在则从第一个删除的时候(实际上是下标最后的)开始二次确定
                    if (confirm("确定要删除已选设备？")) {
                        dele_all(i);
                    } else {
                        allChoice_no();
                        return;
                    }
                } else {
                    dele_all(i);
                }
            }
        }
        allChoice_no();
        idex();
    });
//点击单个删除
    $(".content_box table").delegate("tr td img", "click", function () {
        if (confirm("确定要删除？")) {
            $(this).parent().parent('tr').remove();
        }
        idex();
    });
}

//删除被选中的input所在的tr
function dele_all(i) {
    var tr_i = i + 1;
    var key = ".content_box tr:eq(" + tr_i + ")";
    $(key).remove();
}
//保证每个设备前面的idex随不同操作刷新
function idex() {
    var n = $(".content_box tr").length;
    for (var i = 0; i < n; i++) {
        var classname = ".td_index:eq(" + i + ")";
        $(classname).text(i + 1);
    }
}
//删除设备--end