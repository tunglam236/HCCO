using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Role : System.Web.UI.Page
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
                loadGroupUser();
            }
        }
    }
    void loadGroupUser()
    {
        rdGroupUser.DataSource = from x in db.tGroupUsers
                                  where x.Status == 1
                                  select new { x.Id, x.GroupName };
        rdGroupUser.DataTextField = "GroupName";
        rdGroupUser.DataValueField = "Id";
        rdGroupUser.DataBind();
        rdGroupUser.SelectedIndex = 0;
    }
}