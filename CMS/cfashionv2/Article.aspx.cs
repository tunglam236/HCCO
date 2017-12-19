using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Article : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                try
                {
                    var n = (from x in db.tNews from y in db.tAccounts where x.CreateBy == y.Id && x.Id == int.Parse(Request.QueryString["Id"]) select new { x.Id, x.Title, x.Description, x.Body, x.Image, x.CreateAt, y.FullName }).FirstOrDefault();
                    lbImage.Text = "<img class=' lazy' src='" + n.Image + "' alt='" + n.Title + "' />";
                    lbTitle.Text = Title= lbLinkTitle.Text = n.Title;
                    lbDescription.Text = n.Description;
                    lbCreated.Text = "Đăng bởi: " + n.FullName + " / " + n.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss");
                    lbBody.Text = n.Body.Replace("150%","30px");
                    loadNews(int.Parse(Request.QueryString["Id"]));
                }
                catch
                {
                    Response.Redirect("/notfound");
                }
            }
            else
                Response.Redirect("/home");
        }
    }
    private void loadNews(int id)
    {
        try
        {
            var n = (from x in db.tNews from y in db.tAccounts where x.BranchTypeId == branchTypeId && x.CreateBy == y.Id && x.Status == 1 && x.Type == 0 && x.Id != id select new { x.Id, x.Title, x.Description, x.Image, x.CreateAt, y.FullName }).Skip(0).Take(8);
            string result = "";
            foreach (var item in n.ToList())
            {
                result += "<div class='row_items'><div class='articles-inner'><div class='articles-date'><p class='date'>";
                result += item.CreateAt.Value.ToString("dd-MM-yyyy") + "</p><p class='author'>Đăng bởi: <span class='author-name'>" + item.FullName + "</span></p>";
                result += "</div><div class='articles-image'>";
                result += "<a href='/cfashion/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>";
                result += "<img src='" + item.Image + "' alt='" + item.Title + "' /></a></div><div class='aritcles-content'>";
                result += "<div class='articles-tit'><a class='articles-name' href='/article/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>";
                result += item.Title + "</a></div><div class='articles-intro' style='max-height:110px;'>";
                result += "<p style='font-size:13px;'>" + item.Description + "</p></div>";
                result += "<a class='read-more' href='/cfashion/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>Xem thêm</a></div></div></div>";
            }

            lbNews.Text = result;
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
}