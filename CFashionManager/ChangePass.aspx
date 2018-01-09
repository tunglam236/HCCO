<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="ChangePass.aspx.cs" Inherits="ChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>Admin</b>HCCO</a>
        </div>
        <div class="login-box-body">
            <p class="login-box-msg">
                Thay đổi thông tin mật khẩu</p>
            <div class="form-group has-feedback">
            <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control" placeholder="Nhập tài khoản"></asp:TextBox>
                
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="txtPassOld" class="form-control" placeholder="Mật khẩu cũ" />
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="txtPassword1" class="form-control" placeholder="Mật khẩu mới" />
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="txtPassword2" class="form-control" placeholder="Nhập lại mật khẩu mới" />
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button id="btnSave" onclick="return changepass();" class="btn btn-primary btn-block btn-flat">Thay đổi mật khẩu</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function changepass() {
            var email = $("#cph_txtAccount").val();
            var pwold = $("#txtPassOld").val();
            var pw1 = $("#txtPassword1").val();
            var pw2 = $("#txtPassword2").val();
            if (email.length == 0 || pwold.length == 0 || pw1.length == 0 || pw2.length == 0)
                showAlert('Nhập đầy đủ thông tin tài khoản');
            else if (pw1 != pw2)
                showAlert('Nhập mật khẩu xác nhận không đúng');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/changepass',
                    data: '{"email":"' + email + '","passold":"' + pwold + '","pass":"' + pw1 + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $("#cph_txtAccount").val('');
                        $("#txtPassOld").val('');
                        $("#txtPassword1").val('');
                        $("#txtPassword2").val('');
                        showAlert(data.d);
                    }
                });
            }
            return false;
        }
    </script>
</asp:Content>
