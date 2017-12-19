<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="BranchRole.aspx.cs" Inherits="BranchRole" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        td.childrows {
            background: url('/dist/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.childrows {
            background: url('/dist/img/details_close.png') no-repeat center center;
        }

        #tbdetail tr td, #tbdetailcombo tr td {
            border-bottom: 1px solid #ccc;
            line-height: 35px;
        }

        label {
            font-weight: normal;
            cursor: pointer;
            font-size: 13px;
        }

        .list-group-item {
            padding: 7px 15px;
        }

        .bg-th {
            background-color: #F9F9F9;
        }

        .detail-rows {
            cursor: pointer;
        }

        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

            .dropbtn:hover, .dropbtn:focus {
                background-color: #3e8e41;
            }

        #myInput {
            border-box: box-sizing;
            background-image: url('searchicon.png');
            background-position: 14px 12px;
            background-repeat: no-repeat;
            font-size: 16px;
            padding: 14px 20px 12px 45px;
            border: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            min-width: 230px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .format-input {
            width: 55px;
            height: 25px;
            text-align: center;
        }

        .rdList {
            margin: 5px;
            width: 95%;
        }

            .rdList tr td {
                border-bottom: 1px solid #ccc;
                padding: 10px 0px;
            }

        .detail-rows:hover, #tbdetail tr:hover, #tbdetailcombo tr:hover {
            background-color: whitesmoke !important;
        }
        .algn { vertical-align:middle !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-3" style=" padding:10px;">
       
           <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Người dùng</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdUser" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="btnView" runat="server" Text="Xem dữ liệu" OnClick="btnView_Click" CssClass="btn btn-primary" Style="width:99%;" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-9">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-envelope-o"></i> Phân quyền người dùng - chi nhánh</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addReport"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm báo cáo</a>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body">
                <table id="example2" class="table hover cell-border" style="min-width:915px; font-size:12px;">
                    <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">User</th>
                        <th class="bg-th">Họ và tên</th>
                        <th class="bg-th">Báo cáo</th>
                        <th class="bg-th">Thời gian</th>
                        <th class="bg-th">Cập nhật</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">User</th>
                        <th class="bg-th">Họ và tên</th>
                        <th class="bg-th">Báo cáo</th>
                        <th class="bg-th">Thời gian</th>
                        <th class="bg-th">Cập nhật</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addReport" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>THÊM BÁO CÁO</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-8">
                            Chi nhánh<br />
                            <select id="dlBranch" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                         <div class="col-md-4">
                            User<br />
                            <select id="dlUser" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Báo cáo<br />
                            <select id="dlReport" class="form-control select2" style="width: 100%;">
                            </select>
                        </div> 
                         <div class="col-md-4">
                            Thời gian<br />
                            <input type="text" id="txtTime" class="form-control" maxlength="5" value="" style="width: 100%;" />
                        </div>
                     </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
        function update(id) {
            if (confirm("Bạn chắc chắn muốn cập nhật ?") == true) {
                var hour = $('#id_' + id).val();

                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateTimeReport',
                    data: '{"Id":"' + id + '","hour":"' + hour + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1')
                            showAlert('Đã cập nhật thành công');
                        else showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function remove(id) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                var hour = $('#id_' + id).val();
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/removeTimeReport',
                    data: '{"Id":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('#send' + id).remove();
                            showAlert('Đã xóa thành công');
                        }
                        else showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function saveChanges() {
            var branchType = $('#dlBranchType').val();
            var branch = $('#dlBranch').val();
            var user = $('#dlUser').val();
            var report = $('#dlReport').val();
            var time = $('#txtTime').val();

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/insertReportMail',
                data: '{"branchType":"' + branchType + '","branch":"' + branch + '","user":"' + user + '","report":"' + report + '","time":"' + time + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d._content == '1') {
                        showAlert('Thêm báo cáo thành công');

                        setTimeout(function () {
                            window.location.href = window.location.href;
                        }, 2000);
                    }
                    else showAlert(data.d._mess);
                }
            });
            return false;
        }
    </script>
<script>
         function changeType(id) {
             loadDrop(id);
         }
         function loadDrop(branchTypeId) {
             $('#dlBranch').find('option').remove().end();
             $('#dlUser').find('option').remove().end();

             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/getBranchByType',
                 data: '{"typeId":"' + branchTypeId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     var c1 = document.getElementById('dlBranch');
                     for (var i = 0; i < data.d.length; i++) {
                         var opt = document.createElement('option');
                         opt.value = data.d[i]._content;
                         opt.innerHTML = data.d[i]._mess;
                         c1.appendChild(opt);
                     }
                 }
             });

             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/loadUserByBranchType',
                 data: '{"branchType":"' + branchTypeId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     var c1 = document.getElementById('dlUser');
                     for (var i = 0; i < data.d.length; i++) {
                         var opt = document.createElement('option');
                         opt.value = data.d[i]._id;
                         opt.innerHTML = data.d[i]._content;
                         c1.appendChild(opt);
                     }
                 }
             });
         }
    </script>
<script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getBranchType',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlBranchType');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    loadDrop($('#dlBranchType').val());
                }
            });

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadReportMail',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlReport');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._id;
                        opt.innerHTML = data.d[i]._content;
                        c1.appendChild(opt);
                    }
                }
            });
        });
    </script>
<script>
    $(window).load(function () {
        var table = $('#example2').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "pageLength": 25,
            "autoWidth": false,
            "order": [[3, 'asc']]
        });
    });
</script>
</asp:Content>


