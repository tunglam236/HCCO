using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inventory : System.Web.UI.Page
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
                loadBranchType();

                loadBranch(rdBranchType.SelectedValue);

                txtFromDate.Text = txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                lbData.Text = loadProduct(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text, txtToDate.Text);
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadProduct(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    public string loadProduct(string branchType, string branchId, string fromdate, string todate)
    {
        string result = ""; 
        string fDate = "", tDate = "";
        if (fromdate.Trim() != "")
            fDate = cl.returnDatetime(fromdate.Trim());
        if (todate.Trim() != "")
            tDate = cl.returnDatetime(todate.Trim());
        if (fDate == "" || tDate == "")
        {
            fDate = ""; tDate = "";
            txtFromDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            txtToDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
        }

        var m = db.sp_web_ReportInventory(branchType,branchId, DateTime.Parse(fDate), DateTime.Parse(tDate));
        int i = 1;
        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.ProductId.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.ProductId + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td align='center'>" + item.Pre + "</td>";
            result += "<td align='center'>" + item.QuantityInput + "</td>";
            result += "<td align='center'>" + item.QuantityOutput + "</td>";
            result += "<td align='center'>" + item.Total + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}