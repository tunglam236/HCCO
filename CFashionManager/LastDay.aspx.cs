using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LastDay : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["cm_branchTypeId"])))
            {
                Response.Redirect("/login");
            }
            else
            {
                txtFromDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                loadBranchType();
                loadBranch(rdBranchType.SelectedValue);
                lbData.Text = loadBill(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
            }
        }
    }
    void loadBranchType()
    {
        rdBranchType.DataSource = from x in db.tBranchTypes
                                  where x.Status == 1
                                  select new { x.Id, x.Name };
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    void loadBranch(string branchTypeId)
    {
        rdBranch.DataSource = from x in db.tBranches
                              where x.Status == 1 && x.BranchTypeId == int.Parse(branchTypeId)
                              select new { x.Id, x.BranchName };
        rdBranch.DataTextField = "BranchName";
        rdBranch.DataValueField = "Id";
        rdBranch.DataBind();
        rdBranch.SelectedIndex = 0;
        rdBranch.Items.Insert(0, new ListItem("Tất cả", ""));
        rdBranch.SelectedValue = "";
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(rdBranchType.SelectedValue);
    }
    //void loadBranchType()
    //{
    //    dlBranchType.DataSource = from x in db.tBranchTypes
    //                              where x.Status == 1
    //                              select new { x.Id, x.Name };
    //    dlBranchType.DataTextField = "Name";
    //    dlBranchType.DataValueField = "Id";
    //    dlBranchType.DataBind();
    //    dlBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    //}
    //void loadBranch(string branchTypeId)
    //{
    //    dlBranch.DataSource = from x in db.tBranches
    //                          where x.Status == 1 && x.BranchTypeId == int.Parse(branchTypeId)
    //                          select new { x.Id, x.BranchName };
    //    dlBranch.DataTextField = "BranchName";
    //    dlBranch.DataValueField = "Id";
    //    dlBranch.DataBind();
    //    dlBranch.Items.Insert(0, new ListItem("Tất cả chi nhánh", ""));
    //    dlBranch.SelectedValue = "";
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lbData.Text = loadBill(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    protected void dlBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(rdBranchType.SelectedValue);
        lbData.Text = loadBill(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());

    }
    protected void dlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbData.Text = loadBill(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    public string loadBill(string branchType, string branchId, string fromdate, string todate)
    {
        
        string result = ""; int i = 1;
        string fDate = "", tDate = "";
        if (fromdate.Trim() != "")
            fDate = cl.returnDatetime(fromdate.Trim());
        if (todate.Trim() != "")
            tDate = cl.returnDatetime(todate.Trim());
        if (fDate == "" || tDate == "")
        {
            fDate = ""; tDate = "";
        }
      
        //var m = db.sp_web_loadBill(branchType, branchId, fDate, tDate, outputType);
        var m = db.sp_web_baocaoxuathang(branchType.Trim(), branchId.Trim(), fDate, tDate, int.Parse(rdPaymentType.SelectedValue));
        double total_revenue = 0;
        
        var tmp1 = new Dictionary<string, double>();

        foreach (var item in m.ToList())
        {
            
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchCode + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.StockCode + "</td>";
            result += "<td>" + item.MemberCode + "</td>";
            result += "<td>" + item.MemberName + "</td>";
            result += "<td>" + item.Address + "</td>";
            result += "<td>" + item.Phone + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td>" + item.UnitName + "</td>";
            result += "<td>" + item.Quantity.ToString() + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.Price.Value) + "</td>";
            result += "<td>" + item.DiscountPercent.ToString() + " %</td>";
            if(item.Discount.Value > 999)
                result += "<td>" + string.Format("{0:0,0}", item.Discount) + "</td>";
            else
                result += "<td>" + item.Discount.ToString() + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.TotalPrice) + "</td>";

            if (!tmp1.ContainsKey(item.StockCode))
            {
                result += "<td>" + string.Format("{0:0,0}", item.TTPrice) + "</td>";
                result += "<td>" + item.TotalDiscountPercent.ToString() + " %</td>";
                if (item.TotalDiscount > 999)
                    result += "<td>" + string.Format("{0:0,0}", item.TotalDiscount) + "</td>";
                else
                    result += "<td>" + item.TotalDiscount.ToString() + "</td>";

                result += "<td>" + (item.Total_Price == 0 ? "0" : string.Format("{0:0,0}", item.Total_Price)) + "</td>";
                result += "<td>" + (item.CustomePay == 0 ? "0" : string.Format("{0:0,0}", item.CustomePay)) + "</td>";
                result += "<td>" + (item.CustomeReturn == 0 ? "0" : string.Format("{0:0,0}", item.CustomeReturn)) + "</td>";
                result += "<td>" + item.PaymentType + "</td>";
                result += "<td>" + item.Note + "</td>";

                tmp1.Add(item.StockCode, item.TTPrice.Value);

                total_revenue += item.Total_Price.Value;
            }
            else
            {
                result += "<td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td>";
            }
            result += "</tr>";
            i++;
            
        }
        lbTongTien.Text = total_revenue == 0 ? "0" : string.Format("{0:0,0 đ}", total_revenue);
        return result;
    }

}