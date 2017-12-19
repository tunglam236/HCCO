using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
            Response.Redirect("/login");
    }
}