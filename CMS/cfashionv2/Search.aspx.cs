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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["k"])))
            {
                string k =Server.UrlDecode(Request.QueryString["k"].ToString());
                
                Title = "Kết quả tìm kiếm: " + k;
                lbKey1.Text = k;
                lbKey2.Text = k;
                loadProduct(k);
            }
            else Response.Redirect("/home");
        }
    }
    private void loadProduct(string keyword)
    {
        try
        {
            string result = "";
            string ref_member = getRefMember();
            var p = db.sp_web_cf_loadProductBySearch(branchTypeId.ToString(), keyword.Trim());
            foreach (var item in p.ToList())
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

                result += "</p>";
                result += "<h2 class='product-name'><a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>" + item.ProductTypeCode + " - " + item.ProductName + "</a></h2>";
                result += "<div class='price-box box-special'>";
                result += "<p class='special-price'><span class='price'>" + (item.Price.Value == 0 ? "---" : string.Format("{0:0,0 đ}", item.Price)) + "</span></p>";

                result += "</div>";
                result += "<p class='product-des'>" + item.Description + "</p>";
                result += "<button class='button btn-cart' type='button' data-toggle='tooltip' onclick=\"addCart(" + item.Id.ToString() + ",'" + item.ProductName + "','1'" + ",'" + item.Image + "','" + string.Format("{0:0,0}", item.Price) + "',0)\" title='Thêm nhanh vào giỏ hàng'><span><span>Thêm vào giỏ hàng</span></span></button>";
                result += "<div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating2'>rating</div>";
                result += "</div></div></div></div></div></div></div></div>";
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