using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_control_header : System.Web.UI.UserControl
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadMenu();
        }
    }
    private void loadMenu()
    {
        string result = "";
        string groupId = HttpContext.Current.Session["cm_groupId"].ToString();
        var mn = db.sp_web_RoleMenu(groupId).ToList();
        result += "<ul class='nav navbar-nav'>";
        var parent = mn.Where(x => x.ParentId == null).ToList();
        int ok = 0; bool right = true;
        foreach (var item in parent)
        {
            var child = mn.Where(x => x.ParentId == item.Id).ToList();

            ok = 0;
            foreach (var c in child)
            {
                if (c.Position == 2 && right)
                {
                    result += "</ul><ul class='nav navbar-nav pull-right'>";
                    right = false;
                }
                if (ok == 0)
                {
                    result += "<li class='dropdown'>";
                    result += "<a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class='" + item.Icon + "'></i> " + item.ModuleName + "<span class='caret'></span></a>";
                    result += "<ul class='dropdown-menu'>";
                }
                ok++;
                result += "<li><a href='" + (c.sView.Value == 1 ? c.Link : "#") + "'><i class='" + c.Icon + "'></i> " + c.ModuleName + "</a></li>";
            }
            if(ok>0)
                result += "</ul></li>";

            if (ok==0)
                result += "<li><a href='" + (item.sView.Value==1 ? item.Link : "#") + "'><i class='" + item.Icon + "'></i> " + item.ModuleName + "</a></li>";
        }
        result += "</ul>";
        ulMenu.Text = result;
    }
}
