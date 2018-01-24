using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mess : System.Web.UI.Page
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
                loadStatus();
                lbData.Text = loadForm(rdBranchType.SelectedValue);
            }
        }
    }
    void loadStatus()
    {
        rdBranchType.DataSource = from x in db.tBranchTypes where x.Status!=0
                            select new { x.Id, x.Name };
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.Items.Insert(0, new ListItem("Tất cả", ""));
        rdBranchType.SelectedIndex = 0;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(rdBranchType.SelectedValue);
    }
    public string loadForm(string branchType)
    {
        string result = ""; int i = 1;
        string label = "";

        var m = db.sp_web_loadMess(branchType);
        foreach (var item in m.ToList())
        {
            result += "<tr id='" + item.Id + "' read='" + item.StatusId.ToString() + "' class='detail-rows'>";
            result += "<td class='center'>" + i.ToString() + " </td>";
            if (item.StatusId == 0)
                label = "blink label label-success";
            else
                label = "label label-primary";

            result += "<td>" + item.Name + "</td>";
            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "<td>" + item.UserName + "</td>";
            result += "<td>" + item.Message + "</td>";
            result += "<td><a href='" + item.Path + "' target='_blank'>" + item.Path + "</a></td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}