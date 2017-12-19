using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsDetail : System.Web.UI.Page
{
    clsProcess cl = new clsProcess();
    HoldingDataContext db = new HoldingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                try
                {
                    string id = Request.QueryString["id"];
                    int sId, menuId;
                    bool checkId = int.TryParse(id, out sId);
                    if (checkId)
                    {
                        var details = from x in db.tNews where x.Id == sId select new { x.Title, x.Description, x.Body, x.CreateAt, x.ModifiedAt, x.Image, x.MenuId, x.Tag };
                        if (details != null)
                        {
                            lbTitle.Text = lbTitle2.Text = details.FirstOrDefault().Title;
                            lbBody.Text = details.FirstOrDefault().Body;
                            Title = lbTitle.Text;
                            lbImage.Text = "<img width=\"835px\" height=\"auto\" src=\"" + details.FirstOrDefault().Image.Trim() + "\" class=\"attachment-full size-full wp-post-image\" alt=\"\" sizes=\"100vw\">";
                            menuId = details.FirstOrDefault().MenuId.Value;
                            var ct = from n in db.tMenus where n.Id == menuId select new { n.Name, n.ParentId, n.Id };
                            if (ct != null)
                            {
                                if (ct.FirstOrDefault().ParentId != null)
                                {
                                    var par = from m in db.tMenus where m.Id == ct.FirstOrDefault().ParentId select new { m.Name };
                                    lbSubmenu.Text += "<li><a href=\"#\">" + par.FirstOrDefault().Name + "</a></li>";
                                }
                                lbSubmenu.Text += "<li><a href=\"/tin-tuc/" + ct.FirstOrDefault().Id.ToString() + "/" + cl.ConvertToUnSign(ct.FirstOrDefault().Name) + ".hcc" + "\">" + ct.FirstOrDefault().Name + "</a></li>";
                            }
                            var tag = details.FirstOrDefault().Tag;
                            if (tag != null && tag.Trim().Contains(","))
                            {
                                var t = details.FirstOrDefault().Tag.Split(',');
                                foreach (var t1 in t.ToList())
                                {
                                    lbTag.Text += "<a href=\"/keyword/" + cl.ConvertToUnSign(t1) + "\" rel=\"tag\">" + t1 + "</a>";
                                    lbTag2.Text += "<a href=\"/keyword/" + cl.ConvertToUnSign(t1) + "\" class=\"tag-cloud-link tag-link-14 tag-link-position-8\" style=\"font-size: 22pt;\" aria-label=\"Tags (10 items)\">" + t1 + "</a>";
                                }

                            } 
                            else
                                lbTag.Text += "<a href=\"/keyword/" + cl.ConvertToUnSign(tag) + "\" rel=\"tag\">" + tag + "</a>";
                            var news_popular = (from k in db.tNews
                                                from n in db.tAccounts
                                                where k.IsActive == true && k.Id != sId && k.MenuId == menuId && k.CreateBy == n.Id
                                                select new { k.Id, k.Title, k.CreateAt, Name = n.FullName }).Skip(0).Take(5);
                            lbNewsPopular.Text = "<ul>";
                            foreach (var v in news_popular.ToList())
                            {
                                lbNewsPopular.Text += "<li><a href=\"/bai-viet/" + v.Id.ToString() + "/" + cl.ConvertToUnSign(v.Title.Trim()) + ".hcc" + "\">" + v.Title + "</a><span>Viết bởi:<b> " + v.Name + "</b></span><span>" + v.CreateAt.Value.ToString("dd/MM/yyyy hh:mm") + "</span></li>";
                            }
                            lbNewsPopular.Text += "</ul>";

                            var news_recent = (from k in db.tNews from n in db.tAccounts where k.Id != sId && k.IsActive == true && k.CreateBy == n.Id orderby k.CreateAt descending select new { k.Id, k.Image, k.Title, k.CreateAt, Name = n.FullName }).Skip(0).Take(5);
                            lbNewsRecent.Text = "<ul>";
                            foreach (var g in news_recent.ToList())
                            {
                                lbNewsRecent.Text += "<li><div class=\"img-thumb\"> <img width=\"80\" height=\"80\" src=\"" + g.Image.Trim() + "\" class=\"wp-post-image\" alt=\"\" sizes=\"(max-width: 80px) 100vw, 80px\"></div><div class=\"text-col\">";
                                lbNewsRecent.Text += "<a href=\"/bai-viet/" + g.Id.ToString() + "/" + cl.ConvertToUnSign(g.Title.Trim()) + ".hcc" + "\">" + g.Title + "</a><span>Viết bởi:<b> " + g.Name + "</b></span><span>" + g.CreateAt.Value.ToString("dd/MM/yyyy hh:mm") + "</span></div></li>";
                            }
                            lbNewsRecent.Text += "</ul>";
                        }
                    }
                    else Response.Redirect("/home");
                }
                catch (Exception ax)
                {
                    Response.Redirect("/home");
                }
            }
        }
    }
}