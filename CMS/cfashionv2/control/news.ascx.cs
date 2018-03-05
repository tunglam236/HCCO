using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_news : System.Web.UI.UserControl
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl=new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadNews();
        }
    }
    private void loadNews()
    {
        var n = from x in db.tNews
                where x.BranchTypeId == branchTypeId && x.Status == 1 && x.Type == 1
                select new { x.Id, x.Title, x.Description, x.Image, x.CreateAt };
        string result = "";
        foreach (var item in n.ToList())
        {
            result += "<div class='row_items'><div class='articles-inner'><div class='articles-image'>";
            result += "<a href='/article/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>";
            result += "<img src='" + item.Image + "' alt='" + item.Title + "' class='img-responsive lazy' /></a></div><div class='aritcles-content'>";
            result += "<div class='articles-tit'><a class='articles-name' href='/article/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>";
            result += item.Title + "</a></div><div class='articles-intro'>";
            result += "<p>"+item.Description+"</p></div>";
            result += "</div></div></div>";
        }
        lbNews.Text = result;
    }
}