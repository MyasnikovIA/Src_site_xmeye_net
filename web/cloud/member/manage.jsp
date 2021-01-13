<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="/cloud/css/public-min.css" type="text/css" rel="stylesheet">
    <link href="/cloud/member/css/user_manage.css" type="text/css" rel="stylesheet">
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">
<input class="delete_error" style="display: none" hidden="hidden" type="text"
       value="<s:text name="user_delete_confirm"/>">
<input class="default_password_confirm" style="display: none" hidden="hidden" type="text"
       value="<s:text name="default_password_confirm"/>">
<input class="total" style="display: none" hidden="hidden" type="text">
<!--<%--用户管理--%>-->
<table class="u_manage">
    <thead>
    <th>
        <s:text name="device_index"/>
    </th>
    <th>
        <s:text name="login_username"/>
    </th>
    <th>
        <s:text name="user_truename"/>
    </th>
    <th>
        <s:text name="user_contact"/>
    </th>
    <th>
        <s:text name="user_address"/>
    </th>
    <th>
        <s:text name="user_mail"/>
    </th>
    <th width="100px">
        <s:text name="pub_operation"/>&nbsp;&nbsp;<a href="#"></a>
    </th>
    </thead>
    <tbody>
    <s:iterator value="dataList" var="user" status="index">
        <tr>
            <td>${index.index+1}</td>
            <td>${user.username}</td>
            <td>${user.truename}</td>
            <td>${user.phone}</td>
            <td>${user.address}</td>
            <td>${user.mail}</td>
            <td>
                <span class="update icon_edit" data-src="/cloud_user_info_member?userId=${user.id}"></span>
                <span data-id="${user.id}" class="delete icon_delete" onclick="firm_User(this)"></span><br/>
                <span data="${user.id}" class="restorePassword"><s:text
                        name="restore_default_password"/></span>
            </td>
        </tr>
    </s:iterator>
    </tbody>
</table>
<div style="width: 100%;height: 80px;"></div>
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
                name="tips_1371"/></span></li>
    </ul>
</div>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript" src="/cloud/member/js/flip_window-min.js"></script>
<script type="text/javascript">

    var Message_Ok = $("#Message_Ok").val();
    var Message_Cancel = $("#Message_Cancel").val();
    var Message_title = $("#Message_Title").val();

    var sum =${total};
    $(".total").val(sum);
    function firm_User(even) {
        var id = $(even).attr("data-id");
        $.MsgBox.Confirm(Message_title, $('.delete_error').val(), Message_Ok, Message_Cancel, true, function () {
            //   $.MsgBox.Confirm("Message", $('.delete_error').val(), true, function () {
            $.post("/cloud_user_delete_null", {userId: id});
            $(even).parent().parent('tr').remove();
            sum--;
            $('.number_sum').text(sum);
        });
    }


    $(function () {
        $(".u_manage").delegate("tr td  .update", "click", function () {
            alert_box("800px", "530px", $(this).attr('data-src'));
        });

        $(".u_manage tbody").delegate("tr td .restorePassword", "click", function () {
            var uid=$(this).attr('data');
            $.MsgBox.Confirm(Message_title, $('.default_password_confirm').val(), Message_Ok, Message_Cancel, true, function () {
                $.post("/cloud_user_restorePassword_null", {'userId': uid}, function (data) {
                    $.MsgBox.Alert(Message_title, data, Message_Ok, " ", true);
                });
            })
        });

        $('.submit_div .submit').click(function () {
            var mac = $(".add_input").val();
            if (mac != '')
                $.getJSON('/cloud_whiteList_add_null?mac=' + mac,
                        function (data) {
                            if (data.status != 1200) {
                                $(".error_div").text(data.message);
                            } else {
                                var nu = parseInt($(".black_table tr:last-child td:first-child").text()) + 1;
                                var tr = '<tr><td>' + nu + '</td><td>' + data.mac + '</td><td><span data-id="' + data.mac + '" class="delete icon_delete" onclick="firm_User(this)"></span></td></tr>';
                                $(".black_table tbody:last-child").append(tr);
                                hideAdd();
                                sum++;
                            }
                        });
        });

        sPage(${total});//信息条数
        input_show();
    });

    function this_page(n) {
        var rows = $('#pg_list').val();
        var number = (n - 1) * rows;
        var _tbody = $('.u_manage tbody');
        _tbody.html('<tr><td colspan="6">load...</td></tr>');
        $.getJSON('/cloud_user_ajaxList_null?page=' + n + '&rows=' + rows + '&total=' + sum,
                function (data) {
                    $.each(data, function (i, item) {
                        if (i == 0)_tbody.html('')
                        _tbody.append('<tr><td>' +
                        (number + i + 1) + '</td><td>' +
                        item.username + '</td><td>' +
                        item.truename + '</td><td>' +
                        item.phone + '</td><td>' +
                        item.address + '</td><td>' +
                        item.mail + '</td><td><span class="update icon_edit" data-src="/cloud_user_info_member?userId=' + item.id + '"></span>' +
                        '<span data-id="' + item.id + '" class="delete icon_delete"  onclick="firm_User(this)"></span><br/>' +
                        '<span data="' + item.id + '" class="restorePassword" ><s:text name="restore_default_password"/></span></td></tr>');
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
        $(".search").keydown(function (e) {
            var _userName = $(".search").val();
            if (e.keyCode == '13') {
                if (_userName != "") {
                    var _tBody = $('.u_manage tbody');
                    _tBody.html('')
                    $.getJSON('/cloud_user_ajaxLikeList_null?userName=' + _userName,
                            function (data) {
                                $.each(data, function (i, item) {
                                    if (i == 0)_tBody.html('')
                                    _tBody.append('<tr><td>' +
                                    (i + 1) + '</td><td>' +
                                    item.username + '</td><td>' +
                                    item.truename + '</td><td>' +
                                    item.phone + '</td><td>' +
                                    item.address + '</td><td>' +
                                    item.mail + '</td><td><span class="update icon_edit"data-src="/cloud_user_info_member?userId=' + item.id + '"></span>' +
                                    '<span data-id="' + item.id + '" class="delete icon_delete"  onclick="firm_User(this)"></span><br/>' +
                                    '<span data="' + item.id + '" class="restorePassword"><s:text name="restore_default_password"/></span></td></tr>');
                                });
                            });
                }
            }
        });
    }

</script>
<script type="text/javascript" src="/cloud/js/public_list-min.js"></script>