using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
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
                lbData.Text = loadBrand(rdBranchType.SelectedValue, rdBranch.SelectedValue, rdBuy.SelectedValue);
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
        lbData.Text = loadBrand(rdBranchType.SelectedValue, rdBranch.SelectedValue, rdBuy.SelectedValue);
    }

    public string loadBrand(string branchType, string branch, string status)
    {
        string result = ""; int i = 1;

        var m = db.sp_Feedback_load(branchType.Trim(), branch.Trim(), status.Trim());

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addColor' id='" + item.OrderId.ToString() + "' class='detail-rows feed" + item.Id.ToString() + "' onclick='updateColor_modal(\"" + item.Id.ToString() + "\",\"" + item.OrderId.ToString() + "\",\"" + item.Content + "\");'  title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.StockCode + "</td>";
            result += "<td>" + item.MemberName + " - " + item.Phone + " - " + item.Address + "</td>";
            result += "<td>" + item.Content + "</td>";
            result += "<td>" + item.OrderAt + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.CreateBy + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}