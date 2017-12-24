using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CNManagerDataContext db = new CNManagerDataContext();
    clsProcess cl = new clsProcess();
    static int recordPage = 15;
    int page = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                loadCategories();
                if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                    page = int.Parse(Request.QueryString["page"]);

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["parentId"])))
                {
                    var n = from k in db.tProductTypes where k.Id == int.Parse(Request.QueryString["parentId"]) select new { k.ProductTypeName };
                    if (n.Count() > 0)
                    {
                        lbSubTitle.Text = lbTitle.Text = n.FirstOrDefault().ProductTypeName.ToUpper();

                        var p = db.sp_web_cn_loadProduct(branchTypeId.ToString(), int.Parse(Request.QueryString["parentId"]), 0, "", 1);
                        var tol = new List<product>();
                        foreach (var item in p.ToList())
                        {
                            var t = new product();
                            t.Id = item.Id.ToString();
                            t.ProductName = item.ProductName;
                            t.Description = item.Description;
                            string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();
                            t.Image = img;
                            t.Price = string.Format("{0:0,0 đ}", item.Price.Value);
                            t.Tag = item.Tag;
                            tol.Add(t);
                        }
                        loadProduct(tol, page);

                    }
                    else
                        Response.Redirect("/home");
                }
                else if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                {
                    var n = from k in db.tProductTypes where k.Id == int.Parse(Request.QueryString["Id"]) select new { k.ProductTypeName };
                    if (n.Count() > 0)
                    {
                        lbSubTitle.Text = lbTitle.Text = Title = n.FirstOrDefault().ProductTypeName.ToUpper();

                        var p = db.sp_web_cn_loadProduct(branchTypeId.ToString(), 0, int.Parse(Request.QueryString["Id"]), "", 2);
                        var tol = new List<product>();
                        foreach (var item in p.ToList())
                        {
                            var t = new product();
                            t.Id = item.Id.ToString();
                            t.ProductName = item.ProductName;
                            t.Description = item.Description;
                            string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();
                            t.Image = img;
                            t.Price = string.Format("{0:0,0 đ}", item.Price.Value);
                            t.Tag = item.Tag;
                            tol.Add(t);
                        }
                        loadProduct(tol, page);

                    }
                    else Response.Redirect("/home");
                }
                else if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["brand"])))
                {
                    lbSubTitle.Text = lbTitle.Text = Title = "Thương hiệu " + Request.QueryString["brand"].ToString().ToUpper();
                    var p = db.sp_web_cn_loadProduct(branchTypeId.ToString(), 0, 0, Request.QueryString["brand"].Trim(), 3);
                    var tol = new List<product>();
                    foreach (var item in p.ToList())
                    {
                        var t = new product();
                        t.Id = item.Id.ToString();
                        t.ProductName = item.ProductName;
                        t.Description = item.Description;
                        string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();
                        t.Image = img;
                        t.Price = string.Format("{0:0,0 đ}", item.Price.Value);
                        t.Tag = item.Tag;
                        tol.Add(t);
                    }
                    loadProduct(tol, page);
                }
                else if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["from"])))
                {
                    double pFrom = double.Parse(Request.QueryString["from"].ToString());
                    double pTo = double.Parse(Request.QueryString["to"].ToString());
                    pricefrom.Value = pFrom.ToString();
                    priceto.Value = pTo.ToString();
                    lbSubTitle.Text = lbTitle.Text = Title = "Khoảng giá từ " + string.Format("{0:0,0}", pFrom) + " đến " + string.Format("{0:0,0}", pTo);

                    var p = db.sp_web_cn_loadProductByPrice(branchTypeId.ToString(), pFrom, pTo);
                    var tol = new List<product>();
                    foreach (var item in p.ToList())
                    {
                        var t = new product();
                        t.Id = item.Id.ToString();
                        t.ProductName = item.ProductName;
                        t.Description = item.Description;
                        string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();
                        t.Image = img;
                        t.Price = string.Format("{0:0,0 đ}", item.Price.Value);
                        t.Tag = item.Tag;
                        tol.Add(t);
                    }
                    loadProduct(tol, page);
                }
                else
                {
                    var p = db.sp_web_cn_loadProduct(branchTypeId.ToString(), 0, 0, "", 0);
                    var tol = new List<product>();
                    foreach (var item in p.ToList())
                    {
                        var t = new product();
                        t.Id = item.Id.ToString();
                        t.ProductName = item.ProductName;
                        t.Description = item.Description;
                        string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();
                        t.Image = img;
                        t.Price = string.Format("{0:0,0 đ}", item.Price.Value);
                        t.Tag = item.Tag;
                        tol.Add(t);
                    }
                    loadProduct(tol, page);
                    lbTitle.Text = "Sản phẩm";
                }
                loadProductRandom();
            }
            catch
            {
                Response.Redirect("/notfound");
            }
        }
    }
    private void loadProduct(List<product> p,int page)
    {
        try
        {
            string result = "";
            string ref_member = getRefMember();
            foreach (var x in p.Skip((page - 1) * recordPage).Take(recordPage).ToList())
            {
                result += "<div class='product-layout product-list '>";
                result += "<div class='item'><div class='item-inner'><div class='col-image'><div class='images-container'>";

                if (x.NoteSale != null && x.NoteSale != "")
                    result += "<div class='label-pro-new'><span>" + x.NoteSale + "</span></div>";
                result += "<a href='/" + ref_member + "detail/" + x.Id.ToString() + "/" + cl.ConvertToUnSign(x.ProductName) + ".html'><img src='" + x.Image + "' alt='" + x.ProductName + "' title='" + x.ProductName + "' class='img-responsive lazy' /></a>";

                result += "</div></div><div class='col-des'><div class='des-container'>";

                result += "<p class='tags-product'>";
                if (x.Tag != null && x.Tag != "")
                {
                    if (x.Tag.Contains(","))
                    {
                        var t = x.Tag.Split(',');
                        foreach (var tg in t)
                        {
                            result += "<a href='/search/?k=" + Server.UrlEncode(tg) + "'>#" + tg + "</a>";
                        }
                    }
                    else
                        result += "<a href='/search/?k=" + Server.UrlEncode(x.Tag.Trim()) + "'>#" + x.Tag.Trim() + "</a>";
                }

                result += "</p>";

                result += "<h2 class='product-name' style='height:36px;'><a href='/" + ref_member + "detail/" + x.Id.ToString() + "/" + cl.ConvertToUnSign(x.ProductName) + ".html'>" + x.ProductName + "</a></h2>";
                result += "<div class='box-rating'></div><div class='price-box box-special'>";
                result += "<p class='special-price'><span class='price'>" + string.Format("{0:0,0}", x.Price) + "</span></p>";

                result += "</div><p class='product-des'>" + x.Description + "</p>";
                string img = x.Image.Trim() == "" ? "/image/image-coming-soon.png" : x.Image.Trim();
                result += "<button class='button btn-cart' type='button' onclick=\"addCart(" + x.Id.ToString() + ",'" + x.ProductName + "','1'" + ",'" + img + "','" + string.Format("{0:0,0}", x.Price) + "',0)\" data-toggle='tooltip' title='Thêm nhanh vào giỏ hàng'>";
                result += "<span><span>Thêm vào giỏ hàng</span></span></button>";
                result += "<div class='box-hover'><div class='ratings'><div class='rating-box'><div class='rating5'>rating</div></div></div></div></div></div></div></div></div>";
            }

            int record = p.Count();
            if (record > recordPage)
            {
                string url = "", urlname = "";

                if (!string.IsNullOrEmpty(Request.QueryString["from"]) || !string.IsNullOrEmpty(Request.QueryString["parentId"]) || !string.IsNullOrEmpty(Request.QueryString["Id"]) || !string.IsNullOrEmpty(Request.QueryString["brand"]))
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["parentId"]))
                    {
                        url = "category"; urlname = "parentId";
                    }
                    else if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
                    {
                        url = "subcategory"; urlname = "Id";
                    }
                    else if (!string.IsNullOrEmpty(Request.QueryString["brand"]))
                    {
                        url = "brand"; urlname = "brand";
                    }
                    else if (!string.IsNullOrEmpty(Request.QueryString["from"]))
                    {
                        url = "price";
                    }
                }

                lbPage.Text += "<ul class=\"pagination pagination-large\">";

                if (url == "price")
                    lbPage.Text += "<li><a href='/page-1/price/" + Request.QueryString["from"] + "/" + Request.QueryString["to"] + "'>«</a></li>";
                else if (url != "")
                    lbPage.Text += "<li><a href='/page-1/" + url + "/" + Request.QueryString[urlname] + "/" + Request.QueryString["name"] + ".html'>«</a></li>";
                else
                    lbPage.Text += "<li><a href='/page-1/product'>«</a></li>";
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

                    if (url == "price")
                        lbPage.Text += "<li " + active + "><a href='/page-" + i.ToString() + "/price/" + Request.QueryString["from"] + "/" + Request.QueryString["to"] + "'>" + i.ToString() + "</a></li>";
                    else if (url != "")
                        lbPage.Text += "<li " + active + "><a href='/page-" + i.ToString() + "/" + url + "/" + Request.QueryString[urlname] + "/" + Request.QueryString["name"] + ".html'>" + i.ToString() + "</a></li>";
                    else
                        lbPage.Text += "<li " + active + "><a href='/page-" + i.ToString() + "/product'>" + i.ToString() + "</a></li>";
                }
                if (url == "price")
                    lbPage.Text += "<li><a href='/page-" + spage.ToString() + "/price/" + Request.QueryString["from"] + "/" + Request.QueryString["to"] + "'>»</a></li>";
                else if (url != "")
                    lbPage.Text += "<li><a href='/page-" + spage.ToString() + "/" + url + "/" + Request.QueryString[urlname] + "/" + Request.QueryString["name"] + ".html'>»</a></li>";
                else
                    lbPage.Text += "<li><a href='/page-" + spage.ToString() + "/product'>»</a></li>";

                lbPage.Text += "</ul>";

            }

            lbProduct.Text = result;
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    private void loadCategories()
    {
        try
        {
            string result = "";
            var c = from x in db.tProductTypes where x.BranchTypeId == branchTypeId && x.Status == 1 && x.ParentTypeId == null select x;
            string branchId = "";
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                branchId = Request.QueryString["Id"];
            foreach (var item in c.ToList())
            {
                result += "<a href='/category/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductTypeName) + ".html'><b>" + item.ProductTypeName + "</b></a>";

                var child = from n in db.tProductTypes where n.BranchTypeId == branchTypeId && n.Status == 1 && n.ParentTypeId == item.Id select n;
                foreach (var i in child.ToList())
                {
                    if (branchId == i.Id.ToString())
                        result += "<a href='/subcategory/" + i.Id.ToString() + "/" + cl.ConvertToUnSign(i.ProductTypeName) + ".html' style='padding-left:10px;' class='bg-active'>" + i.ProductTypeName + "</a>";
                    else
                        result += "<a href='/subcategory/" + i.Id.ToString() + "/" + cl.ConvertToUnSign(i.ProductTypeName) + ".html' style='padding-left:10px;'>" + i.ProductTypeName + "</a>";
                }
            }
            lbCategories.Text = result;
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    private void loadProductRandom()
    {
        try
        {
            string result = ""; int count = 0; bool close = true;
            string ref_member = getRefMember();
            var p = db.sp_web_cn_loadProductRandom(branchTypeId.ToString());
            foreach (var item in p.ToList())
            {
                count++;
                if (count == 1 || count % 4 == 1)
                {
                    result += "<div class='row_items'>";
                    close = false;
                }
                result += "<div class='item'><div class='item-inner'><div class='images-container'>";
                result += "<a class='product-image' href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>";
                string img = item.Image.Trim() == "" ? "/image/image-coming-soon.png" : item.Image.Trim();

                result += "<img  src='" + img + "' alt='" + item.ProductName + "' />";
                result += "</a><div class='actions'></div></div><div class='des-container'><h2 class='product-name' style='height:36px;'>";
                result += "<a href='/" + ref_member + "detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.ProductName) + ".html'>" + item.ProductName + "</a></h2>";

                result += "<div class='price-box box-regular'>";
                result += "<span class='regular-price'><span class='price'>" + string.Format("{0:0,0 đ}", item.Price) + "</span></span></div>";

                result += "<div class='ratings'><div class='rating-box'>";
                result += "<div class='rating3'>rating</div></div></div></div></div></div>";

                if (count % 4 == 0)
                {
                    result += "</div>";
                    close = true;
                }
            }
            if (count > 0 && !close)
                result += "</div>";
            lbProductRandom.Text = result;
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    public static string RemoveQueryStringByKey(string url, string key)
    {
        var uri = new Uri(url);

        var newQueryString = HttpUtility.ParseQueryString(uri.Query);

        newQueryString.Remove(key);

        string pagePathWithoutQueryString = uri.GetLeftPart(UriPartial.Path);

        return newQueryString.Count > 0
            ? String.Format("{0}?{1}", pagePathWithoutQueryString, newQueryString)
            : pagePathWithoutQueryString;
    }
    string getRefMember()
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["cn_mb_user_id"])))
        {
            return "ref-" + Session["cn_mb_user_id"].ToString() + "/";
        }
        else return "";
    }
    public class product
    {
        private string id = "", name = "", price = "",image="", tag="", des="", notesale="";
        public string Id
        {
            get { return id; }
            set { id = value; }
        }
        
        public string ProductName
        {
            get { return name; }
            set { name = value; }
        }
        public string Price
        {
            get { return price; }
            set { price = value; }
        }
        public string Image
        {
            get { return image; }
            set { image = value; }
        }
        public string Tag
        {
            get { return tag; }
            set { tag = value; }
        }
        public string Description
        {
            get { return des; }
            set { des = value; }
        }
        public string NoteSale
        {
            get { return notesale; }
            set { notesale = value; }
        }
    }
}