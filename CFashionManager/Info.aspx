<%@ Page Title="Thông tin cá nhân" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#settings" data-toggle="tab">Đổi mật khẩu</a></li>
            </ul>
            <div class="tab-content" style="height:240px">
               <div class="active tab-pane" id="settings">
                <form class="form-horizontal">
                  <div class="form-group" style="min-height:30px">
                    <label for="txtPassOld" class="col-sm-2 control-label">Mật khẩu cũ</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="txtPassOld" placeholder="">
                    </div>
                  </div>
                  <div class="form-group" style="min-height:30px">
                    <label for="txtPassNew" class="col-sm-2 control-label">Mật khẩu mới</label>

                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="txtPassNew" placeholder="">
                    </div>
                  </div>
                  <div class="form-group" style="min-height:30px">
                    <label for="txtPassConfirm" class="col-sm-2 control-label">Xác nhận lại mật khẩu</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="txtPassConfirm" placeholder="">
                    </div>
                  </div>
                  <div class="form-group" style="min-height:30px">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a href="#" class="btn btn-danger" onclick="changePass();">Đổi mật khẩu</a>
                        <a href="/logout" class="btn btn-success">Đăng xuất</a>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script type="text/javascript">
        function changePass() {
            var pwOld = $('#txtPassOld').val();
            var pwNew = $('#txtPassNew').val();
            var pwConfirm = $('#txtPassConfirm').val();
            if (pwOld != '' && pwNew != '' && pwConfirm != '')
            {
                if (pwNew != pwConfirm)
                    showAlert('Mật khẩu xác nhận không trùng khớp');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/changepass',
                        data: '{"passold":"' + pwOld + '","passnew":"' + pwNew + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            showAlert(data.d);
                        }
                    });
                }
            }
            else showAlert('Nhập đầy đủ thông tin mật khẩu');
        }
    </script>
</asp:Content>

