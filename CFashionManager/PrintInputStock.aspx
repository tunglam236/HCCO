<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintInputStock.aspx.cs" Inherits="PrintInputStock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PHIẾU YÊU CẦU NHẬP HÀNG</title>
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
            <td colspan="7"><center><b><h2 style="margin-bottom:5px;">PHIẾU YÊU CẦU NHẬP HÀNG</h2> </b></center></td>
        </tr>
        <tr>
            <td colspan="7"><center><b>Kho: <asp:Literal ID="lbBranch" runat="server"></asp:Literal></b></center></td>
        </tr>
        <tr>
            <td colspan="7"><center><i><asp:Literal ID="lbDate" runat="server"></asp:Literal></i></center></td>
        </tr>
         <tr>
            <td colspan="7"><center><i><asp:Literal ID="lbStockCode" runat="server"></asp:Literal></i></center></td>
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
            <td class="border bold center">Thực nhận</td>
            <td class="border bold center">Sản xuất</td>
        </tr>
        <asp:Literal ID="lbItem" runat="server"></asp:Literal>
        <tr>
            <td colspan="4" class="border center"><b>Tổng cộng</b></td>
            <td colspan="1" class="border center"><b><asp:Literal ID="lbCount" runat="server"></asp:Literal></b></td>
            <td colspan="2" class="border center">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="center"><b>Thủ kho nhận</b><br /><i>(Kí và ghi họ tên)</i></td>
            <td colspan="2" class="center"><b>KCS</b><br /><i>(Kí và ghi họ tên)</i></td>
            <td colspan="1" class="center"><b>Thiết kế</b><br /><i>(Kí và ghi họ tên)</i></td>
            <td colspan="2" class="center"><b>Quản lý sản xuất</b><br /><i>(Kí và ghi họ tên)</i></td>
        </tr>
    </table>
    </form>
</body>
</html>
