using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportRevenue : System.Web.UI.Page
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
                loadBranch(dlBranchType.SelectedValue);
                lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
            }
        }
    }
    void loadBranchType()
    {
        dlBranchType.DataSource = from x in db.tBranchTypes
                                  where x.Status == 1
                                  select new { x.Id, x.Name };
        dlBranchType.DataTextField = "Name";
        dlBranchType.DataValueField = "Id";
        dlBranchType.DataBind();
        dlBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    void loadBranch(string branchTypeId)
    {
        dlBranch.DataSource = from x in db.tBranches
                              where x.Status == 1 && x.BranchTypeId == int.Parse(branchTypeId)
                              select new { x.Id, x.BranchName };
        dlBranch.DataTextField = "BranchName";
        dlBranch.DataValueField = "Id";
        dlBranch.DataBind();
        dlBranch.Items.Insert(0, new ListItem("Tất cả chi nhánh", ""));
        dlBranch.SelectedValue = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    protected void dlBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(dlBranchType.SelectedValue);
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());

    }
    protected void dlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    public string loadBill(string branchType, string branchId, string fromdate, string todate)
    {
        string outputType = "1";//xuat ban, 2//dieu chuyen
        string result = "", product = ""; int i = 1;
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
        var m = db.sp_web_ReportRevenue(branchType.Trim(), branchId.Trim(),DateTime.Parse(fDate),DateTime.Parse(tDate));
        double total_discount = 0, total_revenue = 0;
        
        foreach (var item in m.ToList())
        {
            total_discount += item.TotalDiscount.Value;
            total_revenue += item.TotalPrice.Value;

            result += "<tr class='detail-rows' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchCode + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "<td>" + item.StockCode + "</td>";
            result += "<td>" + item.MemberCode + "</td>";
            result += "<td>" + item.MemberName + "</td>";
            result += "<td>" + item.Username + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.CreateBy + "</td>";

            result += "<td>" + (item.Total.Value > 999 ? string.Format("{0:0,0}", item.Total.Value) : item.Total.ToString()) + "</td>";
            result += "<td>" + item.DiscountPercent.ToString() + " %</td>";
            result += "<td>" + (item.TotalDiscount.Value > 999 ? string.Format("{0:0,0}", item.TotalDiscount.Value) : item.TotalDiscount.ToString()) + "</td>";

            if (item.TotalPrice.Value < 0)
                result += "<td>" + ((item.TotalPrice.Value * (-1)) > 999 ? string.Format("{0:0,0}", item.TotalPrice.Value) : item.TotalPrice.Value.ToString()) + "</td>";
            else
                result += "<td>" + (item.TotalPrice.Value > 999 ? string.Format("{0:0,0}", item.TotalPrice.Value) : item.TotalPrice.ToString()) + "</td>";
            result += "<td>" + (item.CustomePay > 999 ? string.Format("{0:0,0}", item.CustomePay) : item.CustomePay.ToString()) + "</td>";
            result += "<td>" + (item.CustomeReturn > 999 ? string.Format("{0:0,0}", item.CustomeReturn) : item.CustomeReturn.ToString()) + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "</tr>";
            i++;
        }
        //result += "<tr><td colspan='5'>Tổng chiết khấu: " + string.Format("{0:0,0}", total_discount) + "</td><td colspan='12'>Tổng doanh thu: " + string.Format("{0:0,0}", total_revenue) + "</td></tr>";
        lbTongTien.Text = total_revenue == 0 ? "0" : string.Format("{0:0,0 đ}", total_revenue);
        return result;
    }
}