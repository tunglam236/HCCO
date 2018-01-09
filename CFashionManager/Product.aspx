<%@ Page Title="Danh mục sản phẩm" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .detail-rows:hover,#tbdetail tr:hover {background-color: whitesmoke !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
   <div class="col-xs-12 col-md-2" style=" padding:10px;">
      
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Chuỗi cửa hàng</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse">
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse2">Nhóm sản phẩm</a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse" style="padding:5px;">
          <asp:RadioButtonList ID="rdProductType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-th"></i> Quản lý sản phẩm</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <a href="#" class="btn btn-sm btn-success" onclick="showModalAdd();" data-toggle="modal" data-target="#addProduct"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm sản phẩm</a>
       <%--<a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#uploadFile"><i class="glyphicon glyphicon-open"></i> Upload qua file excel</a>
      <div class="dropdown">
       <button class="btn btn-sm btn-success dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-save"></i> Tải file excel mẫu</button>
        <ul class="dropdown-menu" style="">
            <li><a href="/file/template/Product Template_CNice Excel.xls"><label><i class="fa fa-dashboard"></i> Chuỗi mỹ phẩm</label> </a></li>
            <li><a href="/file/template/Product Template_CFashion Excel.xls"><label><i class="fa fa-female"></i> Chuỗi thời trang</label> </a></li>
        </ul>
       </div>--%>
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" />&nbsp;Chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã vạch</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhóm sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mã sản xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" />&nbsp;Màu sắc</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" />&nbsp;Kích thước</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đơn vị tính</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Dung tích</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Xuất xứ</label> </a></li>

            <li><a href="#" class="small toggle-vis" data-column="12" tabIndex="-1"><label><input type="checkbox" />&nbsp;Thành phần</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="13" tabIndex="-1"><label><input type="checkbox" />&nbsp;Chất liệu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="14" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhãn hiệu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="15" tabIndex="-1"><label><input type="checkbox" />&nbsp;Nhà cung cấp</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1000px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th" width="60px">Mã vạch</th>
                        <th class="bg-th" width="80px">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                        <th class="bg-th right">Nhóm</th>
                         <th class="bg-th right">Mã sản xuất</th>
                        <th class="bg-th right">Màu sắc</th>
                        <th class="bg-th right">Kích thước</th>
                         <th class="bg-th right">ĐVT</th>
                         <th class="bg-th right">Dung tích</th>
                         <th class="bg-th right">Xuất xứ</th>
                        <th class="bg-th">Thành phần</th>
                        <th class="bg-th">Chất liệu</th>
                        <th class="bg-th center">Nhãn hiệu</th>
                        <th class="bg-th">Nhà cung cấp</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Mã vạch</th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                        <th class="bg-th right">Nhóm</th>
                         <th class="bg-th right">Mã sản xuất</th>
                        <th class="bg-th right">Màu sắc</th>
                        <th class="bg-th right">Kích thước</th>
                         <th class="bg-th right">ĐVT</th>
                         <th class="bg-th right">Dung tích</th>
                         <th class="bg-th right">Xuất xứ</th>
                        <th class="bg-th">Thành phần</th>
                        <th class="bg-th">Chất liệu</th>
                        <th class="bg-th center">Nhãn hiệu</th>
                        <th class="bg-th">Nhà cung cấp</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <img class="crop-loading" src="dist/img/crop.gif" style="display:none;position:fixed; top:50%; left:50%" />
    <input type="hidden" id="hdId" value="" />
<div class="modal fade" id="addProduct" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>
                        <span id="lb">THÊM SẢN PHẨM</span></h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin sản phẩm</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-8">
                            Nhà cung cấp<br />
                            <select id="dlSupplier" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Nhóm sản phẩm<br />
                            <select id="dlProductType" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">Mã vạch sản phẩm<br />
                            <input type="text" id="txtcodeId" class="numbers form-control" placeholder="Nhập nếu có" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Mã sản phẩm<br />
                            <input type="text" id="txtproductCode" class="form-control" style="width: 100%;" />
                        </div>
                       
                    </div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-4">Tên sản phẩm<br />
                            <input type="text" id="txtproductName" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Mã sản xuất<br />
                            <input type="text" id="txtProductTypeCode" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Năm sản xuất<br />
                            <select id="dlYear" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                         <div class="col-md-12">Mô tả sản phẩm<br />
                            <textarea rows="4" id="txtDescription" class="form-control" style="width: 100%;" ></textarea>
                        </div>
                     </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Thương hiệu<br />
                            <select id="dlBrand" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">Xuất xứ<br />
                            <select id="dlNational" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                         <div class="col-md-4">Đơn vị tính<br />
                             <select id="dlUnit" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Màu sắc<br />
                            <select id="dlColor" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">Dung tích<br />
                             <input type="text" id="txtCapacity" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">Size<br />
                            <select id="dlSize" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        
                        <div class="col-md-2">Số lô<br />
                            <input type="text" id="txtCatalog" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                        <div class="col-md-2">Hạn sử dụng<br />
                            <input type="text" id="txtExpiryDate" class="form-control datepicker2" style="width: 100%;" />
                        </div>
                         <div class="col-md-2">Từ khóa<br />
                            <input type="text" id="txtTag" placeholder="Key1,Key2" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Thành phần<br />
                            <input type="text" id="txtComposition" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Chất liệu<br />
                            <input type="text" id="txtMaterial" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Thông tin sale<br />
                            <input type="text" id="txtNoteSale" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Ghi chú<br />
                            <input type="text" id="txtNote" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Hiển thị<br />
                            <select id="dlStatus" class="form-control select2" style="width: 100%;">
                                <option value="1">Hiển thị</option>
                                <option value="2">Không hiển thị</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 pull-right">
                            <span class=" btn-group">
                            <button type="button" id="btnAdd" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="btnUpdate" style="display:none;" class="btn btn-success" onclick="updateChanges();">
                                Cập nhật</button>
                            <button type="button" id="btnDel" style="display:none;" class="btn btn-success" onclick="removeChanges();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Hủy bỏ</button></span>
                            &nbsp;<label> <input type="checkbox" id="ckAutoLoad" checked="checked" /> Auto load</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="modal fade" id="uploadFile" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="glyphicon glyphicon-folder-open"></i>
                        <span id="lb">UPLOAD SẢN PHẨM</span></h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <asp:DropDownList ID="dlBranchTypeUpload" runat="server" CssClass="form-control select2" Style="width:100%;"></asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            Chọn file excel<br />
                            <asp:FileUpload ID="fu" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-md-4">
                            <br />
                            <asp:Button ID="btnUpload" CssClass="btn btn-sm btn-primary" OnClick="btnUpload_Click" runat="server" Text="Upload dữ liệu" />
                        </div>
                    </div>
                  
                </div>
            </div>
        </div>
    </div>
    <script>
        var options = ["2","3","4","5","9","11","14"];
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
                    return false;
                }
            });

            var table = $('#example2').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "pageLength": 25,
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;
 
                    api.column(5, {page:'current'} ).data().each( function ( group, i ) {
                        if ( last !== group ) {
                            $(rows).eq( i ).before(
                                '<tr class="group"><td colspan="10" style="text-transform: uppercase;"><b>NHÓM HÀNG : ' + group + '</b></td></tr>'
                            );
                            last = group;
                        }
                    });
                },
                "autoWidth": false,
                "order": [[1, 'asc']],
                "columnDefs": [
                {
                    "targets": [1,6,7,8,10,12,13,15],
                    "visible": false,
                    "searchable": false
                }],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'print',
                        text:'Print',
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

            var searchObject = localStorage.getItem('searchProductObject');
            var branchTypeObject = localStorage.getItem('branchTypeObject');
            var branchType = $('input[name="ctl00$cph$rdBranchType"]:checked').val();
            if (searchObject && branchTypeObject == branchType)
                table.search(searchObject).draw();

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
                else {
                    var id = row.selector.rows.prevObject.context.id;
                    var html = '';
                }
            });
        });
    </script>
    <script type="text/javascript">
        function getFilter() {
            var p = $('#example2_filter input').val();
            var branchType = $('input[name="ctl00$cph$rdBranchType"]:checked').val();
            localStorage.setItem('branchTypeObject', branchType);
            localStorage.setItem('searchProductObject', p);
        }
        function showModalUpdate(id) {
            $('#hdId').val(id);
            $('#lb').text('CẬP NHẬT SẢN PHẨM');
            $('#btnAdd').hide();
            $('#btnUpdate').show();
            $('#btnDel').show();
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getProductDetail',
                data: '{"id":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $('#dlBranchType').val(data.d.BranchType);
                    $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());

                    $('#dlSupplier').find('option').remove().end();
                    $('#dlProductType').find('option').remove().end();
                    $('#dlBrand').find('option').remove().end();
                    $('#dlColor').find('option').remove().end();
                    $('#dlSize').find('option').remove().end();
                    $('#dlYear').find('option').remove().end();
                    $('#dlUnit').find('option').remove().end();

                    var id_sup = data.d.Supplier;
                    var id_proType = data.d.ProType;
                    var id_brand = data.d.Brand;
                    var id_color = data.d.Color;
                    var id_size = data.d.Size;
                    var id_year = data.d.Year;
                    var id_unit = data.d.Unit;
                    var capacity = data.d.Capacity;
                    var id_national = data.d.CountryId;

                    $('#dlStatus').val(data.d.Status);
                    $('#select2-dlStatus-container').text($('#dlStatus option:selected').text());

                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/getCategory',
                        data: '{"branchTypeId":"' + data.d.BranchType + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            
                            var c2 = document.getElementById('dlSupplier');
                            var c3 = document.getElementById('dlProductType');
                            var c4 = document.getElementById('dlBrand');
                            var c5 = document.getElementById('dlColor');
                            var c6 = document.getElementById('dlSize');
                            var c7 = document.getElementById('dlYear');
                            var c8 = document.getElementById('dlUnit');

                            var opt_brand = document.createElement('option');
                            opt_brand.value = "";
                            opt_brand.innerHTML = "Chọn nhãn hiệu";
                            c4.appendChild(opt_brand);

                            var opt_size = document.createElement('option');
                            opt_size.value = "";
                            opt_size.innerHTML = "Chọn size";
                            c6.appendChild(opt_size);

                            var opt_color = document.createElement('option');
                            opt_color.value = "";
                            opt_color.innerHTML = "Chọn màu";
                            c5.appendChild(opt_color);
                          
                            var opt_sup = document.createElement('option');
                            opt_sup.value = "";
                            opt_sup.innerHTML = "Chọn nhà cung cấp";
                            c2.appendChild(opt_sup);

                            var opt_type = document.createElement('option');
                            opt_type.value = "";
                            opt_type.innerHTML = "Chọn nhóm";
                            c3.appendChild(opt_type);

                            var opt_year = document.createElement('option');
                            opt_year.value = "";
                            opt_year.innerHTML = "Chọn năm";
                            c7.appendChild(opt_year);

                            var opt_unit = document.createElement('option');
                            opt_unit.value = "";
                            opt_unit.innerHTML = "Chọn đơn vị tính";
                            c8.appendChild(opt_unit);

                            for (var i = 0; i < data.d.length; i++) {

                                if (data.d[i].Type == 'supplier') {
                                    var opt = document.createElement('option');
                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c2.appendChild(opt);
                                }
                                if (data.d[i].Type == 'producttype') {
                                    var opt = document.createElement('option');

                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c3.appendChild(opt);
                                }
                                if (data.d[i].Type == 'brand') {
                                    var opt = document.createElement('option');
                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c4.appendChild(opt);
                                }
                                if (data.d[i].Type == 'color') {
                                    var opt = document.createElement('option');
                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c5.appendChild(opt);
                                }
                                if (data.d[i].Type == 'size') {
                                    var opt = document.createElement('option');
                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c6.appendChild(opt);
                                }
                                if (data.d[i].Type == 'year') {
                                    var opt = document.createElement('option');
                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c7.appendChild(opt);
                                }
                                if (data.d[i].Type == 'unit') {
                                    var opt = document.createElement('option');
                                    opt.value = data.d[i].ID;
                                    opt.innerHTML = data.d[i].Name;
                                    c8.appendChild(opt);
                                }
                            }
                            
                            $('#dlSupplier').val(id_sup);
                            $('#select2-dlSupplier-container').text($('#dlSupplier option:selected').text());

                            $('#dlProductType').val(id_proType);
                            $('#select2-dlProductType-container').text($('#dlProductType option:selected').text());

                            $('#dlBrand').val(id_brand);
                            $('#select2-dlBrand-container').text($('#dlBrand option:selected').text());

                            $('#dlColor').val(id_color);
                            $('#select2-dlColor-container').text($('#dlColor option:selected').text());

                            $('#dlSize').val(id_size);
                            $('#select2-dlSize-container').text($('#dlSize option:selected').text());

                            $('#dlYear').val(id_year);
                            $('#select2-dlYear-container').text($('#dlYear option:selected').text());

                            $('#dlUnit').val(id_unit);
                            $('#select2-dlUnit-container').text($('#dlUnit option:selected').text());
                        }
                    });
                    $('#dlNational').val(id_national);
                    $('#select2-dlNational-container').text($('#dlNational option:selected').text());

                    $('#txtCapacity').val(capacity);
                    $('#txtcodeId').val(data.d.CodeId);
                    $('#txtproductCode').val(data.d.ProCode);
                    $('#txtproductName').val(data.d.ProName);
                    $('#txtProductTypeCode').val(data.d.ProTypeCode);
                    $('#txtDescription').val(data.d.Description);
                    $('#txtComposition').val(data.d.Composition);
                    $('#txtMaterial').val(data.d.Material);
                    $('#txtNote').val(data.d.Note);
                    $('#txtNoteSale').val(data.d.NoteSale);
                    $('#txtTag').val(data.d.Tag);
                    $('#txtExpiryDate').val(data.d.ExpiryDate);
                    $('#txtCatalog').val(data.d.Catalog);
                    $("#addProduct").modal({ show: false });
                }
                
            });
        }
        function showModalAdd() {
            $('#hdId').val('');
            $('#btnAdd').show();
            $('#btnUpdate').hide();
            $('#btnDel').hide();
            $('#lb').text('THÊM SẢN PHẨM');
            $('#txtcodeId').val('');
            $('#txtproductCode').val('');
            $('#txtProductTypeCode').val('');
            $('#txtproductName').val('');
            $('#txtDescription').val('');
            $('#txtComposition').val('');
            $('#txtMaterial').val('');
            $('#txtNote').val('');
            $('#txtCatalog').val('');
            $('#txtCapacity').val('');
            $('#txtExpiryDate').val('');

            $("#addProduct").modal({ show: false });
        }
        function saveChanges() {
            $(".crop-loading").show();
            var proName = $('#txtproductName').val();
            if (proName != null && proName != "") {
                var branchType = $('#dlBranchType').val();
                var supplier = $('#dlSupplier').val();
                var productType = $('#dlProductType').val();
                var brand = $('#dlBrand').val();
                var color = $('#dlColor').val();
                var size = $('#dlSize').val();
                var year = $('#dlYear').val();
                var status = $('#dlStatus').val();
                var unit = $('#dlUnit').val();
                var capacity = $('#txtCapacity').val();
                var national = $('#dlNational').val();
                var nationalname = $('#dlNational option:selected').text();

                var expiry = $('#txtExpiryDate').val();
                var catalog = $('#txtCatalog').val();

                var codeId = $('#txtcodeId').val();
                var proCode = $('#txtproductCode').val();
                var proTypeCode = $('#txtProductTypeCode').val();
                var des = $('#txtDescription').val();
                var compo = $('#txtComposition').val();
                var mate = $('#txtMaterial').val();
                var note = $('#txtNote').val();
                var notesale = $('#txtNoteSale').val();
                var tag = $('#txtTag').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/InsertProduct',
                    data: '{"codeId":"' + codeId + '","proCode":"' + proCode + '","proTypeCode":"' + proTypeCode + '","proName":"' + proName + '","proType":"' + productType + '","branchType":"' + branchType + '","supplierId":"' + supplier + '","des":"' + des + '","brandId":"' + brand + '","color":"' + color + '","size":"' + size + '","material":"' + mate + '","composition":"' + compo + '","note":"' + note + '","notesale":"' + notesale + '","tag":"' + tag + '","year":"'+year+'","status":"'+status+'","unit":"'+unit+'","capacity":"'+capacity+'","expiry":"'+expiry+'","catalog":"'+catalog+'","national":"'+national+'","nationalname":"'+nationalname+'"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Thêm sản phẩm thành công');
                            if (ckload) {
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else {
                                $('#txtCapacity').val('');
                                $('#txtExpiryDate').val('');
                                $('#txtCatalog').val('');
                                $('#txtcodeId').val('');
                                $('#txtproductCode').val('');
                                $('#txtproductName').val('');
                                $('#txtProductTypeCode').val('');
                                $('#txtDescription').val('');
                                $('#txtComposition').val('');
                                $('#txtMaterial').val('');
                                $('#txtNote').val('');
                                $('#txtNoteSale').val('');
                                $('#txtTag').val('');
                                $('#txtcodeId').focus();

                                $(".crop-loading").hide();
                                $("#addProduct").modal('hide');
                            }
                        }
                        else {
                            showAlert('Có lỗi khi lưu sản phẩm. Chi tiết: ' + data.d._mess);
                        }
                    }
                });
            }
            else showAlert('Nhập tên sản phẩm');
            return false;
            $(".crop-loading").hide();
        }
        function updateChanges() {
            $(".crop-loading").show();
            var proName = $('#txtproductName').val();
            if (proName != null && proName != "") {
                var branchType = $('#dlBranchType').val();
                var supplier = $('#dlSupplier').val();
                var productType = $('#dlProductType').val();
                var brand = $('#dlBrand').val();
                var color = $('#dlColor').val();
                var size = $('#dlSize').val();
                var year = $('#dlYear').val();
                var status = $('#dlStatus').val();
                var unit = $('#dlUnit').val();
                var capacity = $('#txtCapacity').val();
                var national = $('#dlNational').val();
                var nationalname = $('#dlNational option:selected').text();
                if (national != '')
                    nationalname = nationalname.substring(5, nationalname.length);
                var expiry = $('#txtExpiryDate').val();
                var catalog = $('#txtCatalog').val();

                var codeId = $('#txtcodeId').val();
                var proCode = $('#txtproductCode').val();
                var proTypeCode = $('#txtProductTypeCode').val();
                var des = $('#txtDescription').val();
                var compo = $('#txtComposition').val();
                var mate = $('#txtMaterial').val();
                var note = $('#txtNote').val();
                var notesale = $('#txtNoteSale').val();
                var tag = $('#txtTag').val();
                var Id = $('#hdId').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/UpdateProduct',
                    data: '{"Id":"' + Id + '","codeId":"' + codeId + '","proCode":"' + proCode + '","proTypeCode":"' + proTypeCode + '","proName":"' + proName + '","proType":"' + productType + '","branchType":"' + branchType + '","supplierId":"' + supplier + '","des":"' + des + '","brandId":"' + brand + '","color":"' + color + '","size":"' + size + '","material":"' + mate + '","composition":"' + compo + '","note":"' + note + '","notesale":"' + notesale + '","tag":"' + tag + '","year":"' + year + '","status":"' + status + '","unit":"' + unit + '","capacity":"' + capacity + '","expiry":"' + expiry + '","catalog":"' + catalog + '","national":"' + national + '","nationalname":"'+nationalname+'"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã cập nhật sản phẩm ' + proName);

                            getFilter();
                            if (ckload) {
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                            {
                                $('#txtCapacity').val('');
                                $('#txtExpiryDate').val('');
                                $('#txtCatalog').val('');
                                $('#txtcodeId').val('');
                                $('#txtproductCode').val('');
                                $('#txtproductName').val('');
                                $('#txtProductTypeCode').val('');
                                $('#txtDescription').val('');
                                $('#txtComposition').val('');
                                $('#txtMaterial').val('');
                                $('#txtNote').val('');
                                $('#txtNoteSale').val('');
                                $('#txtTag').val('');
                                $('#txtcodeId').focus();

                                $(".crop-loading").hide();
                                $("#addProduct").modal('hide');
                            }
                        }
                        else {
                            showAlert('Có lỗi khi cập nhật sản phẩm. Chi tiết: ' + data.d._mess);
                        }
                    }
                });
            }
            else showAlert('Nhập tên sản phẩm');
            return false;
            $(".crop-loading").hide();
        }
        function removeChanges() {
            $(".crop-loading").show();
            var proName = $('#txtproductName').val();
            var Id = $('#hdId').val();
            if (confirm("Bạn chắc chắn muốn xóa [" + proName + "] ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/RemoveProduct',
                    data: '{"Id":"' + Id + '","proName":"' + proName + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('#txtcodeId').val('');
                            $('#txtproductCode').val('');
                            $('#txtProductTypeCode').val('');
                            $('#txtproductName').val('');
                            $('#txtDescription').val('');
                            $('#txtComposition').val('');
                            $('#txtMaterial').val('');
                            $('#txtNote').val('');
                            $('#txtCapacity').val('');
                            $('#txtNoteSale').val('');
                            $('#txtTag').val('');

                            $('#' + Id).remove();
                            showAlert('Đã xóa sản phẩm ' + proName);
                            $("#addProduct").modal('hide');
                        }
                        else {
                            showAlert('Có lỗi khi xóa sản phẩm. Chi tiết: ' + data.d._mess);
                        }
                    }
                });
            }
            return false;
            $(".crop-loading").hide();
        }
    </script>
    <script>
         function changeType(id) {
             loadDrop(id);
         }
         function loadDrop(branchTypeId) {
             $(".crop-loading").show();
             $('#dlSupplier').find('option').remove().end();
             $('#dlProductType').find('option').remove().end();
             $('#dlBrand').find('option').remove().end();
             $('#dlColor').find('option').remove().end();
             $('#dlSize').find('option').remove().end();
             $('#dlYear').find('option').remove().end();
             $('#dlNational').find('option').remove().end();
             $('#dlUnit').find('option').remove().end();

             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/getCategory',
                 data: '{"branchTypeId":"' + branchTypeId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     var c2 = document.getElementById('dlSupplier');
                     var c3 = document.getElementById('dlProductType');
                     var c4 = document.getElementById('dlBrand');
                     var c5 = document.getElementById('dlColor');
                     var c6 = document.getElementById('dlSize');
                     var c7 = document.getElementById('dlYear');
                     var c8 = document.getElementById('dlUnit');
                     var c10 = document.getElementById('dlNational');

                     var opt_sup = document.createElement('option');
                     opt_sup.value = "";
                     opt_sup.innerHTML = "Chọn nhà cung cấp";
                     c2.appendChild(opt_sup);

                     var opt_type = document.createElement('option');
                     opt_type.value = "";
                     opt_type.innerHTML = "Chọn nhóm";
                     c3.appendChild(opt_type);

                     var opt_year = document.createElement('option');
                     opt_year.value = "";
                     opt_year.innerHTML = "Chọn năm";
                     c7.appendChild(opt_year);

                     var opt_brand = document.createElement('option');
                     opt_brand.value = "";
                     opt_brand.innerHTML = "Chọn nhãn hiệu";
                     c4.appendChild(opt_brand);

                     var opt_size = document.createElement('option');
                     opt_size.value = "";
                     opt_size.innerHTML = "Chọn size";
                     c6.appendChild(opt_size);

                     var opt_color = document.createElement('option');
                     opt_color.value = "";
                     opt_color.innerHTML = "Chọn màu";
                     c5.appendChild(opt_color);

                     var opt_unit = document.createElement('option');
                     opt_unit.value = "";
                     opt_unit.innerHTML = "Chọn đơn vị tính";
                     c8.appendChild(opt_unit);

                     var opt_nat = document.createElement('option');
                     opt_nat.value = "";
                     opt_nat.innerHTML = "Chọn xuất xứ";
                     c10.appendChild(opt_nat);

                     for (var i = 0; i < data.d.length; i++) {
                         
                         if (data.d[i].Type == 'supplier') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c2.appendChild(opt);
                         }
                         if (data.d[i].Type == 'producttype') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c3.appendChild(opt);
                         }
                         if (data.d[i].Type == 'brand') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c4.appendChild(opt);
                         }
                         if (data.d[i].Type == 'color') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c5.appendChild(opt);
                         }
                         if (data.d[i].Type == 'size') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c6.appendChild(opt);
                         }
                         if (data.d[i].Type == 'year') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c7.appendChild(opt);
                         }
                         if (data.d[i].Type == 'unit') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c8.appendChild(opt);
                         }
                         if (data.d[i].Type == 'national') {
                             var opt = document.createElement('option');
                             opt.value = data.d[i].ID;
                             opt.innerHTML = data.d[i].Name;
                             c10.appendChild(opt);
                         }
                     }
                 }
             });
             $(".crop-loading").hide();
         }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getBranchType',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlBranchType');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    loadDrop($('#dlBranchType').val());
                }
            });
        });
    </script>
</asp:Content>

