using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    static int recordPage = 16;
    int page = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["k"])))
            {
                string k = Server.UrlDecode(Request.QueryString["k"].ToString());

                if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                    page = int.Parse(Request.QueryString["page"]);

                Title = "Kết quả tìm kiếm: " + k;
                lbKey1.Text = k;
                lbKey2.Text = k;
                loadProduct(k, page);
            }
            else Response.Redirect("/home");
        }
    }
    private void loadProduct(string keyword, int page)
    {
        try
        {
            string result = "";
            string ref_member = getRefMember();
            var p = db.sp_web_cf_loadProductBySearch(branchTypeId.ToString(), keyword.Trim()).ToList();
            foreach (var item in p.Skip((page - 1) * recordPage).Take(recordPage).ToList())
            {
                result += "<div class='product-layout product-list '><div class='item itemi'>";
                result += "<div class='item-inner'><div class='col-image'><div class='images-container'>";
                if (item.NoteSale != null && item.NoteSale != "")
                    result += "<div class='label-pro-new'><span>" + item.NoteSale + "</span></div>";
                result += "<a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'><img src='" + (item.Image == null || item.Image == "" ? "/image/image-coming-soon.png" : item.Image) + "' alt='" + item.ProductName + "' title='" + item.ProductName + "' class='img-responsive lazy' /></a>";

                result += "</div></div><div class='col-des'><div class='des-container'>";
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
                else
                    result += "<a href='#'></a>";

                result += "</p>";
                result += "<h2 class='product-name'><a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>" + item.ProductTypeCode + " - " + item.ProductName + "</a></h2>";
                result += "<div class='price-box box-special'>";
                result += "<p class='special-price'>";
                if (item.Price == item.PriceSale)
                    result += "<span class='price'>" + string.Format("{0:0,0 đ}", item.Price) + "</span>";
                else
                    result += "<span class='price'>" + string.Format("{0:0,0 đ}", item.PriceSale) + "</span><span class='price' style='font-size:12px;padding-left:5px;'><del>" + string.Format("{0:0,0 đ}", item.Price) + "</del></span>";

                result += "</div>";
                result += "<p class='product-des'>" + item.Description + "</p>";
                result += "<button class='button btn-cart' type='button' data-toggle='tooltip' onclick=\"addCart(" + item.Id.ToString() + ",'" + item.ProductName + "','1'" + ",'" + item.Image + "','" + string.Format("{0:0,0}", (item.Price == item.PriceSale ? item.Price.Value : item.PriceSale.Value)) + "',0)\" title='Thêm nhanh vào giỏ hàng'><span><span>Giỏ hàng</span></span></button>-";
                result += "<button class='button btn-quick' type='button' data-toggle='modal' data-target='#addQuickModal' onclick=\"showAddQuick(" + item.Id.ToString() + ",'" + item.ProductName + "','" + string.Format("{0:0,0}", (item.Price == item.PriceSale ? item.Price.Value : item.PriceSale.Value)) + "'," + (item.Price == item.PriceSale ? item.Price.ToString() : item.PriceSale.ToString())  + ")\" data-toggle='tooltip' title='Thử đồ sản phẩm này'>";
                result += "<span><span>Thử đồ</span></span></button>";
                result += "<div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating2'>rating</div>";
                result += "</div></div></div></div></div></div></div></div>";
            }
            int record = p.Count();
            if (record > recordPage)
            {
                lbPage.Text += "<ul class=\"pagination pagination-large\">";

                lbPage.Text += "<li><a href='/page-1/search/?k=" + Server.UrlDecode(Request.QueryString["k"].ToString()) + "'>«</a></li>";
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

                    lbPage.Text += "<li " + active + "><a href='/page-" + i.ToString() + "/search/?k="+ Server.UrlDecode(Request.QueryString["k"].ToString()) + "'>" + i.ToString() + "</a></li>";
                }
                lbPage.Text += "<li><a href='/page-" + spage.ToString() + "/search/?k="+ Server.UrlDecode(Request.QueryString["k"].ToString()) + "'>»</a></li>";

                lbPage.Text += "</ul>";

            }

            lbProduct.Text = result;
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    string getRefMember()
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["cf_mbuser_id"])))
        {
            return "ref-" + Session["cf_mbuser_id"].ToString() + "/";
        }
        else return "";
    }
}