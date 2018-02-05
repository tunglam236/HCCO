using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class control_product : System.Web.UI.UserControl
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        productTab();
    }
    public void productTab()
    {
        clsProcess cl = new clsProcess();
        CFManagerDataContext db = new CFManagerDataContext();
        string result = "", content = "";
        var type = from x in db.tProductTypes where x.BranchTypeId==branchTypeId && x.ParentTypeId == null && x.Status == 1 select x;
        foreach (var item in type.ToList())
        {
            result += "<li rel='" + cl.ConvertToUnSign(item.ProductTypeName) + "'><span>" + item.ProductTypeName + "</span></li>";
            content += "<div id='" + cl.ConvertToUnSign(item.ProductTypeName) + "' class='tab_content'><div class='owl-demo-tabproduct'>";
            string ref_member = getRefMember();
            var pro = db.sp_web_cf_loadProductByType(branchTypeId.ToString(), item.Id);

            foreach (var x in pro.ToList())
            {
                content += "<div class='row_items'><div class='item'><div class='item-inner'><div class='images-container'>";
                if (x.NoteSale != null && x.NoteSale != "")
                    content += "<div class='label-pro-new'><span>" + x.NoteSale + "</span></div>";
                
                content += "<a class='product-image' href='/" + ref_member + "detail/" + x.Id.ToString() + "/" + cl.ConvertToUnSign(x.ProductName) + ".html'><div class='product-image'>";
                content += "<img src='" + (x.Image == null || x.Image == "" ? "/image/image-coming-soon.png" : x.Image) + "' alt='" + x.ProductName + "' class='img-responsive lazy imgzoom' /></div></a>";
                
                content += "</div><div class='des-container'>";
                content += "<p class='tags-product'>";
                if (x.Tag != null && x.Tag != "")
                {
                    if (x.Tag.Contains(","))
                    {
                        var t = x.Tag.Split(',');
                        foreach (var tg in t)
                        {
                            content += "<a href='/search/?k=" + Server.UrlEncode(tg) + "'>#" + tg + "</a>";
                        }
                    }
                    else
                        content += "<a href='/search/?k=" + Server.UrlEncode(x.Tag.Trim()) + "'>#" + x.Tag.Trim() + "</a>";
                }
                else
                    result += "<a href='#'></a>";

                content += "</p>";
                content += " <h2 class='product-name'>";
                content += "<a href='/" + ref_member + "detail/" + x.Id.ToString() + "/" + cl.ConvertToUnSign(x.ProductName) + ".html'>" + x.ProductTypeCode + " - " + x.ProductName + "</a></h2>";
                content += "<div class='price-box'>";
                content += "<p class='special-price'>";
                if (x.PriceSale == 0 || x.PriceSale==x.Price)
                    content += "<span class='price'>" + string.Format("{0:0,0 đ}", x.Price) + "</span>";
                else
                    content += "<span class='price'>" + string.Format("{0:0,0 đ}", x.PriceSale) + "</span><span class='price' style='font-size:12px;padding-left:5px;'><del>" + string.Format("{0:0,0 đ}", x.Price) + "</del></span>";
                content += "</p>";
                content += "</div>";
                content += "<button class='button btn-cart' type='button' onclick=\"addCart(" + x.Id.ToString() + ",'" + x.ProductName + "',1" + ",'" + x.Image + "','" + string.Format("{0:0,0}", (x.Price == x.PriceSale ? x.Price.Value : x.PriceSale.Value)) + "',0)\" data-toggle='tooltip' title='Thêm nhanh vào giỏ hàng'>";
                content += "<span>Giỏ hàng</span></button>-";
                content += "<button class='button btn-quick' type='button' data-toggle='modal' data-target='#addQuickModal' onclick=\"showAddQuick(" + x.Id.ToString() + ",'" + x.ProductName + "','" + string.Format("{0:0,0}", (x.Price == x.PriceSale ? x.Price.Value : x.PriceSale.Value)) + "'," + (x.Price == x.PriceSale ? x.Price.ToString() : x.PriceSale.ToString()) + ")\" data-toggle='tooltip' title='Thử đồ sản phẩm này'>";
                content += "<span><span>Thử đồ</span></span></button>";
                content += "<div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating5'>";
                content += "rating</div></div></div></div></div></div></div></div>";

            }
            content += "</div></div>";
        }
        lbTab.Text = result;
        lbProduct.Text = content;
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