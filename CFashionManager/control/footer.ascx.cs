using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_control_footer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string us = HttpContext.Current.Session["cm_username"].ToString();
            string name = HttpContext.Current.Session["cm_fullname"].ToString();

            lbUser.Text = us.ToUpper();
            lbName.Text = name.ToUpper();
        }
    }
}