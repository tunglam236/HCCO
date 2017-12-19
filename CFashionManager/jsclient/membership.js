function getId(x) {
    $.ajax({
        type: "POST",
        url: "Home.aspx/detail",
        data: "{id:" + x + "}",
        contentType: "application/json; charset=utf-8"
    }).done(function (o) {
        $("#txtCode").val(o.d.Code);
        $("#txtName").val(o.d.Name);
        $("#txtPhone").val(o.d.Phone);
        $("#txtEmail").val(o.d.Email);
        $("#txtAddress").val(o.d.Address);
        $("#txtBirth").val(o.d.Birth);
        $("#txtAccount").val(o.d.Username);
        if (o.d.Status == '1')
            $("#rdActive").prop("checked", true);
        else
            $("#rdInActive").prop("checked", true);
        $('#btnSave').css('display', 'none');
        $('#btnUpdate').css('display', 'block');
    });
}
function add() {
    var status = $('input[id="rdActive"]:checked').val();
    var code = $("#txtCode").val();
    var name = $("#txtName").val();
    var phone = $("#txtPhone").val();
    var email = $("#txtEmail").val();
    var add = $("#txtAddress").val();
    var birth = $("#txtBirth").val();
    var acc = $("#txtAccount").val();
    var pw = $("#txtPass").val();
    if (status == 'rdActive') status = '1';
    else status = '0';
    $.ajax({
        type: "POST",
        url: "Home.aspx/add",
        data: "{code:'" + code + "',name:'" + name + "',phone:'" + phone + "',email:'" + email + "',add:'" + add + "',status:" + status + ",birth:'" + birth + "',acc:'" + acc + "',pass:'" + pw + "'}",
        contentType: "application/json; charset=utf-8"
    }).done(function (o) {
        if (o.d.Key == "1") {
            resetControl();
            alert(o.d.Name);
            window.location.href = 'Home.aspx';
        }
        else alert(o.d.Name);
    });
}
function removeId(x) {
    $.ajax({
        type: "POST",
        url: "Home.aspx/remove",
        data: "{id:" + x + "}",
        contentType: "application/json; charset=utf-8"
    }).done(function (o) {
        if (o.d.Key == "1") {
            alert(o.d.Name);
            window.location.href = 'Home.aspx';
        }
        else alert(o.d.Name);
    });
}
function resetControl() {
    $("#txtCode").val("");
    $("#txtName").val("");
    $("#txtPhone").val("");
    $("#txtEmail").val("");
    $("#txtAddress").val("");
    $("#txtBirth").val("");
    $("#txtAccount").val("");
    $("#txtCode").focus();
    $("#rdActive").prop("checked", true);
    $('#btnSave').css('display', 'block');
    $('#btnUpdate').css('display', 'none');
}