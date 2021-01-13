<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: yangzhongqiu
  Date: 2015-03-24
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>白名单</title>

    <link href="/cloud/css/public-min.css" type="text/css" rel="stylesheet">
    <link href="/cloud/main/css/pagelist-min.css" type="text/css" rel="stylesheet">
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">
<input class="delete_error" type="hidden" value="<s:text name="device_delete_confirm"/>">
<input class="total" type="hidden" value="${total}">
<input class="pub_delete" value="<s:text name="pub_delete"/>" type="hidden">

<table class="black_table">
    <thead class="thead">
    <th>
        <s:text name="device_index"/>
    </th>
    <th>
        <s:text name="device_number"/>
    </th>
    <th style="position: relative">
        <s:text name="pub_operation"/>&nbsp;&nbsp;<a class="add" href="#0">+</a>
        <input id="BWStatus" type="checkbox" ${bwStatus} alt="启用状态">

        <div class="add_div">
            <span class="prompt"><s:text name="device_number"/></span>
            <input type="text" class="add_input">

            <div class="submit_div">
                <div class="error_div"></div>
                <span class="submit fl"><s:text name="pub_ok"/></span><span class="giveup fr"><s:text
                    name="pub_cancel"/></span>
            </div>
        </div>
    </th>
    </thead>
    <tbody>
    <s:iterator value="dataList" var="device" status="index">
        <tr>
            <td>${index.index+1}</td>
            <td>${device.mac}</td>
            <td><span class="delete icon_delete" data-mac="${device.mac}" onclick="firm(this)"></span></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
<div style="width: 100%;height: 80px"></div>
<div id="pagelist">
    <ul>
        <li id="Pglist"><s:text name="tips_1360"/><select id="pg_list">
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="40">40</option>
            <option value="50">50</option>
        </select><s:text name="tips_1369"/>
        </li>
        <li id="home_page"><s:text name="tips_1361"/></li>
        <li id="up_page"><s:text name="tips_1362"/></li>
        <li id="pg1"></li>
        <li id="pg2"></li>
        <li id="pg3"></li>
        <li id="pg4"></li>
        <li id="pg5"></li>
        <li id="next_page"><s:text name="tips_1363"/></li>
        <li id="end_page"><s:text name="tips_1364"/></li>
        <li><s:text name="tips_1365"/><input class="page_number" type="text"><s:text name="tips_1370"/></li>
        <li id="go_page">go <span class="Page_error"></span></li>
        <li id="all_page" class="pageinfo"><s:text name="tips_1366"/><span class="pg_sum"></span><s:text
                name="tips_1370"/></li>
        <li id="all_number" class="pageinfo"><s:text name="tips_1366"/><span class="number_sum">${total}</span><s:text
                name="tips_1367"/></li>
        <li class="relative"><input type="text" class="search"><span class="search_text"><s:text
                name="tips_1368"/></span></li>
    </ul>
</div>
</body>
</html>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript">
    var sum =${total};
    var ajax_url = "/cloud_whiteList_delete4Mac_null";
    var json_url = "/cloud_whiteList_add_null?mac=";

    $(".total").val(sum);
    $(function () {
        sPage(${total});//信息条数
        input_show();
    });

    function this_page(n) {
        var rows = $('#pg_list').val();
        var number = (n - 1) * rows;
        var _tbody = $('.black_table tbody');
        _tbody.html('<tr><td colspan="4">load...</td></tr>');
        $.getJSON('/cloud_whiteList_list_null?page=' + n + '&rows=' + rows + '&total=' + sum,
                function (data) {
                    $.each(data, function (i, item) {
                        if (i == 0)_tbody.html('')
                        _tbody.append('<tr><td>' + (number + i + 1) + '</td><td>' + item.mac + '</td><td><span data-mac="' + item.mac + '" class="delete icon_delete" onclick="firm(this)"></span></td></tr>');
                    });

                });
    }
    function input_show() {
        $(".search").val($(".search_text").text());
        $(".search").focus(function () {
            $(this).val("");
        });
        $(".search").blur(function () {
            if ($(".search").val() == '')
                $(".search").val($(".search_text").text());
        });
        //表单键盘事件，任意输入使遮罩隐藏
        $(".search").val($(".search_text").text());
        $(".search").focus(function () {
            $(this).val("");
        });
        $(".search").blur(function () {
            if ($(".search").val() == '')
                $(".search").val($(".search_text").text());
        });
        $(".search").keydown(function (e) {
            var _mac = $(".search").val();
            if (e.keyCode == '13') {
                if (_mac != "") {
                    var _tBody = $('.black_table tbody');
                    _tBody.html('');
                    $.getJSON('/cloud_whiteList_ajaxLikeList_null?mac=' + _mac,
                            function (data) {
                                $.each(data, function (i, item) {
                                    if (i == 0)_tBody.html('')
                                    _tBody.append('<tr><td>' +
                                    (i + 1) + '</td><td>' +
                                    item.mac + '</td><td>' +
                                    '<span data-mac="' + item.mac + '" class="delete icon_delete" onclick="firm(this)"></span></td></tr>');
                                });
                            });
                }
            }
        });

    }
</script>
<script type="text/javascript" src="/cloud/js/public_list-min.js"></script>
