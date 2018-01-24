<%@ Page Title="Cấp phát nguyên phụ liệu" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="Maps" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="/dist/css/client.css" rel="stylesheet" />
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
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày ra lệnh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày nhận</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày hẹn trả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày trả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đơn vị gia công</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
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
                         <th class="bg-th">Người ra lệnh</th>
                         <th class="bg-th">Ngày nhận</th>
                         <th class="bg-th">Ngày hẹn trả</th>
                         <th class="bg-th">Ngày trả</th>
                         <th class="bg-th">Mẫu</th>
                         <th class="bg-th">Thiết kế</th>
                         <th class="bg-th">Đơn vị gia công</th>
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
                         <th class="bg-th">Người ra lệnh</th>
                         <th class="bg-th">Ngày nhận</th>
                         <th class="bg-th">Ngày hẹn trả</th>
                         <th class="bg-th">Ngày trả</th>
                         <th class="bg-th">Mẫu</th>
                         <th class="bg-th">Thiết kế</th>
                         <th class="bg-th">Đơn vị gia công</th>
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
                        <span id="lb">LỆNH CẤP PHÁT NGUYÊN PHỤ LIỆU</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                            <div class="row" style="padding: 5px;">
                                 <div class="col-md-6">
                                    Mẫu thiết kế<br />
                                     <input type="text" id="txtForm" disabled class="form-control" style="width: 100%;" />
                                </div>
                                <div class="col-md-2">
                                    Ngày cấp phát<br />
                                    <input type="text" id="txtCreateAt" class="form-control datepicker2" style="width: 100%;" />
                                </div>
                                <div class="col-md-4">
                                    Người nhận<br />
                                     <select id="dlUser" class="form-control select2" style="width: 100%;"></select>
                                </div>
                            </div>
                         <div class="input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px;">
                            Số lượng sản xuất dự kiến
                        </div>
                         <div class="row sxdukien" style="padding: 5px;">
                         </div>
                         <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px;">
                            Số lượng sản xuất thực
                        </div>
                        <div class="row sxthuc" style="padding: 5px;">
                         </div>
                    </div>
                    <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết lệnh sản xuất
                    </div>
                    <div class="row input-hide" style="padding: 5px; max-height: 350px; overflow-y: scroll;">
                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 750px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th style="width:30px;">STT</th>
                                    <th style="min-width:100px">Màu sắc</th>
                                    <th style="">Nguyên/phụ liệu</th>
                                    <th style="min-width:100px">Loại</th>
                                    <th style="width:60px">Định mức</th>
                                    <th style="width:40px">Đơn vị tính</th>
                                    <th style="min-width:60px">Tổng định mức</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                          <span class="btn-group">
                              <button type="button" class="approved btn btn-sm btn-success" onclick="test();">Get data</button>  
                              <button type="button" class="approved btn btn-sm btn-primary" onclick="saveChanges();">Lưu lệnh</button>
                              <button type="button" class="btn btn-sm btn-success" data-dismiss="modal">Đóng lại</button>
                          </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <input type="hidden" id="hdFormId" value="" />
    
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
        function getTotalByColor(color, norm, id_norm) {
            var total = 0;
            $(".color" + color).each(function () {
                var id = $(this).val();
                if (id == '') id = '0';
                total += parseInt(id);
            });
            total = Math.round((total * norm), 2);
            $('#totalnorm' + id_norm).text(total);
        }
        function test() {
            var data = '';
            $(".row_norm").each(function (index) {
                var color_id = $(this).attr("id_color");
                var norm = $('#norm' + (index + 1)).val();
                var unit = $('#unit' + (index + 1)).val();
                var type = $('#type' + (index + 1)).attr("type");
                var _id = '#dlNPL' + (index + 1).toString() + (type - 1).toString();
                var mat = $(_id).val();
                var total = $('#totalnorm' + (index + 1)).text();
                
                if (data != '') data += '#';
                data += color_id + '|' + mat + '|' + type + '|' + norm + '|' + unit + '|' + total;
            });
            console.log(data);
            
            var data2 = '';
            var _color = '', _size = '';
            $(".color").each(function (index) {
                var size = $(this).attr("size");
                var color = $(this).attr("color");

                if (size == 'S') _size = $('#colorS' + color).val();
                else if (size == 'M') _size = $('#colorM' + color).val();
                else if (size == 'L') _size = $('#colorL' + color).val();
                else if (size == 'XL') _size = $('#colorXL' + color).val();
                else if (size == 'XXL') _size = $('#colorXXL' + color).val();

                if (data2 != '' && _color != color) data2 += '#';

                if (_color != color) {
                    _color = color;
                    data2 += color + '|' + _size;
                }
                else {
                    data2 += '|' + _size;
                }
                
            });
            console.log(data2);
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
        function update_modal(id, formId,formName, status) {
            $('#txtForm').val(formName);
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getManufactureDetailByForm',
                data: '{"idForm":"' + formId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $(".sxdukien .sxdk").remove();
                    $(".sxthuc .sxth").remove();
                    $("#data-detail-soi tr").remove();
                    var sxdukien = "", sxthuc = "", npl = "";
                    var id_norm = 0;
                    for (var t = 0; t < data.d.length; t++) {
                        sxdukien = '';
                        sxdukien += '<div class="sxdk col-md-2 col-xs-6"><b>Màu sắc</b><br/><input type="text" disabled class="numbers" style="min-width:60px; width:100%; font-weight:bold; background-color:#c4dabd;" value="' + data.d[t].ColorName + '" /></div>';
                        sxdukien += '<div class="sxdk col-md-2 col-xs-6">Size S<br /><input type="text" disabled class="numbers " style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeS + '" /></div>';
                        sxdukien += '<div class="sxdk col-md-2 col-xs-6">Size M<br /><input type="text" disabled class="numbers " style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeM + '" /></div>';
                        sxdukien += '<div class="sxdk col-md-2 col-xs-6">Size L<br /><input type="text" disabled class="numbers " style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeL + '" /></div>';
                        sxdukien += '<div class="sxdk col-md-2 col-xs-6">Size XL<br /><input type="text" disabled class="numbers " style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeXL + '" /></div>';
                        sxdukien += '<div class="sxdk col-md-2 col-xs-6">Size XXL<br /><input type="text" disabled class="numbers " style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeXXL + '" /></div>';

                        sxthuc = '';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6"><b>Màu sắc</b><br/><input type="text" class="numbers" disabled style="min-width:60px; width:100%; font-weight:bold; background-color:#c4dabd;" value="' + data.d[t].ColorName + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size S<br /><input type="text" id="colorS' + data.d[t].ColorId + '" class="numbers color color' + data.d[t].ColorId + '" size="S" color="' + data.d[t].ColorId + '" style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeS + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size M<br /><input type="text" id="colorM' + data.d[t].ColorId + '" class="numbers color color' + data.d[t].ColorId + '" size="M" color="' + data.d[t].ColorId + '" style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeM + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size L<br /><input type="text" id="colorL' + data.d[t].ColorId + '" class="numbers color color' + data.d[t].ColorId + '" size="L" color="' + data.d[t].ColorId + '" style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeL + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size XL<br /><input type="text" id="colorXL' + data.d[t].ColorId + '" class="numbers color color' + data.d[t].ColorId + '" size="XL" color="' + data.d[t].ColorId + '" style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeXL + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size XXL<br /><input type="text" id="colorXXL' + data.d[t].ColorId + '" class="numbers color color' + data.d[t].ColorId + '" size="XXL" color="' + data.d[t].ColorId + '" style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeXXL + '" /></div>';

                        $('.sxdukien').append(sxdukien);
                        $('.sxthuc').append(sxthuc);

                        var _pl = ['Vải chính', 'Vải lót', 'Vải phối', 'Nguyên phụ liệu'];

                        for (var p = 0; p <= 3; p++) {
                            id_norm++;
                            npl = '<tr class="row_norm" id_color="' + data.d[t].ColorId + '"><td style="width:20px;">' + id_norm + '</td>';
                            npl += '<td>' + data.d[t].ColorName + '</td>';
                            npl += '<td><select id="dlNPL' + id_norm + p + '" class="form-control select2 dlNPL" style="width: 100%;"></select></td>';
                            npl += '<td id="type' + id_norm + '" type="' + (p + 1) + '" style="padding-left:5px;width:110px;">' + _pl[p] + '</td>';
                            npl += '<td><input type="text" class="numbers norm" id="norm' + id_norm + '" id_norm="' + id_norm + '" color="' + data.d[t].ColorId + '" style="width:50px; height:30px;text-align:center;" value="0" /></td>';
                            npl += '<td><input type="text" id="unit' + id_norm + '" maxlength="15" style="width:80px; height:30px;text-align:center;" value="" /></td>';
                            npl += '<td style="padding-left:5px;width:80px" id="totalnorm' + id_norm + '">0</td></tr>';
                            $('#data-detail-soi').append(npl);
                        }
                    }
                    loadMaterial();
                }
            });
        }
        function saveChanges() {
            var idManu = $('#hdDeptId').val();
            var idForm = $('#hdFormId').val();
            
            var date_create = $('#txtCreateAt').val();
            var date_expect = $('#txtDateExpect').val();
            var note = $('#txtNote').val();
            var supplier = $('#dlSupplier').val();

            if (date_create == '') showAlert('Nhập ngày ra lệnh');
            else if (date_expect == '') showAlert('Nhập ngày hẹn trả');
            else if (idForm == '') showAlert('Chọn mẫu thiết kế');
            else if (supplier == '') showAlert('Chọn đơn vị gia công');
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
                            data: '{"id":"' + idManu + '","date_create":"' + date_create + '","date_expect":"' + date_expect + '","note":"' + note + '","form":"' + idForm + '","supplier":"' + supplier + '","data":"' + data + '"}',
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
        function complete() {
            var code = $('#txtCode').val();
            var name = $('#txtName').val();

            var content = $('#txtContent').val();
            if (confirm("Bạn chắc chắn đã hoàn thành mẫu " + name + ' - ' + code + " này ?") == true) {
                var id = $('#hdDeptId').val();
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/completeFormSewing',
                    data: '{"id":"' + id + '","content":"' + content + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã cập nhật hoàn thành mẫu [' + name + ' - ' + code + ']');

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
        function loadMaterial() {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadMaterial',
                data: '{"branchtype":"2"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $('.dlNPL').find('option').remove().end();

                    $(".dlNPL").each(function () {
                        var id = $(this).attr("id");
                        var c1 = document.getElementById(id);

                        for (var y = 0; y < data.d.length; y++) {
                            var opt_ = document.createElement('option');
                            opt_.value = data.d[y]._content;
                            opt_.innerHTML = data.d[y]._mess;
                            c1.appendChild(opt_);
                        }
                    });

                    setTimeout(function () {
                        $(".select2").select2();

                        $(".numbers").keypress(function (e) {
                            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                                if (e.which == 46) return true;
                                else return false;
                            }
                        });

                        $(".norm").change(function (e) {
                            var norm = $(this).val();
                            var id = $(this).attr("color");
                            var id_norm = $(this).attr("id_norm");
                            
                            getTotalByColor(id, norm, id_norm);
                        });
                    }, 1000);
                }
            });
        }
    </script>
</asp:Content>

