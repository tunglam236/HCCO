<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin HCCO | Log in</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="/image/favicon.ico" sizes="32x32">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link href="/dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/dist/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
    
    <script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>Admin</b>HCCO</a>
        </div>
        <div class="login-box-body">
            <p class="login-box-msg">
                Đăng nhập hệ thống quản lý chuỗi</p>
            <div class="form-group has-feedback">
                <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control" placeholder="Tài khoản"></asp:TextBox>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control"
                    placeholder="Mật khẩu"></asp:TextBox>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button id="btnlogin" class="btn btn-primary btn-block btn-flat" onclick="return admin_login();">
                        Đăng nhập</button>
                </div>
            </div>
            <div style="text-align: center; margin-top: 10px;">
                <a href="#" data-toggle="modal" data-target="#myForgot">Bạn quên mật khẩu</a>
            </div>
        </div>
    </div>
      <div class="modal fade" id="myForgot" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4 class="modal-title center">
                    <i class="fa fa-unlock" aria-hidden="true"></i> Khôi phục mật khẩu</h4>
            </div>
            <div class="modal-body">
                <div class="row" style="padding:5px;">
                        <div style="font-weight:bold; text-transform:uppercase; font-size:16px; text-align:center;">
                            Thông tin tài khoản</div>
                        <div style="padding:5px;">
                            <asp:TextBox ID="txtRefEmail" runat="server" MaxLength="32" CssClass="form-control"
                                Width="100%" placeholder="Nhập email bạn đã đăng kí"></asp:TextBox></div>
                        <div style="padding:5px;">
                            <i>Chúng tôi sẽ gửi mật khẩu mới vào email của bạn. Sau đó bạn hãy thay đổi mật khẩu để đảm bảo an toàn !</i>
                        </div>
                        <div class="center btn-group" style="padding:5px;">
                            <asp:Button ID="btnGetPass" runat="server" CssClass="btn btn-primary" Text="Gửi lại mật khẩu cho tôi"
                                OnClientClick="return forgotpass();" />
                                <button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
                        </div>
                        <div class="center">
                            <asp:Literal ID="lb2" runat="server"></asp:Literal>
                        </div>
                </div>
                </div>
                </div>
                </div>
                </div>
    <div class="alert alert-success" id="success-alert" style="position: fixed; bottom: 13%;
        right: 0px; width: auto; z-index: 9999;">
        <button type="button" class="close" data-dismiss="alert">
            x</button>
        <b>Thông báo ! </b>
        <div id="lbmess" style="display: inline; padding: 10px;">
            ...</div>
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#success-alert").hide();
        });
    </script>
    <script type="text/javascript">
        function showAlert(x) {
            var m = document.getElementById("lbmess");
            m.innerHTML = x;
            $("#success-alert").fadeTo(5000, 5000).slideUp(1000, function () {
                $("#success-alert").slideUp(1000);
            });
        }
        function admin_login() {
            var email = document.getElementById("txtAccount");
            var pw = document.getElementById("txtPassword");
            if (email.value.length == 0 || pw.value.length == 0) {
                showAlert('Nhập email và mật khẩu');
                return false;
            }
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/admin_login',
                    data: '{"us":"' + email.value + '","pw":"' + pw.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.Ok) {
                            email.value = '';
                            pw.value = '';
                            showAlert(data.d.Mess);
                            window.location.href = '/home';
                        }
                        else showAlert(data.d.Mess);
                    }
                });
                return false;
            }
        }
        function forgotpass() {
            var email = document.getElementById("txtRefEmail");
            if (email.value.length == 0) {
                showAlert('Nhập email');
                return false;
            }
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/forgotPass',
                    data: '{"email":"' + email.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == 'ok') {
                            showAlert(data.d._mess);
                        }
                        else showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
    </script>
</body>
</html>
