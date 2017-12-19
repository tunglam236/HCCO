<%@ Page Title="Quản lý bộ sưu tập" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-newspaper-o"></i> Quản lý bộ sưu tập</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      
       <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Thêm bộ sưu tập" CssClass="btn btn-sm btn-success" />
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên bộ sưu tập</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mô tả</label> </a></li>
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
                        <div class="col-md-8">
                            Tên bộ sưu tập<br />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Style="width:100%;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">Mô tả bộ sưu tập<br />
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Style="width:100%;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">Nội dung bộ sưu tập<br />
                            <FCKeditorV2:FCKeditor ID="fckContent" Height="400px" SkinPath="skins/office2003/" ToolbarSet="Default" runat="server" BasePath="/fckeditor/" ></FCKeditorV2:FCKeditor>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-5">Hình ảnh bộ sưu tập<br />
                            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" Style="width:100%;" />
                        </div>
                        <div class="col-md-4">Thêm hình ảnh<br />
                            <asp:FileUpload ID="fuImage2" runat="server" CssClass="form-control" Style="width:100%;" />
                        </div>
                         <div class="col-md-3">Hiển thị bộ sưu tập<br />
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
                            <a href="/gallery" class="btn btn-success">Đóng lại</a>
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
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Tên bộ sưu tập</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px"></th>
                         <th class="bg-th">Tên bộ sưu tập</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <input type="hidden" id="hdId" value="" />
   
    <script>
        var options = ["1", "2"];

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
			        }]
            });

            $('a.toggle-vis').on('click', function (e) {
                e.preventDefault();
                var column = table.column($(this).attr('data-column'));
                column.visible(!column.visible());
            });

        });
    </script>
</asp:Content>



