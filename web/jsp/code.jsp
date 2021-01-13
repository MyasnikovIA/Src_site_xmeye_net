<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="icon" type="image/png" href="/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/admin.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/cloud/main/css/facility_manage.css" type="text/css" rel="stylesheet">
    <style>
        .hidden {
            display: none !important;
        }
        .ok {
            color: blue!important;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">
<input type="hidden" id="quxiao" value="全部勾选">
<input type="hidden" id="giveUp" value="<s:text name='Cancel'/>">
<input type="hidden" id="MacError" value="<s:text name="tips_1380"/>">
<input type="hidden" id="tianjia" value="<s:text name='pub_add'/>"/>
<div class="content_box">
    <div class="content_box_header">
        <span style="margin-left: 55px;" class="fl">授权系统</span>

        <div style="margin-right: 55px;margin-left: 10px;cursor: pointer" class="fr add_device">
            <%--<s:text name="pub_add"/>--%>添加授权
        </div>
        <span class="icon_addFac add_device fr"
              type="button"
              data-am-modal="{target: '#sq_modal', closeViaDimmer: 0, width: 500, height: 600}"></span>
    </div>
    <table class="content_box_table">
        <thead>
        <th>
            序号
        </th>
        <th>
            设备序列号
        </th>
        <th>
            CSS
        </th>
        <th>
            DSS
        </th>
        <th>
            P2P
        </th>
        <th>
            PMS
        </th>
        <th>
            TPS
        </th>
        </thead>
        <tbody>
        <s:iterator value="#session.deviceCode" var="code">
            <tr>
                <td class="dev_id">${code.id}</td>
                <td class="td_bg">${code.uuid}</td>
                <td class="td_bg">${code.css}</td>
                <td class="td_bg">${code.dss}</td>
                <td class="td_bg">${code.p2p}</td>
                <td class="td_bg">${code.pms}</td>
                <td class="td_bg">${code.tps}</td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="sq_modal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">设备授权
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </div>
        <%--<form class="am-modal-bd">--%>
        <form id="code-form" class="am-form am-padding-xl am-padding-bottom-sm" method="post"
              action="findpassword.action" novalidate="novalidate">
            <div id="yunpan-forgotpassword-form" class="am-form am-padding" novalidate="novalidate">
                <div id="tips" class="error"></div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon am-icon-lock"></i></span>
                    <input type="text" id="fp_new_password" name="uuid" class="am-form-field am-radius"
                           placeholder="要授权的设备序列号">
                </div>
                <div class="am-form-group am-input-group">
                    <span class="am-input-group-label"><i class="am-icon am-icon-lock"></i></span>
                    <%--<input type="text" id="fp_confirm_password" name="type" class="am-form-field am-radius"
                           placeholder="授权类型(css,dss,p2p,pms,tps)">--%>
                    <select name="type">
                        <option value="css">CSS</option>
                        <option value="dss">DSS</option>
                        <option value="p2p">P2P</option>
                        <option value="pms">PMS</option>
                        <option value="tps">TPS</option>
                    </select>
                </div>
                <p>
                    <button id="forgotPasswordBtn" type="button" class="am-btn am-btn-warning am-btn-block"
                            onclick="codeformAjax('code-form','open')"
                            style="background-color: #a2a2a2;border-color: #a2a2a2;">确 认
                    </button>
                </p>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script src="/js/jquery.min.js"></script>
<script src="/js/amazeui.min.js"></script>
<script type="text/javascript" src="/js/codestatus.js"></script>
<script>
    function codeformAjax(a, b) {
        a = "#" + a;
        $.ajax({
            type: "POST",
            url: b,
            data: $(a).serialize(),
            success: function (data) {
                if (data == 2000)
                {
                    $("#tips").html("授权成功").addClass("ok");
                    setTimeout(function () {
                        $("#sq_modal").modal("close");
                    }, 2000)
                }
//                    $("#tips").html(codestatus(data));
            }
        })
    }
</script>