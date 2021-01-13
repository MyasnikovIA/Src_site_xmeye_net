/**
 * Created by hejieming on 2015-04-14.
 */
function showDownLoadCode(e) {
    window.open("/download/ocx/Active.exe");
   /* $(".OcxDown").slideDown(300);
    $('#verificationCode3').val('');
    ref3(this);*/
    //$('#OcxDown').show();
}
function hideDown(e) {
    $(".OcxDown").slideUp(300);
    $('#errorMessage').text("");
}

function download_file() {
    var code = $("#verificationCode3").val();
    $.ajax({
        type: "POST",
        url: 'download_check',
        data: {'verificationCode3': code},
        success: function (data) {
            var jsonData = $.parseJSON(data);
            if (jsonData.status == 1200) {
                $('#errorMessage').text("");
                $("#ocxDownload input[name=checkCode]").val(jsonData.message)
                $("#ocxDownload").submit();
                hideDown(this);
            } else {
                $('#errorMessage').text(jsonData.message);
            }
        }
    })
}