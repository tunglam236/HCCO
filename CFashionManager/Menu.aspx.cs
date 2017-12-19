using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : System.Web.UI.Page
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
                lbData.Text = loadOrder(rdBranchType.SelectedValue);
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadOrder(rdBranchType.SelectedValue);
    }

    public string loadOrder(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadMenu(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' onclick='showModalUpdate("+ item.Id.ToString() + ");' data-toggle='modal' data-target='#addMenu' id='mnu" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.Code + "</td>";
            if (item.Parent == "")
                result += "<td><b>" + item.Name + "</b></td>";
            else
                result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Parent + "</td>";
            result += "<td>" + item.Position + "</td>";
            result += "<td>" + item.Link + "</td>";
            result += "<td>" + item.Status + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}