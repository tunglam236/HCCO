<%@ Page Title="Danh sách nhập hàng" Language="C#" MasterPageFile="~/Admin.master"
    AutoEventWireup="true" CodeFile="InputStock.aspx.cs" Inherits="InputStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        #tbdetail tr td,#data-detail-soi tr td
        {
            border-bottom: 1px solid #ccc;
            line-height: 35px;
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
        .detail-rows,.add-detail-rows
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
        .height30 { line-height:30px}
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
        .rdList
        {
            margin: 5px;
            width: 95%;
        }
        .rdList tr td
        {
            border-bottom: 1px solid #ccc;
            padding: 10px 0px;
        }
        .detail-rows:hover,#tbdetail tr:hover,.add-detail-rows:hover
        {
            background-color: whitesmoke !important;
        }
        .format-input{ width:55px; height:25px; text-align:center;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
   <div class="row">
   <div class="col-xs-12 col-md-2" style=" padding:10px;">
       <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse4">Chuỗi cửa hàng</a>
            </h4>
          </div>
          <div id="collapse4" class="panel-collapse">
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>

      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse1">Thời gian</a>
            </h4>
          </div>
          <div id="collapse1" class="panel-collapse">
            <ul class="list-group">
              <li class="list-group-item"><label>Từ ngày</label>
              <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepicker2" Width="99%"></asp:TextBox>
              </li>
              <li class="list-group-item"><label>Đến ngày</label>
                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepicker2" Width="99%"></asp:TextBox>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Chi nhánh</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdBranch" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse2">Loại phiếu nhập</a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse" style="padding:5px;">
          <asp:RadioButtonList ID="rdOutputType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                <asp:ListItem Value="" Selected="True"> Tất cả</asp:ListItem>
                <asp:ListItem Value="1"> Nhập nhà cung cấp</asp:ListItem>
                <asp:ListItem Value="2"> Nhập điều chuyển</asp:ListItem>
                <asp:ListItem Value="0"> Nhập trả lại</asp:ListItem>
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sign-in"></i> Quản lý nhập hàng</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addStockInternal"><i class="glyphicon glyphicon glyphicon-share"></i> Nhập điều chuyển</a>
       <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addStock"><i class="glyphicon glyphicon glyphicon-edit"></i> Nhập từ nhà cung cấp</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
         <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số hóa đơn</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Loại phiếu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đối tượng nhận</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đối tượng xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning" style="padding-left:10px;">
            <div class="box-header" style="text-align:right;">
            </div>
             <div class="box-body" style="max-width:100%; overflow-x:auto;">
            <table id="example2" class="table hover cell-border" style="min-width:1050px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="60px"></th>
                        <th class="bg-th" width="80px">Số hóa đơn</th>
                        <th class="bg-th" width="80px">Loại phiếu</th>
                        <th class="bg-th" width="100px">Đối tượng nhận</th>
                        <th class="bg-th" width="100px">Đối tượng xuất</th>
                        <th class="bg-th center" width="60px">Ngày xuất</th>
                        <th class="bg-th" width="80px">Người xuất</th>
                        <th class="bg-th">Ghi chú</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="60px"></th>
                        <th class="bg-th">Số hóa đơn</th>
                        <th class="bg-th">Loại phiếu</th>
                        <th class="bg-th">Đối tượng nhận</th>
                        <th class="bg-th">Đối tượng xuất</th>
                        <th class="bg-th">Ngày xuất</th>
                        <th class="bg-th">Người xuất</th>
                        <th class="bg-th">Ghi chú</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <div class="modal fade" id="addStockInternal" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>NHẬP ĐIỀU CHUYỂN</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin nhập hàng</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType2" class="form-control select2" onchange="loadBranch2($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Chi nhánh nhận<br />
                            <select id="dlBranch2" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Số phiếu xuất<br />
                            <input type="text" id="txtStockOutputCode" placeholder="Nhập số phiếu xuất xong Enter" class="stockCode form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row input-hide" style="padding: 5px;">
                        <div class="col-md-4 height30">
                            <b>Ngày xuất</b><br />
                            <label id="lbCreateAt"></label>
                        </div>
                        <div class="col-md-4 height30">
                            <b>Người xuất</b><br />
                            <label id="lbCreateBy"></label>
                        </div>
                        <div class="col-md-4 height30">
                           <b>Chi nhánh xuất</b><br />
                            <label id="lbBranch"></label>
                        </div>
                    </div>
                    <div class="row input-hide" style="padding: 5px;">
                        <div class="col-md-12 height30">
                            <b>Nội dung xuất</b><br />
                            <label id="lbNote"></label>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Ghi chú<br />
                            <input type="text" id="txtNote2" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết nhập hàng</div>
                    <div class="row input-hide" style="padding: 5px;max-height: 200px;overflow-y: scroll;">
                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 500px;
                            margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>
                                        Mã vạch
                                    </th>
                                    <th>
                                        Mã sản phẩm
                                    </th>
                                    <th>
                                        Tên sản phẩm
                                    </th>
                                    <th>
                                        Số lượng
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="viewStockOutput();">
                                Xem phiếu xuất</button>
                            <button type="button" class="btn btn-success" onclick="saveStockOutput();">
                                Lưu phiếu nhập</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <img class="crop-loading" src="dist/img/crop.gif" style="display:none;position:fixed; top:50%; left:50%" />
    <input type="hidden" id="hdBranchFrom" value="" />
    <div class="modal fade" id="inputQuick" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-spinner" aria-hidden="true"></i> NHẬP NHANH SẢN PHẨM</h4>
                </div>
                <div class="modal-body">
                    <i>Copy dữ liệu từ file Excel tương ứng với các cột bên dưới và dán vào đây</i>
                    <div class="row" style="padding: 5px;">
                        <table cellpadding="5" cellspacing="5" border="0" width="80%" margin-left: 15px;">
                            <tr>
                                <th>
                                    Mã vạch
                                </th>
                                 <th>
                                    Mã sản phẩm  -  Tên sản phẩm  -  Số lượng
                                </th>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea id="txtquick" rows="5" cols="90"></textarea>
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12 btn-group" style="padding-left: 5px;">
                            <button type="button" class="btn btn-success" onclick="getQuick();">Import</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addStock" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>NHẬP TỪ NHÀ CUNG CẤP</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin nhập hàng</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Chi nhánh<br />
                            <select id="dlBranch" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                           Nhà cung cấp<br />
                            <select id="dlSupplier" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Ghi chú<br />
                            <input type="text" id="txtNote" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết nhập hàng</div>
                    <div class="row" style="padding: 5px;">
                        <%--<div class="col-md-2">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="productCode" class="proCode form-control" style="width: 100%;" />
                        </div>--%>
                        <div class="col-md-10">
                            Tìm kiếm sản phẩm<br />
                            <select id="dlProduct" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        
                        <div class="col-md-2">
                            Số lượng<br />
                            <input type="text" id="quantity" class="proCode numbers form-control" style="width: 100%;" />
                        </div>
                        <%--<div class="col-md-2">
                            <br />
                            <a href="#" data-toggle="modal" data-target="#inputQuick" class="" style="color:white;">Nhập nhanh</a>
                        </div>--%>
                    </div>
                    <div class="row" style="padding: 5px;max-height: 200px;overflow-y: scroll;">
                        <table id="tbdetail" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 500px;
                            margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>
                                        Xóa
                                    </th>
                                    <th>
                                        Mã vạch
                                    </th>
                                    <th>
                                        Mã sản phẩm
                                    </th>
                                    <th>
                                        Tên sản phẩm
                                    </th>
                                    <th>
                                        Số lượng
                                    </th>
                                    
                                </tr>
                            </thead>
                            <tbody id="data-detail">
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" onclick="addProduct();">
                                Thêm sản phẩm</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
                <img class="process-loading" src="dist/img/3dots.gif" style="display:none; position:absolute; top:0px; left:0px; width:100px" />
            </div>
        </div>
    </div>
    <script>
        var options = ["1", "2", "3", "4", "5", "6", "7"];
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
                "pageLength": 10,
                //"drawCallback": function (settings) {
                //    var api = this.api();
                //    var rows = api.rows({ page: 'current' }).nodes();
                //    var last = null;

                //    api.column(5, { page: 'current' }).data().each(function (group, i) {
                //        if (last !== group) {
                //            $(rows).eq(i).before(
                //                '<tr class="group"><td colspan="3" style="text-transform: uppercase;"><b>Số hóa đơn : ' + group + '</b></td></tr>'
                //            );
                //            last = group;
                //        }
                //    });
                //},
                "autoWidth": false,
                "order": [[1, 'asc']],
                "columnDefs": [
                {
                    "targets": [],
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

            $('#example2 tbody').on('click', 'tr .showchild', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);
                if (row.child.isShown()) {
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    var id = row.selector.rows.prevObject.context.id;
                    var html = '';
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/getStockInputdetail',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr>';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i].CodeId + '</td>';
                                data_html += '<td>' + data.d[i].ProductCode + '</td>';
                                data_html += '<td>' + data.d[i].ProductName + '</td>';
                                data_html += '<td>' + data.d[i].Quantity + '</td>';
                                data_html += '</tr>';

                            }
                            html = '<table id="tbdetail" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:95%; margin-left:25px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="30px">STT</td>' +
                                        '<td class="bold">Mã vạch</td>' +
                                        '<td class="bold">Mã sản phẩm</td>' +
                                        '<td class="bold">Tên sản phẩm</td>' +
                                        '<td class="bold">Số lượng</td>' +
                                    '</tr>' + data_html +
                                '</table>';


                            row.child(html).show();
                            tr.addClass('shown');
                        }
                    });
                }
            });
            $(".select2").select2();
        });
    </script>
    <script type="text/javascript">
        function viewStockOutput()
        {
            var branchType = $('#dlBranchType2').val();
            var branch = $('#dlBranch2').val();
            var stockCode = $('#txtStockOutputCode').val();
           
            if (stockCode != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getStockOutputDetailInternal',
                    data: '{"branchTypeId":"' + branchType + '","branchId":"' + branch + '","stockCode":"' + stockCode + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var createat = document.getElementById('lbCreateAt');
                        var createby = document.getElementById('lbCreateBy');
                        var branch = document.getElementById('lbBranch');
                        var note = document.getElementById('lbNote');

                        if (data.d[0].OK == "1") {
                            var html = "";
                            $('.input-hide').show();
                            createat.innerHTML = data.d[0].CreateAt;
                            createby.innerHTML = data.d[0].CreateBy;
                            branch.innerHTML = data.d[0].BranchFrom;
                            note.innerHTML = data.d[0].Note;
                            $('#hdBranchFrom').val(data.d[0].BranchId);

                            for (var t = 0; t < data.d.length; t++) {
                                html += '<tr><td>' + data.d[t].CodeId + '</td><td>' + data.d[t].ProCode + ' </td><td>' + data.d[t].ProName + '</td><td>' + data.d[t].Quantity + '</td></tr>'
                            }
                            $('#data-detail-soi tr').remove();
                            $('#data-detail-soi').append(html);
                        }
                        else {
                            $('.input-hide').hide();
                            createat.innerHTML = '';
                            createby.innerHTML = '';
                            branch.innerHTML = '';
                            note.innerHTML = '';
                            $('#hdBranchFrom').val('');
                            $('#data-detail-soi tr').remove();
                            showAlert(data.d[0].Mess);
                        }
                    }
                });
            }
            else showAlert('Nhập số phiếu xuất điều chuyển');
            return false;
        }
        function saveStockOutput() {
            var branchType = $('#dlBranchType2').val();
            var branch = $('#dlBranch2').val();
            var stockCode = $('#txtStockOutputCode').val();
            var note = $('#txtNote2').val();
            var branchFrom = $('#hdBranchFrom').val();
            console.log(branchFrom);

            if (stockCode != '' && branchFrom !='') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/saveStockInputInternal',
                    data: '{"branchTypeId":"' + branchType + '","branchId":"' + branch + '","branchfrom":"' + branchFrom + '","outputcode":"' + stockCode + '","note":"'+note+'"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            var createat = document.getElementById('lbCreateAt');
                            var createby = document.getElementById('lbCreateBy');
                            var branch = document.getElementById('lbBranch');
                            var note = document.getElementById('lbNote');

                            createat.innerHTML = '';
                            createby.innerHTML = '';
                            branch.innerHTML = '';
                            note.innerHTML = '';
                            $('#hdBranchFrom').val('');
                            $('#txtStockOutputCode').val('');
                            $('#txtNote2').val('');

                            $('#data-detail-soi tr').remove();
                            showAlert('Lưu phiếu nhập điều chuyển thành công');

                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 2000);
                        }
                        else {
                            showAlert(data.d._mess);
                        }
                    }
                });
            }
            else showAlert('Chưa có thông tin phiếu xuất, nhập lại số phiếu xuất điều chuyển');
            return false;
        }
    </script>
    <script type="text/javascript">
        function removeproduct(index, name) {
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                var id = '#rows' + index;
                $(id).remove();
                showAlert('Đã xóa sản phẩm [' + name + ']');
            }
            return false;
        }
        function addProduct() {
            //var code = $('#productCode').val();
            var pro_id = $('#dlProduct').val();
            var pro_name = $('#dlProduct option:selected').text()
            var quantity = $('#quantity').val();
            if (quantity == '') quantity = '1';
            if (pro_id != '') {
                var ok = true;
                $("#data-detail tr").each(function () {
                    var _id = $(this).attr("data-code");
                    if (_id == pro_id) ok = false;
                });
                if (ok) {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/getDetailProductBySearch',
                        data: '{"branchTypeId":"' + $('#dlBranchType').val() + '","Id":"' + pro_id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d.OK == '1') {
                                var html = "";
                                html += "<tr class='add-detail-rows' id='rows" + data.d.Id + "' data-code='" + data.d.Id + "'>" +
                                            "<td>" +
                                                "<a onclick='removeproduct(" + data.d.Id + ",\"" + data.d.ProductName + "\");'><i class='fa fa-trash-o' aria-hidden='true'></i></a>" +
                                            "</td>" +
                                            "<td>" + data.d.CodeId + "</td>" +
                                            "<td>" + data.d.ProductCode + "</td>" +
                                            "<td>" + data.d.ProductName + "</td>" +
                                            "<td><input type='text' class='format-input numbers' id='quantity" + data.d.Id + "' value='" + quantity + "' /></td>" +
                                        '</tr>';
                                $('#data-detail').append(html);
                                //$('#productCode').val('');
                                //$('#productCode').focus();
                                $('#quantity').val('1');
                            }
                            else
                                showAlert('Không tìm thấy sản phẩm ' + pro_name + '. Kiểm tra lại');
                        }
                    });
                }
                else
                    showAlert('Đã tồn tại sản phẩm ' + pro_name+', hãy kiểm tra lại');
            }
            else showAlert('Chọn sản phẩm cần thêm');
            return false;
        }
        function saveChanges() {
            $('.process-loading').show();
            var branchTypeId = $('#dlBranchType').val();
            var branchId = $('#dlBranch').val();
            var supplierId = $('#dlSupplier').val();
            var note = $('#txtNote').val();
            var data = "";

            $(".add-detail-rows").each(function () {
                var id = $(this).attr("data-code");
                var quantity = $("#quantity" + id).val();
                if (data != "") data += "#";
                data += id + "," + quantity;
            });

            if (branchTypeId == "") showAlert('Chọn chuỗi');
            else if (branchId == "") showAlert('Chọn chi nhánh');
            else if (data == "") showAlert('Chưa có dữ liệu nào để lưu');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertStockInput',
                    data: '{"branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","supplierId":"' + supplierId + '","note":"' + note + '","totalPrice":"0","data":"' + data + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('.add-detail-rows').remove();
                            $('#txtNote').val('');
                            //$('#productCode').val('');
                            //$('#productCode').focus();
                            $('#quantity').val('1');
                            showAlert('Lưu phiếu nhập thành công');

                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 2000);
                        }
                        else
                            showAlert('Có lỗi khi lưu phiếu nhập, chi tiết: ' + data.d._mess);
                    }
                });
            }
            $('.process-loading').hide();
        }
        function numberWithCommas(x) {
            x = x.toString();
            var pattern = /(-?\d+)(\d{3})/;
            while (pattern.test(x))
                x = x.replace(pattern, "$1,$2");
            return x + ' đ';
        }
        function getQuick()
        {
            $('#data-detail tr').remove();
            var q = $('#txtquick').val();
            var line = q.split('\n');
            for (var t = 0; t < line.length; t++) {
                if (line[t] != '') {
                    var sp = line[t].split('	');
                    var html = "";
                    html += "<tr class='add-detail-rows' id='rows" + sp[0].substring(2, sp[0].length) + "' data-code='" + sp[0].substring(2, sp[0].length) + "'>" +
                                "<td>" +
                                    "<a onclick='removeproduct(" + sp[0].substring(2, sp[0].length) + ",\"" + sp[2] + "\");'><i class='fa fa-trash-o' aria-hidden='true'></i></a>" +
                                "</td>" +
                                "<td>" + sp[0] + "</td>" +
                                "<td>" + sp[1] + "</td>" +
                                "<td>" + sp[2] + "</td>" +
                                "<td><input type='text' class='format-input numbers' id='quantity" + sp[0].substring(2, sp[0].length) + "' value='" + sp[3] + "' /></td>" +
                            '</tr>';
                    $('#data-detail').append(html);
                }
            }
            //$('#productCode').val('');
            //$('#productCode').focus();
            $('#quantity').val('1');
            $('#inputQuick').modal('hide');
        }
    </script>

    <script>
        function changeType(id) {
            $('.process-loading').show();
            loadBranchbyType(id);

            loadSupplierbyType(id);
            $('.process-loading').hide();
        }

        function loadBranchbyType(id) {
            $('#dlBranch').find('option').remove().end();
            var c1 = document.getElementById('dlBranch');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn chi nhánh';
            c1.appendChild(opt_);

            $('#dlProduct').find('option').remove().end();
            var c2 = document.getElementById('dlProduct');
            var opt2_ = document.createElement('option');
            opt2_.value = '';
            opt2_.innerHTML = 'Chọn sản phẩm';
            c2.appendChild(opt2_);

            if (id != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getBranchByType',
                    data: '{"typeId":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
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
                    url: '/Command.aspx/loadProductByBranchType',
                    data: '{"branchType":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i]._id;
                            opt.innerHTML = data.d[i]._content;
                            c2.appendChild(opt);
                        }
                    }
                });
            }
        }
        function loadBranch2(id) {
            $('#dlBranch2').find('option').remove().end();
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getBranchByType',
                data: '{"typeId":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlBranch2');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                }
            });
        }
        function loadSupplierbyType(id) {
            $('#dlSupplier').find('option').remove().end();
            var c1 = document.getElementById('dlSupplier');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn nhà cung cấp';
            c1.appendChild(opt_);

            if (id != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getSupplierByType',
                    data: '{"typeId":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i]._content;
                            opt.innerHTML = data.d[i]._mess;
                            c1.appendChild(opt);
                        }
                    }
                });
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.input-hide').hide();
            $('.process-loading').hide();
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $(".proCode").keypress(function (e) {
                if (e.which == 13) {
                    addProduct();
                    return false;
                }
            });
            $(".stockCode").keypress(function (e) {
                if (e.which == 13) {
                    viewStockOutput();
                    return false;

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
                    var opt_ = document.createElement('option');
                    opt_.value = '';
                    opt_.innerHTML = 'Chọn chuỗi';
                    c1.appendChild(opt_);

                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    var c2 = document.getElementById('dlBranchType2');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c2.appendChild(opt);
                    }

                    loadBranchbyType($('#dlBranchType').val());

                    loadBranch2($('#dlBranchType2').val());

                    loadSupplierbyType($('#dlBranchType').val());
                }
            });

            $(document).on('show.bs.modal', '.modal', function (event) {
                var zIndex = 1040 + (10 * $('.modal:visible').length);
                $(this).css('z-index', zIndex);
                setTimeout(function () {
                    $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
                }, 0);
            });
        });
    </script>
</asp:Content>
