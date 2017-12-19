<%@ Page Title="Danh mục chức năng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Function.aspx.cs" Inherits="Function" %>

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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-cogs"></i> Danh mục chức năng</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addColor();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addColor"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm chức năng</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Code</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên chức năng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Danh mục cha</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Liên kết</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Vị trí</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thứ tự</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Icon</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
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
                        <th class="bg-th">Code</th>
                        <th class="bg-th">Tên chức năng</th>
                         <th class="bg-th">Danh mục cha</th>
                         <th class="bg-th">Liên kết</th>
                         <th class="bg-th">Vị trí</th>
                         <th class="bg-th">Thứ tự</th>
                         <th class="bg-th">Icon</th>
                        <th class="bg-th">Trạng thái</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class="bg-th">Code</th>
                        <th class="bg-th">Tên chức năng</th>
                         <th class="bg-th">Danh mục cha</th>
                         <th class="bg-th">Liên kết</th>
                         <th class="bg-th">Vị trí</th>
                         <th class="bg-th">Thứ tự</th>
                         <th class="bg-th">Icon</th>
                        <th class="bg-th">Trạng thái</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addColor" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-cogs" aria-hidden="true"></i>
                        <span id="lb">THÊM CHỨC NĂNG</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Danh mục cha<br />
                            <select id="dlParent" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-3">
                            Mã chức năng<br />
                            <input type="text" id="txtCode" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-3">Tên chức năng<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-3">Liên kết<br />
                            <input type="text" id="txtLink" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Loại menu<br />
                            <select id="dlMenu" class="form-control select2" style="width: 100%;">
                                <option value="1">Menu trái</option>
                                <option value="2">Menu phải</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            Thứ tự<br />
                            <input type="text" id="txtSort" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-3">Icon<br />
                            <input type="text" id="txtIcon" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-3">Kiểu<br />
                             <select id="dlRole" class="form-control select2" style="width: 100%;">
                                <option value="1">Có phân quyền</option>
                                <option value="0">Không phân quyền</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeColor" style="display:none;" class="btn btn-success" onclick="deleteColor();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Hủy bỏ</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdColorId" value="" />
    <script>
        var options = ["1", "2", "3","4","5","6","7"];

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
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Function.aspx/getParent',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlParent');
                    var opt1 = document.createElement('option');
                    opt1.value = '';
                    opt1.innerHTML = 'Chọn danh mục cha';
                    c1.appendChild(opt1);

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
    <script type="text/javascript">
        function updateColor_modal(id, code, name, parent, link, pos, sort,icon,func) {
            $("#addColor").modal({ show: false });
            $('#hdColorId').val(id);
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#dlParent').val(parent);
            $('#select2-dlParent-container').text($('#dlParent option:selected').text());

            $('#txtLink').val(link);
            $('#dlMenu').val(pos);
            $('#select2-dlMenu-container').text($('#dlMenu option:selected').text());
            $('#txtSort').val(sort);
            $('#txtIcon').val(icon);
            console.log(func);
            if (func == 'False')
                func = 0;
            else func = 1;
            $('#dlRole').val(func);
            $('#select2-dlRole-container').text($('#dlRole option:selected').text());

            $('#removeColor').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT CHỨC NĂNG';
        }
        function addColor() {
            $("#addColor").modal({ show: false });
            $('#hdColorId').val('');
            $('#txtCode').val('');
            $('#txtName').val('');
            $('#txtLink').val('');
            $('#txtSort').val('');
            $('#txtIcon').val('');

            $('#removeColor').hide();
            document.getElementById('lb').innerText = 'THÊM CHỨC NĂNG';
        }
        function saveChanges() {
            var id = $('#hdColorId').val();
            if (id == '') {
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var parent = $('#dlParent').val();
                var link = $('#txtLink').val();
                var menu = $('#dlMenu').val();
                var sort = $('#txtSort').val();
                var icon = $('#txtIcon').val();
                var role = $('#dlRole').val();

                if (code != '' && name != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertFunction',
                        data: '{"code":"' + code + '","name":"' + name + '","parent":"' + parent + '","link":"' + link + '","menu":"' + menu + '","sort":"' + sort + '","icon":"' + icon + '","role":"' + role + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm chức năng [' + name + ']');
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Nhập mã và tên chức năng');
            }
            else {
                updateChanges();
            }
        }
        function updateChanges() {
            var branchType = $('#dlBranchType').val();
            var code = $('#txtCode').val();
            var name = $('#txtName').val();
            var parent = $('#dlParent').val();
            var link = $('#txtLink').val();
            var menu = $('#dlMenu').val();
            var sort = $('#txtSort').val();
            var icon = $('#txtIcon').val();
            var role = $('#dlRole').val();
            var id = $('#hdColorId').val();

            if (code != '' && name != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateFunction',
                    data: '{"id":"' + id + '","code":"' + code + '","name":"' + name + '","parent":"' + parent + '","link":"' + link + '","menu":"' + menu + '","sort":"' + sort + '","icon":"' + icon + '","role":"' + role + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã cập nhật chức năng [' + name + ']');
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            else showAlert('Nhập mã và tên chức năng');
        }
        function deleteColor() {
            var id = $('#hdColorId').val();
            var name = $('#txtName').val();
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteFunction',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdColorId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa chức năng [' + name + ']');
                                $("#addColor").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn chức năng muốn xóa');
            }
        }
    </script>
</asp:Content>


