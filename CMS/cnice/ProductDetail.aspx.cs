using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
                lbImage.Text = "<a class='thumbnail' title='" + p.FirstOrDefault().ProductName + "'><img src='" + p.FirstOrDefault().Image + "' data-zoom-image='" + p.FirstOrDefault().Image + "' title='" + p.FirstOrDefault().ProductName + "' alt='" + p.FirstOrDefault().ProductName + "' /></a>";
                Title = lbLinkProduct.Text = lbProductName.Text = hdProductName.Value = p.FirstOrDefault().ProductName;
                liID.Text = hdProductId.Value = p.FirstOrDefault().Id.ToString();
                liProductCode.Text = p.FirstOrDefault().ProductCode;
                liImage.Text = hdImage.Value = p.FirstOrDefault().Image;
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
                loadImageZoom(p.FirstOrDefault().ImageZoom == null ? p.FirstOrDefault().Image : p.FirstOrDefault().ImageZoom, p.FirstOrDefault().ProductName);

                loadProductRandom(id);
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

                result += "<img src='" + item.Image + "' alt='" + item.ProductName + "' title='" + item.ProductName + "' class='img-responsive' /></a>";

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
                result += "<h2 class='product-name'><a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>" + item.ProductName + "</a></h2>";

                result += "<div class='price-box box-regular'><span class='regular-price'><span class='price'>" + string.Format("{0:0,0 đ}", item.Price) + "</span></span></div>";

                result += "<button class='button btn-cart' type='button' data-toggle='tooltip' onclick=\"addCart(" + item.Id.ToString() + ",'" + item.ProductName + "','1'" + ",'" + item.Image + "','" + string.Format("{0:0,0}", item.Price) + "',0)\" title='Thêm vào giỏ hàng'>";
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