<%@ Page Title="Kết quả đi sơ đồ nhảy size" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="Maps" %>
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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-object-ungroup"></i> Kết quả đi sơ đồ</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày cấp phát</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người nhận</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
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
                         <th class="bg-th">Ngày cấp phát</th>
                         <th class="bg-th">Người nhận</th>
                         <th class="bg-th">Mẫu</th>
                         <th class="bg-th">Thiết kế</th>
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
                         <th class="bg-th">Ngày cấp phát</th>
                         <th class="bg-th">Người nhận</th>
                         <th class="bg-th">Mẫu</th>
                         <th class="bg-th">Thiết kế</th>
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
                        <span id="lb">KẾT QUẢ ĐI SƠ ĐỒ NHẢY SIZE</span>
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
                     <div class="row">
                            <div class="col-md-12">
                            Ghi chú<br />
                                <input type="text" id="txtNote" class="form-control" style="width: 100%;" />
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
        var options = ["1", "2", "3", "4","5", "6"];

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
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadUserByBranchTypeGroupCode',
                data: '{"branchType":"2","group":"QLSX"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlUser');
                    var opt = document.createElement('option');
                    opt.value = '';
                    opt.innerHTML = 'Chọn người nhận';
                    c1.appendChild(opt);

                    for (var i = 0; i < data.d.length; i++) {
                        opt = document.createElement('option');
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
                "pageLength": 20,
                "autoWidth": false,
                "order": [[0, 'asc']],
                dom: 'Bfrtip',
                "columnDefs": [
               {
                   "targets": [],
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
            total = (total * norm).toFixed(2);
            $('#totalnorm' + id_norm).text(total);
        }
        function saveChanges() {
            var createat = $('#txtCreateAt').val();
            var user = $('#dlUser').val();

            if (createat == '') showAlert('Nhập ngày cấp phát');
            else if (user == '') showAlert("Chọn người nhận");
            else {
                if (confirm("Bạn chắc chắn muốn lưu lệnh sản xuất này ?") == true) {
                    var formId = $('#hdFormId').val();
                    var note = $('#txtNote').val();


                    var data_norm = '';
                    $(".row_norm").each(function (index) {
                        var color_id = $(this).attr("id_color");
                        var norm = $('#norm' + (index + 1)).val();
                        var unit = $('#unit' + (index + 1)).val();
                        var type = $('#type' + (index + 1)).attr("type");
                        var _id = '#dlNPL' + (index + 1).toString() + (type).toString();
                        var mat = $(_id).val();
                        var total = $('#totalnorm' + (index + 1)).text();

                        if (data_norm != '') data_norm += '#';
                        data_norm += color_id + '|' + mat + '|' + type + '|' + norm + '|' + unit + '|' + total;
                    });

                    var data_size = '';
                    var _color = '', _size = '';
                    $(".color").each(function (index) {
                        var size = $(this).attr("size");
                        var color = $(this).attr("color");

                        if (size == 'S') _size = $('#colorS' + color).val();
                        else if (size == 'M') _size = $('#colorM' + color).val();
                        else if (size == 'L') _size = $('#colorL' + color).val();
                        else if (size == 'XL') _size = $('#colorXL' + color).val();
                        else if (size == 'XXL') _size = $('#colorXXL' + color).val();

                        if (data_size != '' && _color != color) data_size += '#';

                        if (_color != color) {
                            _color = color;
                            data_size += color + '|' + _size;
                        }
                        else {
                            data_size += '|' + _size;
                        }

                    });

                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertMaps',
                        data: '{"formId":"' + formId + '","date":"' + createat + '","user":"' + user + '","note":"' + note + '","data_size":"' + data_size + '","data_norm":"' + data_norm + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {

                                showAlert('Đã lưu lệnh cấp phát nguyên phụ liệu');
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
            return false;
        }
        function reset() {
            $('#txtCreateAt').val('');
            $('#txtNote').val('');

            $('#txtS').val('');
            $('#txtM').val('');
            $('#txtL').val('');
            $('#txtXL').val('');
            $('#txtXXL').val('');
            $('#txtN').val('');
            $("#data-detail-soi tr").remove();
        }
        function update_modal(id, formId,formName,userreceiver, datereceiver,note, status) {
            $('#txtForm').val(formName);
            $('#txtCreateAt').val(datereceiver);
            $('#txtNote').val(note);
            $('#dlUser').val(userreceiver);
            $('#select2-dlUser-container').text($('#dlUser option:selected').text());

            if (status == 1) $('.approved').show();
            else $('.approved').hide();

            $('#hdFormId').val(formId);
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getManufactureDetailByForm',
                data: '{"idForm":"' + formId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $(".sxdukien .sxdk").remove();
                    $(".sxthuc .sxth").remove();
                    var sxdukien = "", sxthuc = "",npl = "";
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
                    }
                }
            });

            ////load norm
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadMapsDetail',
                data: '{"idForm":"' + formId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var npl = "";
                    var _pl = ['--','Vải chính', 'Vải lót', 'Vải phối', 'Nguyên phụ liệu'];
                    var id_norm = 0;
                    var _list_material = [];
                    for (var ti = 0; ti < data.d.length; ti++) {
                        id_norm++;
                        if (data.d[ti].Materialid != '')
                            _list_material.push(data.d[ti].Materialid);

                        npl = '<tr class="row_norm" id_color="' + data.d[ti].ColorId + '"><td style="width:20px;">' + id_norm + '</td>';
                        npl += '<td>' + data.d[ti].ColorName + '</td>';
                        npl += '<td><select id="dlNPL' + id_norm + data.d[ti].Type + '" '+(status == 1 ? '' : 'disabled')+' class="form-control select2 dlNPL" style="width: 100%;"></select></td>';
                        npl += '<td id="type' + id_norm + '" type="' + data.d[ti].Type + '" style="padding-left:5px;width:110px;">' + _pl[data.d[ti].Type] + '</td>';
                        npl += '<td><input type="text" class="numbersnorm norm" id="norm' + id_norm + '" id_norm="' + id_norm + '" color="' + data.d[ti].ColorId + '" style="width:50px; height:30px;text-align:center;" value="' + data.d[ti].Normvalue + '" /></td>';
                        npl += '<td><input type="text" id="unit' + id_norm + '" maxlength="15" style="width:80px; height:30px;text-align:center;" value="' + data.d[ti].Unitname + '" /></td>';
                        npl += '<td style="padding-left:5px;width:80px" id="totalnorm' + id_norm + '">' + data.d[ti].TotalNorm + '</td></tr>';
                        $('#data-detail-soi').append(npl);
                    }
                    loadMaterial(_list_material);
                }
            });
        }
        function saveChanges1() {
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
                            url: '/Command.aspx/insertMaps',
                            data: '{"formId":"' + idManu + '","date":"' + date_create + '","user":"' + date_expect + '","data_size":"' + note + '","data_norm":"' + idForm + '"}',
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
        function loadMaterial(list_material) {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadMaterial',
                data: '{"branchtype":"2"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $('.dlNPL').find('option').remove().end();
                    var index = 0;
                    $(".dlNPL").each(function () {
                        var id = $(this).attr("id");
                        var c1 = document.getElementById(id);

                        var opt_ = document.createElement('option');
                        opt_.value = '';
                        opt_.innerHTML = 'Chọn nguyên phụ liệu';
                        c1.appendChild(opt_);

                        for (var y = 0; y < data.d.length; y++) {
                            opt_ = document.createElement('option');
                            opt_.value = data.d[y]._content;
                            opt_.innerHTML = data.d[y]._mess;
                            c1.appendChild(opt_);
                        }
                        $('#' + id).val(list_material[index]);
                        $('#select2-' + id + '-container').text($('#' + id + ' option:selected').text());
                        index++;
                    });

                    setTimeout(function () {
                        $(".select2").select2();

                        $(".numbers").keypress(function (e) {
                            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                               return false;
                            }
                        });

                        $(".numbersnorm").keypress(function (e) {
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

