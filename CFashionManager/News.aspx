<%@ Page Title="Quản lý bài viết" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

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

        .detail-rows:hover, #tbdetail tr:hover, #tbdetailcombo tr:hover {
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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-newspaper-o"></i> Quản lý bài viết</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      
       <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Thêm tin tức" CssClass="btn btn-sm btn-success" />
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="0" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Hình ảnh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tiêu đề</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chuyên mục</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày đăng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người đăng</label> </a></li>
        </ul>
    </div>
</section>
          <asp:Panel ID="pnShow" runat="server" class="modal_news">
           <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body">
                
                 <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <asp:DropDownList ID="dlBranchType" DataTextField="Name" DataValueField="Id" runat="server" CssClass="form-control select2" Style="width:100%;"></asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            Tiêu đề<br />
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Style="width:100%;"></asp:TextBox>
                        </div>
                         <div class="col-md-4">
                            Từ khóa<br />
                             <asp:TextBox ID="txtTag" runat="server" CssClass="form-control" Style="width:100%;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">Tóm tắt<br />
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Style="width:100%;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">Nội dung<br />
                            <FCKeditorV2:FCKeditor ID="fckContent" Height="400px" SkinPath="skins/office2003/" ToolbarSet="Default" runat="server" BasePath="/fckeditor/" ></FCKeditorV2:FCKeditor>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">Nhóm tin<br />
                            <asp:DropDownList ID="dlMenu" runat="server" CssClass="form-control select2" Style="width:100%;">
                                <asp:ListItem Text="Tin tức" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Xu hướng" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Giới thiệu" Value="0"></asp:ListItem>
                                <%--<asp:ListItem Text="Lookbook" Value="3"></asp:ListItem>--%>
                                <asp:ListItem Text="Tuyển dụng" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">Hình ảnh<br />
                            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" Style="width:100%;" />
                        </div>
                         <div class="col-md-3">Hiển thị bài đăng<br />
                            <asp:DropDownList ID="dlActive" runat="server" CssClass="form-control select2" Style="width:100%;">
                                <asp:ListItem Text="Hiển thị" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Không hiển thị" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <asp:Button ID="btnSave" Text="Lưu lại" OnClick="btnSave_Click" runat="server" CssClass="btn btn-success" />
                            <asp:Button ID="btnUpdate" Text="Cập nhật" OnClick="btnUpdate_Click" runat="server" CssClass="btn btn-success" />
                            <a href="/news" class="btn btn-success">Đóng lại</a>
                        </div>
                    </div>
                   
                </div>
               </div>
                </asp:Panel>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1050px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class="bg-th">Hình ảnh</th>
                        <th class="bg-th">Tiêu đề</th>
                        <th class="bg-th">Chuyên mục</th>
                        <th class="bg-th">Trạng thái</th>
                        <th class="bg-th">Ngày đăng</th>
                        <th class="bg-th">Người đăng</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class="bg-th">Hình ảnh</th>
                        <th class="bg-th">Tiêu đề</th>
                        <th class="bg-th">Chuyên mục</th>
                        <th class="bg-th">Trạng thái</th>
                        <th class="bg-th">Ngày đăng</th>
                        <th class="bg-th">Người đăng</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <input type="hidden" id="hdId" value="" />
    <div class="modal fade" id="addNews" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-newspaper-o" aria-hidden="true"></i><span id="lb">THÊM BÀI VIẾT</span> </h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>
    <script>
        var options = ["0","1", "2", "3"];

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
                "pageLength": 25,
                "autoWidth": false,
                "order": [[2, 'desc']],
                "columnDefs": [
               {
                   "targets": [4,5],
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

        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $(".proCode").keypress(function (e) {
                if (e.which == 13) {
                    detailProduct();
                }
            });
            $(".input-date").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 47 || e.which > 57)) {
                    return false;
                }
            });
            $(".input-price").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    if (e.which == 44) return true;
                    else return false;
                }
            });
        });
    </script>
   
</asp:Content>


