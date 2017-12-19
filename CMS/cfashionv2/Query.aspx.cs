using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class Query : System.Web.UI.Page
{

    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static result updateInfoMember(string name, string sex, string phone, string email, string birth)
    {
        var r = new result();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();
            clsProcess cl = new clsProcess();
            var x = from n in db.tMembers where n.BranchTypeId==branchTypeId && n.Id == int.Parse(HttpContext.Current.Session["cf_mbuser_id"].ToString()) select n;
            if (x.Count() == 1)
            {
                x.FirstOrDefault().MemberName = name.Trim();
                x.FirstOrDefault().Sex = sex.Trim() == "1" ? true : false;
                x.FirstOrDefault().Phone = phone.Trim();
                x.FirstOrDefault().Email = email.Trim();
                if (birth.Trim() != "")
                    x.FirstOrDefault().Birthday = DateTime.Parse(cl.returnDatetime(birth.Trim()));
                else x.FirstOrDefault().Birthday = null;
                db.SubmitChanges();
                r._mess = "Cập nhật thành công";
                r._content = "ok";
            }
            else
            {
                r._mess = "Không tìm thấy thông tin thành viên, vui lòng thử lại";
                r._content = "error";
            }
        }
        else
        {
            r._mess = "Hết phiên đăng nhập, vui lòng đăng nhập lại";
            r._content = "error";
        }
        return r;
    }
    [WebMethod]
    public static result changePassword(string email, string passold, string passnew)
    {
        var r = new result();
        CFManagerDataContext db = new CFManagerDataContext();
        clsProcess cl = new clsProcess();

        var check = from x in db.tMembers where x.BranchTypeId==branchTypeId && (x.Username == email.Trim().ToLower() || x.Phone==email.Trim()) && x.Password == cl.MaHoa(passold.Trim()) select x;
        if (check.Count() == 1)
        {
            try
            {
                check.FirstOrDefault().Password = cl.MaHoa(passnew);
                db.SubmitChanges();
                r._content = "ok";
                r._mess = "Thay đổi mật khẩu thành công";
            }
            catch (Exception ax)
            {
                r._content = "error";
                r._mess = ax.Message;
            }
        }
        else
        {
            r._content = "error";
            r._mess = "Thông tin đăng nhập và mật khẩu cũ không đúng, vui lòng kiểm tra lại";
        }
        return r;
    }

    [WebMethod]
    public static result resetPassword(string email)
    {
        var r = new result();
        CFManagerDataContext db = new CFManagerDataContext();
        clsProcess cl = new clsProcess();

        var check = from x in db.tMembers where x.Email == email.Trim().ToLower() select x;
        if (check.Count() == 1)
        {
            try
            {
                string pw = Guid.NewGuid().ToString("n").Substring(0, 8);
                check.FirstOrDefault().Password = cl.MaHoa(pw);
                db.SubmitChanges();
                if (cl.SendMail("Khôi phục mật khẩu", "C'nice | Khôi phục mật khẩu", email.Trim(),
                    "<p>Bạn vừa thực hiện hành động khôi phục lại mật khẩu người dùng tại C'nice." +
                    "</p><p>Email của bạn: <b>" + email.Trim().ToLower() +
                    "</b></p><p>Mật khẩu mới của bạn là: <b>" + pw + "</b></p>"))
                    r._mess = "Đã gửi lại mật khẩu mới vào mail " + email + " của bạn. Vui lòng kiểm tra hộp thư";
                else
                    r._mess = "Gửi email chưa thành công, có thể lỗi do đường truyền. Bạn vui lòng thử lại";
            }
            catch (Exception ax)
            {
                r._content = "error";
                r._mess = ax.Message;
            }
        }
        else
        {
            r._content = "error";
            r._mess = "Tài khoản và email không đúng, vui lòng kiểm tra lại";
        }
        return r;
    }
    [WebMethod]
    public static Product getProductByColorSize(string proTypeCode, string colorId, string sizeId)
    {
        var r = new Product();
        CFManagerDataContext db = new CFManagerDataContext();
        var x = db.sp_web_cf_getProductByColorSize(branchTypeId.ToString(), proTypeCode.Trim(), colorId.Trim(), sizeId.Trim()).ToList();
        if (x.Count() == 1)
        {
            r.Id = x.FirstOrDefault().Id.ToString();
            r.Image = x.FirstOrDefault().Image;
            r.ImageZoom = x.FirstOrDefault().ImageZoom;
            r.Name = x.FirstOrDefault().ProductName;
            r.BrandCode = x.FirstOrDefault().BrandCode;
            r.ProType = x.FirstOrDefault().ProductType;
            r.ProTypeCode = x.FirstOrDefault().ProductTypeCode;
            r.ColorCode = x.FirstOrDefault().ColorCode;
            r.SizeCode = x.FirstOrDefault().SizeCode;
            r.OK = "1";
        }
        else
        {
            r.OK = "0";
        }
        return r;
    }
    [WebMethod]
    public static result updateReceiverPayment(string name, string phone, string add, string countryid, string country, string districtid, string district, int type)
    {
        var r = new result();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();
            clsProcess cl = new clsProcess();
            var x = from n in db.tMembers where n.Id == int.Parse(HttpContext.Current.Session["cf_mbuser_id"].ToString()) select n;
            if (x.Count() == 1)
            {
                if (type == 1)
                {
                    x.FirstOrDefault().r_name = name.Trim();
                    x.FirstOrDefault().r_phone = phone.Trim();
                    x.FirstOrDefault().r_add = add.Trim();

                    if (countryid.Trim() != "")
                    {
                        x.FirstOrDefault().r_countryid = int.Parse(countryid.Trim());
                        x.FirstOrDefault().r_countryname = country;
                    }
                    else
                    {
                        x.FirstOrDefault().r_countryid = null;
                        x.FirstOrDefault().r_countryname = "";
                    }
                    if (districtid.Trim() != "")
                    {
                        x.FirstOrDefault().r_districtid = int.Parse(districtid.Trim());
                        x.FirstOrDefault().r_districtname = district;
                    }
                    else
                    {
                        x.FirstOrDefault().r_districtid = null;
                        x.FirstOrDefault().r_districtname = "";
                    }
                    db.SubmitChanges();
                }
                else
                {
                    x.FirstOrDefault().p_name = name.Trim();
                    x.FirstOrDefault().p_phone = phone.Trim();
                    x.FirstOrDefault().p_add = add.Trim();

                    if (countryid.Trim() != "")
                    {
                        x.FirstOrDefault().p_countryid = int.Parse(countryid.Trim());
                        x.FirstOrDefault().p_countryname = country;
                    }
                    else
                    {
                        x.FirstOrDefault().p_countryid = null;
                        x.FirstOrDefault().p_countryname = "";
                    }
                    if (districtid.Trim() != "")
                    {
                        x.FirstOrDefault().p_districtid = int.Parse(districtid.Trim());
                        x.FirstOrDefault().p_districtname = district;
                    }
                    else
                    {
                        x.FirstOrDefault().p_districtid = null;
                        x.FirstOrDefault().p_districtname = "";
                    }
                    db.SubmitChanges();
                }
                r._mess = "Cập nhật thành công";
                r._content = "ok";
            }
            else
            {
                r._mess = "Không tìm thấy thông tin thành viên, vui lòng thử lại";
                r._content = "error";
            }
        }
        else
        {
            r._mess = "Hết phiên đăng nhập, vui lòng đăng nhập lại";
            r._content = "error";
        }
        return r;
    }

    [WebMethod]
    public static member getInfoMember()
    {
        var t = new member();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();

            var item = from n in db.tMembers where n.Id == int.Parse(HttpContext.Current.Session["cf_mbuser_id"].ToString()) select n;
            if (item.Count() > 0)
            {
                t.Address = Convert.ToString(item.FirstOrDefault().Address);
                t.CountryName = Convert.ToString(item.FirstOrDefault().CountryName);
                t.DistrictName = Convert.ToString(item.FirstOrDefault().DistrictName);
                t.Country = Convert.ToString(item.FirstOrDefault().CountryId);
                t.District = Convert.ToString(item.FirstOrDefault().DistrictId);
                t.Name = item.FirstOrDefault().MemberName;
                if (item.FirstOrDefault().Birthday != null)
                    t.Birth = item.FirstOrDefault().Birthday.Value.ToString("dd/MM/yyyy");
                t.Email = Convert.ToString(item.FirstOrDefault().Email);
                if (item.FirstOrDefault().Sex != null)
                    t.Sex = item.FirstOrDefault().Sex.Value.ToString();
                t.Phone = Convert.ToString(item.FirstOrDefault().Phone);
                t.P_add = Convert.ToString(item.FirstOrDefault().p_add);
                t.P_country = item.FirstOrDefault().p_countryid.ToString();
                t.P_district = item.FirstOrDefault().p_districtid.ToString();
                t.P_name = Convert.ToString(item.FirstOrDefault().p_name);
                t.P_phone = Convert.ToString(item.FirstOrDefault().p_phone);

                t.R_add = Convert.ToString(item.FirstOrDefault().r_add);
                t.R_country = item.FirstOrDefault().r_countryid.ToString();
                t.R_district = item.FirstOrDefault().r_districtid.ToString();
                t.R_name = Convert.ToString(item.FirstOrDefault().r_name);
                t.R_phone = Convert.ToString(item.FirstOrDefault().r_phone);
                t.Status = "ok";
                t.Mess = "";
            }
            else
            {
                t.Status = "error";
                t.Mess = "Không tìm thấy dữ liệu của thành viên";
            }
        }
        else
        {
            t.Status = "error";
            t.Mess = "Phiên đăng nhập hết hạn, vui lòng đăng nhập lại";
        }
        return t;
    }

    [WebMethod]
    public static List<order_recent> getOrderRecent()
    {
        var r = new List<order_recent>();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();
            int count = 0;

            var x = db.sp_web_cf_mb_getorder_recent(HttpContext.Current.Session["cf_mbuser_id"].ToString());
            foreach (var item in x.ToList())
            {
                count++;
                var t = new order_recent();
                t.Code = item.OrderCode;
                t.Created = item.CreatedAt.Value.ToString("{0:0,0}");
                t.ID = item.Id.ToString();
                t.Status = item.Status.ToString();
                t.Total = item.Total.Value.ToString("{0:0,0}");
                t.OK = "true";
                t.Mess = "";
                r.Add(t);
            }
            if (count == 0)
            {
                r.Add(new order_recent { OK = "false", Mess = "Không có bản ghi nào" });
            }
        }
        else
        {
            r.Add(new order_recent { OK = "false", Mess = "Phiên đăng nhập hết hạn, vui lòng đăng nhập lại" });
        }
        return r;
    }

    [WebMethod]
    public static List<result> getBrand()
    {
        CFManagerDataContext db = new CFManagerDataContext();

        var r = new List<result>();
        var x = (from n in db.tBrands where n.BranchTypeId==branchTypeId && n.Status == 1 select new { n.BrandName }).Distinct();
        foreach (var item in x.ToList())
        {
            var t = new result();
            t._content = item.BrandName;
            r.Add(t);
        }
        return r;
    }
    [WebMethod]
    public static result Unorder(string idOrder)
    {
        var r = new result();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();

            var x = from n in db.tOrders where n.Status == 1 && n.MemberId == int.Parse(HttpContext.Current.Session["cf_mbuser_id"].ToString()) && n.Id == int.Parse(idOrder) select n;
            if (x.Count() == 1)
            {
                r._mess = "Đã hủy đơn hàng số #" + x.FirstOrDefault().OrderCode;
                r._content = "ok";

                x.FirstOrDefault().Status = 0;
                db.SubmitChanges();

            }
            else
            {
                r._mess = "Đơn hàng chỉ được hủy khi chưa được xác nhận. Vui lòng kiểm tra lại";
                r._content = "error";
            }
        }
        else
        {
            r._mess = "Phiên đăng nhập hết hạn, vui lòng đăng nhập lại";
            r._content = "error";
        }
        return r;
    }
    [WebMethod]
    public static List<product> mb_getproduct(string type, string from, string to, string status)
    {
        var p = new List<product>();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();
            clsProcess cl = new clsProcess();
            string userid = HttpContext.Current.Session["cf_mbuser_id"].ToString();
            int count = 0;
            var n = db.sp_web_cf_mb_getproduct(int.Parse(userid), int.Parse(type), DateTime.Parse(cl.returnDatetime(from)), DateTime.Parse(cl.returnDatetime(to)), status);
            foreach (var item in n.ToList())
            {
                count++;
                var x = new product();
                x.CustomerName = item.CustomerName;
                x.Brand = item.Brand;
                x.Code = item.ProductCode;
                x.CodeOrder = item.OrderCode;
                x.CreateAt = item.CreatedAt.Value.ToString("dd/MM/yyyy");
                x.ID = item.Id.ToString();
                x.Image = item.Image;
                if (item.MemberId != null)
                    x.MemberId = item.MemberId.ToString();
                x.Name = item.ProductName;
                x.OrderId = item.OrderId.ToString();
                x.pPrice = string.Format("{0:0,0 đ}", item.pPrice.Value);
                x.Price = string.Format("{0:0,0}", item.Price.Value);
                x.Score = item.Score.ToString();
                x.pScore = item.pScore.ToString();
                x.Quantity = item.Quantity.ToString();
                if (item.RefId != null)
                    x.RefId = item.RefId.ToString();
                x.Mess = cl.ConvertToUnSign(item.ProductName);
                x.Status = item.Status.ToString();
                x.StatusId = item.StatusId.ToString();
                x.OK = true;
                
                p.Add(x);
            }
            if (count == 0)
                p.Add(new product { OK = false, Mess = "Không có dữ liệu nào phù hợp" });
        }
        else
        {
            p.Add(new product { OK = false, Mess = "Phiên đăng nhập hết hạn, vui lòng đăng nhập lại" });
        }
        return p;
    }
    [WebMethod]
    public static List<product> mb_getproductBuy(string from, string to)
    {
        var p = new List<product>();
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
        {
            CFManagerDataContext db = new CFManagerDataContext();
            clsProcess cl = new clsProcess();
            string userid = HttpContext.Current.Session["cf_mbuser_id"].ToString();
            int count = 0;
            var n = db.sp_web_cf_mb_getproductBuy(int.Parse(userid), DateTime.Parse(cl.returnDatetime(from)), DateTime.Parse(cl.returnDatetime(to)));
            foreach (var item in n.ToList())
            {
                count++;
                var x = new product();
                x.BranchName = item.BranchName;
                x.Brand = item.Brand;
                x.Code = item.ProductCode;
                x.CodeOrder = item.OrderCode;
                x.ID = item.ProductId.ToString();
                x.CreateAt = item.CreateAt.Value.ToString("dd/MM/yyyy hh:mm:ss");
                x.Image = item.Image;
                x.Name = item.ProductName;
                x.TotalPrice = string.Format("{0:0,0 đ}", item.TotalPrice.Value);
                x.Price = string.Format("{0:0,0 đ}", item.Price.Value);
                x.pScore = item.Score.ToString();
                x.Quantity = item.Quantity.ToString();
                x.OK = true;
                x.Mess = "";
                x.Status = cl.ConvertToUnSign(item.ProductName);
                p.Add(x);
            }
            if (count == 0)
                p.Add(new product { OK = false, Mess = "Không có dữ liệu nào phù hợp" });
        }
        else
        {
            p.Add(new product { OK = false, Mess = "Phiên đăng nhập hết hạn, vui lòng đăng nhập lại" });
        }
        return p;
    }
    [WebMethod]
    public static result sendOrder(string name, string phone, string email, string countryid, string districtid, string add, string paymenttype, string note, string cname, string dname, string discountid,
        string p_name, string p_phone, string p_email, string p_add, string p_country, string p_countryname, string p_district, string p_districtname)
    {

        var r = new result();
        try
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["Cart"];
            if (cart.Rows.Count > 0)
            {
                CFManagerDataContext db = new CFManagerDataContext();
                
                var o = new tOrder();
                var top = (from k in db.tOrders orderby k.Id descending select new { k.Id }).Skip(0).Take(1);
                int stt = 0;
                if (top.Count() > 0)
                    stt = top.FirstOrDefault().Id;

                string _code = "CODE" + DateTime.Now.ToString("ddMMyy") + (stt + 1).ToString("D3");

                o.OrderCode = _code;

                string userId = "";
                if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
                    userId = HttpContext.Current.Session["cf_mbuser_id"].ToString();

                if (userId != "")
                    o.MemberId = int.Parse(userId);

                HttpCookie ck_ref = HttpContext.Current.Request.Cookies["cf_ref"];
                if (ck_ref != null && ck_ref.Value != "")
                {
                    if (userId != "")
                    {
                        if (ck_ref.Value != userId)
                            o.RefId = int.Parse(ck_ref.Value.Trim());
                    }
                    else
                        o.RefId = int.Parse(ck_ref.Value.Trim());
                }
                o.BranchTypeId = branchTypeId;
                o.CustomerName = name.Trim();
                o.Phone = phone.Trim();
                o.Email = email.Trim();
                o.CountryId = int.Parse(countryid.Trim());
                o.CountryName = cname.Trim();
                o.DistrictId = int.Parse(districtid.Trim());
                o.DistrictName = dname.Trim();
                o.Address = add.Trim();

                o.Note = note;
                o.Status = 1;
                if (discountid != "")
                    o.DiscountId = int.Parse(discountid.Trim());
                o.CreatedAt = DateTime.Now;
                o.ConfirmStatus = false;

                o.PaymentType = paymenttype == "1" ? true : false;
                o.PaymentAddress = p_add.Trim();
                if (p_country.Trim() != "")
                    o.PaymentCountryId = int.Parse(p_country.Trim());
                o.PaymentCountryName = p_countryname.Trim();
                if (p_district.Trim() != "")
                    o.PaymentDistrictId = int.Parse(p_district.Trim());

                o.PaymentDistrictName = p_districtname.Trim();
                o.PaymentEmail = p_email.Trim();
                o.PaymentName = p_name.Trim();
                o.PaymentPhone = p_phone.Trim();

                db.tOrders.InsertOnSubmit(o);
                db.SubmitChanges();

                int orderId = o.Id;

                for (int k = 0; k < cart.Rows.Count; k++)
                {
                    var p = new tOrderDetail();
                    p.OrderId = orderId;
                    p.ProductId = int.Parse(cart.Rows[k]["ID"].ToString());
                    p.Price = double.Parse(cart.Rows[k]["Price"].ToString());
                    p.Quantity = int.Parse(cart.Rows[k]["Quantity"].ToString());
                    p.Score = byte.Parse(cart.Rows[k]["Score"].ToString());
                    p.IsSale = bool.Parse(cart.Rows[k]["IsSale"].ToString());
                    db.tOrderDetails.InsertOnSubmit(p);
                }

                db.SubmitChanges();

                if (cart.Rows.Count > 0)
                    cart.Rows.Clear();

                r._mess = "Đặt hàng thành công, nhân viên C'Fashion sẽ liên hệ với bạn trong thời gian sớm nhất";
                r._content = "1";

                //send mail order
                var em = db.sp_sendmail_order("C'Fashion", _code, email.Trim());
            }
            else
            {
                r._mess = "Không có sản phẩm nào trong giỏ hàng, hãy lựa chọn sản phẩm";
                r._content = "0";
            }

        }
        catch (Exception ax)
        {
            r._mess = "Có lỗi khi gửi đơn hàng của bạn, vui lòng thử gửi lại hoặc kiểm tra lại thông tin. [" + ax.Message + "]";
            r._content = "0";
        }
        return r;
    }
    [WebMethod]
    public static bool check_logined()
    {
        if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cf_mbuser_id"])))
            return true;
        else return false;
    }
    [WebMethod]
    public static void logout()
    {
        HttpContext.Current.Session.Remove("cf_mbuser_id");
        HttpContext.Current.Session.Remove("cf_mbuser_name");
        HttpContext.Current.Session.Remove("cf_mbuser_email");
    }
    [WebMethod]
    public static result check_register(string user,string name, string email, string pw, int sex, string phone, string birth, string add, string country, string countryname, string district, string districtname)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        clsProcess cl = new clsProcess();
        var r = new result();
        try
        {
            var mb = new tMember();
            mb.Username = user.Trim();
            mb.MemberCode = "MB" + DateTime.Now.ToString("ddMMyyyyHHmmss");
            mb.MemberName = name.Trim();
            mb.Email = email.Trim().ToLower();
            mb.Password = cl.MaHoa(pw.Trim());
            mb.Sex = sex == 1 ? true : false;
            mb.Phone = phone.Trim();
            if (birth.Trim() != "")
                mb.Birthday = DateTime.Parse(cl.returnDatetime(birth.Trim()));
            mb.Address = add.Trim();
            if (country != "")
            {
                mb.CountryId = int.Parse(country.Trim());
                mb.CountryName = countryname;
            }
            if (district != "")
            {
                mb.DistrictId = int.Parse(district.Trim());
                mb.DistrictName = districtname;
            }
            mb.BranchTypeId = branchTypeId;
            mb.Status = 1;
            mb.JoinCreateAt = DateTime.Now;
            mb.CreateAt = DateTime.Now;
            db.tMembers.InsertOnSubmit(mb);
            db.SubmitChanges();
            r._mess = "Đăng kí tài khoản thành công";
            r._content = "ok";
        }
        catch (Exception ax)
        {
            r._content = "err";
            r._mess = ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static login check_login(string us, string pw)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        clsProcess cl = new clsProcess();
        var l = new login();

        var u = from x in db.tMembers
                where x.BranchTypeId==branchTypeId && x.Status == 1 && (x.Username == us.Trim().ToLower() || x.Phone==us.Trim().ToLower()) && x.Password == cl.MaHoa(pw.Trim())
                select new { x.Id, x.Email, x.MemberName,x.Username,x.Phone };
        if (u.Count() == 1)
        {
            HttpContext.Current.Session["cf_mbuser_id"] = l.ID = u.FirstOrDefault().Id.ToString();
            HttpContext.Current.Session["cf_mbuser_name"] = l.Name = u.FirstOrDefault().MemberName;
            HttpContext.Current.Session["cf_mbuser_email"] = l.Email = u.FirstOrDefault().Email;
            l.Ok = true;
            l.Mess = "Đăng nhập thành công";
        }
        else
        {
            l.Ok = false;
            l.Mess = "Thông tin đăng nhập không đúng, vui lòng kiểm tra lại";
        }
        return l;
    }
    [WebMethod]
    public static discount getDiscount(string code)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        var d = new discount();
        var c = from x in db.tDiscounts
                from y in db.tDiscountLists
                where x.BranchTypeId==branchTypeId && x.Id == y.DiscountId && y.IsUsing == false
                    && y.DiscountCode==code && (DateTime.Now - x.StartDate.Value).TotalDays >= 0
                    && (x.EndDate.Value-DateTime.Now).TotalDays>=0
                select new { y.Id, y.IsUsing, x.DiscountValue, x.DiscountType, x.OrderMinValue };
        if (c.Count() > 0)
        {
            d.ID = c.FirstOrDefault().Id;
            d.Isusing = c.FirstOrDefault().IsUsing.Value;
            d.isValue = c.FirstOrDefault().DiscountValue.Value;
            d.isType = c.FirstOrDefault().DiscountType.Value;
            d.MinOrder = c.FirstOrDefault().OrderMinValue.Value;
        }
        else
        {
            d.Isusing = true;
            d.isValue = 0;
            d.isType = 0;
            d.ID = 0;
            d.MinOrder = 0;
        }
        return d;
    }
    [WebMethod]
    public static List<country> getCountry(string type)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        var c = new List<country>();
        c.Add(new country { Id = "", Name = "Vui lòng chọn", Parent = "" });
        var x = from n in db.tCountries where n.IsActive == true && n.ParentId == int.Parse(type) select n;
        foreach (var item in x.ToList())
        {
            c.Add(new country { Id = item.Id.ToString(), Name = item.CountryName, Parent = item.ParentId != null ? item.ParentId.ToString() : "" });
        }
        return c;
    }
    [WebMethod]
    public static List<country> getCountryBranch(string countryId)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        var c = new List<country>();
        c.Add(new country { Id = "", Name = "Vui lòng chọn" });
        if (countryId == "")
        {
            var x = (from m in db.tBranches
                     where m.BranchTypeId== branchTypeId && m.Status == 1 && m.IsDisplay==true
                     select new { m.CountryId, m.CountryName }).Distinct();
            foreach (var item in x.ToList())
            {
                c.Add(new country { Id = item.CountryId.ToString(), Name = item.CountryName });
            }
        }
        else
        {
            var x = (from m in db.tBranches
                     where m.BranchTypeId == branchTypeId && m.CountryId == int.Parse(countryId) && m.Status == 1 && m.IsDisplay == true
                     select new { m.DistrictId, m.DistrictName }).Distinct();
            foreach (var item in x.ToList())
            {
                c.Add(new country { Id = item.DistrictId.ToString(), Name = item.DistrictName });
            }
        }
        return c;
    }
    [WebMethod]
    public static List<country> getBranch(string districtId)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        var c = new List<country>();
        c.Add(new country { Id = "", Name = "Vui lòng chọn" });

        var x = (from m in db.tBranches
                 where m.BranchTypeId == branchTypeId && m.DistrictId == int.Parse(districtId) && m.Status == 1
                 select new { m.Id, m.BranchName }).Distinct();
        foreach (var item in x.ToList())
        {
            c.Add(new country { Id = item.Id.ToString(), Name = item.BranchName });
        }

        return c;
    }
    [WebMethod]
    public static List<branch> getBranch2(string districtId, string branchId)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        var c = new List<branch>();


        var x = (from m in db.tBranches
                 where m.BranchTypeId == branchTypeId && m.Status == 1 && m.IsDisplay==true
                 select new { m.Id, m.BranchName, m.DistrictName, m.CountryName, m.Address, m.Time, m.Phone, m.Fax, m.Longitude, m.Latitude }).Skip(0).Take(1);

        if (branchId != "")
        {
            x = from m in db.tBranches
                where m.BranchTypeId == branchTypeId && m.Id == int.Parse(branchId) && m.Status == 1 && m.IsDisplay == true
                select new { m.Id, m.BranchName, m.DistrictName, m.CountryName, m.Address, m.Time, m.Phone, m.Fax, m.Longitude, m.Latitude };
        }
        else
        if (districtId != "")
        {
            x = from m in db.tBranches
                where m.BranchTypeId == branchTypeId && m.DistrictId == int.Parse(districtId) && m.Status == 1 && m.IsDisplay == true
                select new { m.Id, m.BranchName, m.DistrictName, m.CountryName, m.Address, m.Time, m.Phone, m.Fax, m.Longitude, m.Latitude };
            
        }

        if (x.Count() > 0)
        {
            foreach (var item in x.ToList())
            {
                var b = new branch();
                b.ID = item.Id.ToString();
                b.Name = item.BranchName;
                b.Add = item.Address;
                b.Fax = "<a target='_blank' href='http://facebook.com/cfashionvn'> http://facebook.com/cfashionvn </a>";
                b.Latitude = item.Latitude;
                b.Longitude = item.Longitude;
                b.Phone = item.Phone;
                b.Time = item.Time;
                b.CountryName = item.CountryName;
                b.DistrictName = item.DistrictName;
                c.Add(b);
            }
        }
        return c;
    }
    [WebMethod]
    public static branch getBranchDetail(string branchId)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        var c = new branch();

        var x = from m in db.tBranches
                where m.Id == int.Parse(branchId) && m.Status == 1
                select new { m.Id, m.BranchName, m.DistrictName, m.CountryName, m.Address, m.Time, m.Phone, m.Fax, m.Longitude, m.Latitude };
        if (x.Count() > 0)
        {
            c.ID = x.FirstOrDefault().Id.ToString();
            c.Name = x.FirstOrDefault().BranchName;
            c.Add = x.FirstOrDefault().Address;
            c.Fax = x.FirstOrDefault().Fax;
            c.Latitude = x.FirstOrDefault().Latitude;
            c.Longitude = x.FirstOrDefault().Longitude;
            c.Phone = x.FirstOrDefault().Phone;
            c.Time = x.FirstOrDefault().Time;
            c.CountryName = x.FirstOrDefault().CountryName;
            c.DistrictName = x.FirstOrDefault().DistrictName;
        }
        return c;
    }
    [WebMethod]
    public static result removeAllCart()
    {
        var r = new result();
        r._mess = "Đã xóa giỏ hàng";
        var cart = (ShoppingCart)HttpContext.Current.Session["Cart"];
        if (cart.Rows.Count > 0)
            cart.Rows.Clear();
        else
            r._mess = "Không có sản phẩm nào trong giỏ hàng";
        r._content = "0";
        return r;
    }
    [WebMethod]
    public static double getTotalQuantityCart()
    {
        ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["Cart"];
        if (cart.Rows.Count > 0)
            return cart.GetTotalQuantity;
        else return 0;
    }
    [WebMethod]
    public static sCart updateCurrentCart(string id, string name, string quantity)
    {
        var r = new sCart();
        try
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["Cart"];
            string idPro = id;
            if (cart.ReturnID(idPro))
            {
                if (int.Parse(quantity) <= 0)
                {
                    cart.Delete(id);
                    HttpContext.Current.Session["cart_count"] = r._total_quantity = cart.GetTotalQuantity.ToString();
                    r._total_price = cart.GetTotalPrice > 0 ? string.Format("{0:0,0}", cart.GetTotalPrice) : "0";
                    r._mess = "Đã xóa sản phẩm [" + name + "] khỏi giỏ hàng";
                }
                else
                {
                    cart.Update(idPro, double.Parse(quantity));
                    HttpContext.Current.Session["cart_count"] = r._total_quantity = cart.GetTotalQuantity.ToString();
                    r._total_price = string.Format("{0:0,0}", cart.GetTotalPrice);
                    r._price = string.Format("{0:0,0}", cart.getPrice(id) * double.Parse(quantity));
                    r._mess = "Đã cập nhật số lượng sản phẩm [" + name + "] vào giỏ hàng";
                }
            }
            else r._mess = "Không tìm thấy sản phẩm trong giỏ hàng";
        }
        catch (Exception ax)
        {
            r._mess = ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result addToCartByProductId(string id, string name, string quantity, string sale, string colorname, string sizename)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        clsProcess cl = new clsProcess();

        var r = new result();
        try
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["Cart"];
            string idPro = id;
            if (cart.ReturnID(idPro))
            {
                cart.Update(idPro, cart.GetCurrentQuantity(idPro));
                HttpContext.Current.Session["cart_count"] = r._content = cart.GetTotalQuantity.ToString();
                r._mess = "Đã cập nhật số lượng sản phẩm [" + name + "] vào giỏ hàng";
            }
            else
            {
                var pro = db.sp_web_cf_loadProductDetail(branchTypeId.ToString(), int.Parse(id.Trim())).FirstOrDefault();

                cart.AddProduct(id.ToString(), cl.ConvertToUnSign(pro.ProductName), pro.ProductCode, pro.ProductName,
                    pro.Image==null || pro.Image=="" ? "/image/image-coming-soon.png" : pro.Image, int.Parse(quantity), pro.Price.Value, 0, pro.Score != null ? pro.Score.Value : 0,
                    pro.BrandName, pro.CountryName, sale == "1" ? true : false, colorname, sizename);

                HttpContext.Current.Session["cart_count"] = r._content = cart.GetTotalQuantity.ToString();
                r._mess = "Đã thêm sản phẩm [" + name + "] vào giỏ hàng";
            }

        }
        catch (Exception ax)
        {
            r._mess = ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result addCartByProductId(string id, string name, string quantity, string sale)
    {
        CFManagerDataContext db = new CFManagerDataContext();
        clsProcess cl = new clsProcess();

        var r = new result();
        try
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["Cart"];
            string idPro = id;
            if (cart.ReturnID(idPro))
            {
                cart.Update(idPro, cart.GetCurrentQuantity(idPro));
                HttpContext.Current.Session["cart_count"] = r._content = cart.GetTotalQuantity.ToString();
                r._mess = "Đã cập nhật số lượng sản phẩm [" + name + "] vào giỏ hàng";
            }
            else
            {
                var pro = db.sp_web_cf_loadProductDetail(branchTypeId.ToString(), int.Parse(id.Trim())).FirstOrDefault();

                cart.AddProduct(id.ToString(), cl.ConvertToUnSign(pro.ProductName), pro.ProductCode, pro.ProductName,
                     pro.Image == null || pro.Image == "" ? "/image/image-coming-soon.png" : pro.Image, int.Parse(quantity), pro.Price.Value, 0, pro.Score != null ? pro.Score.Value : 0,
                    pro.BrandName, pro.CountryName, sale == "1" ? true : false, pro.ColorName, pro.SizeName);

                HttpContext.Current.Session["cart_count"] = r._content = cart.GetTotalQuantity.ToString();
                r._mess = "Đã thêm sản phẩm [" + name + "] vào giỏ hàng";
            }

        }
        catch (Exception ax)
        {
            r._mess = ax.Message;
        }
        return r;
    }
    public class sCart
    {
        private string price = "", quantity = "", total_price = "", total_quantity = "", mess = "";
        public string _price
        {
            set { price = value; }
            get { return price; }
        }
        public string _quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
        public string _total_price
        {
            set { total_price = value; }
            get { return total_price; }
        }
        public string _total_quantity
        {
            set { total_quantity = value; }
            get { return total_quantity; }
        }
        public string _mess
        {
            set { mess = value; }
            get { return mess; }
        }
    }
    public class branch
    {
        private string id = "", name = "", add = "", time = "", phone = "", fax = "", longitude = "", latitude = "", countryname = "", districtname = "";
        public string ID
        {
            set { id = value; }
            get { return id; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Add
        {
            set { add = value; }
            get { return add; }
        }
        public string CountryName
        {
            set { countryname = value; }
            get { return countryname; }
        }
        public string DistrictName
        {
            set { districtname = value; }
            get { return districtname; }
        }
        public string Phone
        {
            set { phone = value; }
            get { return phone; }
        }
        public string Fax
        {
            set { fax = value; }
            get { return fax; }
        }
        public string Longitude
        {
            set { longitude = value; }
            get { return longitude; }
        }
        public string Latitude
        {
            set { latitude = value; }
            get { return latitude; }
        }
        public string Time
        {
            set { time = value; }
            get { return time; }
        }
    }
    public class country
    {
        private string c_id = "", c_name = "", c_par = "";
        public string Id
        {
            set { c_id = value; }
            get { return c_id; }
        }
        public string Name
        {
            set { c_name = value; }
            get { return c_name; }
        }
        public string Parent
        {
            set { c_par = value; }
            get { return c_par; }
        }
    }
    public class discount
    {
        private int c_id = 0;
        private bool c_using = true;
        private byte c_type;
        private double c_value = 0;
        private double c_minorder = 0;
        public int ID
        {
            set { c_id = value; }
            get { return c_id; }
        }
        public bool Isusing
        {
            set { c_using = value; }
            get { return c_using; }
        }
        public byte isType
        {
            set { c_type = value; }
            get { return c_type; }
        }
        public double isValue
        {
            set { c_value = value; }
            get { return c_value; }
        }
        public double MinOrder
        {
            set { c_minorder = value; }
            get { return c_minorder; }
        }
    }
    public class login
    {
        private string name = "", email = "", id = "", mess = "";
        private bool status = false;
        public bool Ok
        {
            set { status = value; }
            get { return status; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Email
        {
            set { email = value; }
            get { return email; }
        }
        public string ID
        {
            set { id = value; }
            get { return id; }
        }
        public string Mess
        {
            set { mess = value; }
            get { return mess; }
        }
    }
    public class result
    {
        private string content = "", mess = "";
        public string _content
        {
            set { content = value; }
            get { return content; }
        }
        public string _mess
        {
            set { mess = value; }
            get { return mess; }
        }
    }
    public class order_recent
    {
        private string code = "", created = "", id = "", status = "", total = "", ok = "", mess = "";
        public string OK
        {
            set { ok = value; }
            get { return ok; }
        }
        public string Mess
        {
            set { mess = value; }
            get { return mess; }
        }

        public string Code
        {
            set { code = value; }
            get { return code; }
        }
        public string Created
        {
            set { created = value; }
            get { return created; }
        }
        public string ID
        {
            set { id = value; }
            get { return id; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
        }
        public string Total
        {
            set { total = value; }
            get { return total; }
        }
    }
    public class member
    {
        private string name = "", sex = "", birth = "", email = "", phone = "", add = "", countryid = "", districtid = "", country = "", district = "", status = "", mess = "";
        private string r_name = "", r_add = "", r_country = "", r_district = "", r_phone = "";
        private string p_name = "", p_add = "", p_country = "", p_district = "", p_phone = "";
        public string Mess
        {
            set { mess = value; }
            get { return mess; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
        }
        public string Address
        {
            set { add = value; }
            get { return add; }
        }
        public string Country
        {
            set { countryid = value; }
            get { return countryid; }
        }
        public string District
        {
            set { districtid = value; }
            get { return districtid; }
        }
        public string CountryName
        {
            set { country = value; }
            get { return country; }
        }
        public string DistrictName
        {
            set { district = value; }
            get { return district; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Sex
        {
            set { sex = value; }
            get { return sex; }
        }
        public string Birth
        {
            set { birth = value; }
            get { return birth; }
        }
        public string Email
        {
            set { email = value; }
            get { return email; }
        }
        public string Phone
        {
            set { phone = value; }
            get { return phone; }
        }

        public string R_name
        {
            set { r_name = value; }
            get { return r_name; }
        }
        public string R_add
        {
            set { r_add = value; }
            get { return r_add; }
        }
        public string R_country
        {
            set { r_country = value; }
            get { return r_country; }
        }
        public string R_district
        {
            set { r_district = value; }
            get { return r_district; }
        }
        public string R_phone
        {
            set { r_phone = value; }
            get { return r_phone; }
        }

        public string P_name
        {
            set { p_name = value; }
            get { return p_name; }
        }
        public string P_add
        {
            set { p_add = value; }
            get { return p_add; }
        }
        public string P_country
        {
            set { p_country = value; }
            get { return p_country; }
        }
        public string P_district
        {
            set { p_district = value; }
            get { return p_district; }
        }
        public string P_phone
        {
            set { p_phone = value; }
            get { return p_phone; }
        }
    }
    public class Product
    {
        private string id = "", image = "", imageZoom = "", name = "", protypecode = "", colorcode = "", sizecode = "", brandcode = "", protype = "";
        private string ok ="", mess = "";
        public string OK
        {
            set { ok = value; }
            get { return ok; }
        }
        public string Mess
        {
            set { mess = value; }
            get { return mess; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string Image
        {
            set { image = value; }
            get { return image; }
        }
        public string ImageZoom
        {
            set { imageZoom = value; }
            get { return imageZoom; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string ProTypeCode
        {
            set { protypecode = value; }
            get { return protypecode; }
        }
        public string ColorCode
        {
            set { colorcode = value; }
            get { return colorcode; }
        }
        public string SizeCode
        {
            set { sizecode = value; }
            get { return sizecode; }
        }
        public string BrandCode
        {
            set { brandcode = value; }
            get { return brandcode; }
        }
        public string ProType
        {
            set { protype = value; }
            get { return protype; }
        }
    }
    public class product
    {
        private string mess = "", id = "", code = "", name = "", price = "", pricesale = "", score = "", image = "", brand = "", cusname = "", branch="", total_price="",
            orderid = "", quantity = "", pscore = "", pprice = "", statusid = "", status = "", createdat = "", codeorder = "", refid = "", memberid = "";
        private bool ok = true;
        public bool OK
        {
            set { ok = value; }
            get { return ok; }
        }
        public string Mess
        {
            set { mess = value; }
            get { return mess; }
        }
        public string CustomerName
        {
            set { cusname = value; }
            get { return cusname; }
        }
        public string MemberId
        {
            set { memberid = value; }
            get { return memberid; }
        }
        public string RefId
        {
            set { refid = value; }
            get { return refid; }
        }
        public string CodeOrder
        {
            set { codeorder = value; }
            get { return codeorder; }
        }

        public string CreateAt
        {
            set { createdat = value; }
            get { return createdat; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
        }
        public string StatusId
        {
            set { statusid = value; }
            get { return statusid; }
        }

        public string pPrice
        {
            set { pprice = value; }
            get { return pprice; }
        }

        public string pScore
        {
            set { pscore = value; }
            get { return pscore; }
        }

        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }

        public string OrderId
        {
            set { orderid = value; }
            get { return orderid; }
        }
        public string Score
        {
            set { score = value; }
            get { return score; }
        }

        public string ID
        {
            set { id = value; }
            get { return id; }
        }

        public string Code
        {
            set { code = value; }
            get { return code; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
        public string PriceSale
        {
            set { pricesale = value; }
            get { return pricesale; }
        }
        public string Image
        {
            set { image = value; }
            get { return image; }
        }
        public string Brand
        {
            set { brand = value; }
            get { return brand; }
        }
        public string BranchName
        {
            set { branch = value; }
            get { return branch; }
        }
        public string TotalPrice
        {
            set { total_price = value; }
            get { return total_price; }
        }
    }
}