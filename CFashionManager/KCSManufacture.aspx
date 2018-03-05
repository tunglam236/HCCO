<%@ Page Title="KCS gia công sản xuất" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="KCSManufacture.aspx.cs" Inherits="KCSManufacture" %>


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
                  <asp:ListItem Text="Chưa kiểm" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Đang kiểm" Value="2"></asp:ListItem>
                  <asp:ListItem Text="Đã kiểm xong" Value="3"></asp:ListItem>
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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-object-group"></i> Kiểm KCS gia công sản xuất</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhà gia công</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;KCS kiểm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày hoàn thành</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thiết kế</label> </a></li>
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
                         <th class="bg-th">KCS kiểm</th>
                         <th class="bg-th">Ngày hoàn thành</th>
                         <th class="bg-th">Mẫu thiết kế</th>
                         <th class="bg-th">Thiết kế</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                          <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Nhà gia công</th>
                         <th class="bg-th">KCS kiểm</th>
                         <th class="bg-th">Ngày hoàn thành</th>
                         <th class="bg-th">Mẫu thiết kế</th>
                         <th class="bg-th">Thiết kế</th>
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
                        <span id="lb">THÔNG TIN SẢN XUẤT</span>
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
                                    Đơn vị gia công<br />
                                      <input type="text" id="txtSupplier" disabled class="form-control" style="width: 100%;" />
                                </div>
                            </div>
                    </div>
                    <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết số lượng sản xuất
                    </div>
                    <div class="row input-hide" style="padding: 5px; max-height: 320px; overflow-y: auto;">
                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 550px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Màu sắc</th>
                                    <th>Size</th>
                                    <th>Số lượng sản xuất</th>
                                    <th>Số lượng nhận</th>
                                    <th>Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                          <span class="btn-group">
                              <button type="button" title="Lưu khi số lượng mẫu chưa kiểm đủ" class="approved btn btn-sm btn-primary" onclick="saveChanges(1);">Lưu lại</button>
                              <button type="button" title="Lưu khi số lượng mẫu đã kiểm đủ" class="approved btn btn-sm btn-danger" onclick="saveChanges(2);">Lưu lại và hoàn thiện</button>
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
        var options = ["1", "2", "3", "4", "5", "6"];

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
        function saveChanges(complete) {
            var formId = $('#hdFormId').val();
            var data_kcs = '';
            
            $(".row_kcs").each(function (index) {
                var _id = $(this).attr("id_rows");
                var quantity = $('#quantity' + _id).val();
                var note = $('#note' + _id).val();

                if(quantity=='')
                    quantity='0';
                if(quantity != '0'){
                    if (data_kcs != '') data_kcs += '#';
                    data_kcs += _id + '|' + quantity + '|' + note;
                }
            });
            
            if (data_kcs == '') showAlert('Chưa nhập số lượng nào');
            else {
                if (confirm("Bạn chắc chắn muốn lưu thông tin kiểm này ?") == true) {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateKCSManufacture',
                        data: '{"formId":"' + formId + '","data":"' + data_kcs + '","complete":"' + complete + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã lưu thông tin kiểm KCS');
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
        
        function checkMax(id, values, max) {
            if (parseInt(values) > parseInt(max)) {
                showAlert('Số lượng không được lớn hơn ' + max);
                $('#quantity' + id).val('0');
            }
        }
        function update_modal(id, formId,formName,supplierName, status) {
            $('#hdId').val(id);
            $('#hdFormId').val(formId);
            
            $('#txtForm').val(formName);
            $('#txtSupplier').val(supplierName);

            if (status == 1 || status == 2) {
                $('.approved').show();
            }
            else $('.approved').hide();

            $('#hdFormId').val(formId);

            ////load detail
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getKCSManufactureDetail',
                data: '{"idForm":"' + formId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var npl = "";
                    var id_norm = 0;
                    for (var ti = 0; ti < data.d.length; ti++) {
                        id_norm++;
                        
                        npl = '<tr id_rows="' + data.d[ti]._id + '" class="row_kcs"><td style="width:20px;">' + id_norm + '</td>';
                        npl += '<td>' + data.d[ti].ColorName + '</td>';
                        npl += '<td>' + data.d[ti].Size + '</td>';
                        npl += '<td width="120px"><input type="text" disabled style="width:90%; height:30px;text-align:center;" value="' + data.d[ti].Quantity + '" /></td>';
                        npl += '<td width="120px"><input type="text" id="quantity' + data.d[ti]._id + '" class="numbers" onchange="checkMax(' + data.d[ti]._id + ',$(this).val(),' + data.d[ti].Quantity + ')" style="width:90%; height:30px;text-align:center;" value="' + data.d[ti].TotalQuantity + '" /></td>';
                        npl += '<td><input type="text" id="note' + data.d[ti]._id + '" maxlength="128" style="height:30px;width:95%;" value="' + data.d[ti].Note + '" /></td></tr>';
                        $('#data-detail-soi').append(npl);
                    }
                    setTimeout(function () {
                        $(".numbers").keypress(function (e) {
                            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                                return false;
                            }
                        });
                    }, 1000);
                }
            });
        }
    </script>
</asp:Content>


