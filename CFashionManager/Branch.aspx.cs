using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Branch : System.Web.UI.Page
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

                lbData.Text = loadBranch(rdBranchType.SelectedValue);
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
        rdBranchType.Items.Insert(0, new ListItem("Tất cả", ""));
        rdBranchType.SelectedValue = "";
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadBranch(rdBranchType.SelectedValue);
    }

    public string loadBranch(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadBranch(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addBranch' class='detail-rows' onclick='updateBranch_modal(\"" + item.Id.ToString() + "\",\"" + item.BranchTypeId.ToString() + "\",\"" + item.BranchCode + "\",\"" + item.BranchName.Replace("'", ".") + "\",\"" + item.Phone + "\",\"" + item.Address + "\",\"" + item.Info + "\",\"" + item.Time + "\",\"" + item.CountryId.ToString() + "\",\"" + item.DistrictId.ToString() + "\",\"" + item.ContactName + "\",\"" + item.Position + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.Address + "</td>";
            result += "<td>" + item.Phone + "</td>";
            result += "<td>" + item.Info + "</td>";
            result += "<td>" + item.ContactName + "</td>";
            result += "<td>" + item.Position + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}