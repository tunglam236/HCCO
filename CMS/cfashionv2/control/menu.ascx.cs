using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_menu : System.Web.UI.UserControl
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadMenuCF();
            loadMenu();
        }
    }
    private void loadMenuCF()
    {
        string mn = "";
        var m = from x in db.tNews
                where x.BranchTypeId == branchTypeId && x.Status == 1 && x.Type == 0
                select new { x.Id, x.Title };
        foreach (var item in m.ToList())
        {
            mn += "<div class='column' style='width: 405px;'><div class='itemMenu level1'><a class='itemMenuName level0 actParent' href='/cfashion/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html' style='font-size:14px;'><span>" + item.Title + "</span></a></div></div>";
        }
        lbCF.Text = mn;

    }
    private void loadMenu()
    {
        string result = "", mobile="";
        var m = from x in db.tProductTypes where x.BranchTypeId==branchTypeId && x.Status == 1 && x.ParentTypeId == null select x;
        foreach (var item in m.ToList())
        {
            result += "<div class='column'>";
            result += "<div class='itemMenu level1'>";
            result += "<a class='itemMenuName level0 actParent' href='/category/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductTypeName) + ".html'>";
            result += "<span>" + item.ProductTypeName + "</span></a>";

            mobile += "<li><span class=''><a href='/category/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductTypeName) + ".html'>" + item.ProductTypeName + "</a></span>";
            var child = from n in db.tProductTypes where n.ParentTypeId == item.Id select n;
            if (child.Count() > 0)
                mobile += "<ul class='level3'>";
            foreach (var c in child.ToList())
            {
               
                result += "<div class='itemSubMenu level0'>";
                result += "<div class='itemMenu level1'>";
                result += "<a class='itemMenuName level0 act' href='/subcategory/" + c.Id.ToString()+"/"+cl.ConvertToUnSign(c.ProductTypeName) + ".html'><span>" + c.ProductTypeName + "</span></a>";
                result += "</div></div>";

                mobile += "<li><span class='  no-close'><a href='/subcategory/" + c.Id.ToString() + "/" + cl.ConvertToUnSign(c.ProductTypeName) + ".html'>" + c.ProductTypeName + "</a></span></li>";
            }
            if (child.Count() > 0)
                mobile += "</ul>";
            mobile += "</li>";
            
            result += "</div></div>";
        }
        lbMenu.Text = result;
        lbMenuMobile.Text = mobile;
    }
}