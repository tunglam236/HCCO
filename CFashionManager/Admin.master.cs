using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cnine_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Convert.ToString(Session["cm_branchTypeId"])) || string.IsNullOrEmpty(Convert.ToString(Session["cm_userId"])))
        {
            Response.Redirect("/login");
        }

        if (!IsPostBack)
        {
            loadMenu();
        }
    }
    void loadMenu()
    {
        CFileManagerDataContext db = new CFileManagerDataContext();
        string result = "", html ="";

        html = "<div class='panel-group' id='accordion'>";

        string groupId = HttpContext.Current.Session["cm_groupId"].ToString();
        var mn = db.sp_web_RoleMenu(groupId).ToList();
        var parent = mn.Where(x => x.ParentId == null).ToList();
        int ok = 0;
        int colspan = 0;
        foreach (var item in parent)
        {
            html += "<div class='panel panel-default' style='border-radius: 0px; margin-bottom: -7px;'>";
            html += "<div class='panel-heading'><h4 class='panel-title'>";
            html += "<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + colspan.ToString() + "'><i class='" + item.Icon + "'>";
            html += "</i> ";
            if (item.Link == "/home" || item.Link == "/logout")
                html += "<a href='" + item.Link + "'>" + item.ModuleName + "</a></a></h4></div>";
            else
                html += item.ModuleName + "</a></h4></div>";

            var child = mn.Where(x => x.ParentId == item.Id).ToList();

            ok = 0;
            foreach (var c in child)
            {
                if (ok == 0)
                {
                    html += "<div id='collapse" + colspan.ToString() + "' class='panel-collapse collapse'>";
                    html += "<div class='panel-body' style='padding: 0px;'>";
                    html += "<ul class='list-group' style='margin-bottom: 0px;'>";
                }
                html += "<li class='list-group-item'><a href='" + (c.sView.Value == 1 ? c.Link : "#") + "' class=''><i class='" + c.Icon + "'></i> " + c.ModuleName + "</a></li>";
                
                ok++;
            }
            if (ok > 0)
                html += "</ul></div></div>";

            html += "</div>";
            colspan++;
        }

        html += "</div>";
        result = html;
        mbMenu.Text = result;
    }
}
