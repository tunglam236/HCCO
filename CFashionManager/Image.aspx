<%@ Page Title="Quản lý hình ảnh sản phẩm" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Image.aspx.cs" Inherits="Image" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        td.childrows {
            background: url('/dist/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.childrows {
            background: url('/dist/img/details_close.png') no-repeat center center;
        }

        #tbdetail tr td, #tbdetailcombo tr td {
            border-bottom: 1px solid #ccc;
            line-height: 35px;
        }

        label {
            font-weight: normal;
            cursor: pointer;
            font-size: 13px;
        }

        .list-group-item {
            padding: 7px 15px;
        }

        .bg-th {
            background-color: #F9F9F9;
        }

        .detail-rows {
            cursor: pointer;
        }

        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

            .dropbtn:hover, .dropbtn:focus {
                background-color: #3e8e41;
            }

        #myInput {
            border-box: box-sizing;
            background-image: url('searchicon.png');
            background-position: 14px 12px;
            background-repeat: no-repeat;
            font-size: 16px;
            padding: 14px 20px 12px 45px;
            border: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            min-width: 230px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .format-input {
            width: 55px;
            height: 25px;
            text-align: center;
        }

        .rdList {
            margin: 5px;
            width: 95%;
        }

            .rdList tr td {
                border-bottom: 1px solid #ccc;
                padding: 10px 0px;
            }

        .detail-rows:hover, #tbdetail tr:hover {
            background-color: whitesmoke !important;
        }
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
              <a data-toggle="collapse" href="#collapse3">Chuỗi cửa hàng</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdBranchType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
     
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-newspaper-o"></i> Quản lý hình ảnh SP</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <div class="dropdown">
           <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã vạch</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã nhóm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên nhóm </label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số lượng ảnh</label> </a></li>
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
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Mã vạch</th>
                        <th class="bg-th">Mã nhóm</th>
                         <th class="bg-th">Tên nhóm</th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                         <th class="bg-th">Số ảnh</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Mã vạch</th>
                        <th class="bg-th">Mã nhóm</th>
                         <th class="bg-th">Tên nhóm</th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                         <th class="bg-th">Số ảnh</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <input type="hidden" id="hdId" value="" />
    <div class="modal fade" id="showModalAddImage" role="dialog">
        <div class="modal-dialog  modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-newspaper-o" aria-hidden="true"></i><span id="lb">THÊM HÌNH ẢNH</span> </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Ảnh lớn<br />
                            <asp:FileUpload ID="fuImage" Multiple="Multiple" runat="server" CssClass="form-control" Style="width:100%;" />
                        </div>
                        <div class="col-md-6">
                            Ảnh thumbail<br />
                            <asp:FileUpload ID="fuThumb" Multiple="Multiple" runat="server" CssClass="form-control" Style="width:100%;" />
                        </div>
                    </div>
                   
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <asp:Button ID="btnUpload" runat="server" Text="Lưu hình ảnh" CssClass="btn btn-success" OnClientClick="getFilter();" OnClick="btnUpload_Click" />
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="showDetailProduct" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-newspaper-o" aria-hidden="true"></i><span id="lb">CHI TIẾT SẢN PHẨM</span> </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">Nhập nội dung bài viết cho sản phẩm<br />
                            <FCKeditorV2:FCKeditor ID="fckContent" Height="400px" SkinPath="skins/office2003/" ToolbarSet="Default" runat="server" BasePath="/fckeditor/" ></FCKeditorV2:FCKeditor>
                        </div>
                    </div>
                   
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <asp:Button ID="btnSave" runat="server" Text="Lưu bài viết" CssClass="btn btn-success" OnClick="btnSave_Click" />
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdProductId" runat="server" Value="" />
    
    <script>
        var options = ["1", "2", "3", "4","5"];

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
                "pageLength": 50,
                "autoWidth": false,
                "order": [[1, 'asc']],
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
            
            var searchObject = localStorage.getItem('searchImageObject');
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
                    var image = row.selector.rows.prevObject.context.attributes["image"].nodeValue;
                    var imageZoom = row.selector.rows.prevObject.context.attributes["imageZoom"].nodeValue;
                    var branchType = row.selector.rows.prevObject.context.attributes["branchtype"].nodeValue;
                    var id = row.selector.rows.prevObject.context.id;
                    var img_list = image.split('#');
                    var imgZoom_list = imageZoom.split('#');
                    
                    var html = '', data_html = '';
                    
                    html = '<table id="tbdetailcombo" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:95%; margin-left:25px;">';
                    var ind = 0;
                    for (var k = 0; k < img_list.length; k++) {
                        if (ind == 0 || (ind >=7 && (ind % 7) == 1))
                            html += '<tr>';

                        if (img_list[k] != '') {
                            ind++;
                            html += '<td id="removeImage' + id + '" width="140px" style="text-align:center; padding:5px 5px 5px 0px;">';
                            html += '<img title="' + img_list[k].replace(/@/g, '/') + '" width="120px" height="120px" ';
                            if(branchType=='2')
                                html += 'src="' + img_list[k].replace(/@/g, '/').replace('/upload/', '/upload/cfashion/') + '"></br>';
                            else if (branchType == '1')
                                html += 'src="' + img_list[k].replace(/@/g, '/').replace('/upload/', '/upload/cnice/') + '"></br>';
                            else if (branchType == '3')
                                html += 'src="' + img_list[k].replace(/@/g, '/').replace('/upload/', '/upload/cn/') + '"></br>';

                            html += '<a title="Xóa ảnh này" href="#" onclick="return removeImage(1,\'' + id + '\',\'' + img_list[k].replace(/@/g, '/') + '\')" class="fa fa-trash-o"></a>'
                            html += '</td>';
                        }
                        if ((ind % 7) == 0) {
                            html += '</tr>';
                            ind = 0;
                        }
                    }

                    if (ind < 7) {
                        html += '<td><a href="#" data-toggle="modal" data-target="#showModalAddImage" onclick="return addImage(\'' + id + '\')" class="btn btn-xs btn-success">Thêm ảnh mới</a>';
                        html += '</td>';
                        for (var k = ind; k < 6; k++) {
                            html += '<td></td>';
                        }
                        html += '</tr>';
                    }
                    ind = 0;
                    for (var k = 0; k < imgZoom_list.length; k++) {
                        if (ind == 0 || (ind >= 7 && (ind % 7) == 1))
                            html += '<tr>';

                        if (imgZoom_list[k] != '') {
                            ind++;
                            html += '<td id="removeImage' + id + '" width="140px" style="text-align:center; padding:5px 5px 5px 0px;">';
                            html += '<img title="' + imgZoom_list[k].replace(/@/g, '/') + '" width="120px" height="120px" ';
                            if (branchType == '2')
                                html += 'src="' + imgZoom_list[k].replace(/@/g, '/').replace('/upload/', '/upload/cfashion/') + '"></br>';
                            else if (branchType == '1')
                                html += 'src="' + imgZoom_list[k].replace(/@/g, '/').replace('/upload/', '/upload/cnice/') + '"></br>';
                            else if (branchType == '3')
                                html += 'src="' + imgZoom_list[k].replace(/@/g, '/').replace('/upload/', '/upload/cn/') + '"></br>';

                            html += '<a title="Xóa ảnh này" href="#" onclick="return removeImage(2,\'' + id + '\',\'' + imgZoom_list[k].replace(/@/g, '/') + '\')" class="fa fa-trash-o"></a>'
                            html += '</td>';
                        }
                        if ((ind % 7) == 0) {
                            html += '</tr>';
                            ind = 0;
                        }
                    }

                    if (ind < 7) {
                        html += '<td>';//<a href="#" data-toggle="modal" data-target="#showModalAddImage" onclick="return addImage(\'' + id + '\')" class="btn btn-xs btn-success">Thêm ảnh mới</a></br>';
                        html += '<a style="margin-top:10px;" href="#" data-toggle="modal" data-target="#showDetailProduct" onclick="return showArticle(\'' + id + '\')" class="btn btn-xs btn-success">Bài viết sản phẩm</a></td>';
                        for (var k = ind; k < 6; k++) {
                            html += '<td></td>';
                        }
                        html += '</tr>';
                    }
                    html += '</table>';

                    row.child(html).show();
                    tr.addClass('shown');
                }
            });

        });
    </script>
    <script type="text/javascript">
        function getFilter() {
            var p = $('#example2_filter input').val();
            var branchType = $('input[name="ctl00$cph$rdBranchType"]:checked').val();
            localStorage.setItem('branchTypeObject', branchType);
            localStorage.setItem('searchImageObject', p);
        }
       function removeImage(type, id, image) {
           if (confirm("Bạn chắc chắn muốn xóa ảnh này ?") == true) {
               $.ajax({
                   type: 'POST',
                   url: '/Command.aspx/removeImageProduct',
                   data: '{"type":"'+type+'","id":"' + id + '","image":"' + image + '"}',
                   contentType: 'application/json; charset=utf-8',
                   dataType: 'json',
                   success: function (data) {
                       if (data.d._content == '1') {
                           var c = $('#imageCount' + id).text();
                           var down = parseInt(c) - 1;
                           $('#imageCount' + id).html(down.toString());
                           $('#removeImage' + id).remove();
                           showAlert('Xóa hình ảnh thành công');
                       }
                       else
                           showAlert(data.d._mess);

                   }
               });
           }
           return false;
       }
       function addImage(idProduct) {
           $('#cph_hdProductId').val(idProduct);
           $('#showModalAddImage').modal({ show: false });
           return false;
       }
       function showArticle(idArticle) {
           $.ajax({
               type: 'POST',
               url: '/Command.aspx/getArticleProduct',
               data: '{"id":"' + idArticle + '"}',
               contentType: 'application/json; charset=utf-8',
               dataType: 'json',
               success: function (data) {
                   console.log(data.d._content);
               }
           });

           $('#cph_hdProductId').val(idArticle);
           $('#showDetailProduct').modal({ show: false });
           return false;
       }
       function saveChanges() {

           return false;
       }
       
   </script>

</asp:Content>

