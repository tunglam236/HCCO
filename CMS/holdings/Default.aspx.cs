using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    clsProcess cl = new clsProcess();
    HoldingDataContext db = new HoldingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbSlide.Text = LoadSlide();
            lbCategory.Text = LoadCategory();
            lbImage.Text = LoadImage();
            lbPersonal.Text = LoadPersonal();
            lbNews.Text = LoadNews();
            lbSlideThumd.Text = LoadSlideThumb();
            lbFeedBack.Text = LoadFeedBack();
            LoadLabel();

        }
    }
    string LoadCategory()
    {
        string kq = "", label = "", thanhvien = "";
        var ct = from x in db.tCategories where x.IsActive == true select new { x.Id, x.Image, x.Caption, x.Content, x.Icon };
        int count = 1;
        label += "<div class=\"portfolioFilter portfolioFilter600\">";

        foreach (var item in ct.ToList())
        {
            kq += "<div class=\"col-md-4 col-sm-6\" style='height: 395px;overflow: hidden;'><div class=\"services-style-1-box\">";
            kq += "<span class=\"number\">" + count.ToString("D2") + "</span>";
            kq += "<div class=\"icon-box\"><img src=\"" + item.Icon.Trim() + "\" width=\"69px\" height=\"64px\"></div><h4>" + item.Caption.Trim() + "</h4>";
            kq += "<p style='text-align:justify;font-size:13px;'>" + item.Content.Trim() + "</p>";
            kq += "</div></div>";
            count++;
            label += "<a href=\"#\" data-value=\"" + item.Id.ToString() + "\" class=\"\">" + item.Caption.Trim().ToUpper() + "</a>";

            thanhvien += "<div class='response-category wp-post-image' style=\"width:20%; padding:0px 10px; position:relative; float:left;\"><a href='#' style='text-decoration:none;'><img style='border: 8px solid white;' width=\"100%\" src=\"" + item.Image.Trim() + "\" /><div style=\"background-color: white;padding: 10px;margin-top: -25px;margin-left: 5%;width: 90%;position: relative;text-align: center;\">" + item.Caption + "</div></a></div>";
        }
        label += "</div>";
        lbCat.Text = label;
        lbThanhVien.Text = thanhvien;
        return kq;
    }
    string LoadImage()
    {
        string kq = "";
        int count = 1;
        var img = from x in db.tProducts where x.IsActive == true orderby x.CategoryId select new { x.Name, x.Image, x.Id, x.CategoryId };
        foreach (var item in img.ToList())
        {
            kq += "<div id=\"project-" + count.ToString() + "\" class=\"" + item.CategoryId.ToString() + " cp-masonary-item outer portfolio-item item alpha cp-masonary-item600\"><div class=\"thumb item\">";
            kq += "<img width=\"356\" height=\"320\" src=\"" + item.Image.Trim() + "\" class=\"wp-post-image\" alt=\"\" />";
            kq += "<div class=\"caption\"><div class=\"inner\"><div class=\"btn-row\">";
            kq += "<a href=\"" + item.Image.Trim() + "\" class=\"link\" data-rel=\"prettyPhoto[gallery1]\"><i class=\"fa fa-plus\" aria-hidden=\"true\"></i></a></div>";
            kq += "<h3><a href=\"#\">" + item.Name.Trim() + "</a></h3>";
            kq += "</div></div></div></div>";
            count++;
        }
        return kq;
    }
    string LoadPersonal()
    {
        string kq = "";
        var ps = from x in db.tPersonals where x.IsActive == true select new { x.Id, x.Name, x.Image, x.Description, x.Position };
        foreach (var item in ps.ToList())
        {
            kq += "<div class=\"col-md-6 col-sm-6\"><div class=\"outer\"><div class=\"text-col\">";
            kq += "<h3><a href=\"#\">" + item.Name + "</a></h3>";
            kq += "<em>" + item.Position + "</em><p>" + item.Description + "</p>";
            kq += "<div class=\"team-style-1-social\"><ul><li><a href=\"#\"><i class=\"fa fa-google-plus\" aria-hidden=\"true\"></i></a></li>";
            kq += "<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>";
            kq += "<li><a href=\"#\"><i class=\"fa fa-linkedin\" aria-hidden=\"true\"></i></a></li>";
            kq += "<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li></ul></div></div>";
            kq += "<div class=\"frame\"><img width=\"360\" height=\"380\" ";
            kq += "src=\"" + item.Image.Trim() + "\" class=\"attachment-360x380 size-360x380 wp-post-image\" alt=\"\" sizes=\"(max-width: 360px) 100vw, 360px\" /></div></div></div>";
        }
        return kq;
    }
    string LoadNews()
    {
        string kq = "";
        var n = (from x in db.tNews where x.IsActive == true orderby x.CreateAt descending select new { x.Id, x.Title, x.Description, x.Image, x.MenuId }).Skip(0).Take(8);
        int count = 1;
        foreach (var item in n.ToList())
        {
            if (count == 1 || count % 4 == 1)
                kq += "<div class=\"row\" style='margin-top:10px;'>";
            kq += "<div class=\"col-md-3 col-sm-3\"><div class=\"post-box\"><div class=\"thumb\" style='height:230px;'><div class=\"post_featured_image thumbnail_image\">";
            kq += "<img width=\"275px\" height=\"260px\" src=\"" + item.Image.Trim() + "\" class=\"wp-post-image\" alt=\"\" /></div>";
            kq += "<div class=\"caption\"><a href=\"#\" class=\"link\"><i class=\"fa fa-link\" aria-hidden=\"true\"></i></a></div></div><div class=\"text-box\" style='max-height:203px;'>";
            kq += "<h5><a href=\"/bai-viet/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title.Trim()) + ".hcc" + "\">" + item.Title + "</a></h5>";
            kq += "<p class=\"description\">" + item.Description + "</p>";
            //kq += "<a href=\"#\" class=\"more\"><b><i class=\"fa fa-plus\" aria-hidden=\"true\"></i></b><span>Xem thêm</span></a>";
            kq += "</div></div></div>";
            if (count % 4 == 0)
                kq += "</div>";
            count++;
        }
        return kq;
    }
    string LoadSlideThumb()
    {
        string kq = "";
        var sl = from x in db.tSlides where x.IsActive == true && x.Type == false select new { x.Image, x.Caption, x.Content };
        foreach (var item in sl.ToList())
        {
            kq += "<div class=\"item\"><div class=\"thumb\"><img width=\"642px\" height=\"380px\" src=\"" + item.Image.Trim() + "\" alt=\"Image\"></div></div>";
        }
        return kq;
    }
    string LoadSlide()
    {
        string kq = "";
        var sl = from x in db.tSlides where x.IsActive == true && x.Type == true select new { x.Image, x.Caption, x.Content, x.Style1, x.Style2 };
        foreach (var item in sl.ToList())
        {
            kq += "<div class=\"ls-slide\" data-ls=\"bgsize:cover;bgposition:50% 50%;duration:4000;transition2d:104;kenburnsscale:1.2;\">";
            kq += "<img width=\"1920\" height=\"900\" src=\"" + item.Image.Trim() + "\" class=\"ls-bg\" alt=\"\" sizes=\"(max-width: 1920px) 100vw, 1920px\">";
            kq += "<span width=\"100%\" class=\"ls-l\" style=\"text-align:center; left:50%; top:40%; line-height:120px;" + item.Style1.ToString() + "\" data-ls=\"offsetyin:100%;durationin:900;delayin:100;clipin:100% 0 0 0;durationout:400;parallax:true;parallaxlevel:5;\">";
            kq += item.Caption.Trim() + "</span>";
            kq += "<span width=\"100%\" class=\"ls-l\" style=\"text-align:center; left:50%; top:55%; line-height:120px;" + item.Style2.ToString() + "\" data-ls=\"offsetyin:-100%;durationin:900;delayin:100;clipin:0 0 100% 0;durationout:400;parallax:true;parallaxlevel:8;\">";
            kq += item.Content.Trim() + "</span></div>";
        }
        return kq;
    }
    string LoadFeedBack()
    {
        string kq = "";
        var fb = from x in db.tFeedbacks where x.IsActive == true select new { x.Content, x.Image, x.Name, x.Position };
        foreach (var item in fb.ToList())
        {
            kq += "<div class=\"item\"><div class=\"holder\"><div class=\"testi-thumb\">";
            kq += "<img width=\"243\" height=\"320\" src=\"" + item.Image.Trim() + "\" class=\"attachment-full size-full wp-post-image\" alt=\"\" sizes=\"(max-width: 243px) 100vw, 243px\" /></div>";
            kq += "<div class=\"testi-container\"><div class=\"text-col\"><b><i class=\"fa fa-quote-left\" aria-hidden=\"true\"></i></b>";
            kq += "<h3>" + item.Name + "</h3><em>" + item.Content + "</em>";
            kq += "<strong>" + item.Position + "</strong>";
            kq += "</div></div></div></div>";
        }
        return kq;
    }
    void LoadLabel()
    {
        var l = from x in db.tSettings select new { x.Code, x.Title1, x.Title2, x.Title3 };
        foreach (var item in l.ToList())
        {
            if (item.Code == "Intro")
            {
                lbIntro1.Text = item.Title1.Trim();
                lbIntro2.Text = item.Title2.Trim();
                lbIntro3.Text = item.Title3.Trim();
            }
            else if (item.Code == "Company")
            {
                lbCompany1.Text = item.Title1.Trim();
                lbCompany2.Text = item.Title2.Trim();
                lbCompany3.Text = item.Title3.Trim();
            }
            else if (item.Code == "Category")
            {
                lbCategory1.Text = item.Title1.Trim();
                lbCategory2.Text = item.Title2.Trim();
                lbCategory3.Text = item.Title3.Trim();
            }
            else if (item.Code == "Project")
            {
                lbProject1.Text = item.Title1.Trim();
                lbProject2.Text = item.Title2.Trim();
                lbProject3.Text = item.Title3.Trim();
            }
            else if (item.Code == "News")
            {
                lbNews1.Text = item.Title1.Trim();
                lbNews2.Text = item.Title2.Trim();
                lbNews3.Text = item.Title3.Trim();
            }
            else if (item.Code == "Member")
            {
                lbMember1.Text = item.Title1.Trim();
                lbMember2.Text = item.Title2.Trim();
                lbMember3.Text = item.Title3.Trim();
            }
        }
    }
}