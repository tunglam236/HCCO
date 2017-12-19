<%@ Page Title="Phân quyền tài khoản" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Role.aspx.cs" Inherits="Role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        td.childrows
        {
            background: url('/dist/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }
        tr.shown td.childrows
        {
            background: url('/dist/img/details_close.png') no-repeat center center;
        }
        #tbdetail tr td
        {
            border-bottom: 1px solid #ccc;
            line-height:35px;
        }
        label
        {
            font-weight: normal;
            cursor: pointer;
            font-size: 13px;
        }
        .list-group-item
        {
            padding: 7px 15px;
        }
        .bg-th
        {
            background-color: #F9F9F9;
        }
        .detail-rows
        {
            cursor: pointer;
        }
        
        .dropbtn
        {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        
        .dropbtn:hover, .dropbtn:focus
        {
            background-color: #3e8e41;
        }
        #myInput
        {
            border-box: box-sizing;
            background-image: url('searchicon.png');
            background-position: 14px 12px;
            background-repeat: no-repeat;
            font-size: 16px;
            padding: 14px 20px 12px 45px;
            border: none;
        }
        
        .dropdown
        {
            position: relative;
            display: inline-block;
        }
        
        .dropdown-content
        {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            min-width: 230px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        
        .dropdown-content a
        {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        
        .dropdown a:hover
        {
            background-color: #ddd;
        }
        
        .show
        {
            display: block;
        }
        .rdList { margin:5px; width:95%;}
        .rdList tr td { border-bottom:1px solid #ccc; padding:10px 0px;}
        .detail-rows:hover,#tbdetail tr:hover {background-color: whitesmoke !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
   <div class="col-xs-12 col-md-2" style=" padding:10px;">
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Nhóm người dùng</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdGroupUser" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              
              <a href="#" class="btn btn-primary" onclick="return ViewRole();" style="width:99%">Xem dữ liệu</a>
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
          <section class="">
           <div class="pull-left">
              <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-key"></i> Phân quyền tài khoản</h3>
           </div>
           <div style="text-align:right; padding-bottom:10px;">
            <label> <input id="checkall" type="checkbox" onchange="checkAll();" /> Chọn tất cả</label>
               <a href="#" onclick="saveChange();" class="btn btn-sm btn-success"><i class="glyphicon glyphicon glyphicon-edit"></i> Lưu phân quyền</a>
         </section>

          <div class="box box-warning">
            <div class="box-header">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover table-bordered table-striped cell-border" style="min-width:1050px; font-size:12px;">
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
  <img class="crop-loading" src="dist/img/crop.gif" style="display:none;position:fixed; top:50%; left:50%" />
 <script>
       $(window).load(function () {
           ViewRole();
       });
</script>
<script>
    function checkAll() {
        var c = $("#checkall:checked").val();
        var ck = c == 'on' ? true : false;

        $('table#example2 input[type=checkbox]').each(function () {
            $(this).prop("checked", ck);
        });
    }
    function ViewRole() {
        $('.crop-loading').show();
        $('#checkall').prop("checked", false);

        var id = $('#cph_rdGroupUser input:checked').val();
        if (id.length > 0) {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadRoleGroup',
                data: '{"idGroup":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $('#example2').DataTable({
                        data: JSON.parse('[' + data.d + ']'),
                        columns: [
                        { title: "Module" },
                        { title: "Xem dữ liệu" },
                        { title: "Thêm dữ liệu" },
                        { title: "Sửa dữ liệu" },
                        { title: "Xóa dữ liệu" }],
                        paging: true,
                        pageLength: 50,
                        destroy: true,
                        lengthChange: true,
                        searching: true,
                        //ordering: true,
                        info: true,
                        autoWidth: false
                    });
                }
            });
        }
        else
            $('#example2').empty();
        $('.crop-loading').hide();
        return false;
    }
    function saveChange() {
        $('.crop-loading').show();
        var count = 1; var code = '';
        $('table#example2 input[type=checkbox]').each(function () {
            if ($(this).is(":checked")) {
                if (count == 1 || count % 4 == 1)
                    code += $(this).attr('name') + ':1';
                else code += '#1';
                if (count % 4 == 0) code += '@';
            }
            else {
                if (count == 1 || count % 4 == 1)
                    code += $(this).attr('name') + ':0';
                else
                    code += '#0';
                if (count % 4 == 0) code += '@';
            }
            count++;
        });
        var gr = $('#cph_rdGroupUser input:checked').val();
        if (gr.length == 0)
            showAlert('Chọn nhóm người dùng');
        else {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/updateRole',
                data: '{"data":"' + code + '","groupId":"' + gr + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d._content == 'ok') {
                        $('.crop-loading').hide();
                        showAlert(data.d._mess);
                    }
                    else
                        showAlert(data.d._mess);
                }
            });
        }
        return false;
    }
</script>
</asp:Content>

