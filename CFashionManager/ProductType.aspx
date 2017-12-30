<%@ Page Title="Danh mục nhóm sản phẩm" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ProductType.aspx.cs" Inherits="ProductType" %>
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
              <a data-toggle="collapse" href="#collapse3">Chuỗi cửa hàng</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdBranchType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sitemap"></i> Quản lý nhóm hàng</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addProductType();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addProductType"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm nhóm</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã nhóm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên nhóm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhóm cha</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày tạo</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:915px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Mã nhóm</th>
                        <th class="bg-th">Tên nhóm</th>
                        <th class="bg-th">Nhóm cha</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Mã nhóm</th>
                        <th class="bg-th">Tên nhóm</th>
                        <th class="bg-th">Nhóm cha</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addProductType" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>
                        <span id="lb">THÊM NHÓM SẢN PHẨM</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin nhóm sản phẩm</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeBranchType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-3">Nhóm cha<br />
                             <select id="dlGroup" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-3">
                            Mã nhóm sản phẩm<br />
                            <input type="text" id="txtCode" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Tên nhóm sản phẩm<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                         
                    </div>
                   
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 pull-right">
                            <span class=" btn-group">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeProductType" style="display:none;" class="btn btn-success" onclick="deleteProductType();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Hủy bỏ</button></span>
                            &nbsp;<label> <input type="checkbox" id="ckAutoLoad" checked="checked" /> Auto load</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdProductTypeId" value="" />
    <script>
        var options = ["1", "2", "3", "4"];
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
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copyHtml5',
                        text:'Copy',
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
    <script>
        function changeBranchType(id) {
             loadDrop(id);
         }
         function loadDrop(branchTypeId) {
             $('#dlGroup').find('option').remove().end();
             var c0 = document.getElementById('dlGroup');
             var opt_s = document.createElement('option');
             opt_s.value = '';
             opt_s.innerHTML = 'Chọn nhóm cha';
             c0.appendChild(opt_s);
             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/loadProductType',
                 data: '{"branchType":"' + branchTypeId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     var c1 = document.getElementById('dlGroup');
                     for (var i = 0; i < data.d.length; i++) {
                         var opt = document.createElement('option');
                         opt.value = data.d[i]._content;
                         opt.innerHTML = data.d[i]._mess;
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
        });
    </script>
    <script type="text/javascript">
        function updateProductType_modal(id, branchtypeId, code, name, parent) {
            $("#addProductType").modal({ show: false });
            $('#hdProductTypeId').val(id);
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#dlBranchType').val(branchtypeId);
            $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());

            $('#dlGroup').find('option').remove().end();
            var c0 = document.getElementById('dlGroup');
            var opt_s = document.createElement('option');
            opt_s.value = '';
            opt_s.innerHTML = 'Chọn nhóm cha';
            c0.appendChild(opt_s);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadProductType',
                data: '{"branchType":"' + branchtypeId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlGroup');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    $("#dlGroup").val(parent);
                    $('#select2-dlGroup-container').text($('#dlGroup option:selected').text());
                }
            });

            $('#removeProductType').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT NHÓM SẢN PHẨM';
        }
        function addProductType() {
            $("#addProductType").modal({ show: false });
            $('#hdProductTypeId').val('');
            $('#txtCode').val('');
            $('#txtName').val('');
            $("#dlGroup").val('');
            $('#select2-dlGroup-container').text('Chọn nhóm cha');
            $('#removeProductType').hide();
            document.getElementById('lb').innerText = 'THÊM NHÓM SẢN PHẨM';
        }
        function saveChanges() {
            var id = $('#hdProductTypeId').val();
            if (id == '') {
                var branchType = $('#dlBranchType').val();
                var name = $('#txtName').val();
                var code = $('#txtCode').val();
                var parent = $('#dlGroup').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                if (code != '' && name != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertProductType',
                        data: '{"branchTypeId":"' + branchType + '","code":"'+code+'","name":"' + name + '","parent":"' + parent + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm nhóm sản phẩm [' + name + ']');
                                if (ckload) {
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else
                                {
                                    $('#txtName').val('');
                                    $('#txtCode').val('');
                                    $('#txtCode').focus();

                                    $(".crop-loading").hide();
                                    $("#addProductType").modal('hide');
                                }
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Nhập mã và tên nhóm sản phẩm ');
            }
            else {
                updateChanges(id);
            }
        }
        function updateChanges(id) {
            var branchType = $('#dlBranchType').val();
            var name = $('#txtName').val();
            var code = $('#txtCode').val();
            var parent = $('#dlGroup').val();

            if (name != '' && code != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateProductType',
                    data: '{"id":"' + id + '","branchTypeId":"' + branchType + '","code":"' + code + '","name":"' + name + '","parent":"' + parent + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {

                            showAlert('Đã cập nhật nhóm sản phẩm [' + name + ']');

                            if (ckload) {
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else {
                                $('#txtName').val('');
                                $('#txtCode').val('');
                                $('#txtCode').focus();

                                $(".crop-loading").hide();
                                $("#addProductType").modal('hide');
                            }
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            else showAlert('Nhập mã và tên nhóm sản phẩm');
        }
        function deleteProductType() {
            var id = $('#hdProductTypeId').val();
            var name = $('#txtName').val();
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteProductType',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdProductTypeId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa nhóm sản phẩm [' + name + ']');
                                $("#addProductType").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn nhóm sản phẩm muốn xóa');
            }
        }
    </script>
</asp:Content>

