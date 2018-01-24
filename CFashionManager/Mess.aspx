<%@ Page Title="Thông báo hệ thống" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Mess.aspx.cs" Inherits="Mess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/dist/css/client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
   <div class="row">
        <div class="col-xs-12 col-md-2" style=" padding:10px;">
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-crosshairs"></i> Chuỗi</h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
               <asp:RadioButtonList ID="rdBranchType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
        <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-bullhorn"></i> Thông báo hệ thống</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <button type="button" onclick="isRead();" class="btn btn-sm btn-success" title="Đánh dấu những tin chọn là đã đọc"><i class="fa fa-check-circle-o"></i> Đánh dấu đã đọc</button>
       <button type="button" onclick="readAll();" class="btn btn-sm btn-primary" title="Đánh dấu đã đọc tất cả"><i class="fa fa-check-circle"></i> Đọc tất cả</button>
      <div class="dropdown">
            <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
       <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" />&nbsp;Chuỗi</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li> 
           <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thời gian</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người nhận</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nội dung</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Liên kết</label> </a></li>
        </ul>
    </div></div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1050px; font-size:12px;">
                   <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                         <th class="bg-th" width="60px">Chuỗi</th>
                         <th class="bg-th" width="55px">Trạng thái</th>
                         <th class="bg-th" width="80px">Thời gian</th>
                         <th class="bg-th" width="90px">Người nhận</th>
                        <th class="bg-th">Nội dung</th>
                         <th class="bg-th" width="50px">Liên kết</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px">STT</th>
                          <th class="bg-th">Chuỗi</th>
                         <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Thời gian</th>
                         <th class="bg-th">Người nhận</th>
                        <th class="bg-th">Nội dung</th>
                         <th class="bg-th">Liên kết</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    <script>
        var options = ["2", "3", "4", "5", "6"];

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
                   "targets": [1],
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
    <script type="text/javascript">
        function isRead() {
            var data = '';
            $("#rbody tr").each(function () {
                var cls = $(this).attr("class");
                if (cls.indexOf('selected') > 0) {
                    var id = $(this).attr("id");
                    var read = $(this).attr("read");
                    if (read == '0') {
                        if (data != "") data += "#";
                        data += id;
                    }
                }
            });
            console.log(data);
            showAlert('Đã đánh dấu đã đọc');
            return false;
        }
        function readAll() {
            if (confirm('Bạn chắc chắn muốn đánh dấu tất cả ?') == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/markReadAllMess',
                    //data: '{"id":"' + id_form + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã đánh dấu tất cả');
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
    </script>
</asp:Content>



