<%@ Page Title="Giao sản phẩm gia công" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="OutSourcing.aspx.cs" Inherits="OutSourcing" %>

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
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdStatus" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                  <asp:ListItem Text="Tất cả" Value="" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chưa hoàn thiện" Value="2"></asp:ListItem>
                  <asp:ListItem Text="Đã hoàn thiện" Value="3"></asp:ListItem>
              </asp:RadioButtonList>
              
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-home"></i> Đơn vị gia công</h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdSupplier" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-object-group"></i> Giao gia công sản xuất</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhà gia công</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày gia công</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày hẹn trả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày hoàn thiện</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" />&nbsp;Thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người cắt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
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
                         <th class="bg-th">Nhà gia công</th>
                         <th class="bg-th">Ngày gia công</th>
                         <th class="bg-th">Ngày hẹn trả</th>
                         <th class="bg-th">Ngày hoàn thiện</th>
                         <th class="bg-th">Mẫu thiết kế</th>
                         <th class="bg-th">Thiết kế</th>
                         <th class="bg-th">Mô tả</th>
                         <th class="bg-th">Người cắt</th>
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
                         <th class="bg-th">Nhà gia công</th>
                         <th class="bg-th">Ngày gia công</th>
                         <th class="bg-th">Ngày hẹn trả</th>
                         <th class="bg-th">Ngày hoàn thiện</th>
                         <th class="bg-th">Mẫu thiết kế</th>
                         <th class="bg-th">Thiết kế</th>
                         <th class="bg-th">Mô tả</th>
                         <th class="bg-th">Người cắt</th>
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
                        <i class="fa fa-object-group" aria-hidden="true"></i>
                        <span id="lb">GIAO SẢN XUẤT GIA CÔNG</span>
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
                                    Chọn nhà gia công<br />
                                      <select id="dlSupplier" class="form-control select2" style="width: 100%;">
                                      </select>
                                </div>
                            </div>
                         <div class="row" style="padding: 5px;">
                                 <div class="col-md-3">
                                    Ngày gia công<br />
                                     <input type="text" id="txtCreateAt" class="form-control datepicker2" style="width: 100%;" />
                                </div>
                                <div class="col-md-3">
                                    Ngày hẹn trả<br />
                                    <input type="text" id="txtExpectDate" class="form-control datepicker2" style="width: 100%;" />
                                </div>
                                <div class="col-md-6">
                                    Ghi chú<br />
                                    <input type="text" id="txtNote" placeholder="Ghi chú các giấy tờ, văn bản liên quan..." class="form-control" style="width: 100%;" />
                                </div>
                            </div>
                         <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px;">
                            Số lượng sản xuất
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
                              <button type="button" class="approved btn btn-sm btn-primary" onclick="saveChanges();">Giao gia công</button>
                              <button type="button" class="btn btn-sm btn-success" data-dismiss="modal">Đóng lại</button>
                          </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdId" value="" />
    <input type="hidden" id="hdFormId" value="" />
    
    <script>
        var options = ["1", "2", "3", "4","5", "6","10"];

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

            loadSupplier();
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
                   "targets": [7,8,9],
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
        function saveChanges() {
            var Id = $('#hdId').val();
            var supplier = $('#dlSupplier').val();
            var supplier_name = $('#dlSupplier option:selected').text();
            var formId = $('#hdFormId').val();
            var create = $('#txtCreateAt').val();
            var expect = $('#txtExpectDate').val();
            var note = $('#txtNote').val();

            if (supplier == '') showAlert('Chọn đơn vị gia công');
            else if (create == '') showAlert('Nhập ngày giao mẫu');
            else if (expect == '') showAlert('Nhập ngày hẹn trả mẫu');
            else {
                if (confirm("Bạn chắc chắn muốn giao cho gia công " + supplier_name + " ?") == true) {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateOutSourcing',
                        data: '{"Id":"' + Id + '","formId":"' + formId + '","supplierId":"' + supplier + '","dateCreate":"' + create + '","dateExpect":"' + expect + '","note":"' + note + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã giao mẫu thiết kế ' + $('#txtForm').val() + ' cho gia công ' + supplier_name);
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
        function complete() {
            var Id = $('#hdId').val();
            var formId = $('#hdFormId').val();
            var note = $('#txtNote').val();
            
            if (confirm("Bạn chắc chắn mẫu " + $('#txtForm').val() + " đã hoàn thành gia công ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/completeOutSourcing',
                    data: '{"Id":"' + Id + '","formId":"' + formId + '","note":"' + note + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã hoàn thành mẫu thiết kế ' + $('#txtForm').val());
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
        function update_modal(id, formId,formName,dateCreate, dateExpect, supplierId,note, status) {
            $('#hdId').val(id);
            $('#txtForm').val(formName);
            $('#txtCreateAt').val(dateCreate);
            $('#txtExpectDate').val(dateExpect);
            $('#txtNote').val(note);
            $('#dlSupplier').val(supplierId);
            $('#select2-dlSupplier-container').text($('#dlSupplier option:selected').text());

            if (status == 1) {
                $('.approved').show();
            }
            else if (status == 2) {
                $('.approved').hide();
            }
            else if (status == 3) {
                $('.approved').hide();
            }

            $('#hdFormId').val(formId);
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getManufactureDetailByForm',
                data: '{"idForm":"' + formId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $(".sxthuc .sxth").remove();
                    var sxthuc = "",npl = "";
                    for (var t = 0; t < data.d.length; t++) {
                        sxthuc = '';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6"><b>Màu sắc</b><br/><input type="text" class="numbers" disabled style="min-width:60px; width:100%; font-weight:bold;" value="' + data.d[t].ColorName + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size S<br /><input type="text" disabled style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeS + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size M<br /><input type="text" disabled style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeM + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size L<br /><input type="text" disabled style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeL + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size XL<br /><input type="text" disabled style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeXL + '" /></div>';
                        sxthuc += '<div class="sxth col-md-2 col-xs-6">Size XXL<br /><input type="text" disabled style="min-width:60px; width:100%;text-align:center;" value="' + data.d[t].SizeXXL + '" /></div>';

                        $('.sxthuc').append(sxthuc);
                    }
                }
            });

            ////load norm
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadCutManufactureDetail',
                data: '{"idForm":"' + formId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var npl = "";
                    var _pl = ['--','Vải chính', 'Vải lót', 'Vải phối', 'Nguyên phụ liệu'];
                    var id_norm = 0;
                    for (var ti = 0; ti < data.d.length; ti++) {
                        id_norm++;
                        
                        npl = '<tr class="row_norm"><td style="width:20px;">' + id_norm + '</td>';
                        npl += '<td>' + data.d[ti].ColorName + '</td>';
                        npl += '<td>' + data.d[ti].Materialid + '</td>';
                        npl += '<td style="padding-left:5px;width:110px;">' + _pl[data.d[ti].Type] + '</td>';
                        npl += '<td><input type="text" disabled style="width:50px; height:30px;text-align:center;" value="' + data.d[ti].Normvalue + '" /></td>';
                        npl += '<td><input type="text" disabled style="width:80px; height:30px;text-align:center;" value="' + data.d[ti].Unitname + '" /></td>';
                        npl += '<td style="padding-left:5px;"><input type="text" disabled style="width:80px; height:30px;text-align:center;" value="' + data.d[ti].TotalNorm + '" /></td></tr>';
                        $('#data-detail-soi').append(npl);
                    }
                }
            });
        }
    </script>
     <script type="text/javascript">
         function loadSupplier() {
             $('#dlSupplier').find('option').remove().end();
             var c1 = document.getElementById('dlSupplier');
             var opt = document.createElement('option');
             opt.value = "";
             opt.innerHTML = 'Chọn nhà gia công';
             c1.appendChild(opt);

             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/getSupplierByType',
                 data: '{"typeId":"2"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     
                     for (var i = 0; i < data.d.length; i++) {
                         opt = document.createElement('option');
                         opt.value = data.d[i]._content;
                         opt.innerHTML = data.d[i]._mess;
                         c1.appendChild(opt);
                     }
                 }
             });
         }
    </script>
</asp:Content>

