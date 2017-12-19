using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_footer : System.Web.UI.UserControl
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadIntroNews();
        }
    }
    void loadIntroNews()
    {
        string result = "<ul class='list-unstyled text-content'>";
        result += "";
        var n = from x in db.tNews
                where x.BranchTypeId == branchTypeId && x.Status == 1 && x.Type == 0
                select new { x.Id, x.Title };
        foreach (var item in n.ToList())
        {
            result += "<li><a href='/cfashion/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>- " + item.Title + "</a></li>";
        }
        result += "</ul>";
        lbIntroNews.Text = result;
    }
}