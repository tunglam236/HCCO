<%@ Page Title="Lệnh sản xuất mẫu" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Manufacture.aspx.cs" Inherits="Manufacture" %>

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
          <div class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdStatus" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                  <asp:ListItem Text="Tất cả" Value="" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chưa nhập lệnh" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Đã nhập lệnh" Value="2"></asp:ListItem>
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-object-ungroup"></i> Lệnh sản xuất</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
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
                         <th class="bg-th">Trạng thái</th>
                         <%--<th class="bg-th">Người ra lệnh</th>
                         <th class="bg-th">Ngày nhận</th>
                         <th class="bg-th">Ngày hẹn trả</th>
                         <th class="bg-th">Ngày trả</th>--%>
                         <th class="bg-th">Mẫu</th>
                         <th class="bg-th">Thiết kế</th>
                         <%--<th class="bg-th">Đơn vị gia công</th>--%>
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
                         <%--<th class="bg-th">Người ra lệnh</th>
                         <th class="bg-th">Ngày nhận</th>
                         <th class="bg-th">Ngày hẹn trả</th>
                         <th class="bg-th">Ngày trả</th>--%>
                         <th class="bg-th">Mẫu</th>
                         <th class="bg-th">Thiết kế</th>
                         <%--<th class="bg-th">Đơn vị gia công</th>--%>
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
                        <i class="fa fa-object-ungroup" aria-hidden="true"></i>
                        <span id="lb">LỆNH SẢN XUẤT</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                            <div class="row" style="padding: 5px;">
                                 <div class="col-md-6">
                                    Mẫu thiết kế<br />
                                     <input type="text" id="txtForm" disabled class="form-control" style="width: 100%;" />
                                </div>
                                <div class="col-md-6">
                                    Ghi chú<br />
                                    <input type="text" id="txtNote" class="form-control" style="width: 100%;" maxlength="128" />
                                </div>
                              <%--<div class="col-md-2">
                                    Ngày ra lệnh<br />
                                    <input type="text" id="txtCreateAt" class="form-control datepicker2" style="width: 100%;" />
                                </div>
                                <div class="col-md-4">
                                    Ngày hẹn trả<br />
                                    <input type="text" id="txtDateExpect" class="form-control datepicker2" style="width: 100%;" />
                                </div>--%>
                            </div>
                            <%--<div class="row" style="padding: 5px;">
                                 <div class="col-md-6">
                                    Đơn vị gia công<br />
                                     <select id="dlSupplier" class="form-control select2" style="width: 100%;">
                                  </select>
                                </div>
                            </div>--%>
                    </div>
                    <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết lệnh sản xuất
                    </div>
                    <div class="row input-hide" style="padding: 5px; max-height: 350px; overflow-y: scroll;">
                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 450px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th style="width:30px;"></th>
                                    <th>Màu sắc</th>
                                    <th>Size S</th>
                                    <th>Size M</th>
                                    <th>Size L</th>
                                    <th>Size XL</th>
                                    <th>Size XXL</th>
                                    <th>Ghi chú</th>
                                </tr>
                                <tr class="func">
                                    <th>Chọn</th>
                                    <th><select id="dlColor" class="form-control select2" style="width: 200px;"></select></th>
                                    <th><input type="text" id="txtS" class="select numbers form-control" style="width: 60px;" /></th>
                                    <th><input type="text" id="txtM" class="select numbers form-control" style="width: 60px;" /></th>
                                    <th><input type="text" id="txtL" class="select numbers form-control" style="width: 60px;" /></th>
                                    <th><input type="text" id="txtXL" class="select numbers form-control" style="width: 60px;" /></th>
                                    <th><input type="text" id="txtXXL" class="select numbers form-control" style="width: 60px;" /></th>
                                    <th><input type="text" id="txtN" class="select form-control" maxlength="128" style="min-width: 150px; width: 100%;" /></th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                            <tfoot>
                                 <tr>
                                    <th style="width:30px;"></th>
                                    <th>Tổng cộng</th>
                                    <th class="sumS" style="text-align:center !important;">0</th>
                                    <th class="sumM" style="text-align:center !important;">0</th>
                                    <th class="sumL" style="text-align:center !important;">0</th>
                                    <th class="sumXL" style="text-align:center !important;">0</th>
                                    <th class="sumXXL" style="text-align:center !important;">0</th>
                                    <th class="sumTotal" style="text-align:left !important;">0</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                          <span class="btn-group">
                              <button type="button" class="approved btn btn-success" onclick="addColor();">Thêm màu</button>  
                              <button type="button" class="approved btn btn-primary" onclick="saveChanges();">Lưu lệnh</button>
                              <button type="button" class="btn btn-success" data-dismiss="modal">Đóng lại</button>
                          </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <input type="hidden" id="hdFormId" value="" />
    <input type="hidden" id="sumS" value="0" />
    <input type="hidden" id="sumM" value="0" />
    <input type="hidden" id="sumL" value="0" />
    <input type="hidden" id="sumXL" value="0" />
    <input type="hidden" id="sumXXL" value="0" />
    <input type="hidden" id="sumTotal" value="0" />
    <script>
        var options = ["1", "2", "3", "4", "6", "7", "8","9"];

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
    <script type="text/javascript">
        $(document).ready(function () {
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $(".select").keypress(function (e) {
                if (e.which == 13) {
                    addColor();
                    return false;
                }
            });

            //$('#dlSupplier').find('option').remove().end();
            //var c1 = document.getElementById('dlSupplier');
            //var opt_ = document.createElement('option');
            //opt_.value = '';
            //opt_.innerHTML = 'Chọn đơn vị gia công';
            //c1.appendChild(opt_);

            //$.ajax({
            //    type: 'POST',
            //    url: '/Command.aspx/getSupplierByType',
            //    data: '{"typeId":"2"}',
            //    contentType: 'application/json; charset=utf-8',
            //    dataType: 'json',
            //    success: function (data) {
            //        for (var i = 0; i < data.d.length; i++) {
            //            var opt = document.createElement('option');
            //            opt.value = data.d[i]._content;
            //            opt.innerHTML = data.d[i]._mess;
            //            c1.appendChild(opt);
            //        }
            //    }
            //});

            $('#dlColor').find('option').remove().end();
            var dl_color = document.getElementById('dlColor');
            var opt_color = document.createElement('option');
            opt_color.value = '';
            opt_color.innerHTML = 'Chọn màu sắc';
            dl_color.appendChild(opt_color);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadColor',
                data: '{"branchtype":"2"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        dl_color.appendChild(opt);
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
                "pageLength": 20,
                "autoWidth": false,
                "order": [[0, 'asc']],
                dom: 'Bfrtip',
                "columnDefs": [
               {
                   "targets": [5],
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
        function addColor() {
            var color = $('#dlColor').val();
            var color_name = $('#dlColor option:selected').text();
            if (color == '')
                showAlert('Chọn màu sắc');
            else {
                var ok = true;
                $("#data-detail-soi tr").each(function () {
                    var _color = $(this).attr("data-color");
                    if (_color == color) ok = false;

                });
                if (ok) {
                    var sS = $('#txtS').val();
                    var sM = $('#txtM').val();
                    var sL = $('#txtL').val();
                    var sXL = $('#txtXL').val();
                    var sXXL = $('#txtXXL').val();
                    var note = $('#txtN').val();

                    if (sS == '' && sM == '' && sL == '' && sXL == '' && sXXL == '')
                        showAlert('Nhập ít nhất một số lượng');
                    else {
                        if (sS == '') sS = 0;
                        if (sM == '') sM = 0;
                        if (sL == '') sL = 0;
                        if (sXL == '') sXL = 0;
                        if (sXXL == '') sXXL = 0;

                        $('#sumS').val(parseInt($('#sumS').val()) + parseInt(sS));
                        $('#sumM').val(parseInt($('#sumM').val()) + parseInt(sM));
                        $('#sumL').val(parseInt($('#sumL').val()) + parseInt(sL));
                        $('#sumXL').val(parseInt($('#sumXL').val()) + parseInt(sXL));
                        $('#sumXXL').val(parseInt($('#sumXXL').val()) + parseInt(sXXL));
                        $('#sumTotal').val(parseInt($('#sumS').val()) + parseInt($('#sumM').val()) + parseInt($('#sumL').val()) + parseInt($('#sumXL').val()) + parseInt($('#sumXXL').val()));

                        var html = '';
                        html += '<tr data-color="' + color + '" data-s="' + sS + '" data-m="' + sM + '" data-l="' + sL + '" data-xl="' + sXL + '" data-xxl="' + sXXL + '" id="rows' + color + '">';
                        html += '<td style="width:20px;"><a onclick="removeproduct(' + color + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                        html += '<td>' + color_name + '</td>';
                        html += '<td><input type="text" class="numbers format-input sizeS" id="sS' + color + '" value="' + sS + '" /></td>';
                        html += '<td><input type="text" class="numbers format-input sizeM" id="sM' + color + '" value="' + sM + '" /></td>';
                        html += '<td><input type="text" class="numbers format-input sizeL" id="sL' + color + '" value="' + sL + '" /></td>';
                        html += '<td><input type="text" class="numbers format-input sizeXL" id="sXL' + color + '" value="' + sXL + '" /></td>';
                        html += '<td><input type="text" class="numbers format-input sizeXXL" id="sXXL' + color + '" value="' + sXXL + '" /></td>';
                        html += '<td><input type="text" class="format-input" id="sNote' + color + '" maxlength="128" style="min-width:150px;width:100%; text-align:left;" value="' + note + '" /></td>';
                        $('#data-detail-soi').append(html);

                        $('#txtS').val('');
                        $('#txtM').val('');
                        $('#txtL').val('');
                        $('#txtXL').val('');
                        $('#txtXXL').val('');
                        $('#txtN').val('');

                        $('.sumS').text($('#sumS').val());
                        $('.sumM').text($('#sumM').val());
                        $('.sumL').text($('#sumL').val());
                        $('.sumXL').text($('#sumXL').val());
                        $('.sumXXL').text($('#sumXXL').val());
                        $('.sumTotal').text('= ' + $('#sumTotal').val());
                    }
                }
                else
                    showAlert('Đã tồn tại màu sắc ' + color_name + '. Hãy kiểm tra lại');
            }
        }
        function removeproduct(index) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                var id = '#rows' + String(index);
                $(id).remove();
                showAlert('Xóa thành công ');
            }
            return false;
        }
        function reset() {
            $('#txtCreateAt').val('');
            $('#txtDateExpect').val('');
            //$('#txtDateReturn').val('');
            $('#txtNote').val('');

            $('#txtS').val('');
            $('#txtM').val('');
            $('#txtL').val('');
            $('#txtXL').val('');
            $('#txtXXL').val('');
            $('#txtN').val('');
            $("#data-detail-soi tr").remove();
        }
        function update_modal(id, formId, formname, note, status) {
            reset();
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#hdFormId').val(formId);
            $('#txtForm').val(formname);
            //$('#txtCreateAt').val(date_create);
            //$('#txtDateExpect').val(date_expect);
            $('#txtNote').val(note);

            //$('#dlSupplier').val(supplierId);
            //$('#select2-dlSupplier-container').text($('#dlSupplier option:selected').text());

            document.getElementById('lb').innerText = 'CẬP NHẬT LỆNH SẢN XUẤT';
            console.log(status);
            if (status == '1') {
                $('.approved').show();
                $('.func').show();
            }
            else {
                $('.approved').hide();
                $('.func').hide();
            }

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getManufactureDetail',
                data: '{"id":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var html = "";
                    var sumS = 0, sumM = 0, sumL = 0, sumXL = 0, sumXXL = 0, sumTotal = 0;
                    for (var t = 0; t < data.d.length; t++) {
                        html = '';
                        html += '<tr data-color="' + data.d[t].ColorId + '" data-s="' + data.d[t].SizeS + '" data-m="' + data.d[t].SizeM + '" data-l="' + data.d[t].SizeL + '" data-xl="' + data.d[t].SizeXL + '" data-xxl="' + data.d[t].SizeXXL + '" id="rows' + data.d[t].ColorId + '">';
                        html += '<td style="width:20px;"><a onclick="removeproduct(' + data.d[t].ColorId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                        html += '<td>' + data.d[t].ColorName + '</td>';
                        html += '<td><input type="text" ' + (status=='1' ? '' : 'disabled') + ' class="numbers format-input sizeS" id="sS' + data.d[t].ColorId + '" value="' + data.d[t].SizeS + '" /></td>';
                        html += '<td><input type="text" ' + (status == '1' ? '' : 'disabled') + ' class="numbers format-input sizeM" id="sM' + data.d[t].ColorId + '" value="' + data.d[t].SizeM + '" /></td>';
                        html += '<td><input type="text" ' + (status == '1' ? '' : 'disabled') + ' class="numbers format-input sizeL" id="sL' + data.d[t].ColorId + '" value="' + data.d[t].SizeL + '" /></td>';
                        html += '<td><input type="text" ' + (status == '1' ? '' : 'disabled') + ' class="numbers format-input sizeXL" id="sXL' + data.d[t].ColorId + '" value="' + data.d[t].SizeXL + '" /></td>';
                        html += '<td><input type="text" ' + (status == '1' ? '' : 'disabled') + ' class="numbers format-input sizeXXL" id="sXXL' + data.d[t].ColorId + '" value="' + data.d[t].SizeXXL + '" /></td>';
                        html += '<td><input type="text" ' + (status == '1' ? '' : 'disabled') + ' class="format-input" id="sNote' + data.d[t].ColorId + '" maxlength="128" style="min-width:150px;width:100%;text-align:left;" value="' + data.d[t].Note + '" /></td>';
                        sumS += parseInt(data.d[t].SizeS);
                        sumM += parseInt(data.d[t].SizeM);
                        sumL += parseInt(data.d[t].SizeL);
                        sumXL += parseInt(data.d[t].SizeXL);
                        sumXXL += parseInt(data.d[t].SizeXXL);
                        
                        $('#data-detail-soi').append(html);
                    }
                    sumTotal = sumS + sumM + sumL + sumXL + sumXXL;
                    $('.sumS').text(sumS);
                    $('.sumM').text(sumM);
                    $('.sumL').text(sumL);
                    $('.sumXL').text(sumXL);
                    $('.sumXXL').text(sumXXL);
                    $('.sumTotal').text('= ' + sumTotal);
                }
            });
        }
        function saveChanges() {
            var idManu = $('#hdDeptId').val();
            var idForm = $('#hdFormId').val();
            
            //var date_create = $('#txtCreateAt').val();
            //var date_expect = $('#txtDateExpect').val();
            var note = $('#txtNote').val();
            //var supplier = $('#dlSupplier').val();

            //if (date_create == '') showAlert('Nhập ngày ra lệnh');
            //else if (date_expect == '') showAlert('Nhập ngày hẹn trả');
            if (idForm == '') showAlert('Chọn mẫu thiết kế');
            //else if (supplier == '') showAlert('Chọn đơn vị gia công');
            else {
                if (confirm("Bạn chắc chắn muốn lưu lệnh sản xuất này ?") == true) {
                    var id = $('#hdDeptId').val();

                    var data = "";
                    $("#data-detail-soi tr").each(function () {
                        var id = $(this).attr("data-color");
                        var size_S = $('#sS' + id).val();
                        var size_M = $('#sM' + id).val();
                        var size_L = $('#sL' + id).val();
                        var size_XL = $('#sXL' + id).val();
                        var size_XXL = $('#sXXL' + id).val();
                        var note = $('#sNote' + id).val();

                        if (data != '') data += '#';
                        data += id + '|' + size_S + '|' + size_M + '|' + size_L + '|' + size_XL + '|' + size_XXL + '|' + note
                    });
                    if (data == '') showAlert('Chưa có dữ liệu màu và số lượng từng size');
                    else {
                        $.ajax({
                            type: 'POST',
                            url: '/Command.aspx/updateManufacture',
                            data: '{"id":"' + idManu + '","note":"' + note + '","form":"' + idForm + '","data":"' + data + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                if (data.d._content == '1') {
                                    $('#sumS').val('0');
                                    $('#sumM').val('0');
                                    $('#sumL').val('0');
                                    $('#sumXL').val('0');
                                    $('#sumXXL').val('0');

                                    showAlert('Đã lưu lệnh sản xuất');
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else
                                    showAlert(data.d._mess);
                            }
                        });
                    }
                }
            }
        }
    </script>
</asp:Content>

