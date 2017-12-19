<%@ Page Title="Quản lý Menu" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

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
        #tbdetail tr td,#tbdetailcombo tr td
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
        .format-input{ width:55px; height:25px; text-align:center;}
        .rdList { margin:5px; width:95%;}
        .rdList tr td { border-bottom:1px solid #ccc; padding:10px 0px;}
        .detail-rows:hover, #tbdetail tr:hover,#tbdetailcombo tr:hover {background-color: whitesmoke !important;}
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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sitemap"></i> Quản lý menu</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <a href="#" class="btn btn-sm btn-success" onclick="showModalAdd();" data-toggle="modal" data-target="#addMenu"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm menu</a>
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên menu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhóm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Vị trí</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Liên kết</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body">
                <table id="example2" class="table hover cell-border" style="min-width:915px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Mã</th>
                        <th class="bg-th">Tên menu</th>
                        <th class="bg-th">Nhóm</th>
                        <th class="bg-th">Vị trí</th>
                        <th class="bg-th">Liên kết</th>
                         <th class="bg-th">Trạng thái</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                      <th class="bg-th">Mã</th>
                        <th class="bg-th">Tên menu</th>
                        <th class="bg-th">Nhóm</th>
                        <th class="bg-th">Vị trí</th>
                        <th class="bg-th">Liên kết</th>
                         <th class="bg-th">Trạng thái</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<input type="hidden" id="hdId" value="" />

<div class="modal fade" id="addMenu" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-sitemap" aria-hidden="true"></i><span id="lb">THÊM MENU</span> </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Chuỗi<br />
                             <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">Nhóm cha<br />
                             <select id="dlParentMenu" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Mã menu<br />
                            <input type="text" id="txtCode" class="form-control" maxlength="20" style="width: 100%;" />
                        </div>
                       
                    </div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-4">
                            Tên menu<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-4">Liên kết<br />
                             <input type="text" id="txtLink" class="form-control" maxlength="50" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">Thứ tự<br />
                             <input type="text" id="txtPosition" class="numbers form-control" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">
                            Trạng thái<br />
                              <select id="dlStatus" class="form-control select2" style="width: 100%;">
                                  <option value="1">Hiển thị</option>
                                  <option value="2">Không hiển thị</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success btnSave" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success btnUpdate" onclick="updateChanges();">
                                Cập nhật</button>
                            <button type="button" class="btn btn-success btnDelete" onclick="removeChanges();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var options = ["1","2","3","4","5","6"];

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
                "pageLength": 50,
                "autoWidth": false,
                "order": [[4, 'asc']],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copyHtml5',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
			        {
			            extend: 'excelHtml5',
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
        });
    </script>
    <script>
        function showModalAdd() {
            document.getElementById('lb').innerText = 'THÊM MENU';
            $('#hdId').val('');
            $('.btnSave').show();
            $('.btnUpdate').hide();
            $('.btnDelete').hide();
            $('#txtCode').val('');
            $('#txtName').val('');
            $('#txtLink').val('');
            $('#txtPosition').val('');
            $("#addMenu").modal({ show: false });
            return false;
        }
        function showModalUpdate(id) {
            document.getElementById('lb').innerText = 'CẬP NHẬT MENU';
            $('#hdId').val(id);
            $('.btnSave').hide();
            $('.btnUpdate').show();
            $('.btnDelete').show();
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getMenuDetail',
                data: '{"Menuid":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $('#dlBranchType').val(data.d.BranchType);
                    $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());

                    $('#txtCode').val(data.d.Code);
                    $('#txtName').val(data.d.Name);
                    $('#txtLink').val(data.d.Link);
                    $('#txtPosition').val(data.d.Position);

                    $('#dlStatus').val(data.d.Status);
                    $('#select2-dlStatus-container').text($('#dlStatus option:selected').text());

                    $('#dlParentMenu').find('option').remove().end();
                    var c1 = document.getElementById('dlParentMenu');
                    var op = document.createElement('option');
                    op.value = "";
                    op.innerHTML = 'Chọn nhóm cha';
                    c1.appendChild(op);

                    var branchtype = data.d.BranchType;
                    var parentId = data.d.Parent;
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/loadParentMenu',
                        data: '{"branchTypeId":"' + branchtype + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            console.log(data.d);
                            var c1 = document.getElementById('dlParentMenu');
                            for (var i = 0; i < data.d.length; i++) {
                                var opt = document.createElement('option');
                                opt.value = data.d[i]._id;
                                opt.innerHTML = data.d[i]._content;
                                c1.appendChild(opt);
                            }

                            $('#dlParentMenu').val(parentId);
                            $('#select2-dlParentMenu-container').text($('#dlParentMenu option:selected').text());
                        }
                    });
                }
            });

            $("#addMenu").modal({ show: false });
            return false;
        }
        
         function changeType(id) {
             loadDrop(id);
         }
         function loadDrop(branchTypeId) {
             $('#dlParentMenu').find('option').remove().end();
             var c1 = document.getElementById('dlParentMenu');
             var op = document.createElement('option');
             op.value = "";
             op.innerHTML = 'Chọn nhóm cha';
             c1.appendChild(op);

             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/loadParentMenu',
                 data: '{"branchTypeId":"' + branchTypeId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     var c1 = document.getElementById('dlParentMenu');
                     for (var i = 0; i < data.d.length; i++) {
                         var opt = document.createElement('option');
                         opt.value = data.d[i]._id;
                         opt.innerHTML = data.d[i]._content;
                         c1.appendChild(opt);
                     }
                 }
             });
         }
         function updateChanges() {
             if (confirm("Bạn chắc chắn muốn cập nhật ?") == true) {
                 var id = $('#hdId').val();

                 var branchType = $('#dlBranchType').val();
                 var parent = $('#dlParentMenu').val();
                 var code = $('#txtCode').val();
                 var name = $('#txtName').val();
                 var link = $('#txtLink').val();
                 var position = $('#txtPosition').val();
                 var status = $('#dlStatus').val();
                 if (code == '' || name == '' || position == '')
                     showAlert('Nhập đầy đủ mã, tên và thứ tự menu');
                 else {
                     $.ajax({
                         type: 'POST',
                         url: '/Command.aspx/updateMenu',
                         data: '{"id":"' + id + '","branchTypeId":"' + branchType + '","code":"' + code + '","name":"' + name + '","parent":"' + parent + '","position":"' + position + '","link":"' + link + '","status":"' + status + '"}',
                         contentType: 'application/json; charset=utf-8',
                         dataType: 'json',
                         success: function (data) {
                             if (data.d._content == '1') {
                                 showAlert('Đã cập nhật menu');

                                 setTimeout(function () {
                                     window.location.href = window.location.href;
                                 }, 2000);
                             }
                             else
                                 showAlert(data.d._mess)
                         }
                     });
                 }
             }
             return false;
         }
         function saveChanges() {
             if (confirm("Bạn chắc chắn muốn lưu ?") == true) {
                 var branchType = $('#dlBranchType').val();
                 var parent = $('#dlParentMenu').val();
                 var code = $('#txtCode').val();
                 var name = $('#txtName').val();
                 var link = $('#txtLink').val();
                 var position = $('#txtPosition').val();
                 var status = $('#dlStatus').val();

                 if (code == '' || name == '' || position == '')
                     showAlert('Nhập đầy đủ mã, tên và thứ tự menu');
                 else {
                     $.ajax({
                         type: 'POST',
                         url: '/Command.aspx/insertMenu',
                         data: '{"branchTypeId":"' + branchType + '","code":"' + code + '","name":"' + name + '","parent":"' + parent + '","position":"' + position + '","link":"' + link + '","status":"' + status + '"}',
                         contentType: 'application/json; charset=utf-8',
                         dataType: 'json',
                         success: function (data) {
                             if (data.d._content == '1') {
                                 showAlert('Đã tạo menu ' + name);

                                 setTimeout(function () {
                                     window.location.href = window.location.href;
                                 }, 2000);
                             }
                             else
                                 showAlert(data.d._mess)
                         }
                     });
                 }
             }
             return false;
         }
         function removeChanges() {
             var id = $('#hdId').val();

             if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                 $.ajax({
                     type: 'POST',
                     url: '/Command.aspx/deleteMenu',
                     data: '{"id":"'+id+'"}',
                     contentType: 'application/json; charset=utf-8',
                     dataType: 'json',
                     success: function (data) {
                         if (data.d._content == '1') {
                             showAlert('Đã xóa menu');
                             $('#mnu' + id).remove();
                             $("#addMenu").modal('hide');
                         }
                         else
                             showAlert(data.d._mess)
                     }
                 });
             }
             return false;
         }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    if (e.which == 46) return true;
                    else return false;
                }
            });
            $(".input-date").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 47 || e.which > 57)) {
                    return false;
                }
            });
            $(".input-price").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    if (e.which == 44) return true;
                    else return false;
                }
            });
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
    
</asp:Content>




