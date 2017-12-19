using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            if (!url.Contains("/login") && !url.Contains("Login.aspx"))
                if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                    Response.Redirect("/login");

            if (!string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])))
            {
                lbMenu.Text += "<li id=\"menu-item-187\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-187\"><a href=\"/role\">Phân quyền người dùng</a></li>";
                lbMenu.Text += "<li id=\"menu-item-187\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-187\"><a href=\"/changepass\">Đối mật khẩu</a></li>";
                lbMenu.Text += "<li id=\"menu-item-189\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-189\"><a href=\"/logout\">Đăng xuất</a></li>";
            }
            else lbMenu.Text = "<li id=\"menu-item-190\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-187\"><a href=\"/login\">Đăng nhập</a></li>";
        }
    }
}
