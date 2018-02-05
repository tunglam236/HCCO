<%@ Page Title="Báo cáo doanh thu" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ReportRevenue.aspx.cs" Inherits="ReportRevenue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .pr {
            padding-right: 0px;
        }    
        .pl {
            padding-left: 0px;
        }    
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
        .detail-rows:hover,#tbdetail tr:hover {background-color: #27ae6078 !important;}
        .format-input{ width:55px; height:25px; text-align:center;}
        table#example2 tbody tr.selected { background-color:#27ae6078;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content" style="margin-left:10px;">
   <div class="row">
      <div class="col-xs-12 col-md-12">
          <div class="row">
              <div class="col-md-3" style="padding-right:0px; padding-left:0px; margin-bottom:10px;">
                  Chuỗi <br />
                  <asp:DropDownList ID="dlBranchType" AutoPostBack="true" OnSelectedIndexChanged="dlBranchType_SelectedIndexChanged" runat="server" CssClass="select2 form-control" Style="width:99%">
                  </asp:DropDownList>
              </div>
              <div class="col-md-3" style="padding-right:0px; padding-left:0px;margin-bottom:10px;">
                  Chi nhánh<br />
                  <asp:DropDownList ID="dlBranch" runat="server" CssClass="select2 form-control" Style="width:99%">
                  </asp:DropDownList>
              </div>
              <div class="col-md-2" style="padding-right:0px; padding-left:0px;margin-bottom:10px;">
                  Từ ngày<br /> 
                  <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepicker2" Style="width:99%;"></asp:TextBox>
               </div>
               <div class="col-md-2" style="padding-right:0px; padding-left:0px;margin-bottom:10px;">
                   Đến ngày<br />
                   <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepicker2" Style="width:99%;"></asp:TextBox>
               </div>
              <div class="col-md-2" style="padding-right:0px; padding-left:0px;margin-bottom:10px;">
                   <br />
                   <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text="Xem dữ liệu" />
               </div>
          </div>
      </div>
       <div class="col-xs-12 col-md-12">
      <section class="">
       <div class="pull-left">
          <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-bar-chart"></i> Báo cáo doanh thu</h3>
           
       </div>
       <div style="text-align:right; padding-bottom:10px;">
          <div class="dropdown">
          <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
            <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
                <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã CN</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày xuất</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số hóa đơn</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã KH</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Khách hàng</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã NV</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên nhân viên</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người Xuất</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tổng tiền</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;% CK</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="12" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tổng chiết khấu</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="13" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thành tiền</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="14" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;KH thanh toán</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="15" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trả lại</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="16" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>

            </ul>
        </div>
           <h4><i class="fa fa-money"></i> Tổng doanh thu: <asp:Literal ID="lbTongTien" runat="server"></asp:Literal></h4>
       </div>
      </section>
        <div class="box box-warning">
        <div class="box-header" style="text-align:right;">
        </div>
        <div class="box-body">
            <div style="max-width:1366px; overflow:auto;">
            <table id="example2" class="table cell-border" style="font-size:12px;min-width:2000px;">
                <thead>
                    <tr>
                    <th class='bg-th center' width="40px"></th>
                    <th class="bg-th">Mã CN</th>
                    <th class="bg-th">Chi nhánh</th>
                    <th class="bg-th">Ngày xuất</th>
                    <th class="bg-th">Số HĐ</th>
                    <th class="bg-th">Mã KH</th>
                    <th class="bg-th">Khách hàng</th>
                    <th class="bg-th">Mã NV</th>
                    <th class="bg-th">Tên nhân viên</th>
                    <th class="bg-th">Người xuất</th>
                    <th class="bg-th">Tổng tiền</th>
                    <th class="bg-th">% CK</th>
                    <th class="bg-th">Tổng chiết khấu</th>
                    <th class="bg-th">Thành tiền</th>
                    <th class="bg-th">KH thanh toán</th>
                    <th class="bg-th">Trả lại</th>
                    <th class="bg-th">Ghi chú</th>
                    </tr>
                </thead>
                <tbody id="rbody">
                <asp:Literal ID="lbData" runat="server"></asp:Literal>
                </tbody>
                <tfoot>
                    <tr>
                    <th class='bg-th center' width="40px"></th>
                    <th class="bg-th">Mã CN</th>
                    <th class="bg-th">Chi nhánh</th>
                    <th class="bg-th">Ngày xuất</th>
                    <th class="bg-th">Số HĐ</th>
                    <th class="bg-th">Mã KH</th>
                    <th class="bg-th">Khách hàng</th>
                    <th class="bg-th">Mã NV</th>
                    <th class="bg-th">Tên nhân viên</th>
                    <th class="bg-th">Người xuất</th>
                    <th class="bg-th">Tổng tiền</th>
                    <th class="bg-th">% CK</th>
                    <th class="bg-th">Tổng chiết khấu</th>
                    <th class="bg-th">Thành tiền</th>
                    <th class="bg-th">KH thanh toán</th>
                    <th class="bg-th">Trả lại</th>
                    <th class="bg-th">Ghi chú</th>
                    </tr>
                </tfoot>
            </table>
            </div>
        </div>
        </div>
      </div>
   </div>
</section>
    <script>
        var options = ["1","2","3", "4", "5","6","7","8","9","10","11","12","13","14","15","16"];

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
                "order": [[4, 'desc']],
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
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
			        {
			            extend: 'excelHtml5',
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

            $('#example2 tbody').on('click', 'tr', function () {
                $(this).toggleClass('selected');
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
</asp:Content>

