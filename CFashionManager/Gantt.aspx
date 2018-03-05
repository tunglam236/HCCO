<%@ Page Title="Bảng kế hoạch thực hiện tiến độ" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Gantt.aspx.cs" Inherits="Grantt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="dist/css/client.css" rel="stylesheet" />
    <style type="text/css">
       .days {
            width: 20px;
            float: left;
            height: 15px;
            background-color: #85c729;
            margin: 2px;
        }
       .days.active {
            width: 20px;
            float: left;
            height: 15px;
            background-color: yellow;
            border-top: 5px solid #bbbb65;
            border-bottom: 5px solid #bbbb65;
            margin: 2px;
         }
       .days.over {
            width: 20px;
            float: left;
            height: 15px;
            background-color: yellow;
            border-top: 5px solid red;
            border-bottom: 5px solid red;
            margin: 2px;
         }
       .days.plan {
            width: 20px;
            float: left;
            height: 15px;
            background-color: #bbbb65;
            margin: 2px;
         }
       .days.empty {
            width: 20px;
            float: left;
            height: 15px;
            background-color: #ded5d5;
            margin: 2px;
         }
        .jobcurrent {animation:glowing 1500ms infinite;}
        .format-input-text {
            line-height: 25px;
            margin: 0px;
            padding: 0px;
            width: 100%;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
        <div class="row">
         <div class="col-xs-12 col-md-12" style="margin-bottom:10px;">
              <div class="row">
                  <div class="col-md-3" style="">
                      Người thực hiện<br />
                      <asp:DropDownList ID="dlUserReceiver" runat="server" CssClass="select2 form-control" Style="width:99%;">
                          <asp:ListItem Text="Tất cả" Value=""></asp:ListItem>
                      </asp:DropDownList>
                  </div>
                  <div class="col-md-3" style="">
                      Trạng thái<br />
                      <asp:DropDownList ID="dlStatus" runat="server" CssClass="select2 form-control" Style="width:99%;">
                          <asp:ListItem Text="Tất cả" Value=""></asp:ListItem>
                          <asp:ListItem Text="Đang thực hiện" Value="1"></asp:ListItem>
                          <asp:ListItem Text="Hoàn thành" Value="2"></asp:ListItem>
                          <asp:ListItem Text="Chậm tiến độ" Value="3"></asp:ListItem>
                      </asp:DropDownList>
                  </div>
                  <div class="col-md-2" style="">
                      Từ ngày<br /> 
                      <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepicker2" Style="width:99%;"></asp:TextBox>
                   </div>
                   <div class="col-md-2" style="">
                       Đến ngày<br />
                       <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepicker2" Style="width:99%;"></asp:TextBox>
                   </div>
                  <div class="col-md-2" style="">
                   <br />
                   <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text="Xem dữ liệu" />
               </div>
              </div>
         </div>
        <div class="col-xs-12 col-md-12">
         <section class="">
   <div class="pull-left">
        <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-keyboard-o"></i> Phân công công việc</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
          <span data-toggle="tooltip" data-placement="bottom" title="Kế hoạch thực hiện" class="days plan" style="margin-top:7px;"></span>
          <span data-toggle="tooltip" data-placement="bottom" title="Thực tế thực hiện" class="days active" style="margin-top:7px;"></span>
          <span data-toggle="tooltip" data-placement="bottom" title="Chậm tiến độ" class="days over" style="margin-top:7px;"></span>
       <div class="dropdown">
           <a href="#" onclick="addJob();" class="btn btn-sm btn-success dropdown-toggle" data-toggle="modal" data-target="#addJob"><i class="glyphicon glyphicon-edit"></i> Tạo công việc mới</a>
           <a href="#" onclick="viewReport();" class="btn btn-sm btn-warning dropdown-toggle" data-toggle="modal" data-target="#viewReport"><i class="fa fa-line-chart"></i> Xem báo cáo</a>
        </div>
       <div class="dropdown">
          <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
       <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
           <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người giao</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người nhận</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên công việc</label> </a></li> 
           <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" />&nbsp;Thời gian bắt đầu</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" />&nbsp;Kế hoạch hoàn thành</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" />&nbsp;Thực tế hoàn thành</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tiến độ thực hiện</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Kết quả thực hiện</label> </a></li>
           <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ghi chú</label> </a></li>
        </ul>
    </div>
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
                       <th class="bg-th" width="55px">Trạng thái</th>
                         <th class="bg-th" width="75px">Người giao</th>
                         <th class="bg-th" width="75px">Người nhận</th>
                         <th class="bg-th">Công việc</th>
                         <th class="bg-th" width="55px">Bắt đầu</th>
                         <th class="bg-th" width="55px">Kế hoạch</th>
                         <th class="bg-th" width="55px">Thực tế</th>
                         <th class="bg-th">Tiến độ thực hiện</th>
                         <th class="bg-th">Kết quả</th>
                         <th class="bg-th">Ghi chú</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px"></th>
                       <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Người giao</th>
                         <th class="bg-th">Người nhận</th>
                         <th class="bg-th">Công việc</th>
                         <th class="bg-th">Bắt đầu</th>
                         <th class="bg-th">Kế hoạch</th>
                         <th class="bg-th">Thực tế</th>
                         <th class="bg-th">Tiến độ thực hiện</th>
                         <th class="bg-th">Kết quả</th>
                         <th class="bg-th">Ghi chú</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
            
         </div>
            <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-line-chart"></i> Báo cáo tiến độ thực hiện</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Ẩn/hiện kết quả" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="RevenueWeek" style="height:350px"></canvas>
              </div>
            </div>
          </div>
      </div>
        
    </div>
</section>

    <div class="modal fade" id="updateJob" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        <span>CẬP NHẬT TIẾN ĐỘ CÔNG VIỆC</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Người giao việc<br />
                            <input type="text" id="txtUserCreate"  disabled="disabled" class="form-control" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Người nhận việc<br />
                            <input type="text" id="txtUser"  disabled="disabled" class="form-control" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-6">
                            Ngày giao việc<br />
                            <input type="text" id="txtDate"  disabled="disabled" class="form-control" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Mô tả tóm tắt công việc<br />
                            <textarea rows="2" id="txtsDescription" disabled="disabled" class="form-control" maxlength="512" style="width: 100%;"></textarea>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-12">
                            Ghi chú<br />
                             <input type="text" id="txtsNote" disabled="disabled" class="addMaterial form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Ngày bắt đầu dự kiến<br />
                            <input type="text" id="txtsStartDate"  disabled="disabled" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Ngày hoàn thành dự kiến<br />
                            <input type="text" id="txtsExpectDate"  disabled="disabled" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Ngày hoàn thành thực tế<br />
                            <input type="text" id="txtsCompleteDate" class="datepicker2 form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-12">
                            Kết quả thực hiện<br />
                             <input type="text" id="txtsComment" maxlength="128" placeholder="Nhập ghi chú cho việc thực hiện công việc..." class="addMaterial form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group">
                            <button type="button" title="Click nếu đã hoàn thành công việc" class="completejob btn btn-primary" onclick="completeJob();">
                                Hoàn thành</button>
                            <button type="button" title="Click nếu muốn hủy bỏ công việc" class="deletejob btn btn-danger" onclick="deleteJob();">
                                Hủy công việc</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addJob" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        <span id="lb">THÊM CÔNG VIỆC MỚI</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            <a href="javascript:;" onclick="addUser();" class="btn btn-xs btn-primary" style="margin-top:2px; font-style:italic; font-size:11px;">Thêm user</a>
                            <div id="lbUser">
                                
                            </div>
                        </div>
                        <div class="col-md-12">
                            Người nhận việc<br />
                            <select id="dlUser" class="form-control select2" style="width: 100%;">
                             </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Mô tả tóm tắt công việc<br />
                            <textarea rows="1" id="txtDescription" class="form-control" maxlength="512" style="width: 100%;"></textarea>
                        </div>
                        <div class="col-md-3">
                            Ngày bắt đầu dự kiến<br />
                            <input type="text" id="txtStartDate" class="numbers datepicker2 form-control" maxlength="10" placeholder="ngày/tháng/năm" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Ngày hoàn thành dự kiến<br />
                            <input type="text" id="txtExpectDate" class="numbers datepicker2 form-control" maxlength="10" placeholder="ngày/tháng/năm" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-12">
                            Ghi chú<br />
                            <input type="text" id="txtNote" class="addMaterial form-control" maxlength="128" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Danh sách công việc</div>    
                    <div class="row" style="padding: 5px; max-height:250px; overflow-y:auto;max-width:100%; overflow-x:auto;">
                         <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 550px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th style="width:30px">Xóa</th>
                                    <th>Công việc</th>
                                    <th style="width:85px;">Ngày bắt đầu</th>
                                    <th style="width:85px;">Ngày kết thúc</th>
                                    <th style="min-width:110px;">Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                        </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group">
                            <button type="button" title="Thêm công việc" class="btn btn-success" onclick="insertJob();">
                                Thêm công việc</button>
                            <button type="button" title="Lưu công việc" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdGanttId" value="" />
    <input type="hidden" id="hdUserId" value="" />
    <script>
        var options = ["1", "3", "4", "8", "9"];

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
                    if (e.which == 47) return true;
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
                   "targets": [2,5,6,7,10],
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
         $(document).ready(function () {
            $('#dlUser').find('option').remove().end();
            var c1 = document.getElementById('dlUser');
            var op = document.createElement('option');
            op.value = '';
            op.innerHTML = 'Chọn người nhận';
            c1.appendChild(op);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadUserAll',
                //data: '{"branchtype":"2"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._id;
                        opt.innerHTML = data.d[i]._content;
                        c1.appendChild(opt);
                    }
                }
            });
            viewReport();
        });
    </script>
    <script type="text/javascript">
        function update_modal(id,usercreate, userreceiver, iduser,createdate, startdate, expectdate, completedate,fullname,jobname, note, comment,status, module, remove, complete) {
            $("#updateJob").modal({ show: false });
            $('#hdGanttId').val(id);
            $('#txtUserCreate').val(usercreate);
            $('#txtUser').val(fullname);
            $('#txtDate').val(createdate);
            $('#txtsStartDate').val(startdate);
            $('#txtsExpectDate').val(expectdate);
            $('#txtsNote').val(note);
            $('#txtsDescription').val(jobname);
            $('#txtsComment').val(comment);
            $('#txtsCompleteDate').val(completedate);

            if (remove == '1') {
                $('.deletejob').show();
            }
            else {
                $('.deletejob').hide();
            }

            if (complete == '1') {
                $('.completejob').show();
            }
            else {
                $('.completejob').hide();
            }
        }
        function deleteJob() {
            var name = $('#txtsDescription').val();
            if (confirm("Bạn chắc chắn muốn xóa công việc [" + name + "] này ?") == true) {
                var id = $('#hdGanttId').val();
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/removeGantt',
                    data: '{"id":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('#job' + id).remove();
                            showAlert('Đã xóa công việc [' + name+ ']');
                            setTimeout(function () {
                                $("#updateJob").modal('hide');
                            }, 500);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function addJob() {
            $("#addJob").modal({ show: false });
            $('#hdGanttId').val('');
            $('#txtDescription').val('');
            $('#txtStartDate').val('');
            $('#txtExpectDate').val('');
            $('#txtNote').val('');
            $("#data-detail-soi tr").remove();
            $('#lbUser').text('');
            $('#hdUserId').val('');
            document.getElementById('lb').innerText = 'THÊM CÔNG VIỆC MỚI';
        }
        function insertJob() {
            var id = Math.random() * 100;
            id = id.toString().replace('.', '');
            var note = $('#txtNote').val();
            var des = $('#txtDescription').val();
            var start = $('#txtStartDate').val();
            var expect = $('#txtExpectDate').val();

            if (des == '') showAlert('Nhập nội dung công việc')
            else if (start == '') showAlert('Nhập ngày dự kiến bắt đầu công việc');
            else if (expect == '') showAlert('Nhập ngày dự kiến hoàn thành công việc');
            else {
                var html = "";
                html += '<tr data-id="' + id + '" id="rows' + id + '"><td><a onclick="removeJob(' + id + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                html += '<td style="padding:5px;"><input type="text"  id="des' + id + '" class="format-input-text" style="min-width:100px;" maxlength="512" value="' + des + '" /></td>';
                html += '<td style="padding:5px;"><input type="text" id="start' + id + '" class="format-input-text datepicker2 numbers" maxlength="10" style="min-width:100px;text-align:center;" value="' + start + '" /></td>';
                html += '<td style="padding:5px;"><input type="text" id="expect' + id + '" class="format-input-text datepicker2 numbers" maxlength="10" style="min-width:100px;text-align:center;" value="' + expect + '" /></td>';
                html += '<td style="padding:5px;"><input type="text" id="note' + id + '" class="format-input-text" style="min-width:100px;" maxlength="128" value="' + note + '" /></td></tr>';
                $('#data-detail-soi').append(html);

                $('#txtNote').val('');
                $('#txtDescription').val('');
                $('#txtStartDate').val('');
                $('#txtExpectDate').val('');
                $('#txtDescription').focus();

                setTimeout(function () {
                    $('.datepicker2').datepicker({
                        autoclose: true
                    });
                    $(".numbers").keypress(function (e) {
                        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                            if (e.which == 47) return true;
                            else return false;
                        }
                    });
                }, 0);
            }
        }
        function removeJob(index) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                var id = '#rows' + index;
                console.log(id);
                $(id).remove();
                showAlert('Đã xóa công việc');
            }
            return false;
        }
        function saveChanges() {
            var data = "";
            $("#data-detail-soi tr").each(function () {
                var id = $(this).attr("data-id");
                var des = $('#des' + id).val();
                var start = $('#start' + id).val();
                var expect = $('#expect' + id).val();
                var note = $('#note' + id).val();

                if (data != "") data += "#";
                data += des + '|' + start + '|' + expect + '|' + note;
            });

            var id = $('#hdGanttId').val();
            var id_list = $('#hdUserId').val();

            if (id == '') {
                var user = $('#dlUser').val();
                if (user == '' && id_list == '') showAlert('Chọn người nhận việc');
                else if (data == '') showAlert('Chưa có dữ liệu công việc nào');
                else {
                    if (id_list != '') user = id_list;
                    if (confirm("Bạn chắc chắn muốn lưu ?") == true) {
                        $.ajax({
                            type: 'POST',
                            url: '/Command.aspx/insertGantt',
                            data: '{"userreceiver":"' + user + '","data":"' + data + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                if (data.d._content == '1') {
                                    showAlert('Đã thêm công việc');
                                    $("#addJob").modal('hide');

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
            
            return false;
        }
        function completeJob() {
            var id = $('#hdGanttId').val();
            var comment = $('#txtsComment').val();
            var expectdate = $('#txtsExpectDate').val();
            var completedate = $('#txtsCompleteDate').val();
            if (completedate == '') showAlert('Nhập ngày hoàn thành công việc');
            else {
                if (confirm("Bạn chắc chắn muốn hoàn thành công việc này ?") == true) {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/completeGantt',
                        data: '{"id":"' + id + '","expectdate":"' + expectdate + '","completedate":"' + completedate + '","comment":"' + comment + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã lưu hoàn thành công việc');
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
        function addUser() {
            if ($('#dlUser').val() == '')
                showAlert('Chọn user cần thêm.');
            else {
                var us = $('.user' + $('#dlUser').val()).val();
                if (us == undefined) {
                    var id_random = Math.random() * 100;
                    id_random = id_random.toString().replace('.', '');

                    if ($('#lbUser').text() == '') {
                        $('#lbUser').append('<span id="span' + id_random + '"><label title="Xóa user này" onclick="removeUser(\'' + id_random + '\',\'' + $('#dlUser').val() + '\')" class="label label-warning user' + $('#dlUser').val() + '">' + $('#dlUser option:selected').text() + '</label> - </span>');
                        $('#hdUserId').val(',' + $('#dlUser').val() + ',');
                    }
                    else {
                        $('#lbUser').append('<span id="span' + id_random + '"><label title="Xóa user này" onclick="removeUser(\'' + id_random + '\',\'' + $('#dlUser').val() + '\')" class="label label-warning user' + $('#dlUser').val() + '">' + $('#dlUser option:selected').text() + '</label> - </span>');
                        $('#hdUserId').val($('#hdUserId').val() + $('#dlUser').val() + ',');
                    }
                }
                else
                    showAlert('Đã tồn tại user ' + $('#dlUser option:selected').text());

            }
            return false;
        }
        function removeUser(id_random,id) {
            $('#span' + id_random).remove();
            
            var vl = $('#hdUserId').val();
            $('#hdUserId').val(vl.replace(',' + id + ',', ','));

            if ($('#hdUserId').val() == ',')
                $('#hdUserId').val('');

            return false;
        }
        function viewReport() {
            //var branchType = '';
            var fromdate = '12/12/2017';//$('#fromdate').val();
            var todate = '05/03/2018';//$('#todate').val();

            var min_stick = 1;

            var _options = {
                elements: {
                    rectangle: {
                        borderWidth: 1,
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: 'bottom',
                },
                tooltips: {
                    position: 'average',
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
                        }
                    }
                },
                title: {
                    display: true,
                    text: 'Kết quả từ ' + fromdate + ' đến ' + todate
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Account'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Số lượng công việc'
                        },
                        ticks: {
                            min: min_stick,
                            callback: function (value, index, values) {
                                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        }
                    }]
                }
            };
            var _label = [], _list = [], _data1 = [], _ser = [], _series = [];
            _label.push('baonq.kd'); _label.push('tientx.kd'); _label.push('kiennt.kd'); _label.push('dungmt.pc'); _label.push('khanhtp.hc');
            _label.push('baonq.kd'); _label.push('tientx.kd'); _label.push('kiennt.kd'); _label.push('dungmt.pc'); _label.push('khanhtp.hc');
            _ser.push({ id: 2, name: 'Đúng tiến độ' });_ser.push({ id: 3, name: 'Chậm tiến độ' });_ser.push({ id: 1, name: 'Đang thực hiện' });
            
            _data1.push({ id: 1, data: 2 },{ id: 2, data: 5 },{ id: 3, data: 6 });
            _data1.push({ id: 1, data: 3 },{ id: 2, data: 2 },{ id: 3, data: 4 });
            _data1.push({ id: 1, data: 4 },{ id: 2, data: 3 },{ id: 3, data: 5 });
            _data1.push({ id: 1, data: 6 }, { id: 2, data: 3 }, { id: 3, data: 4 });
            _data1.push({ id: 1, data: 4 }, { id: 2, data: 5 }, { id: 3, data: 3 });

            _data1.push({ id: 1, data: 2 }, { id: 2, data: 5 }, { id: 3, data: 6 });
            _data1.push({ id: 1, data: 3 }, { id: 2, data: 2 }, { id: 3, data: 4 });
            _data1.push({ id: 1, data: 4 }, { id: 2, data: 3 }, { id: 3, data: 5 });
            _data1.push({ id: 1, data: 6 }, { id: 2, data: 3 }, { id: 3, data: 4 });
            _data1.push({ id: 1, data: 4 }, { id: 2, data: 5 }, { id: 3, data: 3 });

            //if (fromdate != '' && todate != '') {
            //    $.ajax({
            //        type: 'POST',
            //        url: '/Command.aspx/loadDashboardRevenue',
            //        data: '{"branchType":"' + branchType + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
            //        contentType: 'application/json; charset=utf-8',
            //        dataType: 'json',
            //        success: function (data) {
            //            var html = '';
            //            for (var i = 0; i < data.d.length; i++) {
            //                if (_label.indexOf(data.d[i].CreateAt) == -1)
            //                    _label.push(data.d[i].CreateAt);

            //                if (_series.indexOf(data.d[i].BranchTypeName) == -1) {
            //                    _ser.push({ id: data.d[i].Id, name: data.d[i].BranchTypeName });
            //                    _series.push(data.d[i].BranchTypeName);
            //                }

            //                _data1.push({ id: data.d[i].Id, data: data.d[i].RevenueValue });
            //            }
                        var color = ["rgb(255, 159, 64)", "#059BFF", "#FF6384"];

                        for (var i = 0; i < _ser.length; i++) {
                            var list_data = _data1.filter(x => x.id === _ser[i].id).map(x => x.data);

                            var obj = { label: _ser[i].name, backgroundColor: color[i], borderColor: "rgb(255, 159, 64)", borderWidth: 0, fill: false, data: list_data };
                            _list.push(obj);
                        }

                        var revenueWeek = {
                            data: {
                                labels: _label,
                                datasets: _list
                            }
                        };

                        var ctx2 = document.getElementById('RevenueWeek').getContext("2d");
                        var myChart2 = new Chart(ctx2, { type: 'bar', data: revenueWeek.data, options: _options });
            //        }
            //    });
            //}
        }
     </script>
</asp:Content>
