﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_product_feature : System.Web.UI.UserControl
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            productFeature();
    }
    public void productFeature()
    {
        clsProcess cl = new clsProcess();
        CNManagerDataContext db = new CNManagerDataContext();
        var pro = db.sp_web_cn_loadProductFeature(branchTypeId.ToString());
        string result = ""; int count = 0;
        string ref_member = getRefMember();
        foreach (var item in pro.ToList())
        {
            count++;
            if (count == 1 || count % 2 == 1)
                result += "<div class='row_items'>";

            result += "<div class='item'><div class='item-inner'><div class='images-container'>";
            if(item.NoteSale!=null && item.NoteSale!="")
                result += "<div class='label-pro-new'><span>" + item.NoteSale + "</span></div>";

            string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();
            result += "<a class='product-image' href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'><img src='" + img + "' alt='" + item.ProductName + "' /></a>";
            
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
            result += "<div class='price-box box-special'><p class='special-price'><span class='price'>" + string.Format("{0:0,0 đ}",  item.Price) + "</span></p>";
            
            result += "</div><button class='button btn-cart' type='button' onclick=\"addCart(" + item.Id.ToString() + ",'" + item.ProductName + "',1" + ",'" + item.Image + "','" + string.Format("{0:0,0}", item.Price) + "',0)\" data-toggle='tooltip' title='Thêm nhanh vào giỏ hàng'>";
            result += "<span><span>Thêm vào giỏ hàng</span></span></button>";
            result += "<div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating5'>rating</div>";
            result += "</div></div></div></div></div></div>";

            if (count % 2 == 0)
                result += "</div>";
        }
        lbFProduct.Text = result;
    }
    string getRefMember()
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["cn_mb_user_id"])))
        {
            return "ref-"+Session["cn_mb_user_id"].ToString() + "/";
        }
        else return "";
    }
}