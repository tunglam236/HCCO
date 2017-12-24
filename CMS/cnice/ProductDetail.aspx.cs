using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ProductDetail : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CNManagerDataContext db = new CNManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                try
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["ref"]))
                    {
                        HttpCookie ck = new HttpCookie("cn_ref");
                        ck.Value = Request.QueryString["ref"];
                        ck.Expires = DateTime.Now.AddMonths(1);
                        Response.Cookies.Add(ck);
                    }

                    getDetailProduct(int.Parse(Request.QueryString["Id"]));
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
    public void getDetailProduct(int id)
    {
        try
        {
            var p = db.sp_web_cn_loadProductDetail(branchTypeId.ToString(), id).ToList();
            if (p.Count() > 0)
            {
                lbProductCode.Text = p.FirstOrDefault().ProductCode;
                lbCountryName.Text = p.FirstOrDefault().CountryName;
                lbBrand.Text = p.FirstOrDefault().BrandName;
                lbDescription.Text = p.FirstOrDefault().Description;
                lbInfoProduct.Text = p.FirstOrDefault().Content;
                string img = p.FirstOrDefault().Image;
                if (img == "") img = "/image/image-coming-soon.png";
                string img_zoom = p.FirstOrDefault().ImageZoom;
                if (img_zoom == "") img_zoom = "/image/image-coming-soon.png";

                lbImage.Text = "<a class='thumbnail' title='" + p.FirstOrDefault().ProductName + "'><img src='" + img + "' data-zoom-image='" + img_zoom + "' title='" + p.FirstOrDefault().ProductName + "' alt='" + p.FirstOrDefault().ProductName + "' /></a>";
                Title = lbLinkProduct.Text = lbProductName.Text = hdProductName.Value = p.FirstOrDefault().ProductName;
                liID.Text = hdProductId.Value = p.FirstOrDefault().Id.ToString();
                liProductCode.Text = p.FirstOrDefault().ProductCode;
                liImage.Text = hdImage.Value = img;
                liScore.Text = p.FirstOrDefault().Score == null ? "0" : p.FirstOrDefault().Score.ToString();
                lbPrice.Text = "<p class='special-price'><span class='price'>" + string.Format("{0:0,0 đ}", p.FirstOrDefault().Price) + "</span></p>";

                hdSale.Value = "0";
                liPriceSale.Text = "0";
                liPrice.Text = p.FirstOrDefault().Price.ToString();
                hdPrice.Value = string.Format("{0:0,0 đ}", p.FirstOrDefault().Price);

                string tag = p.FirstOrDefault().Tag;
                if (tag != null && tag.Contains(","))
                {
                    var m = tag.Split(',');
                    for (int i = 0; i < m.Length; i++)
                    {
                        lbTag.Text += " <a href='/search/?k=" + Server.UrlEncode(m[i]) + "'>#" + m[i] + "</a>";
                    }
                }
                else lbTag.Text = "<a href='/search/?k=" + Server.UrlEncode(tag) + "'>#" + tag + "</a>";
                loadImageZoom(img_zoom, p.FirstOrDefault().ProductName);

                loadProductRandom(id);

                HtmlMeta seo_key = new HtmlMeta();
                seo_key.Name = "keywords";
                seo_key.Content = "cnice, mỹ phẩm thiên nhiên, my pham thien nhien";
                Header.Controls.Add(seo_key);

                HtmlMeta seo_auth = new HtmlMeta();
                seo_auth.Name = "description";
                seo_auth.Content = lbDescription.Text;
                Header.Controls.Add(seo_auth);

                HtmlMeta seo_copy = new HtmlMeta();
                seo_copy.Name = "copyright";
                seo_copy.Content = "CNICE.VN";
                Header.Controls.Add(seo_copy);

                HtmlMeta seo_des = new HtmlMeta();
                seo_des.Name = "Author";
                seo_des.Content = "CNICE.VN";
                Header.Controls.Add(seo_des);

                HtmlMeta seo_robot = new HtmlMeta();
                seo_robot.Name = "robots";
                seo_robot.Content = "index,follow";
                Header.Controls.Add(seo_robot);

                HtmlMeta seo_url = new HtmlMeta();
                seo_url.Name = "url";
                seo_url.Content = "http://cnice.vn/detail/" + p.FirstOrDefault().Id.ToString() + "/" + cl.ConvertToUnSign(p.FirstOrDefault().ProductName) + ".html";
                Header.Controls.Add(seo_url);

                HtmlMeta seo_iden = new HtmlMeta();
                seo_iden.Name = "identifier-URL";
                seo_iden.Content = "http://cnice.vn";
                Header.Controls.Add(seo_iden);

                var seo_img = Convert.ToString(p.FirstOrDefault().ImageZoom);
                if (seo_img.Contains("#"))
                    seo_img = seo_img.Substring(0, seo_img.IndexOf('#'));
                HtmlMeta seo_og_img = new HtmlMeta();
                seo_og_img.Name = "og:image";
                seo_og_img.Content = seo_img.Replace("/upload/", "http://cf.hcco.vn/upload/cnice/");
                Header.Controls.Add(seo_og_img);

                HtmlMeta seo_og_url = new HtmlMeta();
                seo_og_url.Name = "og:url";
                seo_og_url.Content = "http://cnice.vn/detail/" + p.FirstOrDefault().Id.ToString() + "/" + cl.ConvertToUnSign(p.FirstOrDefault().ProductName) + ".html";
                Header.Controls.Add(seo_og_url);

                HtmlMeta seo_og_title = new HtmlMeta();
                seo_og_title.Name = "og:title";
                seo_og_title.Content = lbProductName.Text;
                Header.Controls.Add(seo_og_title);

                HtmlMeta seo_og_site = new HtmlMeta();
                seo_og_site.Name = "og:site_name";
                seo_og_site.Content = "CNICE.VN";
                Header.Controls.Add(seo_og_site);

                HtmlMeta seo_fbid = new HtmlMeta();
                seo_fbid.Name = "fb:page_id";
                seo_fbid.Content = "232141077312902";
                Header.Controls.Add(seo_fbid);

                HtmlMeta seo_email = new HtmlMeta();
                seo_email.Name = "og:email";
                seo_email.Content = "info@hcco.vn";
                Header.Controls.Add(seo_email);

                HtmlMeta seo_phone = new HtmlMeta();
                seo_phone.Name = "og:phone_number";
                seo_phone.Content = "024 22 15 73 73";
                Header.Controls.Add(seo_phone);
            }
            else
                Response.Redirect("/notfound");
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    private void loadProductRandom(int id)
    {
        try
        {
            string result = "";
            string ref_member = getRefMember();
            var p = db.sp_web_cn_loadProductRandom(branchTypeId.ToString()).ToList();
            foreach (var item in p.ToList())
            {
                result += "<div class='row_items'><div class='item'><div class='item-inner'><div class='images-container'>";
                if (item.NoteSale != null && item.NoteSale != "")
                    result += "<div class='label-pro-new'><span>" + item.NoteSale + "</span></div>";

                result += "<a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>";
                string img = item.Image;
                if (img == "") img = "/image/image-coming-soon.png";
                result += "<img src='" + img + "' alt='" + item.ProductName + "' title='" + item.ProductName + "' class='img-responsive' /></a>";

                result += "</div><div class='des-container'>";
                result += "<p class='tags-product'>";
                if (item.Tag != null && item.Tag != "")
                {
                    if (item.Tag.Contains(","))
                    {
                        var t = item.Tag.Split(',');
                        foreach (var tg in t)
                        {
                            result += "<a href='/search/?k=" + Server.UrlEncode(tg) + "'>#" + tg + "</a>";
                        }
                    }
                    else
                        result += "<a href='/search/?k=" + Server.UrlEncode(item.Tag.Trim()) + "'>#" + item.Tag.Trim() + "</a>";
                }

                result += "</p>";
                result += "<h2 class='product-name' style='height:36px;'><a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>" + item.ProductName + "</a></h2>";

                result += "<div class='price-box box-regular'><span class='regular-price'><span class='price'>" + string.Format("{0:0,0 đ}", item.Price) + "</span></span></div>";

                result += "<button class='button btn-cart' type='button' data-toggle='tooltip' onclick=\"addCart(" + item.Id.ToString() + ",'" + item.ProductName + "','1'" + ",'" + img + "','" + string.Format("{0:0,0}", item.Price) + "',0)\" title='Thêm vào giỏ hàng'>";
                result += "<span><span>Thêm vào giỏ hàng</span></span></button><div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating5'>rating</div>";
                result += "</div></div></div></div></div></div></div>";
            }

            lbProduct.Text = result;
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    private void loadImageZoom(string image, string name)
    {
        string result = "";
        if (image != "" && image.Contains("#"))
        {
            var p = image.Split('#');
            foreach (var item in p)
            {
                result += "<a class='thumbnail' style='display: none; padding-bottom: 5px;' href='#' ";
                result += "data-image='" + item + "' ";
                result += "data-zoom-image='" + item + "'";
                result += "title='" + name + "'><img src='" + item + "' title='" + name + "' alt='" + name + "' /></a>";
            }
        }
        else
        {
            result += "<a class='thumbnail' style='display: none; padding-bottom: 5px;' href='#' ";
            result += "data-image='" + image + "' ";
            result += "data-zoom-image='" + image + "'";
            result += "title='" + name + "'><img src='" + image + "' title='" + name + "' alt='" + name + "' /></a>";
        }
        lbImageZoom.Text = result;
    }
    string getRefMember()
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["cn_mb_user_id"])))
        {
            return "ref-" + Session["cn_mb_user_id"].ToString() + "/";
        }
        else return "";
    }
}