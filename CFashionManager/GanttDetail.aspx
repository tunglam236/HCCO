<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GanttDetail.aspx.cs" Inherits="GanttDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cập nhật tiến độ thực hiện công việc</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="/dist/img/favicon.ico" sizes="32x32">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link href="/dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/dist/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
    <script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/dist/css/skins/_all-skins.min.css">
    <link href="/dist/css/custom.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .form-control[disabled]{background-color:#ffffff;}
    </style>
</head>
<body class="hold-transition skin-green sidebar-mini sidebar-collapse">
    <div class="wrapper">
        <div class="content-wrapper">
            <form id="form1" runat="server">
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#settings" data-toggle="tab"><b>Cập nhật tiến độ thực hiện công việc</b></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="active tab-pane" id="settings">
                                        <div class="row" style="padding: 5px;">
                                            <div class="col-md-3 col-sm-6">
                                                <b>Người giao việc</b><br />
                                                <asp:TextBox ID="txtUserCreate" runat="server" Enabled="False" CssClass="form-control" Style="width: 100%;" />
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <b>Người nhận việc</b><br />
                                                <asp:TextBox ID="txtUserReceiver" runat="server" Enabled="False" CssClass="form-control" Style="width: 100%;" />
                                            </div>
                                            <div class="col-md-2">
                                                <b>Ngày giao việc</b><br />
                                                <asp:TextBox ID="txtDateCreate" runat="server" Enabled="False" CssClass="form-control" Style="width: 100%;" />
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <b>Ngày bắt đầu dự kiến</b><br />
                                                <asp:TextBox ID="txtStartDate" runat="server" Enabled="False" CssClass="form-control" Style="width: 100%;" />
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                               <b>Ngày hoàn thành dự kiến</b><br />
                                                <asp:TextBox ID="txtExpectDate" runat="server" Enabled="False" CssClass="form-control" Style="width: 100%;" />
                                            </div>
                                        </div>
                                        <div class="row" style="padding: 5px;">
                                            <div class="col-md-6">
                                                <b>Mô tả tóm tắt công việc</b><br />
                                                <asp:Label ID="txtContent" Style="font-style:italic;" runat="server"></asp:Label>
                                            </div>
                                            <div class="col-md-6">
                                                <b>Ghi chú</b><br />
                                                <asp:Label ID="txtNote" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        
                                        <div class="row" style="padding: 5px;">
                                            <div class="col-md-12">
                                                <b>Kết quả thực hiện</b><br />
                                                <asp:TextBox TextMode="MultiLine" Rows="3" ID="txtComment" runat="server" placeholder="Nhập ghi chú cho việc thực hiện công việc..." CssClass="form-control" Style="width: 100%;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="padding: 5px;">
                                            <div class="col-md-12 btn-group">
                                                <asp:Button ID="btnSubmit" runat="server" ToolTip="Click nếu đã hoàn thành công việc" Text="Hoàn thành công việc" CssClass="btn btn-primary" OnClientClick="complete();" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <asp:HiddenField ID="hdId" runat="server" />
            </form>
        </div>
    </div>
    <div class="alert alert-success" id="success-alert" style="position: fixed; top: 0px; right: 0px; width: auto; z-index: 999999; height: 60px;">
        <button type="button" class="close">x</button>
        <b>Thông báo ! </b>
        <div id="lbmess" style="display: inline; padding: 8px;">...</div>
    </div>
    
    
    <script type="text/javascript">
        $(document).ready(function () {
            $("#success-alert").hide();
        });
    </script>
    <script type="text/javascript">
        function showAlert(x) {
            var m = document.getElementById("lbmess");
            m.innerHTML = x;
            $("#success-alert").fadeTo(5000, 5000).slideUp(1000, function () {
                $("#success-alert").slideUp(1000);
            });
        }
        function complete() {
            var id = $('#hdId').val();
            $('#btnSubmit').val('Đã hoàn thành công việc');
            $('#btnSubmit').prop("disabled", "disabled");

            var cmt = $('#txtComment').val();
            if (cmt == '') cmt = 'Đã hoàn thành công việc';
            if (confirm("Bạn chắc chắn đã hoàn thành công việc này ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/completeJob',
                    data: '{"id":"' + id + '","comment":"' + cmt + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            
                            showAlert('Đã lưu hoàn thành công việc');
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
        }
    </script>
</body>
</html>
