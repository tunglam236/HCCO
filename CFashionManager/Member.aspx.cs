using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member : System.Web.UI.Page
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

                lbData.Text = loadMember(rdBranchType.SelectedValue, rdBuy.SelectedValue.Trim());
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
        lbData.Text = loadMember(rdBranchType.SelectedValue, rdBuy.SelectedValue.Trim());
    }
    public string loadMember(string branchType, string buy)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadMember(branchType, buy);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.BranchTypeName + "</td>";
            result += "<td>" + item.MemberCode + "</td>";
            result += "<td>" + item.MemberName + "</td>";
            result += "<td>" + item.Birthday + "</td>";
            result += "<td>" + item.Sex + "</td>";
            result += "<td>" + item.Address + "</td>";
            result += "<td>" + item.Phone + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "<td>" + item.CreateBy + "</td>";
            result += "<td>" + item.JoinCreateAt + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}