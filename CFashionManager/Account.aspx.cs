using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
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

                lbData.Text = loadAccount(dlGroupUser.SelectedValue);
            }
        }
    }
    void loadBranchType()
    {
        dlGroupUser.DataSource = from x in db.tGroupUsers
                                  where x.Status !=0
                                  select new { x.Id, x.GroupName };
        dlGroupUser.DataTextField = "GroupName";
        dlGroupUser.DataValueField = "Id";
        dlGroupUser.DataBind();
        dlGroupUser.Items.Insert(0, new ListItem("Tất cả", ""));
        dlGroupUser.SelectedValue = "";
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadAccount(dlGroupUser.SelectedValue);
    }
    public string loadAccount(string group)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadAccountByGroup(group);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' onclick='getDetailUser(" + item.Id.ToString() + ")' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.BranchTypeName + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.GroupName + "</td>";
            result += "<td>" + item.Username + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.Sex + "</td>";
            result += "<td>" + item.Birthday + "</td>";
            result += "<td>" + item.Email + "</td>";
            result += "<td>" + item.Phone + "</td>";
            result += "<td>" + item.Address + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "<td>" + item.Status + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}