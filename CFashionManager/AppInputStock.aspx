<%@ Page Title="Duyệt đề xuất nhập" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AppInputStock.aspx.cs" Inherits="AppInputStock" %>

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
            <h4 class="panel-title">Chuỗi cửa hàng</h4>
          </div>
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>

      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">Chi nhánh</h4>
          </div>
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdBranch" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
           <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">Trạng thái</h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdStatus" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                  <asp:ListItem Text="Tất cả" Value="" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chờ duyệt" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Đã duyệt" Value="2"></asp:ListItem>
                  <asp:ListItem Text="Không duyệt" Value="3"></asp:ListItem>
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sign-out"></i> Duyệt đề xuất nhập hàng,NPL</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nội dung đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày nhận hàng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Cấp duyệt</label> </a></li>
        </ul>
    </div>
       </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1070px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày đề xuất</th>
                        <th class="bg-th">Số đề xuất</th>
                        <th class="bg-th">Nội dung đề xuất</th>
                        <th class="bg-th">Người đề xuất</th>
                        <th class="bg-th">Ngày nhận hàng</th>
                        <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Người duyệt</th>
                         <th class="bg-th">Cấp duyệt</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                      <th class='bg-th center' width="40px">STT</th>
                       <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày đề xuất</th>
                        <th class="bg-th">Số đề xuất</th>
                        <th class="bg-th">Nội dung đề xuất</th>
                        <th class="bg-th">Người đề xuất</th>
                        <th class="bg-th">Ngày nhận hàng</th>
                        <th class="bg-th">Trạng thái</th>
                        <th class="bg-th">Người duyệt</th>
                        <th class="bg-th">Cấp duyệt</th>
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
                        <span id="lb">DUYỆT ĐỀ XUẤT NHẬP NGUYÊN PHỤ LIỆU</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Chi nhánh<br />
                            <input type="text" id="txtBranch" class="form-control" disabled style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Người đề xuất<br />
                            <input type="text" id="txtCreateBy" class="form-control" disabled style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Ngày đề xuất<br />
                            <input type="text" id="txtCreateAt" class="form-control" disabled style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Nội dung đề xuất<br />
                            <input type="text" id="txtDescription" class="form-control" disabled style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết đề xuất</div>
                        <div class="row" style="padding: 5px; max-height:250px; overflow-y:auto;max-width:100%; overflow-x:auto;">
                         <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" style="min-width: 850px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>Nguyên phụ liệu</th>
                                    <th>Nhà cung cấp</th>
                                    <th>SL đề xuất</th>
                                    <th>SL nhập</th>
                                    <th>ĐVT</th>
                                    <th>Đơn giá</th>
                                    <th>Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                        </div>
                    <div class="row" style="padding: 5px;">
                        <div class="btn-group col-md-4">
                            <button type="button" title="Duyệt đề xuất này" class="approved btn btn-primary" onclick="Approved(2);">
                                Duyệt</button>
                            <button type="button" title="Không duyệt đề xuất này" class="approved btn btn-danger" onclick="Approved(3);">
                                Không duyệt</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng lại</button>
                        </div>
                        <div class="col-md-8">
                            <input type="text" id="txtContent" class="form-control" placeholder="Nhập nội dung phê duyệt (nếu có)" maxlength="512" style="width: 100%;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <script>
        var options = ["1", "2", "3","4","5","6","7","8","9"];

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
                    if (e.which == 44 || e.which == 46) return true;
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
                      "targets": [6],
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
        function update_modal(id, branch, note, createby, creatat,status) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtDescription').val(note);
            $('#txtBranch').val(branch);
            $('#txtCreateBy').val(createby);
            $('#txtCreateAt').val(creatat);
            document.getElementById('lb').innerText = 'DUYỆT PHIẾU ĐỀ XUẤT NGUYÊN PHỤ LIỆU';

            if (status == 1) {
                $('.approved').show();
                $('#txtContent').show();
            }
            else {
                $('.approved').hide();
                $('#txtContent').hide();
            }

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/OfferMaterialDetail',
                data: '{"Id":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var html = "";
                    for (var t = 0; t < data.d.length; t++) {
                        html = '';
                        html += '<tr id="rows' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '">';
                        html += '<td>' + data.d[t].MaterialCode + ' | ' + data.d[t].MaterialName + '</td>';
                        html += '<td>' + data.d[t].SupplierName + '</td>';
                        html += '<td>' + data.d[t].QuantityOffer + '</td>';
                        html += '<td>' + data.d[t].Quantity + '</td>';
                        html += '<td>' + data.d[t].UnitName + '</td>';
                        html += '<td>' + data.d[t].Price + '</td>';
                        html += '<td>' + data.d[t].Note + '</td>';
                        html += '</tr>';
                        $('#data-detail-soi').append(html);

                    }
                }
            });
        }
        function Approved(status,content) {
            var id = $('#hdDeptId').val();
            var content = $('#txtContent').val();
            var mess = '';
            if (status == 2) mess = 'Bạn chắc chắn muốn duyệt phiếu đề xuất này ?'
            else mess = 'Bạn chắc chắn không duyệt phiếu đề xuất này ?';
            if (confirm(mess) == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/approvedOfferMaterial',
                    data: '{"Id":"' + id + '","status":"' + status + '","content":"' + content + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            if (status == 2) {
                                $('#lbstatus'+id).text('Đã duyệt');
                                showAlert('Đã duyệt phiếu đề xuất');
                            }
                            else {
                                $('#lbstatus'+id).text('Không duyệt');
                                showAlert('Đã hủy duyệt phiếu đề xuất');
                            }
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                            $("#addDept").modal('hide');
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
        }
    </script>
</asp:Content>

