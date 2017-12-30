using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintOutputStock : System.Web.UI.Page
{
    // var d = db.sp_web_OutputStock_detail(id.Trim());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            string html = "";
            var p = from x in db.tStockOutputs
                    from y in db.tBranches
                    from y2 in db.tBranches
                    from z in db.tBranchTypes
                    where x.BranchId == y.Id && x.BranchToId==y2.Id && x.BranchTypeId == z.Id 
                    && x.Id == int.Parse(Request.QueryString["Id"]) && x.OutputType==2
                    select new { x.StockCode, x.CreateAt, y.BranchName, y.Address, y.ContactName, y.Position, ToBranch= y2.BranchName, ToAddress=y2.Address, ToContactName= y2.ContactName, ToPosition=y2.Position, BranchType = z.Code };

            lbBenGiao.Text = p.FirstOrDefault().BranchName;
            lbAddBenGiao.Text = p.FirstOrDefault().Address;
            lbDaiDienGiao.Text = p.FirstOrDefault().ContactName;
            lbChucVuGiao.Text = p.FirstOrDefault().Position;

            lbBenNhan.Text = p.FirstOrDefault().ToBranch;
            lbAddBenNhan.Text = p.FirstOrDefault().ToAddress;
            lbDaiDienNhan.Text = p.FirstOrDefault().ToContactName;
            lbChucVuNhan.Text = p.FirstOrDefault().ToPosition;

            lbDate.Text = "Ngày " + p.FirstOrDefault().CreateAt.Value.ToString("dd/MM/yyyy HH:mm");
            lbBranchType.Text = p.FirstOrDefault().BranchType;
            lbCode.Text = "Số phiếu: " + p.FirstOrDefault().StockCode.ToString().ToUpper();
            var d = db.sp_web_OutputStock_detail(Request.QueryString["Id"]);
            int i = 1; int count = 0;
            foreach (var item in d.ToList())
            {
                html += "<tr style='font-size:14px;'>";
                html += "<td class='border center'>" + i.ToString() + "</td>";
                html += "<td class='border pl'>" + item.CodeId + " | " + item.ProductCode + "</td>";
                html += "<td class='border pl'>" + item.ProductName + "</td>";
                html += "<td class='border center'>Chiếc</td>";
                html += "<td class='border center'>" + item.Quantity.ToString() + "</td>";
                html += "<td class='border center'></td>";
                html += "<td class='border pl'></td>";
                html += "</tr>";
                i++;
                count += item.Quantity;
            }
            lbCount.Text = count == 0 ? "0" : string.Format("{0:0,0}", count);
            lbItem.Text = html;
        }
    }
}