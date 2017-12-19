using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_product_product_list : System.Web.UI.UserControl
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CNManagerDataContext db = new CNManagerDataContext();
    static int page = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadProduct();
        }
    }
    private void loadProduct()
    {
        string result = "";

        var p = (from x in db.tProducts where x.BranchTypeId==branchTypeId && x.Status == 1 select new { x.Id,x.ProductName,x.Image,x.Description,Price=0 }).Skip(0).Take(page);
        foreach (var x in p.ToList())
        {
            result += "<div class='product-layout product-list '>";
            result += "<div class='item'><div class='item-inner'><div class='col-image'><div class='images-container'>";
            
            result += "<div class='label-pro-new'><span>New</span></div>";
            result += "<a href='#'><img src='"+x.Image+"' alt='"+x.ProductName+"' title='"+x.ProductName+"' class='img-responsive lazy' /></a>";
            result += "<div class='actions'><ul class='add-to-links'>";
            result += "<li><a class='link-wishlist' title='Thêm vào yêu thích' data-toggle='tooltip'>";
            result += "<em>Thêm vào yêu thích</em> </a></li>";
            result += "<li><a class='link-compare' title='Compare this Product' data-toggle='tooltip'>";
            result += "<em>Compare this Product</em> </a></li></ul></div></div></div>";
            result += "<div class='col-des'><div class='des-container'>";
            result += "<p class='tags-product'><a href='#'>Keyword1</a>, <a href='#'>Keyword2</a></p><h2 class='product-name'>";
            result += "<a href='/ProductDetail.aspx?Id=" + x.Id.ToString() + "'>" + x.ProductName + "</a></h2>";
            result += "<div class='box-rating'></div><div class='price-box box-special'>";
            result += "<p class='special-price'><span class='price'>" + string.Format("{0:0,0}", x.Price) + "</span></p>";

            result += "</div><p class='product-des'>" + x.Description + "</p>";
            result += "<button class='button btn-cart' type='button' data-toggle='tooltip' title='Thêm vào giỏ hàng'>";
            result += "<span><span>Thêm vào giỏ hàng</span></span></button>";
            result += "<div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating2'>rating</div></div></div></div></div></div></div></div></div>";
        }
        
        lbProduct.Text = result;
    }
}