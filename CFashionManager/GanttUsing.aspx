<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GanttUsing.aspx.cs" Inherits="GanttUsing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hướng dẫn quy trình phân công công việc trên ERP</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="/dist/img/favicon.ico" sizes="32x32">
    
    <style type="text/css">
		@media (min-width: 800px) {
		    .scontent{padding: 0% 10%}
            img {width:auto;}
		}
		@media (max-width: 800px) {
		    .scontent{padding: 0%}
            img {width:100%;}
		}
		.border {border: 1px solid blue; margin-bottom: 7px; border-radius: 5px;}
        h3 { text-transform:uppercase;}
        ul {margin:0 auto;}
        ul li { list-style-type:circle; text-align:left !important; padding-bottom:5px; }
        
	</style>
</head>
<body class="scontent">
        <center>
            <h3>Hướng dẫn quy trình phân công công việc trên hệ thống ERP</h3>
            <div><i>Bước 1: Đăng nhập hệ thống ERP tại địa chỉ: <a href="http://cms.hcco.vn">http://cms.hcco.vn</a></i></div>
            <div>
                <ul>
                    <li>Mỗi user sẽ được cấp 1 tài khoản truy cập trên hệ thống</li>
                    <li>Điền thông tin đăng nhập và click [Đăng nhập]</li>
                    <li>Nếu quên mật khẩu click vào [Quên mật khẩu], sau đó nhập lại địa chỉ email để hệ thống cấp lại mật khẩu mới.</li>
                </ul>
            </div>
		    <div><img src="Gantt/1.png" class="border"></div>
            <div><i>Bước 2: Truy cập vào trang phân công công việc tại: <a href="http://cms.hcco.vn/gantt">http://cms.hcco.vn/gantt</a></i></div>
            <div><i>Hoặc vào từ menu -> Quy trình -> Phân công công việc</i></div>
            <div><img src="Gantt/2.png" class="border"></div>
            <div><i>Hiển thị giao diện Phân công công việc</i></div>
             <div>
                <ul>
                    <li>[1],[2],[3],[4] - Các điều kiện lọc để xem danh sách các công việc.</li>
                    <li>[1] - Danh sách các user nhận việc do mình giao, hoặc người khác giao cho mình.</li>
                    <li>[2] - Trạng thái thực hiện công việc: Đang thực hiện, Đã hoàn thành, Chậm tiến độ.</li>
                    <li>[3],[4] - Các công việc trong khoảng thời gian muốn xem.</li>
                    <li>Sau đó click [Xem dữ liệu] để xem danh sách công việc đã lọc.</li>
                    <li>[5] - Tạo công việc mới.</li>
                </ul>
            </div>
            <div><img src="Gantt/3.png" class="border"></div>
            <div>
                <ul>
                    <li>Để thêm công việc mới, nhập đủ các nội dung có dấu (*) </li>
                    <li>[1] - Chọn user nhận công việc.</li>
                    <li>[2] - Nhập ngày giao công việc.</li>
                    <li>[3] - Nội dung công việc.</li>
                    <li>[4] - Thời gian dự kiến bắt đầu.</li>
                    <li>[5] - Thời gian dự kiến hoàn thành công việc.</li>
                    <li>[6] - Ghi chú về công việc (nếu có)</li>
                    <li>[7] - Thêm công việc vào danh sách (dùng để thêm nhiều công việc cho 1 user)</li>
                    <li>[8] - Cuối cùng lưu lại công việc</li>
                </ul>
            </div>
            <div><img src="Gantt/4.png" class="border"></div>
            <div>
                <ul>
                    <li>Sau khi lưu lại công việc, sẽ có thông báo tới email của user được nhận công việc, như sau:</li>
                    <li>Sau khi nhận được thông báo công việc, user nhận được việc và thực hiện tiến độ.</li>
                    <li>Khi hoàn thành công việc, user vào email và xác nhận hoàn thành công việc bằng cách click vào ô [Xác nhận hoàn thành công việc]</li>
                </ul>
            </div>
            <div><img src="Gantt/8-1.png" class="border"></div>
            <div>
                <ul>
                     <li>User sẽ chuyển đến địa chỉ để cập nhật tiến độ công việc.</li>
                    <li>Nhập ghi chú cho kết quả thực hiện (nếu có) vào ô [Kết quả thực hiện].</li>
                    <li>Click [Hoàn thành công việc] để cập nhật lên hệ thống.</li>
                </ul>
           </div>
            <div><img src="Gantt/9-1.png" class="border"></div>
        </center>
</body>
</html>
