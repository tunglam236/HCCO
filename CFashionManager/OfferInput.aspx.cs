using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfferInput : System.Web.UI.Page
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
                lbData.Text = loadForm(rdBranchType.SelectedValue, rdBranch.SelectedValue, rdStatus.SelectedValue);
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
        lbData.Text = loadForm(rdBranchType.SelectedValue, rdBranch.SelectedValue, rdStatus.SelectedValue);
    }
    public string loadForm(string branchTypeId, string branchId,string status)
    {
        string result = ""; int i = 1;
        string label = "";
        var m = db.sp_web_loadImportMaterial(branchTypeId.Trim(), branchId.Trim(), status.Trim());
        var userId = Session["cm_userId"].ToString();
        foreach (var item in m.ToList())
        {
            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick ='update_modal(\"" + item.Id.ToString() + "\",\"" + item.BranchTypeId.ToString() + "\",\"" + item.BranchId + "\",\"" + item.Description + "\",\"" + (item.CreateBy.ToString() == userId && item.StatusId==1 ? 1 : 0) + "\");' id ='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.StatusId.Value == 1)
                label = "blink label label-warning";
            else if (item.StatusId.Value == 2)
                label = "label label-primary";
            else if (item.StatusId.Value == 3)
                label = "label label-danger";

            result += "<td><span class='" + label + "'>" + item.Status + "</span></td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.ImportCode + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.DateReceiver + "</td>";
            
            result += "</tr>";
            i++;
        }
        return result;
    }
}