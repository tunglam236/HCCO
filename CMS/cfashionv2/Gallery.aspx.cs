using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gallery : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    static int recordPage = 8;
    int page = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["page"])))
            {
                if (int.TryParse(Request.QueryString["page"], out page))
                {
                    loadGallery(page);
                }
                else loadGallery(1);
            }
            else loadGallery(1);

        }
    }
    private void loadGallery(int page)
    {
        try
        {
            string result = "";
            var n = from x in db.tGalleries from y in db.tAccounts where x.BranchTypeId == branchTypeId && x.CreateBy == y.Id && x.Status == 1
                    orderby x.CreateAt descending
                    select new { x.Id, x.GalleryName, x.Description, x.Image1,x.Image2, x.CreateAt, y.FullName };
            foreach (var item in n.Skip((page - 1) * recordPage).Take(recordPage).ToList())
            {
                result += "<div class='article-layout article-list'><div class='article-item'><div class='article-item-inner row'><div class='article-image col-sm-5'>";
                result += "<a href='/lb-detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.GalleryName) + ".html'><img class=' lazy'  src='" + item.Image1 + "' alt='" + item.GalleryName + "'/></a></div>";
                result += "<div class='article-intro col-sm-7'><div class='article-name'>";
                result += "<a href='/lb-detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.GalleryName) + ".html'>" + item.GalleryName + "</a></div><p class='articledate'>";
                result += "<i class='fa fa-clock-o' aria-hidden='true'></i>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + " / Đăng bởi: " + item.FullName + "</p><div class='intro-content'>";
                result += "<p>" + item.Description + "</p>";
                result += "</div><a class='readmore-page' href='/lb-detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.GalleryName) + ".html'>Xem thêm<i class='fa fa-arrow-right' aria-hidden='true'></i></a></div></div></div></div>";
            }

            lbNews.Text = result;
            int record = n.Count();
            if (record > recordPage)
            {
                lbPage.Text += "<ul class=\"pagination pagination-large\">";
                lbPage.Text += "<li><a href='/page/lookbook/1'>«</a></li>";
                string active = ""; int p_start = 1;
                int spage = record % recordPage == 0 ? record / recordPage : (record / recordPage) + 1;

                int max_page = p_start + 4;

                if (page >= 3)
                {
                    p_start = page - 2;
                    max_page = page + 2;
                }
                if (max_page > spage) max_page = spage;

                for (int i = p_start; i <= max_page; i++)
                {
                    if (i == page)
                        active = "class='active'";
                    else active = "";
                    lbPage.Text += "<li " + active + "><a href='/page/lookbook/" + i.ToString() + "'>" + i.ToString() + "</a></li>";
                }
                lbPage.Text += "<li><a href='/page/lookbook/" + spage.ToString() + "'>»</a></li>";
                lbPage.Text += "</ul>";
            }
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
}