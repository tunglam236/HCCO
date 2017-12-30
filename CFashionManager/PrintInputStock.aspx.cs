using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintInputStock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            string html = "";
            var p = from x in db.tStockInputs from y in db.tBranches from z in db.tBranchTypes
                    where x.BranchId==y.Id && x.BranchTypeId==z.Id && x.Id == int.Parse(Request.QueryString["Id"])
                    && x.InputType==1
                    select new { x.StockInputCode, x.CreateAt, y.BranchName,BranchType= z.Code };

            lbBranch.Text = p.FirstOrDefault().BranchName;
            lbBranchType.Text = p.FirstOrDefault().BranchType;
            lbDate.Text = "Ngày "+p.FirstOrDefault().CreateAt.Value.ToString("dd/MM/yyyy HH:mm");
            lbStockCode.Text = "Số phiếu: "+p.FirstOrDefault().StockInputCode.ToString().ToUpper();
            var d = db.sp_web_getStockInputDetail(Request.QueryString["Id"]);
            int i = 1; int count = 0;
            foreach (var item in d.ToList())
            {
                html += "<tr style='font-size:14px;'>";
                html += "<td class='border center'>" + i.ToString() + "</td>";
                html += "<td class='border pl'>" + item.CodeId + " | " + item.ProductCode + "</td>";
                html += "<td class='border pl'>"+item.ProductName+"</td>";
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