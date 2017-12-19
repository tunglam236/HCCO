<%@ Page Title="Danh mục chi nhánh" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Branch.aspx.cs" Inherits="Branch" %>

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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sitemap"></i> Danh sách chi nhánh</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addbranch();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addBranch"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm chi nhánh</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Địa chỉ</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số điện thoại</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" />&nbsp;Thông tin</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người đại diện</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" />&nbsp;Chức vụ</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày tạo</label> </a></li>
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
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Tên chi nhánh</th>
                        <th class="bg-th">Địa chỉ</th>
                        <th class="bg-th">Số điện thoại</th>
                        <th class="bg-th">Thông tin</th>
                         <th class="bg-th">Người đại diện</th>
                         <th class="bg-th">Chức vụ</th>
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
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Tên chi nhánh</th>
                        <th class="bg-th">Địa chỉ</th>
                        <th class="bg-th">Số điện thoại</th>
                         <th class="bg-th">Thông tin</th>
                         <th class="bg-th">Người đại diện</th>
                         <th class="bg-th">Chức vụ</th>
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
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>
                        <span id="lb">THÊM CHI NHÁNH</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin chi nhánh</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-3">
                            Mã chi nhánh<br />
                            <input type="text" id="txtBranchCode" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Tên chi nhánh<br />
                            <input type="text" id="txtBranchName" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-3">Số điện thoại<br />
                            <input type="text" id="txtPhone" class="numbers form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">Tỉnh,thành phố<br />
                            <select id="dlCountry" class="form-control select2" style="width: 100%;" onchange="changeCountry($(this).val())">
                            </select>
                        </div>
                        <div class="col-md-3">Quận, huyện<br />
                            <select id="dlDistrict" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-6">Địa chỉ<br />
                            <input type="text" id="txtAddress" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">Thời gian làm việc<br />
                            <input type="text" id="txtTime" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-6">Thông tin<br />
                            <input type="text" id="txtNote" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                        <div class="col-md-6">Người đại diện<br />
                            <input type="text" id="txtContactName" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-6">Chức vụ<br />
                            <input type="text" id="txtPosition" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeBranch" style="display:none;" class="btn btn-success" onclick="deleteBranch();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Hủy bỏ</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdBranchId" value="" />
    <script>
        var options = ["1", "2", "3", "4", "8","9"];

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
                    "targets": [5,6,7],
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
                }
            });

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getCountry',
                data: '{"type":"-1"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlCountry');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i].Id;
                        opt.innerHTML = data.d[i].Name;
                        c1.appendChild(opt);
                    }
                  
                    $('#dlDistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                }
            });
        });
    </script>
    <script type="text/javascript">
        function updateBranch_modal(id, branchtypeId, code, name, phone, add, note,time, countryid, districtid, contact, position) {
            $("#addBranch").modal({ show: false });
            $('#hdBranchId').val(id);
            $('#txtBranchName').val(name);
            $('#txtPhone').val(phone);
            $('#txtAddress').val(add);
            $('#dlBranchType').val(branchtypeId);
            $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());
            $('#txtBranchCode').val(code);
            $('#txtTime').val(time);
            $('#txtContactName').val(contact);
            $('#txtPosition').val(position);
            
            $('#txtNote').val(note);
            $("#dlCountry").val(countryid);
            $('#select2-dlCountry-container').text($('#dlCountry option:selected').text());

            $('#dlDistrict').find('option').remove().end();
            if (countryid != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getCountry',
                    data: '{"type":"' + countryid + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('dlDistrict');
                        $('#dlDistrict').find('option').remove().end();
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            d.appendChild(opt);
                        }
                        $("#dlDistrict").val(districtid);
                        $('#select2-dlDistrict-container').text($('#dlDistrict option:selected').text());
                    }
                });
            }
            else {
                $('#dlDistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }

            $('#removeBranch').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT CHI NHÁNH';
        }
        function addbranch() {
            $("#addBranch").modal({ show: false });
            $('#hdBranchId').val('');
            $('#txtBranchName').val('');
            $('#txtPhone').val('');
            $('#txtAddress').val('');
            $('#txtBranchCode').val('');
            $('#txtTime').val('');
            $('#txtNote').val('');
            $('#txtContactName').val('');
            $('#txtPosition').val('');
            $('#removeBranch').hide();
            document.getElementById('lb').innerText = 'THÊM CHI NHÁNH';
        }
        function saveChanges() {
            var id = $('#hdBranchId').val();
            if (id == '') {
                var branchType = $('#dlBranchType').val();
                var name = $('#txtBranchName').val();
                var add = $('#txtAddress').val();
                var phone = $('#txtPhone').val();
                var note = $('#txtNote').val();
                var code = $('#txtBranchCode').val();
                var time = $('#txtTime').val();
                var contact = $('#txtContactName').val();
                var pos = $('#txtPosition').val();
                var countryId = $('#dlCountry').val();
                var countryName = $('#dlCountry option:selected').text();
                var districtId = $('#dlDistrict').val();
                var districtName = $('#dlDistrict option:selected').text();

                if (name != '' && add != '' && countryId != "" && districtId != "") {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertBranch',
                        data: '{"branchTypeId":"' + branchType + '","code":"'+code+'","name":"' + name + '","add":"' + add + '","phone":"' + phone + '","note":"' + note + '","time":"'+time+'","countryId":"'+countryId+'","countryName":"'+countryName+'","districtId":"'+districtId+'","districtName":"'+districtName+'","contact":"'+contact+'","position":"'+pos+'"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm chi nhánh [' + name + ']');
                                
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Nhập tên chi nhánh, địa chỉ, tỉnh thành phố');
            }
            else {
                updateChanges();
            }
        }
        function updateChanges() {
            var branchType = $('#dlBranchType').val();
            var name = $('#txtBranchName').val();
            var add = $('#txtAddress').val();
            var phone = $('#txtPhone').val();
            var note = $('#txtNote').val();
            var id = $('#hdBranchId').val();
            var code = $('#txtBranchCode').val();
            var time = $('#txtTime').val();
            var contact = $('#txtContactName').val();
            var pos = $('#txtPosition').val();
            var countryId = $('#dlCountry').val();
            var countryName = $('#dlCountry option:selected').text();
            var districtId = $('#dlDistrict').val();
            var districtName = $('#dlDistrict option:selected').text();

            if (name != '' && add != '' && countryId != "" && districtId!="") {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateBranch',
                    data: '{"id":"' + id + '","branchTypeId":"' + branchType + '","code":"' + code + '","name":"' + name + '","add":"' + add + '","phone":"' + phone + '","note":"' + note + '","time":"' + time + '","countryId":"' + countryId + '","countryName":"' + countryName + '","districtId":"' + districtId + '","districtName":"' + districtName + '","contact":"'+contact+'","position":"'+pos+'"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {

                            showAlert('Đã cập nhật chi nhánh [' + name + ']');
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            else showAlert('Nhập tên chi nhánh, địa chỉ, tỉnh thành phố');
        }
        function deleteBranch() {
            var id = $('#hdBranchId').val();
            var name = $('#txtBranchName').val();
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteBranch',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdBranchId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa chi nhánh [' + name + ']');
                                $("#addBranch").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn chi nhánh muốn xóa');
            }
        }
        function changeCountry(id) {
            $('#dlDistrict').find('option').remove().end();
            if (id != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getCountry',
                    data: '{"type":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('dlDistrict');
                        $('#dlDistrict').find('option').remove().end();
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            d.appendChild(opt);

                        }
                    }
                });
            }
            else {
                $('#dlDistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }
        }
    </script>
</asp:Content>