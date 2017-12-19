﻿<%@ Page Title="Danh mục chuỗi" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="BranchType.aspx.cs" Inherits="BranchType" %>

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
       <div class="col-xs-12 col-md-12">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-opencart"></i> Quản lý chuỗi</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addbranch();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addBranch"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm chuỗi</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Website</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Facebook</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Instagram</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày tạo</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1050px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Mã</th>
                        <th class="bg-th">Tên chuỗi</th>
                        <th class="bg-th">Website</th>
                         <th class="bg-th">Facebook</th>
                         <th class="bg-th">Instagram</th>
                        <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Người tạo</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Mã</th>
                        <th class="bg-th">Tên chuỗi</th>
                        <th class="bg-th">Website</th>
                        <th class="bg-th">Facebook</th>
                         <th class="bg-th">Instagram</th>
                        <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Người tạo</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addBranch" role="dialog">
        <div class="modal-dialog  modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>
                        <span id="lb">THÊM CHUỖI</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin chuỗi</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Mã chuỗi<br />
                            <input type="text" id="txtCode" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-6">Tên chuỗi<br />
                            <input type="text" id="txtName" class="numbers form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">Website<br />
                            <input type="text" id="txtWeb" class="form-control" style="width: 100%;" />
                        </div>
                       
                        <div class="col-md-6">Facebook<br />
                            <input type="text" id="txtFacebook" class="numbers form-control" style="width: 100%;" />
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                        <div class="col-md-6">Instagram<br />
                            <input type="text" id="txtInstagram" class="form-control" style="width: 100%;" />
                        </div>
                       
                        <div class="col-md-6">Mô tả<br />
                            <input type="text" id="txtNote" class="numbers form-control" style="width: 100%;" />
                        </div>
                    </div>
                   
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                             <button type="button" id="removeBranch" style="display:none;" class="btn btn-success" onclick="deleteBranchType();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Hủy bỏ</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdId" value="" />
    <script>
        var options = ["1", "2", "3", "4", "5","6","7","8"];

        $('.ul-column a').on('click', function (event) {

            var $target = $(event.currentTarget),
            val = $target.attr('data-column'),
            $inp = $target.find('input');
            var idx = 0;

            if ((idx = options.indexOf(val)) > -1) {
                options.splice(idx, 1);
                setTimeout(function () { $inp.prop('checked', false) }, 0);
            } else {
                options.push(val);
                setTimeout(function () { $inp.prop('checked', true) }, 0);
            }

            $(event.target).blur();
            return false;
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
                "pageLength": 20,
                "autoWidth": false,
                "order": [[0, 'asc']],
                "columnDefs": [
                {
                    "targets": [],
                    "visible": false,
                    "searchable": false
                }],
                dom: 'Bfrtip',
                buttons: [
                     {
                         extend: 'copyHtml5',
                         text: 'Copy',
                         exportOptions: {
                             columns: ':visible'
                         }
                     },
                    {
                        extend: 'print',
                        text: 'Print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
			        {
			            extend: 'excelHtml5',
			            text: 'Export',
			            exportOptions: {
			                columns: ':visible'
			            }
			        }],
                language: {
                    buttons: {
                        copy: 'Copy danh sách',
                        print: 'In danh sách',
                        excel: 'Xuất Excel'
                    }
                }
            });

            $('a.toggle-vis').on('click', function (e) {
                e.preventDefault();
                var column = table.column($(this).attr('data-column'));
                column.visible(!column.visible());
            });

            $('#example2 tbody').on('click', 'tr.detail-rows', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);
                if (row.child.isShown()) {
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    var id = row.selector.rows.prevObject.context.id;
                    var html = '';
                }
            });
        });
    </script>
    
    <script type="text/javascript">
        function updateBranch_modal(id,code, name, web, fb, ins, note) {
            $("#addBranch").modal({ show: false });
            $('#hdId').val(id);
            $('#txtName').val(name);
            $('#txtCode').val(code);
            $('#txtWeb').val(web);
            $('#txtFacebook').val(fb);
            $('#txtInstagram').val(ins);
            $('#txtNote').val(note);
            $('#removeBranch').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT CHUỖI';
        }
        function addbranch() {
            $("#addBranch").modal({ show: false });
            $('#hdId').val('');
            $('#txtName').val('');
            $('#txtCode').val('');
            $('#txtWeb').val('');
            $('#txtFacebook').val('');
            $('#txtInstagram').val('');
            $('#txtNote').val('');
            $('#removeBranch').hide();
            document.getElementById('lb').innerText = 'THÊM CHUỖI';
        }
        function saveChanges() {
            var id = $('#hdId').val();
            if (id =='') {
                var name = $('#txtName').val();
                var code = $('#txtCode').val();
                var web = $('#txtWeb').val();
                var fb = $('#txtFacebook').val();
                var ins = $('#txtInstagram').val();
                var note = $('#txtNote').val();

                if (name != '' && code != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertBranchType',
                        data: '{"code":"' + code + '","name":"' + name + '","web":"' + web + '","face":"'+fb+'","instagram":"'+ins+'","note":"' + note + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                              
                                showAlert('Đã thêm chuỗi [' + name + ']');
                                
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 2000);
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Nhập mã và tên chuỗi');
            }
            else {
                updateChanges();
            }
        }
        function updateChanges() {
            var name = $('#txtName').val();
            var code = $('#txtCode').val();
            var web = $('#txtWeb').val();
            var fb = $('#txtFacebook').val();
            var ins = $('#txtInstagram').val();
            var note = $('#txtNote').val();
            var id = $('#hdId').val();

            if (name != '' && code != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateBranchType',
                    data: '{"id":"' + id + '","code":"' + code + '","name":"' + name + '","web":"' + web + '","face":"'+fb+'","instagram":"'+ins+'","note":"' + note + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            
                            showAlert('Đã cập nhật chuỗi [' + name + ']');
                            
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 2000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            else showAlert('Nhập mã và tên chuỗi');
        }
        function deleteBranchType() {
            var id = $('#hdId').val();
            var name = $('#txtName').val();

            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteBranchType',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdId').val('');
                                $('#txtName').val('');
                                $('#txtCode').val('');
                                $('#txtWeb').val('');
                                $('#txtFacebook').val('');
                                $('#txtInstagram').val('');
                                $('#txtNote').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa chuỗi [' + name + ']');
                                $("#addBranch").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn chuỗi muốn xóa');
            }
        }
    </script>
</asp:Content>

