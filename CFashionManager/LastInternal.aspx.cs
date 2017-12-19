using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Internal : System.Web.UI.Page
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
    protected void dlBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(dlBranchType.SelectedValue);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    public string loadBill(string branchType, string branchId, string fromdate, string todate)
    {
        string result = "";
        string fDate = "", tDate = "";
        if (fromdate.Trim() != "")
            fDate = cl.returnDatetime(fromdate.Trim());
        if (todate.Trim() != "")
            tDate = cl.returnDatetime(todate.Trim());

        var m = db.sp_web_loadStockInternal(branchType, branchId, fDate, tDate);
        int i = 1; int count = 0;
        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchCode + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.ToBranchCode + "</td>";
            result += "<td>" + item.ToBranchName + "</td>";
            result += "<td>" + item.Type + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.StockCode + "</td>";
            result += "<td>" + item.CodeId + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td>" + item.Quantity + "</td>";
            result += "<td>" + item.UnitName + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "</tr>";
            i++;
            count += item.Quantity.Value;
        }
        lbCount.Text = count == 0 ? "0" : string.Format("{0:0,0}", count);
        return result;
    }
}