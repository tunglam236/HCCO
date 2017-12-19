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
        var n = from x in db.tNews from y in db.tAccounts where x.BranchTypeId==branchTypeId && x.CreateBy == y.Id && x.Status == 1 && x.Type==1
                select new { x.Id, x.Title, x.Description, x.Image, x.CreateAt, y.FullName };
        string result = "";
        foreach (var item in n.ToList())
        {
            result += "<div class='row_items'><div class='articles-inner'><div class='articles-date'><p class='date'>";
            result += item.CreateAt.Value.ToString("dd - MM - yyyy") +"</p><p class='author'>Đăng bởi: <span class='author-name'>" + item.FullName + "</span></p>";
            result += "</div><div class='articles-image'>";
            result += "<a href='/article/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>";
            result += "<img src='" + item.Image + "' alt='" + item.Title + "' /></a></div><div class='aritcles-content'>";
            result += "<div class='articles-tit'><a class='articles-name' href='/NewsDetail.aspx?Id=" + item.Id.ToString() + "'>";
            result += item.Title + "</a></div><div class='articles-intro'>";
            result += "<p>"+item.Description+"</p></div>";
            result += "<a class='read-more' href='/article/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>Xem thêm</a></div></div></div>";
        }
        lbNews.Text = result;
    }
}