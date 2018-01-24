<%@ Page Title="Duyệt mẫu sống" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="FormLive.aspx.cs" Inherits="FormLive" %>


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
                  <asp:ListItem Text="Tất cả" Value="0" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chưa duyệt" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Mẫu duyệt" Value="2"></asp:ListItem>
                  <asp:ListItem Text="Không duyệt" Value="3"></asp:ListItem>
                  <asp:ListItem Text="Chờ sửa lại" Value="4"></asp:ListItem>
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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-gears"></i> Duyệt mẫu sống</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu tháng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Màu sắc</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
            
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
                         <th class="bg-th">Người duyệt</th>
                         <th class="bg-th">Ngày duyệt</th>
                         <th class="bg-th">Người thiết kế</th>
                         <th class="bg-th">Mã thiết kế</th>
                        <th class="bg-th">Tên mẫu</th>
                         <th class="bg-th">Mẫu tháng</th>
                         <th class="bg-th">Màu sắc</th>
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
                         <th class="bg-th">Người duyệt</th>
                         <th class="bg-th">Ngày duyệt</th>
                         <th class="bg-th">Người thiết kế</th>
                         <th class="bg-th">Mã thiết kế</th>
                        <th class="bg-th">Tên mẫu</th>
                         <th class="bg-th">Mẫu tháng</th>
                         <th class="bg-th">Màu sắc</th>
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
                        <i class="fa fa-object-ungroup" aria-hidden="true"></i>
                        <span id="lb">KIỂM KCS MẪU</span>
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
                                <div class="col-md-12">
                                    Tên mẫu<br />
                                    <input type="text" id="txtName" disabled class="form-control" style="width: 100%;" />
                                </div>
                            </div>
                            <div class="row" style="padding: 5px;">
                                <div class="col-md-6">
                                    Mẫu tháng<br />
                                    <input type="text" id="txtMonth" disabled class="form-control" style="width: 100%;" />
                                </div>
                                 <div class="col-md-6">
                                    Màu sắc<br />
                                    <input type="text" id="txtColor" disabled class="form-control" style="width: 100%;" />
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
                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 450px; margin-left: 15px;">
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
                            <button type="button" class="approved btn btn-primary" onclick="approved(2);">Mẫu đạt</button>
                            <button type="button" class="edit btn btn-success" onclick="approved(4);">Yêu cầu sửa lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Đóng lại</button>
                          </span>
                          <input type="text" id="txtContent" class="edit form-control" placeholder="Nhập nội dung (nếu có)" maxlength="512" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <script>
        var options = ["1", "2", "3", "4", "5", "6", "7", "8", "11"];

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
                "columnDefs": [
               {
                   "targets": [9,10],
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
        function update_modal(formId, code, name, month,color, des, fullname, complete,edit) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(formId);
            $('#txtCode').val(code);
            $('#txtContent').val('');
            $('#txtColor').val(color);
            $('#txtName').val(name);
            $('#txtFullName').val(fullname);
            $('#txtMonth').val(month);
            $('#txtDescription').val(des);
            document.getElementById('lb').innerText = 'DUYỆT MẪU SỐNG';

            if (complete == 1 || edit==1) {
                $('.approved').show();
                $('.edit').show();
            }
            else {
                $('.approved').hide();
                $('.edit').hide();
            }

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getDetailForm',
                data: '{"id":"' + formId + '"}',
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

                        html += '<tr><td>' + data.d[t].MaterialName + '</td><td>' + type_name + '</td>';
                        html += '<td>' + data.d[t].Norm + '</td><td>' + data.d[t].UnitName + '</td></tr>';
                        $('#data-detail-soi').append(html);
                    }
                }
            });
        }
        function approved(status) {
            var code = $('#txtCode').val();
            var name = $('#txtName').val();
            var content = $('#txtContent').val();
            var mess = '';
            if (status == '2')
                mess = 'Bạn chắc chắc mẫu ' + name +' - '+ code + ' này ĐẠT ?';
            else
                mess = 'Bạn chắc chắn yêu cầu mẫu ' + name +' - '+ code + ' SỬA LẠI mẫu ?';

            if (confirm(mess) == true) {
                var id = $('#hdDeptId').val();

                if (status == '4' && content == '')//neu yeu cau sua lai mau thi nhap noi dung sua lai
                    showAlert('Nhập nội dung yêu cầu sửa lại mẫu');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateFormLive',
                        data: '{"formId":"' + id + '","status":"' + status + '","content":"' + content + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {

                                if (status == '2')
                                    showAlert('Đã hoàn thành mẫu [' + name + ' - ' + code + ']');
                                else
                                    showAlert('Đã yêu cầu sửa lại mẫu [' + name + ' - ' + code + ']');

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
            var code = $('#txtCode').val();
            var content = $('#txtContent').val();
            if (confirm("Bạn chắc chắn đã hoàn thành mẫu " + code + " này ?") == true) {
                var id = $('#hdDeptId').val();
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/completeFormSewing',
                    data: '{"id":"' + id + '","content":"' + content + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã cập nhật hoàn thành mẫu [' + code + ']');

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
    </script>
</asp:Content>


