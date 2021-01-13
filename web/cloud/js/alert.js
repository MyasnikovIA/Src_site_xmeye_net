/**
 * Created by ynq on 2015-10-15.
 */

function alert_info(title, msg, hasParent) {
    alert(msg);
    var titleBox;
    var messBox;
    var Dialog;
    if (hasParent) {
        titleBox = _parent("#DialogTitle");
        messBox = _parent("#DialogMessage");
        Dialog = _parent("#Dialog")
    } else {
        titleBox = $("#DialogTitle");
        messBox = $("#DialogMessage");
        Dialog = $("#Dialog");
    }
    titleBox.text(title);
    messBox.text(msg);
    Dialog.show();


}


function hide_Dialog() {
    $("#Dialog").hide();
}

function _parent(name) {
    return $("body", parent.document).find(name)
}
