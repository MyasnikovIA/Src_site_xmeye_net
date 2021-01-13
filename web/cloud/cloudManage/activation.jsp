<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>激活界面</title>
    <style type="text/css">
        body {

        }

        .pos-abs {
            position: absolute;
            top: 40%;
            left: 0;
            width: 100%;
            height: 5em;
            text-align: center
        }

        #actClick {
            cursor: pointer;
            color: #007aff
        }

        #actClick:hover {
            color: #005bb5
        }
    </style>
</head>
<body>
<input type="hidden" id="Message_Ok" value="<s:text name="pub_ok"/>">
<input type="hidden" id="Message_Cancel" value="<s:text name='Cancel'/>">
<input type="hidden" id="Message_Title" value="<s:text name='tips_1313'/>">

<div class="pos-abs">
    <s:text name="cloud_click_now"/>
    <span id="actClick"><s:text name="cloud_acti"/></span>
</div>
</body>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/cloud/cloudManage/js/flip_window.js"></script>
<script type="text/javascript" src="/js/confirm-min.js"></script>
<script type="text/javascript">
    var Message_Ok = $("#Message_Ok").val();
    var Message_Cancel = $("#Message_Cancel").val();
    var Message_title = $("#Message_Title").val();
    function _parent(name) {
        return $("body", parent.document).find(name);
    }
    $(function () {
        $("#actClick").click(function () {
            $.ajax({
                type: "post",
                url: "/cloudMange/cloud_cloudM_actClick_cloudManage",
                success: function (data) {
                    if (data == 200) {
                        _parent(".cloudShare .v_li_back").click();
                    } else if (data = 400) {
                        $.MsgBox.Alert(Message_title, "激活失败", Message_Ok, " ", true);
                        setTimeout(function () {
                            _parent("#mb_btn_ok").click();
                        }, 1000);
                    }
                }
            });
        });
    });
</script>
</html>