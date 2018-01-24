using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfferOutput : System.Web.UI.Page
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
                loadStatus();
                loadBranch(rdBranchType.SelectedValue);
                lbData.Text = loadForm(rdBranchType.SelectedValue, rdBranch.SelectedValue, rdUser.SelectedValue);
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
    void loadStatus()
    {
        rdUser.DataSource = from x in db.tGroupUsers
                            from y in db.tAccounts
                            where x.Id == y.GroupUserId && y.Status != 0
                            && x.GroupCode == "DESIGN"
                            select new { y.Id, y.FullName };
        rdUser.DataTextField = "FullName";
        rdUser.DataValueField = "Id";
        rdUser.DataBind();
        rdUser.Items.Insert(0, new ListItem("Tất cả", ""));
        rdUser.SelectedIndex = 0;
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(rdBranchType.SelectedValue);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(rdBranchType.SelectedValue, rdBranch.SelectedValue, rdUser.SelectedValue);
    }
    public string loadForm(string branchTypeId, string branchId, string status)
    {
        string result = ""; int i = 1;
        var m = db.sp_web_loadExportMaterial(branchTypeId.Trim(), branchId.Trim(), status.Trim());
        var userId = Session["cm_userId"].ToString();

        foreach (var item in m.ToList())
        {
            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick ='update_modal(\"" + item.Id.ToString() + "\",\"" + item.BranchTypeId.ToString() + "\",\"" + item.BranchId + "\",\"" + item.FormId.ToString() + "\",\"" + item.Description + "\");' id ='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.ExportCode + "</td>";
            result += "<td>" + item.DesignName + "</td>";
            result += "<td>" + item.Name + " - " + item.Code + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}