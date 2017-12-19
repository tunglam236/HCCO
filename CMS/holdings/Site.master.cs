using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    clsProcess cl = new clsProcess();
    HoldingDataContext db = new HoldingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbMenu.Text = LoadMenu();
            //lbNewsRecent.Text = LoadNewsRecent();
            lbCategory.Text = LoadCategory();
        }
    }
    string LoadMenu()
    {
        string kq = "", link = "";
        kq += "<div id=\"default-menu\" class=\"header-menu\"><ul id=\"nav\" class=\"navbar-nav\">";
        var mn = from x in db.tMenus where x.IsActive == true && x.ParentId == null orderby x.ParentId select new { x.Name, x.Code, x.Id, x.ParentId, x.Link };
        if (mn.Count() > 0)
        {
            int count = 1;
            foreach (var i in mn.ToList())
            {
                if (i.Link != null)
                    link = i.Link.Trim();
                else link = "#";
                kq += "<li id=\"menu-item-" + count.ToString() + "\" class=\"menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-" + count.ToString() + "\"><a href=\"" + link + "\">" + i.Name.Trim().ToUpper() + "</a>";
                kq += LoadChildMenu(i.Id);
                kq += "</li>";
            }
        }
        kq += "</ul></div>";
        return kq;
    }
    string LoadChildMenu(int parentId)
    {
        string kq = "";

        var mn = from x in db.tMenus where x.IsActive == true && x.ParentId == parentId orderby x.Position select new { x.Name, x.Code, x.Id, x.ParentId, x.Link };
        if (mn.Count() > 0)
        {
            kq += "<ul class=\"sub-menu\">";
            int count = 10;
            foreach (var i in mn.ToList())
            {
                kq += "<li id=\"menu-item-" + count.ToString() + "\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-" + count.ToString() + "\">";
                if (i.Link != null)
                    kq += "<a href=\"" + i.Link.Trim() + "\">" + i.Name.ToUpper().Trim() + "</a></li>";
                else
                    kq += "<a href=\"/tin-tuc/" + i.Id.ToString() + "/" + cl.ConvertToUnSign(i.Name.Trim().ToLower()) + ".hcc\">" + i.Name.ToUpper().Trim() + "</a></li>";
                count++;
            }
            kq += "</ul>";
        }
        return kq;
    }
    string LoadNewsRecent()
    {
        string kq = "";
        //kq = "<ul>";
        //var news_recent = (from k in db.tNews from n in db.tAccounts where k.IsActive == true && k.CreateBy == n.Id orderby k.CreateAt descending 
        //                   select new { k.Id,k.Title, k.CreateAt, Name = n.FullName }).Skip(0).Take(3);
        //foreach (var g in news_recent.ToList())
        //{
        //    kq += "<li><a href=\"/bai-viet/" + g.Id.ToString() + "/" + cl.ConvertToUnSign(g.Title) + ".hcc\">" + g.Title + "</a><span>Viết bởi: <b>" + g.Name + "</b></span><span>" + g.CreateAt.Value.ToString("dd/MM/yyyy hh:mm") + "</span></li>";
        //}
        //kq += "</ul>";
        return kq;
    }
    string LoadCategory()
    {
        string kq = "";
        kq += "<ul>";
        var cat = from x in db.tCategories where x.IsActive == true select new { x.Id, x.Caption };
        foreach (var item in cat.ToList())
        {
            kq += "<li><a href=\"#\">" + item.Caption + "</a></li>";
        }
        kq += "</ul>";
        return kq;
    }
}
