using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    clsProcess cl = new clsProcess();
    HoldingDataContext db = new HoldingDataContext();
    int currentPage = 1, recordPage = 6;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {

                if (!string.IsNullOrEmpty(Request.QueryString["id1"]))
                {
                    string Id = Request.QueryString["id1"].ToString(), title = "";
                    if (string.IsNullOrEmpty(Request.QueryString["page"]))
                        currentPage = 1;
                    else currentPage = int.Parse(Request.QueryString["page"].ToString());
                    int sId;
                    bool checkId = int.TryParse(Id, out sId);
                    if (checkId)
                    {
                        var menu_cur = from x in db.tMenus where x.Id == sId select new { x.Name, x.ParentId };
                        if (menu_cur.Count() > 0)
                        {
                            var menu_parent = (from x in db.tMenus where x.Id == menu_cur.FirstOrDefault().ParentId select new { x.Name, x.Id }).FirstOrDefault();
                            title = menu_cur.FirstOrDefault().Name;
                            lbTitle.Text = title;
                            lbParent.Text = menu_parent.Name + " / " + title;
                            hdTin.Value = title;
                            Title = title;
                            lbNews.Text = LoadNews(sId, currentPage);
                        }
                        else Response.Redirect("/home");
                    }
                    else Response.Redirect("/home");
                }
                else Response.Redirect("/home");
            }
            catch
            {
                Response.Redirect("/home");
            }
        }
    }
    string LoadNews(int menuId, int page)
    {
        string kq = "";
        var count = (from n in db.tNews where n.IsActive == true && n.MenuId == menuId select new { n.Id }).Count();
        var news = (from x in db.tNews
                    where x.IsActive == true && x.MenuId == menuId
                    orderby x.CreateAt descending
                    select new { x.Id, x.Title, x.Description, x.Image, x.CreateAt }).Skip((page - 1) * recordPage).Take(recordPage);
        foreach (var item in news.ToList())
        {
            kq += "<div class=\"col-md-4 col-sm-6\"><div class=\"post-box\"><div class=\"thumb\" style='height:320px;'><div class=\"post_featured_image thumbnail_image\">";
            kq += "<img width=\"370px\" height=\"260px\" src=\"" + item.Image.Trim() + "\" class=\"wp-post-image\" alt=\"\">";
            kq += "</div><div class=\"caption\"><a href=\"#\" class=\"link\"><i class=\"fa fa-link\" aria-hidden=\"true\"></i></a></div></div><div class=\"text-box\">";
            kq += "<h4 style='height:80px;'><a href=\"/bai-viet/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title.Trim()) + ".hcc" + "\">" + item.Title + "</a></h4>";
            kq += "<p style='height:89px;text-overflow: ellipsis;' class='description'>" + item.Description + "</p>";
            kq += "<a href=\"/bai-viet/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title.Trim()) + ".hcc" + "\" class=\"more\"><b><i class=\"fa fa-plus\" aria-hidden=\"true\"></i></b><span>Xem thêm</span></a></div></div></div>";
        }
        if (count > recordPage)
        {
            int c_page = count / recordPage; int next_page = count % recordPage == 0 ? 0 : 1;
            lbPage.Text = "<ul class=\"pagination\">";
            if (next_page > 0)
            {
                c_page++;

            }
            for (int i = 1; i <= c_page; i++)
            {
                lbPage.Text += "<li><a class=\"page-numbers\" href=\"/tin-tuc/" + menuId.ToString() + "/page-" + i.ToString() + "/" + cl.ConvertToUnSign(hdTin.Value) + ".html\">" + i.ToString() + "</a></li>";
            }
            lbPage.Text += "</ul>";
        }
        return kq;
    }
}