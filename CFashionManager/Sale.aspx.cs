using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sale : System.Web.UI.Page
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

                lbData.Text = loadGift(rdBranchType.SelectedValue, rdBranch.SelectedValue);
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
        if (branchTypeId == "")
            rdBranch.DataSource = from x in db.tBranches
                                  where x.Status == 1
                                  select new { x.Id, x.BranchName };
        else
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadGift(rdBranchType.SelectedValue, rdBranch.SelectedValue);
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(rdBranchType.SelectedValue);
    }
    public string loadGift(string branchType, string branchId)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadGift(branchType, branchId);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchTypeName + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.FromHour + " - " + item.FromDate + "</td>";
            result += "<td>" + item.ToHour + " - " + item.ToDate + "</td>";
            result += "<td>" + item.SaleType + "</td>";
            if (item.SaleValue.Value > 999)
                result += "<td>" + string.Format("{0:0,0}", item.SaleValue) + "</td>";
            else result += "<td>" + item.SaleValue.ToString() + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.CreateBy + "</td>";
            
            result += "</tr>";
            i++;
        }
        return result;
    }
}