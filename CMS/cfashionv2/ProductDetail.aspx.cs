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
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["ref"]))
                    {
                        HttpCookie ck = new HttpCookie("cf_ref");
                        ck.Value = Request.QueryString["ref"];
                        ck.Expires = DateTime.Now.AddMonths(1);
                        Response.Cookies.Add(ck);
                    }

                    getDetailProduct(int.Parse(Request.QueryString["Id"]));
                }
                else
                    Response.Redirect("/home");
            }
            catch
            {
                Response.Redirect("/notfound");
            }
        }
    }
    public void getDetailProduct(int id)
    {
        try
        {
            var p = db.sp_web_cf_loadProductDetail(branchTypeId.ToString(), id).ToList();
            if (p.Count() > 0)
            {
                //lbProductCode.Text = p.FirstOrDefault().ProductCode;
                //lbCountryName.Text = p.FirstOrDefault().CountryName;
                hdProductTypeCode.Value = p.FirstOrDefault().ProductTypeCode;
                //lbProductCodeId.Text = p.FirstOrDefault().SKU;
                //lbBrand.Text = p.FirstOrDefault().BrandName;
                lbDescription.Text = p.FirstOrDefault().Description;
                lbInfoProduct.Text = p.FirstOrDefault().Content;
                hdColorName.Value = p.FirstOrDefault().ColorName;
                hdSizeName.Value = p.FirstOrDefault().SizeName;
                var size = p.FirstOrDefault().SizeList;
                
                if (size.Contains("#"))
                {
                    var tmp = size.Split('#');
                    var active = "";
                    for (int i = 0; i < tmp.Length-1; i++)
                    {
                        var z = tmp[i];
                        var cId = z.Split('@')[0];
                        var cName = z.Split('@')[1];

                        if (p.FirstOrDefault().SizeId == int.Parse(cId.Trim())) active = " active";
                        else active = "";

                        if (active != "")
                            lbSize.Text += "<label onclick='return setSize(\"" + cId + "\",\"" + cName + "\");' class='btn" + active + "'><input type='radio' name='size' value='" + cId + "' checked><span> " + cName + "</span></label>";
                        else
                            lbSize.Text += "<label onclick='return setSize(\"" + cId + "\",\"" + cName + "\");' class='btn" + active + "'><input type='radio' name='size' value='" + cId + "'><span> " + cName + "</span></label>";
                    }
                }
                else
                {
                    var z = size.Split('@');
                    var cId = z[0];
                    var cName = z[1];
                    lbSize.Text = "<label onclick='return setSize(\"" + cId + "\",\"" + cName + "\");' class='btn active'><input type='radio' name='size' value='" + cId + "' checked><span> " + cName + "</span></label>";
                }

                var color = p.FirstOrDefault().ColorList;
                if (color.Contains("#"))
                {
                    var tmp = color.Split('#');
                    var active = "";
                    for (int i = 0; i < tmp.Length - 1; i++)
                    {
                        var z = tmp[i];
                        var cId = z.Split('@')[0];
                        var cName = z.Split('@')[1];

                        if (p.FirstOrDefault().ColorId == int.Parse(cId.Trim())) active = " active";
                        else active = "";

                        if (active != "")
                            lbColor.Text += "<label onclick='return setColor(\"" + cId + "\",\"" + cName + "\");' class='btn" + active + "'><input type='radio' name='color' checked><span> " + cName + "</span></label>";
                        else
                            lbColor.Text += "<label onclick='return setColor(\"" + cId + "\",\"" + cName + "\");' class='btn" + active + "'><input type='radio' name='color'><span> " + cName + "</span></label>";
                    }
                }
                else
                {
                    var z = color.Split('@');
                    var cId = z[0];
                    var cName = z[1];
                    lbColor.Text = "<label onclick='return setColor(\"" + cId + "\",\"" + cName + "\");' class='btn active'><input type='radio' name='color' value='" + cId + "' checked><span> " + cName + "</span></label>";
                }
                string imgZoomFirst = (p.FirstOrDefault().ImageZoom == null || p.FirstOrDefault().ImageZoom == "") ? (p.FirstOrDefault().Image==null || p.FirstOrDefault().Image=="" ? "/image/image-coming-soon.png" : p.FirstOrDefault().Image) : p.FirstOrDefault().ImageZoom;
                if (imgZoomFirst.Contains("#"))
                {
                    imgZoomFirst = imgZoomFirst.Split('#')[0];
                }
                lbImage.Text = "<a class='thumbnail' title='" + p.FirstOrDefault().ProductName + "'><img id='img_product' src='" + imgZoomFirst + "' data-zoom-image='" + imgZoomFirst + "' title='" + p.FirstOrDefault().ProductName + "' alt='" + p.FirstOrDefault().ProductName + "' /></a>";
                Title = lbLinkProduct.Text = lbProductName.Text = hdProductName.Value = p.FirstOrDefault().ProductName + " - " + p.FirstOrDefault().ProductCode;
                liID.Text = hdProductId.Value = p.FirstOrDefault().Id.ToString();
                liProductCode.Text = p.FirstOrDefault().ProductCode;
                liImage.Text = hdImage.Value = p.FirstOrDefault().Image;
                liScore.Text = p.FirstOrDefault().Score == null ? "0" : p.FirstOrDefault().Score.ToString();
                if(p.FirstOrDefault().Price.Value >999)
                    lbPrice.Text = "<p class='special-price'><span class='price'>" + string.Format("{0:0,0 đ}", p.FirstOrDefault().Price) + "</span></p>";
                else
                    lbPrice.Text = "<p class='special-price'><span class='price'>" + (p.FirstOrDefault().Price.Value==0 ? "---" : p.FirstOrDefault().Price.ToString() + " đ") + "</span></p>";

                hdColor.Value = p.FirstOrDefault().ColorId.ToString();
                hdSize.Value = p.FirstOrDefault().SizeId.ToString();
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
                loadImageZoom((p.FirstOrDefault().ImageZoom == null || p.FirstOrDefault().ImageZoom =="") ? (p.FirstOrDefault().Image == null || p.FirstOrDefault().Image == "" ? "/image/image-coming-soon.png" : p.FirstOrDefault().Image) : p.FirstOrDefault().ImageZoom, p.FirstOrDefault().ProductName);

                loadProductRandom(id);

                HtmlMeta seo_key = new HtmlMeta();
                seo_key.Name = "keywords";
                seo_key.Content = "cfashion, thời trang, thoi trang, công sở, cong so,";
                Header.Controls.Add(seo_key);

                HtmlMeta seo_auth = new HtmlMeta();
                seo_auth.Name = "description";
                seo_auth.Content = lbDescription.Text;
                Header.Controls.Add(seo_auth);

                HtmlMeta seo_copy = new HtmlMeta();
                seo_copy.Name = "copyright";
                seo_copy.Content = "CFASHION.VN";
                Header.Controls.Add(seo_copy);

                HtmlMeta seo_des = new HtmlMeta();
                seo_des.Name = "Author";
                seo_des.Content = "CFASHION.VN";
                Header.Controls.Add(seo_des);

                HtmlMeta seo_robot = new HtmlMeta();
                seo_robot.Name = "robots";
                seo_robot.Content = "index,follow";
                Header.Controls.Add(seo_robot);

                HtmlMeta seo_url = new HtmlMeta();
                seo_url.Name = "url";
                seo_url.Content = "http://cfashion.vn/detail/" + p.FirstOrDefault().Id.ToString() + "/" + cl.ConvertToUnSign(p.FirstOrDefault().ProductName) + ".html";
                Header.Controls.Add(seo_url);

                HtmlMeta seo_iden = new HtmlMeta();
                seo_iden.Name = "identifier-URL";
                seo_iden.Content = "http://cfashion.vn";
                Header.Controls.Add(seo_iden);

                var seo_img = Convert.ToString(p.FirstOrDefault().ImageZoom);
                if (seo_img.Contains("#"))
                    seo_img = seo_img.Substring(0, seo_img.IndexOf('#'));
                HtmlMeta seo_og_img = new HtmlMeta();
                seo_og_img.Name = "og:image";
                seo_og_img.Content = seo_img.Replace("/upload/", "http://cf.hcco.vn/upload/cfashion/");
                Header.Controls.Add(seo_og_img);

                HtmlMeta seo_og_url = new HtmlMeta();
                seo_og_url.Name = "og:url";
                seo_og_url.Content = "http://cfashion.vn/detail/" + p.FirstOrDefault().Id.ToString() + "/" + cl.ConvertToUnSign(p.FirstOrDefault().ProductName) + ".html";
                Header.Controls.Add(seo_og_url);

                HtmlMeta seo_og_title = new HtmlMeta();
                seo_og_title.Name = "og:title";
                seo_og_title.Content = lbProductName.Text;
                Header.Controls.Add(seo_og_title);

                HtmlMeta seo_og_site = new HtmlMeta();
                seo_og_site.Name = "og:site_name";
                seo_og_site.Content = "CFASHION.VN";
                Header.Controls.Add(seo_og_site);

                HtmlMeta seo_fbid = new HtmlMeta();
                seo_fbid.Name = "fb:page_id";
                seo_fbid.Content = "308537856275021";
                Header.Controls.Add(seo_fbid);

                HtmlMeta seo_email = new HtmlMeta();
                seo_email.Name = "og:email";
                seo_email.Content = "info@hcco.vn";
                Header.Controls.Add(seo_email);

                HtmlMeta seo_phone = new HtmlMeta();
                seo_phone.Name = "og:phone_number";
                seo_phone.Content = "024 22 18 95 95";
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
        string result = "";
        string ref_member = getRefMember();
        var p = db.sp_web_cf_loadProductRandom(branchTypeId.ToString()).ToList();
        foreach (var item in p.ToList())
        {
            result += "<div class='row_items'><div class='item'><div class='item-inner'><div class='images-container'>";
            if (item.NoteSale != null && item.NoteSale != "")
                result += "<div class='label-pro-new'><span>" + item.NoteSale + "</span></div>";
            
            result += "<a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>";
            
            result += "<img src='" + (item.Image == null || item.Image == "" ? "/image/image-coming-soon.png" : item.Image) + "' alt='" + item.ProductName + "' title='" + item.ProductName + "' class='img-responsive' /></a>";
            
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

            result += "<div class='price-box box-regular'><span class='regular-price'><span class='price'>" + (item.Price.Value == 0 ? "---" : string.Format("{0:0,0 đ}", item.Price)) + "</span></span></div>";

            result += "<button class='button btn-cart' type='button' data-toggle='tooltip' onclick=\"addCart(" + item.Id.ToString() + ",'" + item.ProductName + "','1'" + ",'" + item.Image + "','" + string.Format("{0:0,0}",item.Price) + "',0)\" title='Thêm vào giỏ hàng'>";
            result += "<span><span>Thêm vào giỏ hàng</span></span></button><div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating5'>rating</div>";
            result += "</div></div></div></div></div></div></div>";
        }

        lbProduct.Text = result;
    }
    private void loadImageZoom(string image, string name)
    {
        string result = "";
        if (image != "" && image.Contains("#"))
        {
            var p = image.Split('#');
            var t = 0;
            foreach (var item in p)
            {
                result += "<a id='im_thumb_" + t.ToString() + "' class='thumbnail' style='display: none; padding-bottom: 5px;' href='#' ";
                result += "data-image='" + item + "' ";
                result += "data-zoom-image='" + item + "'";
                result += "title='" + name + "'><img id='iml_thumb_" + t.ToString() + "' src='" + item + "' title='" + name + "' alt='" + name + "' /></a>";
                t++;
            }
        }
        else
        {
            result += "<a id='im_thumb_0' class='thumbnail' style='display: none; padding-bottom: 5px;' href='#' ";
            result += "data-image='" + image + "' ";
            result += "data-zoom-image='" + image + "'";
            result += "title='" + name + "'><img id='iml_thumb_0' src='" + image + "' title='" + name + "' alt='" + name + "' /></a>";
        }
        lbImageZoom.Text = result;
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