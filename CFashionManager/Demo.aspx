<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Demo.aspx.cs" Inherits="Demo" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   
   <div class="row">
      <div class="col-xs-12 col-md-2" style=" background-color:#ffffff; padding:10px;">
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse1">Loại hàng</a>
            </h4>
          </div>
          <div id="collapse1" class="panel-collapse">
            <ul class="list-group">
              <li class="list-group-item"><label><input type="checkbox" value=""> Hàng hóa</label></li>
              <li class="list-group-item"><label><input type="checkbox" value=""> Dịch vụ</label></li>
              <li class="list-group-item"><label><input type="checkbox" value=""> Combo - Đóng gói</label></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse2">Tồn kho</a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse">
            <ul class="list-group">
               <li class="list-group-item"><label><input type="radio" name="ck2" checked value=""> Tất cả</label></li>
              <li class="list-group-item"><label><input type="radio" name="ck2" value=""> Dưới định mức tồn</label></li>
              <li class="list-group-item"><label><input type="radio" name="ck2" value=""> Vượt định mức tồn</label></li>
                <li class="list-group-item"><label><input type="radio" name="ck2" value=""> Còn hàng trong kho</label></li>
              <li class="list-group-item"><label><input type="radio" name="ck2" value=""> Hết hàng trong kho</label></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Hiển thị</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse">
            <ul class="list-group">
              <li class="list-group-item"><label><input type="radio" name="ck1" checked value=""> Đang kinh doanh</label></li>
              <li class="list-group-item"><label><input type="radio" name="ck1" value=""> Ngừng kinh doanh</label></li>
              <li class="list-group-item"><label><input type="radio" name="ck1" value=""> Tất cả</label></li>
            </ul>
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="content-header">
   <div class="pull-left">
      <h2 style="margin:5px; font-weight:bold;">Hàng hóa</h2>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <button class="btn btn-success"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm mới</button>
      <button class="btn btn-primary"><i class="glyphicon glyphicon glyphicon-upload"></i> Import</button>
      <button class="btn btn-warning"><i class="glyphicon glyphicon glyphicon-download-alt"></i> Xuất file</button>
      
      <div class="dropdown">
      <button class="btn btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Mã sản phẩm</a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Tên sản phẩm</a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Giá bán</a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Giá khuyến mại</a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Thương hiệu</a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Xuất xứ</a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><input type="checkbox" checked/>&nbsp;Trạng thái</a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body">
                <table id="example2" class="table table-bordered display nowrap" style="min-width:915px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                        <th class="bg-th">Giá bán</th>
                        <th class="bg-th">Giá khuyến mại</th>
                        <th class="bg-th">Thương hiệu</th>
                        <th class="bg-th">Xuất xứ</th>
                        <th class="bg-th center" width="120px">Trạng thái</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <%--<%=loadFile()%>--%>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                        <th class="bg-th">Giá bán</th>
                        <th class="bg-th">Giá khuyến mại</th>
                        <th class="bg-th">Thương hiệu</th>
                        <th class="bg-th">Xuất xứ</th>
                        <th class="bg-th center" width="120px">Trạng thái</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <script>
        var options = [];

        $('.dropdown-menu a').on('click', function (event) {

            var $target = $(event.currentTarget),
       val = $target.attr('data-value'),
       $inp = $target.find('input'),
       idx;

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
                "autoWidth": false,
                "order": [[1, 'asc'], [2, 'asc']]
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
                else {
                    var id = row.selector.rows.prevObject.context.id;
                    var html = '';
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/getdetail',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            html = '<table id="tbdetail" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;">' +
                                    '<tr>' +
                                        '<td colspan="4" style="font-size:17px; padding:10px;color:#006fa9;"><b>' + data.d.ProName + '</b></td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td rowspan="6" width="300px" style="text-align:center; padding:10px;"><img src="' + data.d.Image + '" width="230px" height="220px" /></td>' +
                                        '<td width="130px"><i class="glyphicon glyphicon-ok-circle"></i> Mã hàng hóa</td>' +
                                        '<td width="130px">SP000020</td>' +
                                        '<td  style="padding-left:10px;"><i class="glyphicon glyphicon-ok-circle"></i> Mô tả</td>' +
                                    '</tr>' +
                                     '<tr>' +
                                        '<td><i class="glyphicon glyphicon-ok-circle"></i> Nhóm hàng</td>' +
                                        '<td>Nước hoa</td>' +
                                        '<td rowspan="5" valign="top" style="padding-left:10px;">' +
                                            '<p style="line-height:30px;">Sản phẩm cao cấp thuộc dòng mỹ phẩm chăm sóc da mặt. Sản phẩm cao cấp thuộc dòng mỹ phẩm chăm sóc da mặt. </p>' +
                                            '<br /><i class="glyphicon glyphicon-ok-circle"></i> Ghi chú đặt hàng<br />' +
                                            '<p style="line-height:30px;">Gọi trước khi giao hàng, vận chuyển cẩn thận</p>' +
                                        '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="glyphicon glyphicon-ok-circle"></i> Loại hàng</td>' +
                                        '<td>Hàng hóa</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="glyphicon glyphicon-ok-circle"></i> Định mức tồn</td>' +
                                        '<td>0 > 10</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="glyphicon glyphicon-ok-circle"></i> Giá bán</td>' +
                                        '<td>980,000</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td><i class="glyphicon glyphicon-ok-circle"></i> Giá vốn</td>' +
                                        '<td>890,000</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td colspan="4" style="text-align:right; padding:10px;">' +
                                            '<button class="btn btn-success" style="width:120px; margin-right:10px;"><i class="glyphicon glyphicon glyphicon-edit"></i> Cập nhật</button>' +
                                            '<button class="btn btn-warning" style="width:120px; margin-right:10px;"><i class="glyphicon glyphicon glyphicon-print"></i> In mã vạch</button>' +
                                            '<button class="btn btn-primary" style="width:120px; margin-right:10px;"><i class="glyphicon glyphicon glyphicon-print"></i> In hóa đơn</button>' +
                                            '<button class="btn btn-danger" style="width:120px; margin-right:10px;"><i class="glyphicon glyphicon glyphicon-trash"></i> Xóa</button>' +
                                        '</td>' +
                                    '</tr>' +
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
</asp:Content>

