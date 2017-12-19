<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintOutputStock.aspx.cs" Inherits="PrintOutputStock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PHIẾU XUẤT HÀNG KIÊM BIÊN BẢN GIAO NHẬN HÀNG HÓA</title>
    <style type="text/css">
        #tblPrint tr td { line-height:25px;}
        .border {border:1px solid #ccc;}
        .bold{font-weight:bold;}
        .center{ text-align:center;}
        .pl{padding-left:5px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table id="tblPrint" style="width:100%;" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="7" style="text-transform:uppercase"><b>Công ty đầu tư và phát triển cuộc sống hạnh phúc hcc</b></td>
        </tr>
        <tr>
            <td colspan="7"><b>Tầng 29, tòa nhà HANDICO, Đường Phạm Hùng - P.Mễ Trì - Q.Nam Từ Liêm, TP.Hà Nội, Việt Nam</b></td>
        </tr>
        <tr>
            <td colspan="7">Số điện thoại: 024 6666 6838</td>
        </tr>
        <tr>
            <td colspan="7">Bộ phận: <asp:Literal ID="lbBranchType" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td colspan="7"><center><b><h2 style="margin-bottom:5px;">PHIẾU XUẤT HÀNG KIÊM BIÊN BẢN GIAO NHẬN HÀNG HÓA</h2> </b></center></td>
        </tr>
        <tr>
            <td colspan="7"><center><i><asp:Literal ID="lbCode" runat="server"></asp:Literal></i></center></td>
        </tr>
        <tr>
            <td colspan="7"><center><i><asp:Literal ID="lbDate" runat="server"></asp:Literal></i></center></td>
        </tr>
      <%--  <tr>
            <td colspan="7" style="border-bottom:1px dotted black"><i>Vào lúc:&nbsp;&nbsp;&nbsp;ngày&nbsp;&nbsp;&nbsp;tháng&nbsp;&nbsp;&nbsp;năm&nbsp;&nbsp;&nbsp;Tại:</i></></td>
        </tr>--%>
         <tr>
            <td colspan="2"><b>Bên giao</b></td>
            <td colspan="5" style="border-bottom:1px dotted black"><b><asp:Literal ID="lbBenGiao" runat="server"></asp:Literal> </b></td>
        </tr>
        <tr>
            <td colspan="2">Địa chỉ: </td>
            <td colspan="5" style="border-bottom:1px dotted black"><asp:Literal ID="lbAddBenGiao" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td colspan="2" style="margin-top:10px;">Đại diện Ông/Bà: </td>
            <td colspan="2" style="border-bottom:1px dotted black"><asp:Literal ID="lbDaiDienGiao" runat="server"></asp:Literal></td>
            <td colspan="3" style="border-bottom:1px dotted black">Chức vụ: <asp:Literal ID="lbChucVuGiao" runat="server"></asp:Literal> </td>
        </tr>
        <tr>
            <td colspan="2"><b>Bên nhận</b></td>
            <td colspan="5" style="border-bottom:1px dotted black"><b><asp:Literal ID="lbBenNhan" runat="server"></asp:Literal> </b></td>
        </tr>
        <tr>
            <td colspan="2">Địa chỉ: </td>
            <td colspan="5" style="border-bottom:1px dotted black"><asp:Literal ID="lbAddBenNhan" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td colspan="2" style="margin-top:10px;">Đại diện Ông/Bà: </td>
            <td colspan="2" style="border-bottom:1px dotted black"><asp:Literal ID="lbDaiDienNhan" runat="server"></asp:Literal></td>
            <td colspan="3" style="border-bottom:1px dotted black">Chức vụ: <asp:Literal ID="lbChucVuNhan" runat="server"></asp:Literal> </td>
        </tr>
        <tr>
            <td colspan="2">Lý do giao nhận: </td>
            <td colspan="5" style="border-bottom:1px dotted black"></td>
        </tr>
         <tr>
            <td colspan="7">Chi tiết hàng hóa như sau:  </td>
        </tr>
        <tr>
            <td class="border bold center" rowspan="2">STT</td>
            <td class="border bold center" rowspan="2">Mã hàng</td>
            <td class="border bold center" rowspan="2">Tên hàng</td>
            <td class="border bold center" rowspan="2">Đơn vị tính</td>
            <td class="border bold center" colspan="2">Số lượng</td>
            <td class="border bold center" rowspan="2">Ghi chú</td>
        </tr>
        <tr>
            <td class="border bold center">Thực nhập</td>
            <td class="border bold center">Đề xuất</td>
        </tr>

        <asp:Literal ID="lbItem" runat="server"></asp:Literal>
        <tr>
            <td colspan="4" class="border center"><b>Tổng cộng</b></td>
            <td colspan="1" class="border center"><b><asp:Literal ID="lbCount" runat="server"></asp:Literal></b></td>
            <td colspan="2" class="border center">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="7" class="pl">Biên bản này được lập làm 02 bản, mỗi bên giữ 01 bản có giá trị như nhau.</td>
        </tr>
        <tr>
            <td colspan="3" class="center"><b>Bên nhận - Trưởng cửa hàng</b><br /><i>(Kí và ghi họ tên)</i></td>
            <td colspan="2" class="center"><b>Kế toán</b><br /><i>(Kí và ghi họ tên)</i></td>
            <td colspan="2" class="center"><b>Bên giao - Thủ kho</b><br /><i>(Kí và ghi họ tên)</i></td>
        </tr>
    </table>
    </form>
</body>
</html>