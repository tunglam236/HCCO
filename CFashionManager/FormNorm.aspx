﻿<%@ Page Title="Nhập định mức vải" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="FormNorm.aspx.cs" Inherits="FormNorm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="dist/css/client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
        <div class="col-xs-12 col-md-2" style=" padding:10px;">
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-flash"></i> Trạng thái</h4>
          </div>
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdStatus" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                  <asp:ListItem Text="Tất cả" Value="-1" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chưa nhập" Value="0"></asp:ListItem>
                  <asp:ListItem Text="Đã nhập" Value="1"></asp:ListItem>
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-user"></i> Thiết kế</h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
               <asp:RadioButtonList ID="rdUser" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
        <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-keyboard-o"></i> Nhập định mức vải</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <div class="dropdown">
            <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
       <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người nhập</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày nhập</label> </a></li> 
           <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Loại mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mẫu tháng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày tạo</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
        </ul>
    </div></div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1050px; font-size:12px;">
                   <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                       <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Người nhập</th>
                         <th class="bg-th">Ngày nhập</th>
                         <th class="bg-th">Người thiết kế</th>
                          <th class="bg-th">Loại mẫu</th>
                         <th class="bg-th">Mã thiết kế</th>
                        <th class="bg-th">Tên mẫu</th>
                         <th class="bg-th">Mẫu tháng</th>
                         <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Ngày tạo</th>
                         <th class="bg-th">Ghi chú</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Người nhập</th>
                         <th class="bg-th">Ngày nhập</th>
                         <th class="bg-th">Người thiết kế</th>
                          <th class="bg-th">Loại mẫu</th>
                         <th class="bg-th">Mã thiết kế</th>
                        <th class="bg-th">Tên mẫu</th>
                         <th class="bg-th">Mẫu tháng</th>
                         <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Ngày tạo</th>
                         <th class="bg-th">Ghi chú</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addDept" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        <span id="lb">DUYỆT MẪU THIẾT KẾ</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            <div class="row" style="padding: 5px;">
                                <div class="col-md-12">
                                    Mã thiết kế<br />
                                    <input type="text" id="txtCode" disabled class="form-control" style="width: 100%;" />
                                </div>
                                <div class="col-md-12">
                                    Người thiết kế<br />
                                    <input type="text" id="txtFullName" disabled class="form-control" style="width: 100%;" />
                                </div>
                                <div class="col-md-6">
                                    Tên mẫu<br />
                                    <input type="text" id="txtName" disabled class="form-control" style="width: 100%;" />
                                </div>
                                <div class="col-md-6">
                                    Màu sắc<br />
                                    <input type="text" id="txtColor" disabled class="form-control" style="width: 100%;" />
                                </div>
                            </div>
                            <div class="row" style="padding: 5px;">
                                <div class="col-md-12">
                                    Mẫu tháng<br />
                                    <input type="text" id="txtMonth" disabled class="form-control" style="width: 100%;" />
                                </div>
                                <div class="col-md-12">
                                    Loại mẫu<br />
                                    <input type="text" id="txtProductTypeName" disabled class="form-control" style="width: 100%;" />
                                </div>
                            </div>
                            <div class="row" style="padding: 5px;">
                                <div class="col-md-12">
                                    Mô tả thiết kế<br />
                                    <textarea type="text" id="txtDescription" disabled class="form-control" style="width: 100%;" rows="2"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6" style="max-height:350px; overflow:auto;">
                            Hình ảnh<br />
                            <img src="/form/FVADO0009.jpeg" style="width:100%;" />
                        </div>
                    </div>
                    <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết nguyên phụ liệu
                    </div>
                    <div class="row input-hide" style="padding: 5px; max-height: 350px; overflow-y: scroll;">
                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 97%; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>Nguyên phụ liệu</th>
                                    <th>Loại</th>
                                    <th>Định mức</th>
                                    <th>Đơn vị tính</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                    </div>
                     <div class="row" style="padding: 5px;">
                         <div class="input-group col-md-12">
                          <span class="input-group-btn">
                                <button type="button" class="approved btn btn-primary" onclick="saveChanges();">Lưu lại</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Đóng lại</button>
                          </span>
                          <input type="text" id="txtContent" class="form-control" placeholder="Nhập nội dung (nếu có)" maxlength="512" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <script>
        var options = ["1", "2", "3", "4", "5", "6", "7","11"];

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
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    if (e.which == 46) return true;
                    else return false;
                }
            });

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
                "columnDefs": [
               {
                   "targets": [8,9,10],
                   "visible": false,
                   "searchable": false
               }],
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
                        copy: 'Copy',
                        print: 'Print',
                        excel: 'Export'
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
        function update_modal(id, type, code, name, month, des,color, fullname,status) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtCode').val(code);
            $('#txtColor').val(color);
            $('#txtName').val(name);
            $('#txtFullName').val(fullname);
            $('#txtMonth').val(month);
            $('#txtProductTypeName').val(type);
            $('#txtDescription').val(des);
            document.getElementById('lb').innerText = 'NHẬP ĐỊNH MỨC VẢI';

            if (status == 1) {
                $('.approved').show();
            }
            else {
                $('.approved').hide();
            }

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getDetailForm',
                data: '{"id":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var type_name = '';
                    var html = "";
                    for (var t = 0; t < data.d.length; t++) {
                        html = '';
                        type_name = data.d[t].TypeName == '0' ? 'Chọn loại' : data.d[t].TypeName == '1' ? 'Vải chính' :
                            data.d[t].TypeName == '2' ? 'Vải lót' : data.d[t].TypeName == '3' ? 'Vải phối' : 'Nguyên phụ liệu';
                        html += '<tr data-id="' + data.d[t].MaterialId + '" data-type="' + data.d[t].TypeName + '" id="rows' + data.d[t].MaterialId + '"><td>' + data.d[t].MaterialName + '</td><td>' + type_name + '</td>';
                        html += '<td><input type="text" class="numbers format-input" id="quantity' + data.d[t].MaterialId + data.d[t].TypeName + '" value="' + data.d[t].Norm + '" /></td><td><input type="text" class="format-input" id="unit' + data.d[t].MaterialId + data.d[t].TypeName + '" value="' + data.d[t].UnitName + '" /></td></tr>';
                        $('#data-detail-soi').append(html);
                    }
                }
            });
            setTimeout(function () {
                $(".numbers").keypress(function (e) {
                    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                        if (e.which == 46) return true;
                        else return false;
                    }
                });
            }, 1000);
        }
        function saveChanges() {
            if (confirm('Bạn chắc chắn muốn lưu thông tin này ?') == true) {
                var id_form = $('#hdDeptId').val();
                var content = $('#txtContent').val();

                var ok = true;
                var data = "";
                $("#data-detail-soi tr").each(function () {
                    if (ok) {
                        var id = $(this).attr("data-id");
                        var type = $(this).attr("data-type");
                        var quan = $('#quantity' + id + type).val();
                        var unit = $('#unit' + id + type).val();
                        if (quan == '' || unit == '') {
                            ok = false;
                        }
                        if (data != "") data += "#";
                        data += id + ',' + type + ',' + quan + ',' + unit;
                    }
                });

                if (ok) {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateFormNorm',
                        data: '{"id":"' + id_form + '","data":"' + data + '","content":"' + content + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#delete' + id_form).remove();
                                $(".crop-loading").hide();
                                $("#addDept").modal('hide');

                                showAlert('Đã cập nhật định mức');
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else
                    showAlert('Nhập đầy đủ các thông số định mức và đơn vị tính')
            }
        }
    </script>
</asp:Content>


