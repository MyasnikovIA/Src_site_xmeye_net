var Message_Ok = $("#Message_Ok").val();
var Message_Cancel = $("#Message_Cancel").val();
var Message_title = $("#Message_Title").val();
$(function () {
    allChoice();
    addFacility();
    dele();
    update()
});
function update() {
    var b, e, d, a, c;
    $(".content_box_table").delegate(".td_bg", "dblclick", function () {
        b = $(this).text();
        var f = "<input class='update_input' type='text ' value='" + b + "'/>";
        e = $(this).parent().find("td").eq(0).html();
        d = $(this).parent().find(".td_bg_1").text();
        a = $(this).parent().find("td").eq(3).html();
        c = $(this).parent().find("td").eq(4).html();
        $(this).html(f);
        $(".td_bg input").focus()
    });
    $(".content_box_table").delegate(".td_bg input", "blur", function () {
        var f = $(this).val();
        if (f == null || f == "" || f == b) {
            f = b
        } else {
            if (b == a) {
                $.post("/update", {
                    "device.id": e,
                    "device.uuid":d,
                    "device.nickname": f,
                    "device.username": c
                })
            } else {
                if (b == c) {
                    $.post("/update", {
                        "device.id": e,
                        "device.uuid":d,
                        "device.nickname": a,
                        "device.username": f
                    })
                }
            }
        }
        $(this).parent().html(f);
        if (b == a) {
            window.parent.editMacName(d, f)
        }
    })
}
function allChoice() {
    $(".all_select").click(function () {
        if ($(this).prop("checked")) {
            allChoice_yes()
        } else {
            allChoice_no()
        }
    });
    idex()
}
function allChoice_yes() {
    $(" :checkbox").prop("checked", true);
    $(".center_box_top1  span").text("\u9359\u6828\u79f7\u5bb8\u67e5\ufffd\ufffd")
}
function allChoice_no() {
    $(" :checkbox").removeProp("checked");
    $(".center_box_top1  span").text($("#quxiao").val())
}
function addFacility() {
    $(".add_device").click(function () {
        $(".fixed_0_0").slideDown(800)
    });
    $(".add_Cancel").click(function () {
        $(".fixed_0_0").slideUp(800)
    });
    $(".add_ok").click(function () {
        $(".fixed_0_0").attr("data", "add_yes");
        $(".fixed_0_0").hide();
        var a = $("#addForm").serialize();
        $.ajax({
            type: "post",
            url: "/cloud_device_add_null",
            data: a,
            cache: false,
            dataType: "json",
            success: function (j) {
                if (j.status == 3) {
                    var b = j.mac;
                    var f = j.message;
                    var i = "<tr><td class='hidden'>" + j.message + "</td>";
                    var h = "<td> <span class='td_index'></span></td>";
                    var g = " <td  class= 'td_bg_1'>" + $(".f_number").val() + "</td >";
                    var e = "<td class='td_bg'>" + $(".f_name").val() + "</td>";
                    var d = "<td class = 'td_bg' >" + $(".f_uname").val() + "</td>";
                    var c = "<td><span class='delete icon_delete'  onclick='firm(\"" + j.mac + '","' + j.message + "\",this);'></span></td></tr > ";
                    var k = i + h + g + e + d + c;
                    $(".content_box_table tbody:last-child").append(k);
                    idex();
                    alert("min")
                    window.parent.addMacAjax(j.mac, j.name, j.username, j.password)
                } else {
                    $.MsgBox.Alert(Message_title, j.message, Message_Ok, " ", true)
                }
            }
        })
    })
}
function dele() {
    $(".delete_button").click(function () {
        var c = 0;
        var b = $(".input_checkbox").length - 1;
        for (var a = b; a >= 0; a--) {
            if ($(".input_checkbox:eq(" + a + ")").prop("checked")) {
                c++;
                if (c == 1) {
                    if (confirm("\u7ead\ue1bc\u757e\u7455\u4f78\u57b9\u95c4\u3085\u51e1\u95ab\u590e\ue195\u6fb6\u56f7\u7d35")) {
                        dele_all(a)
                    } else {
                        allChoice_no();
                        return
                    }
                } else {
                    dele_all(a)
                }
            }
        }
        allChoice_no();
        idex()
    })
}
function dele_all(b) {
    var c = b + 1;
    var a = ".content_box tr:eq(" + c + ")";
    $(a).remove()
}
function idex() {
    var c = $(".content_box tr").length;
    for (var a = 0; a < c; a++) {
        var b = ".td_index:eq(" + a + ")";
        $(b).text(a + 1)
    }
};
