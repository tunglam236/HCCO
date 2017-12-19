using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;
public partial class Command : System.Web.UI.Page
{
    private static string mess_role = "Bạn không có quyền sử dụng thao tác này";
    private static string mess_session = "Hết phiên đăng nhập, hãy đăng nhập lại";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["cm_userId"])))
            Response.Redirect("/login");
    }
    [WebMethod]
    public static List<stockOutputDetail> getdetail(string id)
    {
        var li = new List<stockOutputDetail>();

        CFileManagerDataContext db = new CFileManagerDataContext();
        double total = 0;
        var d = db.sp_web_OutputStock_detail(id.Trim());
        foreach (var item in d.ToList())
        {
            var l = new stockOutputDetail();
            l.ProductCode = item.ProductCode;
            l.ProductName = item.ProductName;
            if (item.Discount != null)
                l.Discount = item.Discount.Value > 999 ? string.Format("{0:0,0}", item.Discount.Value) : item.Discount.ToString();
            else
                l.Discount = "0";
            l.DiscountPercent = item.DiscountPercent.ToString() + "%";
            l.Price = item.Price.Value > 999 ? string.Format("{0:0,0}", item.Price.Value) : item.Price.Value.ToString();
            l.Quantity = item.Quantity.ToString();

            if (item.Discount != null)
                total = (item.Price.Value * item.Quantity) - (item.Quantity * item.Discount.Value);
            else total = (item.Price.Value * item.Quantity);

            l.Total = total > 999 ? string.Format("{0:0,0}", total) : total.ToString();
            li.Add(l);
        }
        return li;
    }
    [WebMethod]
    public static List<feedback> FeedbackDetail(int stockId)
    {
        var r = new List<feedback>();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = db.sp_Feedback_loaddetail(stockId);
            foreach (var item in b.ToList())
            {
                var t = new feedback();
                t.Code = item.ProductCode;
                t.Name = item.ProductName;
                t.Material = item.Material;
                t.Compositon = item.Composition;
                t.Quantity = item.Quantity.ToString();
                r.Add(t);
            }
        }
        catch
        {

        }
        return r;
    }
    [WebMethod]
    public static result updateFeed(string id, string content)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var f = from x in db.tFeedbacks where x.Id == int.Parse(id.Trim()) select x;
            if (f.Count() > 0)
            {
                f.FirstOrDefault().Content = content.Trim();
                f.FirstOrDefault().CreateAt = DateTime.Now;
                f.FirstOrDefault().Status = true;
                f.FirstOrDefault().CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }

        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi cập nhật thông tin, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<result> loadLog()
    {
        var r = new List<result>();
        try
        {
            string ss = HttpContext.Current.Session["cm_userId"].ToString();
            if (ss != null && ss != "")
            {
                CFileManagerDataContext db = new CFileManagerDataContext();
                var b = db.sp_web_Log();
                foreach (var item in b.ToList())
                {
                    var t = new result();
                    t._content = item.Mess;
                    t._mess = item.FullName+" - "+item.gr;
                    t._id = "1";
                    r.Add(t);
                }
            }
        }
        catch
        {
            var t = new result();
            t._id = "0";
            r.Add(t);
        }
        return r;
    }
    [WebMethod]
    public static List<result> loadDiscountList(string discountId)
    {
        var r = new List<result>();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tDiscountLists
                    where x.DiscountId == int.Parse(discountId.Trim())
                    orderby x.IsUsing
                    select new { x.DiscountId, x.DiscountCode, Using = x.IsUsing.Value };
            foreach (var item in b.ToList())
            {
                var t = new result();
                t._content = item.DiscountCode;
                t._id = item.DiscountId.ToString();
                t._mess = item.Using ? "Đã sử dụng" : "Chưa sử dụng";
                r.Add(t);
            }
        }
        catch
        {
            
        }
        return r;
    }
    [WebMethod]
    public static result removeImageProduct(string type,string id, string image)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            string result = id;
            string color = result.Split('#')[0];
            string _id = result.Split('#')[1];
            var p = from x in db.tProducts where x.Color==int.Parse(color) && x.ProductTypeCode == _id.Trim() select x;
            if (p.Count() > 0)
            {
                if (type == "1")//anh nho
                {
                    foreach (var item in p.ToList())
                    {
                        var img_new = item.Image.Replace(image.Trim(), "").Replace("##", "#");
                        if (img_new.StartsWith("#")) img_new = img_new.Substring(1);
                        if (img_new.EndsWith("#")) img_new = img_new.Substring(0, img_new.Length - 1);
                        item.Image = img_new;
                    }
                }
                else//anh to
                {
                    foreach (var item in p.ToList())
                    {
                        var img_new = item.ImageZoom.Replace(image.Trim(), "").Replace("##", "#");
                        if (img_new.StartsWith("#")) img_new = img_new.Substring(1);
                        if (img_new.EndsWith("#")) img_new = img_new.Substring(0, img_new.Length - 1);
                        item.ImageZoom = img_new;
                    }
                }
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin sản phẩm, hãy thử lại";
            }
            
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa hình ảnh sản phẩm, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<result> loadProductType(string branchType)
    {
        var r = new List<result>();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tProductTypes
                    where x.BranchTypeId == int.Parse(branchType.Trim()) && x.Status != 0 && x.ParentTypeId == null
                    select new { x.Id, Name = x.ProductTypeCode + " | " + x.ProductTypeName };
            foreach (var item in b.ToList())
            {
                var t = new result();
                t._content = item.Id.ToString();
                t._mess = item.Name;
                t._id = "1";
                r.Add(t);
            }
        }
        catch (Exception ax)
        {
            var t = new result();
            t._id = "0";
            t._content = ax.Message;
            r.Add(t);
        }
        return r;
    }
    
    [WebMethod]
    public static List<result> loadProductTypeCode(string branchType)
    {
        var r = new List<result>();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = db.sp_web_cf_loadProductTypeCode(branchType.Trim()).ToList();
            foreach (var item in b.ToList())
            {
                var t = new result();
                t._content = item.Code;
                t._mess = item.Id.ToString() + " | " + item.Code;
                t._id = "1";
                r.Add(t);
            }
        }
        catch (Exception ax)
        {
            var t = new result();
            t._id = "0";
            t._content = ax.Message;
            r.Add(t);
        }
        return r;
    }
    [WebMethod]
    public static result insertBranchType(string code, string name, string web, string face, string instagram, string note)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = new tBranchType();
            b.Code = code.Trim();
            b.Name = name.Trim();
            b.Website = web.Trim();
            b.Facebook = face.Trim();
            b.Instagram = instagram.Trim();
            b.Description = note.Trim();
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tBranchTypes.InsertOnSubmit(b);
            db.SubmitChanges();

            r._mess = HttpContext.Current.Session["cm_fullname"].ToString();
            r._content = "1";
            r._id = b.Id.ToString();
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu chuỗi, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateBranchType(string id,string code, string name, string web,string face, string instagram, string note)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tBranchTypes where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Code = code.Trim();
                b.FirstOrDefault().Name = name.Trim();
                b.FirstOrDefault().Website = web.Trim();
                b.FirstOrDefault().Facebook = face.Trim();
                b.FirstOrDefault().Instagram = instagram.Trim();
                b.FirstOrDefault().Description = note.Trim();
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                r._mess = HttpContext.Current.Session["cm_fullname"].ToString();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin chuỗi, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu chuỗi, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteBranchType(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tBranchTypes where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin chuỗi, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa chuỗi, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<Dashboard> loadDashboard(string branchType,string fromdate, string todate)
    {
        var r = new List<Dashboard>();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();

            var b = db.sp_web_dashboard_total(branchType, cl.returnDatetime(fromdate.Trim()), cl.returnDatetime(todate.Trim()));
            foreach (var item in b.ToList())
            {
                var t = new Dashboard();
                t.Count = item.sCount.ToString();
                t.Id = item.BranchTypeId.ToString();
                t.Name = item.BranchTypeName;
                t.num_count = item.sCount.Value;
                t.num_quantity = item.Quantity.Value;
                t.num_total = item.TotalPrice.Value;
                t.Quantity = item.Quantity.Value > 999 ? string.Format("{0:0,0}", item.Quantity.Value) : item.Quantity.ToString();
                t.TotalPrice = item.TotalPrice.Value > 999 ? string.Format("{0:0,0}", item.TotalPrice.Value) : item.TotalPrice.ToString();
                r.Add(t);
            }
        }
        catch (Exception ax)
        {

        }
        return r;
    }
    [WebMethod]
    public static result updateTimeReport(string Id, string hour)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var h = from x in db.tSendMails where x.Id == int.Parse(Id.Trim()) select x;
            if (h.Count() > 0)
            {
                h.FirstOrDefault().TimeSend = hour.Trim();
                db.SubmitChanges();
                r._content = "1";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu thông tin, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result removeTimeReport(string Id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var h = from x in db.tSendMails where x.Id == int.Parse(Id.Trim()) select x;
            if (h.Count() > 0)
            {
                db.tSendMails.DeleteAllOnSubmit(h);
                db.SubmitChanges();
                r._content = "1";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa thông tin, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertDiscount(string branchType, string name, string type, string number, string values, string fromdate,string todate, string minorder)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();
            var d = new tDiscount();
            d.BranchTypeId = int.Parse(branchType.Trim());
            d.DiscountName = name.Trim();
            d.DiscountType = byte.Parse(type.Trim());
            d.DiscountNumber = int.Parse(number.Trim().Replace(",",""));
            d.DiscountValue = double.Parse(values.Trim().Replace(",", ""));
            d.StartDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));

            if (todate.Trim()!="")
                d.EndDate= DateTime.Parse(cl.returnDatetime(todate.Trim()));

            d.OrderMinValue = double.Parse(minorder.Trim().Replace(",", ""));
            d.Status = 1;
            d.CreateAt = DateTime.Now;
            d.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tDiscounts.InsertOnSubmit(d);
            db.SubmitChanges();

            string gencode = genDiscountCode(d.Id.ToString(), int.Parse(number.Trim()));
            r._content = "1";
            r._mess = gencode;
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu thông tin, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateDiscount(string id,string branchType, string name, string type, string number, string values, string fromdate, string todate, string minorder)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();
            var d = from x in db.tDiscounts where x.Id == int.Parse(id.Trim()) select x;
            if (d.Count() > 0)
            {
                if (int.Parse(number.Trim().Replace(",", "")) < d.FirstOrDefault().DiscountNumber.Value)
                {
                    r._content = "0";
                    r._mess = "Số lượng mã Voucher không được nhỏ hơn số lượng cũ";
                }
                else
                {
                    d.FirstOrDefault().BranchTypeId = int.Parse(branchType.Trim());
                    d.FirstOrDefault().DiscountName = name.Trim();
                    d.FirstOrDefault().DiscountType = byte.Parse(type.Trim());
                    d.FirstOrDefault().DiscountNumber = int.Parse(number.Trim().Replace(",", ""));
                    d.FirstOrDefault().DiscountValue = double.Parse(values.Trim().Replace(",", ""));
                    d.FirstOrDefault().StartDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));

                    if (todate.Trim() != "")
                        d.FirstOrDefault().EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
                    else d.FirstOrDefault().EndDate = null;

                    d.FirstOrDefault().OrderMinValue = double.Parse(minorder.Trim().Replace(",", ""));
                    d.FirstOrDefault().ModifiedAt = DateTime.Now;
                    d.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                    db.SubmitChanges();

                    string gencode = genDiscountCode(id.Trim(), int.Parse(number.Trim()));
                    r._content = "1";
                    r._mess = gencode;
                }
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin Voucher, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu thông tin, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static Discount getDiscount(string id)
    {
        var a = new Discount();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tDiscounts where x.Id == int.Parse(id.Trim()) select x;
        if (d.Count() > 0)
        {
            a.BranchType = d.FirstOrDefault().BranchTypeId.ToString();
            a.Name = d.FirstOrDefault().DiscountName;
            a.Type = d.FirstOrDefault().DiscountType.ToString();
            a.Number = d.FirstOrDefault().DiscountNumber.ToString();
            a.FromDate = d.FirstOrDefault().StartDate.Value.ToString("dd/MM/yyyy");
            if (d.FirstOrDefault().EndDate != null)
                a.ToDate = d.FirstOrDefault().EndDate.Value.ToString("dd/MM/yyyy");
            else a.ToDate = "";
            a.Value = d.FirstOrDefault().DiscountValue.Value > 999 ? string.Format("{0:0,0}", d.FirstOrDefault().DiscountValue.Value) : d.FirstOrDefault().DiscountValue.ToString();
            a.MinOrder = d.FirstOrDefault().OrderMinValue.Value > 999 ? string.Format("{0:0,0}", d.FirstOrDefault().OrderMinValue.Value) : d.FirstOrDefault().OrderMinValue.ToString();
            a.OK = "1";
        }
        else
        {
            a.Mess = "Không tìm thấy thông tin Voucher, hãy thử lại";
            a.OK = "0";
        }
        return a;
    }
    [WebMethod]
    public static string genDiscountCode(string idDiscount, int numbers)
    {
        var r = "";

        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        int count = 0, coded = 0;


        count = numbers;

        var c = from y in db.tDiscountLists where y.DiscountId == int.Parse(idDiscount.Trim()) select y;
        int diff = count - c.Count();

        var code_arr = (from k in db.tDiscountLists select new { k.DiscountCode }).ToList();
        var list = new List<string>();
        for (int i = 0; i < diff; i++)
        {
            string dis_code = Convert.ToBase64String(Guid.NewGuid().ToByteArray()).Substring(0, 8).Replace("+", "0").Replace("/", "0");
            if (code_arr.Exists(x => x.DiscountCode == dis_code) || list.Contains(dis_code))
            {
                diff++;
            }
            else
            {
                coded++;
                list.Add(dis_code);
                var code = new tDiscountList();
                code.DiscountId = int.Parse(idDiscount.Trim());
                code.DiscountCode = dis_code;
                code.IsUsing = false;
                db.tDiscountLists.InsertOnSubmit(code);
            }
        }
        db.SubmitChanges();
        r = "Đã tạo (" + coded.ToString() + " mã)";

        return r;
    }
    [WebMethod]
    public static Menu getMenuDetail(string Menuid)
    {
        var p = new Menu();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tMenus where x.Id == int.Parse(Menuid.Trim()) select x;
        if (d.Count() > 0)
        {
            p.Id = d.FirstOrDefault().Id.ToString();
            p.BranchType = d.FirstOrDefault().BranchTypeId.ToString();
            p.Code = d.FirstOrDefault().Code;
            p.Name = d.FirstOrDefault().Name;
            p.Parent = d.FirstOrDefault().ParentId.ToString();
            p.Link = d.FirstOrDefault().Link;
            p.Status = d.FirstOrDefault().Status.ToString();
            p.Position = d.FirstOrDefault().Position.ToString();
            p.OK = "1";
        }
        else
        {
            p.Mess = "Không tìm thấy thông tin menu, hãy thử lại";
            p.OK = "0";
        }
        return p;
    }
    [WebMethod]
    public static result getArticleProduct(string id)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tProducts where x.Id == int.Parse(id.Trim()) select new { x.Content};
        if (d.Count() > 0)
        {
            r._content = d.FirstOrDefault().Content;
        }
        return r;
    }
    [WebMethod]
    public static product getProductDetail(string id)
    {
        var p = new product();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tProducts where x.Id == int.Parse(id.Trim()) select x;
        if (d.Count() > 0)
        {
            
            p.BranchType = d.FirstOrDefault().BranchTypeId.ToString();
            p.Supplier = d.FirstOrDefault().SupplierId.ToString();
            if (d.FirstOrDefault().ParentProductTypeId.ToString() == "")
                p.ProType = d.FirstOrDefault().ProductTypeId.ToString() + ",0";
            else
                p.ProType = d.FirstOrDefault().ProductTypeId.ToString() + "," + d.FirstOrDefault().ParentProductTypeId.ToString();
            p.CodeId = d.FirstOrDefault().CodeId;
            p.ProCode = d.FirstOrDefault().ProductCode;
            p.ProName = d.FirstOrDefault().ProductName;
            p.ProTypeCode = d.FirstOrDefault().ProductTypeCode;
            p.Description = d.FirstOrDefault().Description;
            p.Brand = d.FirstOrDefault().BrandId.ToString();
            p.Color = d.FirstOrDefault().Color.ToString();
            p.Size = d.FirstOrDefault().Size.ToString();
            p.Composition = d.FirstOrDefault().Composition;
            p.Material = d.FirstOrDefault().Material;
            p.Note = d.FirstOrDefault().Note;
            p.NoteSale = d.FirstOrDefault().NoteSale;
            p.Tag = d.FirstOrDefault().Tag;
            p.Year = d.FirstOrDefault().YearId.ToString();
            p.CountryId = d.FirstOrDefault().CountryId.ToString();
            p.Unit = Convert.ToString(d.FirstOrDefault().UnitId);
            p.Capacity = d.FirstOrDefault().CapacityName;
            if (d.FirstOrDefault().ExpiryDate != null)
                p.ExpiryDate = d.FirstOrDefault().ExpiryDate.Value.ToString("dd/MM/yyyy");
            else
                p.ExpiryDate = "";
            p.Catalog = Convert.ToString(d.FirstOrDefault().Catalog);
            p.Status = d.FirstOrDefault().Status.ToString();
            //p.Content = d.FirstOrDefault().Content;
            p.Ok = "1";
        }
        else
        {
            p.Mess = "Không tìm thấy thông tin sản phẩm, hãy thử lại";
            p.Ok = "0";
        }
        return p;
    }
    [WebMethod]
    public static News getNewDetail(string id)
    {
        var p = new News();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tNews where x.Id == int.Parse(id.Trim()) select x;
        if (d.Count() > 0)
        {
            p.BranchType = d.FirstOrDefault().BranchTypeId.ToString();
            p.Title = d.FirstOrDefault().Title;
            p.Description = d.FirstOrDefault().Description;
            p.Body = d.FirstOrDefault().Body;
            p.Type = d.FirstOrDefault().Type.ToString();
            p.Tag = d.FirstOrDefault().Tag;
            p.Status = d.FirstOrDefault().Status.ToString();
            p.OK = "1";
        }
        else
        {
            p.Mess = "Không tìm thấy thông tin bài viết, hãy thử lại";
            p.OK = "0";
        }
        return p;
    }
    [WebMethod]
    public static Account getDetailUser(string id)
    {
        var a = new Account();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tAccounts where x.Id == int.Parse(id.Trim()) select x;
        if (d.Count() > 0)
        {
            a.Username = d.FirstOrDefault().Username;
            a.FullName = d.FirstOrDefault().FullName;
            a.Sex = d.FirstOrDefault().Sex ? "1" : "0";
            a.Birthday = d.FirstOrDefault().Birthday != null ? d.FirstOrDefault().Birthday.Value.ToString("dd/MM/yyyy") : "";
            a.Email = d.FirstOrDefault().Email;
            a.Phone = d.FirstOrDefault().Phone;
            a.Address = d.FirstOrDefault().Address;
            a.GroupUserId = d.FirstOrDefault().GroupUserId.ToString();
            a.BranchTypeId = d.FirstOrDefault().BranchTypeId.ToString();
            a.BranchId = d.FirstOrDefault().BranchId.ToString();
            a.Note = d.FirstOrDefault().Note;
            a.Status = d.FirstOrDefault().Status.ToString();
            a.OK = "1";
        }
        else
        {
            a.Mess = "Không tìm thấy thông tin tài khoản, hãy thử lại";
            a.OK = "0";
        }
        return a;
    }
    [WebMethod]
    public static result updateColor(string id, string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tColors where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().ColorCode = code.Trim();
                b.FirstOrDefault().ColorName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin màu sắc, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu màu sắc, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertColor(string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tColor();
            b.ColorCode = code.Trim();
            b.ColorName = name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tColors.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu màu sắc, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteColor(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tColors where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin màu sắc, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa màu sắc, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateFunction(string id, string code, string name, string parent,string link,string menu , string sort,string icon, string role)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tRoles where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().ModuleCode = code.Trim();
                b.FirstOrDefault().ModuleName = name.Trim();
                if (parent.Trim() != "")
                    b.FirstOrDefault().ParentId = int.Parse(parent.Trim());
                else
                    b.FirstOrDefault().ParentId = null;
                b.FirstOrDefault().Link = link.Trim();
                b.FirstOrDefault().Position =byte.Parse(menu.Trim());
                b.FirstOrDefault().Sort = double.Parse(sort.Trim());
                b.FirstOrDefault().Icon = icon.Trim();
                b.FirstOrDefault().IsFunction = role.Trim() == "1";
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin chức năng, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu chức năng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertFunction(string code, string name, string parent, string link, string menu, string sort, string icon, string role)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tRole();
            b.ModuleCode = code.Trim();
            b.ModuleName = name.Trim();
            if (parent.Trim() != "")
                b.ParentId = int.Parse(parent.Trim());
            
            b.Link = link.Trim();
            b.Position = byte.Parse(menu.Trim());
            b.Sort = sort.Trim() == "" ? 0 : double.Parse(sort.Trim());
            b.Icon = icon.Trim();
            b.IsFunction = role.Trim() == "1";
            b.Status = 1;
            db.tRoles.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu chức năng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteFunction(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tRoles where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                db.tRoles.DeleteAllOnSubmit(b);
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin chức năng, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa chức năng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateCapacity(string id, string branchTypeId, string code, string name,string note)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tCapacities where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().CapacityCode = code.Trim();
                b.FirstOrDefault().CapacityName = name.Trim();
                b.FirstOrDefault().Note = note.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin dung tích, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu dung tích, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertCapacity(string branchTypeId, string code, string name,string note)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tCapacity();
            b.CapacityCode = code.Trim();
            b.CapacityName = name.Trim();
            b.Note = note.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tCapacities.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu dung tích, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteCapacity(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tCapacities where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin dung tích, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa dung tích, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateUnit(string id, string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tUnits where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().UnitCode = code.Trim();
                b.FirstOrDefault().UnitName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin đơn vị tính, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu đơn vị tính, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertUnit(string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tUnit();
            b.UnitCode = code.Trim();
            b.UnitName = name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tUnits.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu đơn vị tính, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteUnit(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tUnits where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin đơn vị tính, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa đơn vị tính, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateBrand(string id, string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tBrands where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().BrandCode = code.Trim();
                b.FirstOrDefault().BrandName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin thương hiệu, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu thương hiệu, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertBrand(string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tBrand();
            b.BrandCode = code.Trim();
            b.BrandName = name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tBrands.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu thương hiệu, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteBrand(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tBrands where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy= int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin thương hiệu, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa thương hiệu, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateSize(string id, string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tSizes where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().SizeCode = code.Trim();
                b.FirstOrDefault().SizeName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin size, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu size, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertSize(string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tSize();
            b.SizeCode = code.Trim();
            b.SizeName = name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tSizes.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu size, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteSize(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tSizes where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin size, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa size, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateGroupUser(string id, string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tGroupUsers where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().GroupCode = code.Trim();
                b.FirstOrDefault().GroupName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin nhóm người dùng, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu nhóm người dùng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertGroupUser(string branchTypeId, string code, string name)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tGroupUser();
            b.GroupCode = code.Trim();
            b.GroupName = name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tGroupUsers.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu nhóm người dùng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteGroupUser(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tGroupUsers where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin nhóm người dùng, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa nhóm người dùng, chi tiết: " + ax.Message;
        }
        return r;
    }

    [WebMethod]
    public static result updateProductType(string id, string branchTypeId, string code, string name,string parent)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tProductTypes where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().ProductTypeCode = code.Trim();
                b.FirstOrDefault().ProductTypeName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                if (parent.Trim() != "")
                    b.FirstOrDefault().ParentTypeId = int.Parse(parent.Trim());
                else
                    b.FirstOrDefault().ParentTypeId = null;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin nhóm sản phẩm, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu nhóm sản phẩm, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertProductType(string branchTypeId, string code, string name,string parent)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = new tProductType();
            b.ProductTypeCode = code.Trim();
            b.ProductTypeName= name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            if(parent.Trim()!="")
                b.ParentTypeId = int.Parse(parent.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Status = 1;
            db.tProductTypes.InsertOnSubmit(b);
            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu nhóm sản phẩm, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteProductType(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var b = from x in db.tProductTypes where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin nhóm sản phẩm, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa màu sắc, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertPersonal(string branchTypeId, string branchId, string code, string name,string sex, string birthday, string phone, string email, string add, string note, string status)
    {
        var r = new result();
        try
        {
            //CFileManagerDataContext db = new CFileManagerDataContext();
            //clsProcess cl = new clsProcess();
            //var b = new tPersonnel();
            //b.Code = code.Trim();
            //b.Name = name.Trim();
            //b.BranchId = int.Parse(branchId.Trim());
            //b.BranchTypeId = int.Parse(branchTypeId.Trim());
            //if (birthday.Trim() != "")
            //    b.Birthday = DateTime.Parse(cl.returnDatetime(birthday.Trim()));
            //b.Phone = phone.Trim();
            //b.Email = email.Trim();
            //b.Address = add.Trim();
            //b.Note = note.Trim();
            //b.Sex = sex.Trim() == "1";
            //b.CreateAt = DateTime.Now;
            //b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            //b.Status = byte.Parse(status.Trim());
            //db.tPersonnels.InsertOnSubmit(b);
            //db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu nhân viên bán hàng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result UpdatePersonal(string id,string branchTypeId, string branchId, string code, string name,string sex, string birthday, string phone, string email, string add, string note, string status)
    {
        var r = new result();
        try
        {
            //CFileManagerDataContext db = new CFileManagerDataContext();
            //clsProcess cl = new clsProcess();
            //var b = from x in db.tPersonnels where x.Id == int.Parse(id.Trim()) select x;
            //if (b.Count() > 0)
            //{
            //    b.FirstOrDefault().Code = code.Trim();
            //    b.FirstOrDefault().Name = name.Trim();
            //    b.FirstOrDefault().BranchId = int.Parse(branchId.Trim());
            //    b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
            //    if (birthday.Trim() != "")
            //        b.FirstOrDefault().Birthday = DateTime.Parse(cl.returnDatetime(birthday.Trim()));
            //    else
            //        b.FirstOrDefault().Birthday = null;
            //    b.FirstOrDefault().Sex = sex.Trim() == "1";
            //    b.FirstOrDefault().Phone = phone.Trim();
            //    b.FirstOrDefault().Email = email.Trim();
            //    b.FirstOrDefault().Address = add.Trim();
            //    b.FirstOrDefault().Note = note.Trim();
            //    b.FirstOrDefault().ModifiedAt = DateTime.Now;
            //    b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            //    b.FirstOrDefault().Status = byte.Parse(status.Trim());
            //    db.SubmitChanges();

            //    r._content = "1";
            //}
            //else
            //{
            //    r._content = "0";
            //    r._mess = "Không tìm thấy thông tin nhân viên bán hàng, hãy thử lại";
            //}
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi cập nhật nhân viên bán hàng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deletePersonal(string id)
    {
        var r = new result();
        try
        {
            //CFileManagerDataContext db = new CFileManagerDataContext();

            //var b = from x in db.tPersonnels where x.Id == int.Parse(id.Trim()) select x;
            //if (b.Count() > 0)
            //{
            //    b.FirstOrDefault().Status = 0;
            //    db.SubmitChanges();

            //    r._content = "1";
            //}
            //else
            //{
            //    r._content = "0";
            //    r._mess = "Không tìm thấy thông tin nhân viên bán hàng, hãy thử lại";
            //}
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa nhân viên bán hàng, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result insertBranch(string branchTypeId,string code, string name, string add, string phone, string note, string time, string countryId, string countryName, string districtId, string districtName, string contact, string position)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = new tBranch();
            b.Address = add.Trim();
            b.BranchCode = code.Trim();
            b.BranchName = name.Trim();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            b.Info = note.Trim();
            b.Phone = phone.Trim();
            b.Time = time.Trim();
            b.ContactName = contact.Trim();
            b.Position = position.Trim();

            if (countryId.Trim() != "")
            {
                b.CountryId = int.Parse(countryId.Trim());
                b.CountryName = countryName.Trim();
            }
            if (districtId.Trim() != "")
            {
                b.DistrictId = int.Parse(districtId.Trim());
                b.DistrictName = districtName.Trim();
            }
            b.Status = 1;
            db.tBranches.InsertOnSubmit(b);
            db.SubmitChanges();

            r._mess = HttpContext.Current.Session["cm_fullname"].ToString();
            r._content = "1";
            r._id = b.Id.ToString();
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu chi nhánh, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateBranch(string id,string branchTypeId,string code, string name, string add, string phone, string note, string time, string countryId, string countryName, string districtId, string districtName, string contact, string position)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tBranches where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Address = add.Trim();
                b.FirstOrDefault().Time = time.Trim();
                b.FirstOrDefault().BranchCode = code.Trim();
                b.FirstOrDefault().BranchName = name.Trim();
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                b.FirstOrDefault().Info = note.Trim();
                b.FirstOrDefault().Phone = phone.Trim();
                b.FirstOrDefault().ContactName = contact.Trim();
                b.FirstOrDefault().Position = position.Trim();
                if (countryId.Trim() != "")
                {
                    b.FirstOrDefault().CountryId = int.Parse(countryId.Trim());
                    b.FirstOrDefault().CountryName = countryName.Trim();
                }
                else {
                    b.FirstOrDefault().CountryId = null;
                    b.FirstOrDefault().CountryName = "";
                }
                if (districtId.Trim() != "")
                {
                    b.FirstOrDefault().DistrictId = int.Parse(districtId.Trim());
                    b.FirstOrDefault().DistrictName = districtName.Trim();
                }
                else
                {
                    b.FirstOrDefault().DistrictId = null;
                    b.FirstOrDefault().DistrictName = "";
                }
                db.SubmitChanges();

                r._mess = HttpContext.Current.Session["cm_fullname"].ToString();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin chi nhánh, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu chi nhánh, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteBranch(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tBranches where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());

                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin chi nhánh, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa chi nhánh, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<Branch> listBranch(string branchTypeId)
    {
        var l = new List<Branch>();
        CFileManagerDataContext db = new CFileManagerDataContext();

        var d = db.sp_web_loadBranch(branchTypeId);
        foreach (var item in d.ToList())
        {
            var r = new Branch();
            r.CreateAt = item.CreateAt.Value.ToString("dd/MM/yyyy");
            r.Address = item.Address;
            r.BranchType = item.Name;
            r.Code = item.BranchCode;
            r.CreateBy = item.FullName;
            r.Phone = item.Phone;
            r.Name = item.BranchName;
            l.Add(r);
        }
        return l;
    }

    [WebMethod]
    public static result insertMenu(string branchTypeId, string code, string name, string parent, string position, string link, string status)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = new tMenu();
            b.BranchTypeId = int.Parse(branchTypeId.Trim());
            b.Code = code.Trim();
            if (parent.Trim() != "")
                b.ParentId = int.Parse(parent.Trim());
            
            b.Name = name.Trim();
            b.Position = double.Parse(position.Trim());
            b.Link = link.Trim();
            b.Status = byte.Parse(status.Trim());
            b.CreateAt = DateTime.Now;
            b.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tMenus.InsertOnSubmit(b);

            db.SubmitChanges();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu menu, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result updateMenu(string id, string branchTypeId,string code, string name, string parent, string position, string link, string status)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tMenus where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                b.FirstOrDefault().Code = code.Trim();
                if (parent.Trim() != "")
                    b.FirstOrDefault().ParentId = int.Parse(parent.Trim());
                else b.FirstOrDefault().ParentId = null;
                b.FirstOrDefault().Name = name.Trim();
                b.FirstOrDefault().Position = double.Parse(position.Trim());
                b.FirstOrDefault().Link = link.Trim();
                b.FirstOrDefault().Status = byte.Parse(status.Trim());
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin menu, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi lưu menu, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result deleteMenu(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tMenus where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin menu, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa menu, chi tiết: " + ax.Message;
        }
        return r;
    }

    [WebMethod]
    public static List<result> loadParentMenu(string branchTypeId)
    {
        var l = new List<result>();
        CFileManagerDataContext db = new CFileManagerDataContext();

        var d = from x in db.tMenus
                where x.BranchTypeId == int.Parse(branchTypeId.Trim()) && x.ParentId == null
                select new { x.Id, x.Name };

        foreach (var item in d.ToList())
        {
            var r = new result();
            r._id = item.Id.ToString();
            r._content = item.Name;
            l.Add(r);
        }
        return l;
    }
    [WebMethod]
    public static List<Revenue2> loadDashboardRevenue(string branchType, string fromdate, string todate)
    {
        var l = new List<Revenue2>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();

        var d = db.sp_web_loadDashboardRevenue(branchType.Trim(), cl.returnDatetime(fromdate.Trim()), cl.returnDatetime(todate.Trim()));
        foreach (var item in d.ToList())
        {
            var r = new Revenue2();
            r.CreateAt = item.CreateDate;
            r.Id = item.Id.ToString();
            r.BranchTypeName = item.BranchTypeName;
            r.RevenueValue = item.Revenue.Value;
            r.Total = item.Revenue.Value;
            l.Add(r);
        }
        return l;
    }
    [WebMethod]
    public static List<Revenue2> loadDashboardBill(string branchType, string fromdate, string todate)
    {
        var l = new List<Revenue2>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();

        var d = db.sp_web_loadDashboardBill(branchType.Trim(), cl.returnDatetime(fromdate.Trim()), cl.returnDatetime(todate.Trim()));
        foreach (var item in d.ToList())
        {
            var r = new Revenue2();
            r.CreateAt = item.CreateDate;
            r.Id = item.Id.ToString();
            r.BranchTypeName = item.BranchTypeName;
            r.RevenueValue = item.Bill.Value;
            l.Add(r);
        }
        return l;
    }
    [WebMethod]
    public static List<result> loadDashboardTopProduct(string branchType, string fromdate, string todate,string type)
    {
        var l = new List<result>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();

        var d = db.sp_web_loadDashboardTopProduct(branchType.Trim(),"", cl.returnDatetime(fromdate.Trim()), cl.returnDatetime(todate.Trim()), type);
        foreach (var item in d.ToList())
        {
            var r = new result();
            r._id = item.ProductCode;
            r._content = item.ProductName;
            r._mess = item.Quantity.ToString();
            l.Add(r);
        }
        return l;
    }
    [WebMethod]
    public static List<Revenue> loadRevenue(string branchType, string branchId, string fromdate, string todate)
    {
        var l = new List<Revenue>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();

        var d = db.sp_web_loadRevenue(branchType.Trim(), branchId.Trim(), cl.returnDatetime(fromdate.Trim()), cl.returnDatetime(todate.Trim()));
        foreach (var item in d.ToList())
        {
            var r = new Revenue();
            r.CreateAt = item.CreateDate;
            r.BranchName  = item.BranchName;
            r.BranchTypeName = item.BranchTypeName;
            r.RevenueValue = item.Revenue.Value > 999 ? string.Format("{0:0,0}", item.Revenue.Value) : item.Revenue.ToString();
            r.Total = item.Revenue.Value;
            l.Add(r);
        }
        return l;
    }
    [WebMethod]
    public static List<stockInputDetail> getStockInputdetail(string id)
    {
        var li = new List<stockInputDetail>();

        CFileManagerDataContext db = new CFileManagerDataContext();

        var d = db.sp_web_getStockInputDetail(id);
        foreach (var item in d.ToList())
        {
            var l = new stockInputDetail();
            l.ProductCode = item.ProductCode;
            l.ProductName = item.ProductName;
            l.CodeId = item.CodeId;
            l.Quantity = item.Quantity.ToString();
            li.Add(l);
        }
        return li;
    }
    [WebMethod]
    public static List<country> getCountry(string type)
    {
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = new List<country>();
        c.Add(new country { Id = "", Name = "Vui lòng chọn", Parent = "" });
        var x = from n in db.tCountries
                where n.IsActive == true && n.ParentId == int.Parse(type) select n;
        foreach (var item in x.ToList())
        {
            c.Add(new country { Id = item.Id.ToString(), Name = item.CountryName, Parent = item.ParentId != null ? item.ParentId.ToString() : "" });
        }
        return c;
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
    public class Dashboard
    {
        private string id = "", name = "", count = "", quantity = "", totalprice = "";
        private int quan = 0, scount = 0;
        private double total = 0;
        public int num_quantity
        {
            set { quan = value; }
            get { return quan; }
        }
        public int num_count
        {
            set { scount = value; }
            get { return scount; }
        }
        public double num_total
        {
            set { total = value; }
            get { return total; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Count
        {
            set { count = value; }
            get { return count; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
        public string TotalPrice
        {
            set { totalprice = value; }
            get { return totalprice; }
        }
    }
    public class Branch
    {
        private string id="",code = "", name = "", add = "", phone = "", branchtype="", createat="", createby="";
        public string Id
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
        public string Address
        {
            set { add = value; }
            get { return add; }
        }
        public string Phone
        {
            set { phone = value; }
            get { return phone; }
        }
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
        public string CreateAt
        {
            set { createat = value; }
            get { return createat; }
        }
        public string CreateBy
        {
            set { createby = value; }
            get { return createby; }
        }
    }
    public class Revenue2
    {
        private string createat = "", id = "", branchtypename = "", branchname = "";
        private double revenuevalue = 0;
        private double total = 0;
        public double Total
        {
            set { total = value; }
            get { return total; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string CreateAt
        {
            set { createat = value; }
            get { return createat; }
        }
        public string BranchTypeName
        {
            set { branchtypename = value; }
            get { return branchtypename; }
        }
        public string BranchName
        {
            set { branchname = value; }
            get { return branchname; }
        }
        public double RevenueValue
        {
            set { revenuevalue = value; }
            get { return revenuevalue; }
        }

    }
    public class Revenue
    {
        private string createat = "", id = "", branchtypename = "", branchname = "",revenuevalue = "";
        private double total = 0;
        public double Total
        {
            set { total = value; }
            get { return total; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string CreateAt
        {
            set { createat = value; }
            get { return createat; }
        }
        public string BranchTypeName
        {
            set { branchtypename = value; }
            get { return branchtypename; }
        }
        public string BranchName
        {
            set { branchname = value; }
            get { return branchname; }
        }
        public string RevenueValue
        {
            set { revenuevalue = value; }
            get { return revenuevalue; }
        }
        
    }
    public class BillList
    {
        private string id = "", stock_code = "", outputType = "", totalPrice = "", totalDiscount = "", total = "", createAt = "", createBy = "", memberName = "";
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string StockCode
        {
            set { stock_code = value; }
            get { return stock_code; }
        }
        public string OutputType
        {
            set { outputType = value; }
            get { return outputType; }
        }
        public string TotalPrice
        {
            set { totalPrice = value; }
            get { return totalPrice; }
        }
        public string TotalDiscount
        {
            set { totalDiscount = value; }
            get { return totalDiscount; }
        }
        public string Total
        {
            set { total = value; }
            get { return total; }
        }
        public string CreateAt
        {
            set { createAt = value; }
            get { return createAt; }
        }
        public string CreateBy
        {
            set { createBy = value; }
            get { return createBy; }
        }
        public string MemberName
        {
            set { memberName = value; }
            get { return memberName; }
        }
    }
    public class stockInputDetail
    {
        private string codeId = "", pro_code = "", pro_name = "", quantity = "", price = "", discount = "", total = "";
        public string CodeId
        {
            set { codeId = value; }
            get { return codeId; }
        }
        public string ProductCode
        {
            set { pro_code = value; }
            get { return pro_code; }
        }
        public string ProductName
        {
            set { pro_name = value; }
            get { return pro_name; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
        public string Discount
        {
            set { discount = value; }
            get { return discount; }
        }
        public string Total
        {
            set { total = value; }
            get { return total; }
        }
    }
    public class stockOutputDetail
    {
        private string pro_code = "", pro_name = "", quantity = "", price = "",discountpercent="", discount = "", total = "";

        public string ProductCode
        {
            set { pro_code = value; }
            get { return pro_code; }
        }
        public string ProductName
        {
            set { pro_name = value; }
            get { return pro_name; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
        public string Discount
        {
            set { discount = value; }
            get { return discount; }
        }
        public string DiscountPercent
        {
            set { discountpercent = value; }
            get { return discountpercent; }
        }
        public string Total
        {
            set { total = value; }
            get { return total; }
        }
    }
    public class product
    {

        private string status = "", mess = "", id = "", procode = "", protypecode="", proname = "", protype = "", img = "", country = "", countryname = "", brand = "", branchtype = "", branch = "",year="",
            des = "",content="", price = "", pricesale = "", size = "", note = "", notesale = "", tag = "", info = "", score = "", supplier = "", codeid = "", color = "", composition = "", material = "", unit="", capacity="", catalog="", expirydate="";
        private string ok = "";
        public string Size
        {
            set { size = value; }
            get { return size; }
        }
        public string Note
        {
            set { note = value; }
            get { return note; }
        }
        public string Unit
        {
            set { unit = value; }
            get { return unit; }
        }
        public string Capacity
        {
            set { capacity = value; }
            get { return capacity; }
        }
        public string ExpiryDate
        {
            set { expirydate = value; }
            get { return expirydate; }
        }
        public string Catalog
        {
            set { catalog = value; }
            get { return catalog; }
        }
        public string Color
        {
            set { color = value; }
            get { return color; }
        }
        public string Material
        {
            set { material = value; }
            get { return material; }
        }
        public string Composition
        {
            set { composition = value; }
            get { return composition; }
        }
        public string CodeId
        {
            set { codeid = value; }
            get { return codeid; }
        }
        public string Supplier
        {
            set { supplier = value; }
            get { return supplier; }
        }
        public string Brand
        {
            set { brand = value; }
            get { return brand; }
        }
        public string Branch
        {
            set { branch = value; }
            get { return branch; }
        }
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
        public string Score
        {
            set { score = value; }
            get { return score; }
        }
        public string Year
        {
            set { year = value; }
            get { return year; }
        }
        public string Content
        {
            set { content = value; }
            get { return content; }
        }
        public string Info
        {
            set { info = value; }
            get { return info; }
        }
        public string Tag
        {
            set { tag = value; }
            get { return tag; }
        }
        public string NoteSale
        {
            set { notesale = value; }
            get { return notesale; }
        }
        public string PriceSale
        {
            set { pricesale = value; }
            get { return pricesale; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
        public string Description
        {
            set { des = value; }
            get { return des; }
        }
        public string CountryId
        {
            set { country = value; }
            get { return country; }
        }
        public string CountryName
        {
            set { countryname = value; }
            get { return countryname; }
        }
        public string Ok
        {
            set { ok = value; }
            get { return ok; }
        }
        public string ProName
        {
            set { proname = value; }
            get { return proname; }
        }
        public string ProCode
        {
            set { procode = value; }
            get { return procode; }
        }
        public string ProType
        {
            set { protype = value; }
            get { return protype; }
        }
        public string ProTypeCode
        {
            set { protypecode = value; }
            get { return protypecode; }
        }
        public string Image
        {
            set { img = value; }
            get { return img; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
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

    [WebMethod]
    public static List<category> getCategory(string branchTypeId)
    {
        var li = new List<category>();

        CFileManagerDataContext db = new CFileManagerDataContext();

        var d1 = db.sp_getCategory(branchTypeId, false, true, true, true, true, true, true,true,true,true);

        foreach (var item in d1.ToList())
        {
            var l = new category();
            l.Name = item.Name;
            l.ID = item.Id.ToString();
            l.Type = item.sType;
            li.Add(l);
        }

        return li;
    }

    [WebMethod]
    public static result InsertProduct(string codeId, string proCode, string proTypeCode, string proName, string proType,
        string branchType, string supplierId, string des, string brandId, string color,
        string size, string material, string composition, string note, string notesale, string tag,string year,string status, string unit, string capacity, string expiry, string catalog, string national, string nationalname)
    {
        var r = new result();

        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();
            var p = new tProduct();
            p.CodeId = codeId.Trim();
            p.ProductCode = proCode.Trim();
            p.ProductName = proName.Trim();
            p.ProductTypeCode = proTypeCode.Trim();
            p.ParentProductTypeId = int.Parse(proType.Trim().Split(',')[1]);
            p.ProductTypeId = int.Parse(proType.Trim().Split(',')[0]);
            p.BranchTypeId = int.Parse(branchType.Trim());
            if (supplierId.Trim() != "" && supplierId != null)
                p.SupplierId = int.Parse(supplierId.Trim());
            p.Description = des.Trim();
            if (brandId.Trim() != "null" && brandId != null)
                p.BrandId = int.Parse(brandId.Trim());
            if (color.Trim() != "null" && color != null)
                p.Color = int.Parse(color.Trim());
            if (size.Trim() != "null" && size != null)
                p.Size = int.Parse(size.Trim());
            if (material.Trim() != "" && material != null)
                p.Material = material.Trim();
            if (composition.Trim() != "" && composition != null)
                p.Composition = composition.Trim();
            p.Status = byte.Parse(status.Trim());
            p.YearId = int.Parse(year.Trim());
            p.Note = note.Trim();
            p.NoteSale = notesale.Trim();
            p.Tag = tag.Trim();
            if(expiry.Trim()!="")
                p.ExpiryDate = DateTime.Parse(cl.returnDatetime(expiry.Trim()));
            if(unit.Trim()!="")
                p.UnitId = int.Parse(unit.Trim());
            if (capacity.Trim() != "")
                p.CapacityName = capacity.Trim();
            p.Catalog = catalog.Trim();

            if (national.Trim() != "")
            {
                p.CountryId = int.Parse(national.Trim());
                p.CountryName = nationalname.Trim();
            }

            p.CreateAt = DateTime.Now;
            p.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tProducts.InsertOnSubmit(p);
            db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static result UpdateProduct(string Id, string codeId, string proCode,string proTypeCode, string proName, string proType,
        string branchType, string supplierId, string des, string brandId, string color,
        string size, string material, string composition, string note, string notesale, string tag,string year,string status, string unit, string capacity, string expiry, string catalog, string national, string nationalname)
    {
        var r = new result();

        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();
            var p = from x in db.tProducts where x.Id == int.Parse(Id.Trim()) select x;
            if (p.Count() > 0)
            {
                p.FirstOrDefault().CodeId = codeId.Trim();
                p.FirstOrDefault().ProductCode = proCode.Trim();
                p.FirstOrDefault().ProductName = proName.Trim();
                p.FirstOrDefault().ProductTypeCode = proTypeCode.Trim();
                if (proType.Trim().Split(',')[1] == "0")
                    p.FirstOrDefault().ParentProductTypeId = null;
                else
                    p.FirstOrDefault().ParentProductTypeId = int.Parse(proType.Trim().Split(',')[1]);

                p.FirstOrDefault().ProductTypeId = int.Parse(proType.Trim().Split(',')[0]);
                p.FirstOrDefault().BranchTypeId = int.Parse(branchType.Trim());

                if (supplierId.Trim() != "" && supplierId != null)
                    p.FirstOrDefault().SupplierId = int.Parse(supplierId.Trim());
                else p.FirstOrDefault().SupplierId = null;

                p.FirstOrDefault().Description = des.Trim();
                if (brandId.Trim() != "null" && brandId != null)
                    p.FirstOrDefault().BrandId = int.Parse(brandId.Trim());
                else p.FirstOrDefault().BrandId = null;

                if (color.Trim() != "null" && color != null)
                    p.FirstOrDefault().Color = int.Parse(color.Trim());
                else p.FirstOrDefault().Color = null;

                if (size.Trim() != "null" && size != null)
                    p.FirstOrDefault().Size = int.Parse(size.Trim());
                else p.FirstOrDefault().Size = null;

                if (material.Trim() != "" && material != null)
                    p.FirstOrDefault().Material = material.Trim();
                else p.FirstOrDefault().Material = null;

                if (composition.Trim() != "" && composition != null)
                    p.FirstOrDefault().Composition = composition.Trim();
                else p.FirstOrDefault().Composition = null;

                if (expiry.Trim() != "")
                    p.FirstOrDefault().ExpiryDate = DateTime.Parse(cl.returnDatetime(expiry.Trim()));
                else p.FirstOrDefault().ExpiryDate = null;

                if (unit.Trim() != "")
                    p.FirstOrDefault().UnitId = int.Parse(unit.Trim());
                else p.FirstOrDefault().UnitId = null;

                if (capacity.Trim() != "")
                    p.FirstOrDefault().CapacityName = capacity.Trim();
                else p.FirstOrDefault().CapacityName = "";

                p.FirstOrDefault().Catalog = catalog.Trim();
                if (national.Trim() != "")
                {
                    p.FirstOrDefault().CountryId = int.Parse(national.Trim());
                    p.FirstOrDefault().CountryName = nationalname.Trim();
                }
                else
                {
                    p.FirstOrDefault().CountryId = null;
                    p.FirstOrDefault().CountryName = null;
                }
                p.FirstOrDefault().Status = byte.Parse(status.Trim());
                p.FirstOrDefault().YearId = int.Parse(year.Trim());
                p.FirstOrDefault().Note = note.Trim();
                p.FirstOrDefault().NoteSale = notesale.Trim();
                p.FirstOrDefault().Tag = tag.Trim();
                p.FirstOrDefault().ModifiedAt = DateTime.Now;
                p.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy sản phẩm " + proName + ". Vui lòng thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;
    }

    [WebMethod]
    public static result RemoveProduct(string Id, string proName)
    {
        var r = new result();

        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var p = from x in db.tProducts where x.Id == int.Parse(Id.Trim()) select x;
            if (p.Count() > 0)
            {
                p.FirstOrDefault().Status = 0;
                p.FirstOrDefault().ModifiedAt = DateTime.Now;
                p.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy sản phẩm " + proName + ". Vui lòng thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<result> getBranchType()
    {
        var li = new List<result>();

        CFileManagerDataContext db = new CFileManagerDataContext();

        var d = from x in db.tBranchTypes
                where x.Status == 1
                select new { x.Id, x.Name };
        foreach (var item in d.ToList())
        {
            var l = new result();
            l._mess = item.Name;
            l._content = item.Id.ToString();
            li.Add(l);
        }
        return li;
    }

    [WebMethod]
    public static List<result> getBranchByType(string typeId)
    {
        var li = new List<result>();

        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tBranches
                where x.Status == 1 && x.BranchTypeId == int.Parse(typeId)
                select new { x.Id, x.BranchName };
        foreach (var item in d.ToList())
        {
            var l = new result();
            l._mess = item.BranchName;
            l._content = item.Id.ToString();
            li.Add(l);
        }
        return li;
    }
    [WebMethod]
    public static List<result> getProductIdByType(string branchType , string typeId)
    {
        var li = new List<result>();

        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = db.sp_web_loadGift_getProductByType(branchType, typeId);
        foreach (var item in d.ToList())
        {
            var l = new result();
            l._mess = item.ProductCode + "#" + item.ProductName;
            l._id = item.Id.ToString();
            l._content = item.CodeId;
            li.Add(l);
        }
        return li;
    }
    [WebMethod]
    public static List<result> getProductType(string typeId)
    {
        var li = new List<result>();

        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tProductTypes
                where x.Status == 1 && x.ParentTypeId!=null && x.BranchTypeId == int.Parse(typeId)
                select new { x.Id, x.ProductTypeName };
        foreach (var item in d.ToList())
        {
            var l = new result();
            l._mess = item.ProductTypeName;
            l._content = item.Id.ToString();
            li.Add(l);
        }
        return li;
    }

    [WebMethod]
    public static List<result> getSupplierByType(string typeId)
    {
        var li = new List<result>();

        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = from x in db.tSuppliers
                where x.Status == 1 && x.BranchTypeId == int.Parse(typeId)
                select new { x.Id, x.SupplierName };
        foreach (var item in d.ToList())
        {
            var l = new result();
            l._mess = item.SupplierName;
            l._content = item.Id.ToString();
            li.Add(l);
        }
        return li;
    }

    [WebMethod]
    public static addProduct getDetailProduct(string branchTypeId, string codeId)
    {
        CFileManagerDataContext db = new CFileManagerDataContext();
        var d = db.sp_web_getDetailProduct(branchTypeId, codeId).ToList();
        var li = new addProduct();
        if (d.Count() > 0)
        {
            li.Id = d.FirstOrDefault().Id.ToString();
            li.CodeId = d.FirstOrDefault().CodeId;
            li.ProductCode = d.FirstOrDefault().ProductCode;
            li.ProductName = d.FirstOrDefault().ProductName;
            li.Price = d.FirstOrDefault().Price > 999 ? string.Format("{0:0,0}", d.FirstOrDefault().Price) : d.FirstOrDefault().Price.ToString();
            li.OK = "1";
        }
        else li.OK = "0";
        return li;
    }
    [WebMethod]
    public static result deletePriceProduct(string idPrice)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        try
        {
            var pr = from x in db.tProductPrices where x.Id == int.Parse(idPrice.Trim()) select x;
            db.tProductPrices.DeleteAllOnSubmit(pr);
            db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result insertPriceProduct(string productId, string price, string fromdate, string todate)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            var si = new tProductPrice();
            si.ProductId = Int64.Parse(productId.Trim());
            si.Price = double.Parse(price.Trim().Replace(",", ""));
            si.FromDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
            if (todate.Trim() != "")
                si.EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
            si.ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            si.ModifiedDate = DateTime.Now;
            db.tProductPrices.InsertOnSubmit(si);
            db.SubmitChanges();

            r._id = si.Id.ToString();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result insertPriceProductCode(string productCodeList,string proCode, string price, string fromdate, string todate)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            if (proCode.Trim().Equals(""))
            {
                //1 | BLZ001 | T01 | Tím than
                var prCode = productCodeList.Replace(" ", "").Split('|');
                var pl = from x in db.tProducts
                         where x.ProductTypeCode == prCode[1] && x.Color==int.Parse(prCode[0])
                         select new { x.Id };
                foreach (var item in pl.ToList())
                {
                    var si = new tProductPrice();
                    si.ProductId = item.Id;
                    si.Price = double.Parse(price.Trim().Replace(",", ""));
                    si.FromDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
                    si.ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                    si.ModifiedDate = DateTime.Now;
                    if (todate.Trim() != "")
                        si.EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
                    db.tProductPrices.InsertOnSubmit(si);
                }
                
                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                var pl = from x in db.tProducts
                         where x.CodeId == proCode.Trim()
                         select new { x.Id };
                if (pl.Count() > 0)
                {
                    var si = new tProductPrice();
                    si.ProductId = pl.FirstOrDefault().Id;
                    si.Price = double.Parse(price.Trim().Replace(",", ""));
                    si.FromDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
                    if (todate.Trim() != "")
                        si.EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
                    db.tProductPrices.InsertOnSubmit(si);
                    db.SubmitChanges();
                    r._id = si.Id.ToString();
                    r._content = "1";
                }
                else
                {
                    r._content = "0";
                    r._mess = "Không tìm thấy sản phẩm có mã vạch: "+proCode.Trim();
                }
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result updatePriceProduct(string id, string price, string fromdate, string todate)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            var si = from x in db.tProductPrices where x.Id == int.Parse(id.Trim()) select x;
            if (si.Count() > 0)
            {
                si.FirstOrDefault().Price = double.Parse(price.Trim().Replace(",", ""));
                si.FirstOrDefault().FromDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
                if (todate.Trim() != "")
                    si.FirstOrDefault().EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
                else si.FirstOrDefault().EndDate = null;
                si.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                si.FirstOrDefault().ModifiedDate = DateTime.Now;
                db.SubmitChanges();
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin đơn giá, hãy thử lại";
            }
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result insertCombo(string branchTypeId, string branchId,string combocode, string comboname, string totalPrice, string fromdate, string todate, string note, string data)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            var si = new tCombo();
            si.BranchTypeId = int.Parse(branchTypeId.Trim());
            si.BranchId = int.Parse(branchId.Trim());
            si.ComboCode = combocode.Trim();
            si.ComboName = comboname.Trim();
            si.Description = note.Trim();
            si.TotalPrice = double.Parse(totalPrice.Trim().Replace(",", ""));
            si.Status = 1;
            si.StartDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
            if (todate != "")
                si.EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
            si.CreateAt = DateTime.Now;
            si.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tCombos.InsertOnSubmit(si);
            db.SubmitChanges();


            var split = data.Split('#');
            if (split.Length > 0)
            {
                for (int i = 0; i < split.Length; i++)
                {
                    var d = split[i].Split(',');

                    var dsi = new tComboDetail();
                    dsi.ComboId = si.Id;
                    dsi.ProductId = Int64.Parse(d[0]);
                    dsi.Quantity = byte.Parse(d[1]);
                    db.tComboDetails.InsertOnSubmit(dsi);
                }
            }

            db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }

    [WebMethod]
    public static result updateCombo(string Id, string branchTypeId, string branchId, string combocode, string comboname, string totalPrice, string fromdate, string todate, string note)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            var si = from x in db.tCombos where x.Id == int.Parse(Id.Trim()) select x;
            if (si.Count() > 0)
            {
                si.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                si.FirstOrDefault().BranchId = int.Parse(branchId.Trim());
                si.FirstOrDefault().ComboCode = combocode.Trim();
                si.FirstOrDefault().ComboName = comboname.Trim();
                si.FirstOrDefault().Description = note.Trim();
                si.FirstOrDefault().TotalPrice = double.Parse(totalPrice.Trim().Replace(",", ""));
                si.FirstOrDefault().StartDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
                if (todate != "")
                    si.FirstOrDefault().EndDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));
                else si.FirstOrDefault().EndDate = null;

                si.FirstOrDefault().ModifiedAt = DateTime.Now;
                si.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin combo, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result removeCombo(string Id)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            var si = from x in db.tCombos where x.Id == int.Parse(Id.Trim()) select x;
            if (si.Count() > 0)
            {
                si.FirstOrDefault().Status = 0;
                si.FirstOrDefault().ModifiedAt = DateTime.Now;
                si.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin combo, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result insertGift(string branchTypeId, string branchId, string name,string des,string type,string minbill, string totalPrice,string start_hour, string fromdate, string to_hour,string todate, string data)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        try
        {
            var si = new tHourGold();
            si.BranchTypeId = int.Parse(branchTypeId.Trim());
            si.BranchId = int.Parse(branchId.Trim());
            si.Name = name.Trim();
            si.Description = des.Trim();
            si.SaleValue = double.Parse(totalPrice.Trim().Replace(",", ""));
            si.SaleType = byte.Parse(type.Trim());
            si.Status = 1;
            si.MinBill = double.Parse(minbill.Trim().Replace(",", "").Equals("") ? "0" : minbill.Trim().Replace(",", ""));
            var st_h = start_hour.Trim();
            if (st_h.Contains("PM"))
            {
                var h = st_h.Substring(0, st_h.IndexOf(' ')).Split(':');
                si.FromHour = (int.Parse(h[0]) + 12).ToString() + ":" + h[1].ToString();

            }
            else
                si.FromHour = st_h.Substring(0, st_h.IndexOf(' '));

            si.FromDate = DateTime.Parse(cl.returnDatetime(fromdate.Trim()));
            si.ToDate = DateTime.Parse(cl.returnDatetime(todate.Trim()));

            st_h = to_hour.Trim();
            if (st_h.Contains("PM"))
            {
                var h = st_h.Substring(0, st_h.IndexOf(' ')).Split(':');
                si.ToHour = (int.Parse(h[0]) + 12).ToString() + ":" + h[1].ToString();

            }
            else
                si.ToHour = st_h.Substring(0, st_h.IndexOf(' '));


            si.CreateAt = DateTime.Now;
            si.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tHourGolds.InsertOnSubmit(si);
            db.SubmitChanges();


            var split = data.Split('#');
            if (split.Length > 0)
            {
                for (int i = 0; i < split.Length; i++)
                {
                    var d = split[i].Split(',');

                    var dsi = new tHourGoldDetail();
                    dsi.HourGoldId = si.Id;
                    dsi.ProductId = Int64.Parse(d[0]);
                    db.tHourGoldDetails.InsertOnSubmit(dsi);
                }
            }

            db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }

    [WebMethod]
    public static result saveStockInputInternal(string branchTypeId, string branchId, string branchfrom,string outputcode,string note )
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var codeId = db.sp_StockInput_GetCodeId().FirstOrDefault().CodeId.Value;

            var inputCode = "NKDC" + DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");

            db.sp_StockInput_InsertData(inputCode, int.Parse(branchTypeId.Trim()), int.Parse(branchId.Trim()),
                int.Parse(branchfrom.Trim()), outputcode.Trim(), note.Trim(), int.Parse(HttpContext.Current.Session["cm_userId"].ToString()));

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._mess = ax.Message;
            r._content = "0";
        }
        return r;
    }
    [WebMethod]
    public static List<StockOutputInternalDetail> getStockOutputDetailInternal(string branchTypeId, string branchId, string stockCode)
    {
        var l = new List<StockOutputInternalDetail>();
        

        CFileManagerDataContext db = new CFileManagerDataContext();
        var data = db.sp_web_getStockOutputInternalByCode(branchTypeId.Trim(), branchId.Trim(), stockCode.Trim());
        int i = 0;
        foreach (var item in data.ToList())
        {
            var d = new StockOutputInternalDetail();
            d.Id = item.Id.ToString();
            d.Note = item.Note;
            d.CreateAt = item.CreateAt.Value.ToString("dd/MM/yyyy");
            d.CreateBy = item.CreateBy;
            d.BranchId = item.BranchId.ToString();
            d.BranchFrom = item.BranhFrom;
            d.BranchTo = item.BranchTo;
            d.ProId = item.ProductId.ToString();
            d.Quantity = item.Quantity.ToString();
            d.ProName = item.ProductName;
            d.CodeId = item.CodeId;
            d.ProCode = item.ProductCode;
            d.OK = "1";
            l.Add(d);
            i++;
        }
        if (i == 0)
        {
            var d = new StockOutputInternalDetail();
            d.OK = "0";
            d.Mess = "Số phiếu xuất không phù hợp, hãy kiểm tra lại";
            l.Add(d);
        }
        return l;
    }
    [WebMethod]
    public static result insertStockOutput(string branchTypeId, string branchId, string tobranchId, string note, string totalPrice, string data)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();

        try
        {
            var codeId = db.sp_StockOutput_GetCodeId().FirstOrDefault().CodeId.Value;

            var si = new tStockOutput();
            si.StockCode = "XKDC" + DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");
            si.BranchTypeId = int.Parse(branchTypeId.Trim());
            si.BranchId = int.Parse(branchId.Trim());
            si.BranchToId = int.Parse(tobranchId.Trim());
            si.OutputType = 2;//xuat dieu chuyen
            si.Note = note.Trim();
            si.TotalPrice = 0;// double.Parse(totalPrice.Trim().Replace(",", ""));
            si.Total = 0;
            si.Discount = 0;
            si.Status = 2;
            si.CreateAt = DateTime.Now;
            si.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tStockOutputs.InsertOnSubmit(si);
            db.SubmitChanges();


            var split = data.Split('#');
            if (split.Length > 0)
            {
                for (int i = 0; i < split.Length; i++)
                {
                    var d = split[i].Split(',');

                    var dsi = new tStockOutputDetail();
                    dsi.StockOutputId = si.Id;
                    dsi.ProductId = Int64.Parse(d[0]);
                    dsi.Quantity = int.Parse(d[1]);
                    dsi.Price = 0;
                    dsi.IsCombo = false;
                    dsi.ComboId = 0;
                    dsi.ComboQuantity = 0;
                    db.tStockOutputDetails.InsertOnSubmit(dsi);

                    //insert inventory
                    var inv = new tStockInventory();
                    inv.BranchTypeId = int.Parse(branchTypeId.Trim());
                    inv.BranchId = int.Parse(branchId.Trim());
                    inv.ProductId = int.Parse(d[0]);
                    inv.QuantityOut = byte.Parse(d[1]);
                    inv.QuantityIn = 0;
                    inv.CreateAt = DateTime.Now;
                    db.tStockInventories.InsertOnSubmit(inv);
                }
            }

            db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }
    [WebMethod]
    public static result insertSupplier(string branchTypeId, string code, string name,  string address, string phone, string contact, string info)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var s = new tSupplier();
            s.SupplierCode = code.Trim();
            s.SupplierName = name.Trim();
            s.BranchTypeId = int.Parse(branchTypeId.Trim());
            s.Address = address.Trim();
            s.Phone = phone.Trim();
            s.ContactName = contact.Trim();
            s.Info = info.Trim();
            s.Status = 1;
            s.CreateAt = DateTime.Now;
            s.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tSuppliers.InsertOnSubmit(s);
            db.SubmitChanges();

            r._id = s.Id.ToString();
            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;

    }
    [WebMethod]
    public static Supplier getDetailSupplier(string Id)
    {
        var r = new Supplier();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var s = from x in db.tSuppliers where x.Id == int.Parse(Id.Trim()) select x;
            if (s.Count() > 0)
            {
                r.Code = s.FirstOrDefault().SupplierCode;
                r.Name = s.FirstOrDefault().SupplierName;
                r.BranchType = s.FirstOrDefault().BranchTypeId.ToString();
                r.Address = s.FirstOrDefault().Address;
                r.Phone = s.FirstOrDefault().Phone;
                r.ContactName = s.FirstOrDefault().ContactName;
                r.Info = s.FirstOrDefault().Info;
                r.OK = "1";
            }
            else
            {
                r.OK = "0";
                r.Mess = "Không tìm thấy thông tin nhà cung cấp, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r.OK = "0";
            r.Mess = ax.Message;
        }
        return r;

    }
    [WebMethod]
    public static result updateSupplier(string Id,string branchTypeId, string code, string name, string address, string phone, string contact, string info)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var s = from x in db.tSuppliers where x.Id == int.Parse(Id.Trim()) select x;
            if (s.Count() > 0)
            {
                s.FirstOrDefault().SupplierCode = code.Trim();
                s.FirstOrDefault().SupplierName = name.Trim();
                s.FirstOrDefault().BranchTypeId = int.Parse(branchTypeId.Trim());
                s.FirstOrDefault().Address = address.Trim();
                s.FirstOrDefault().Phone = phone.Trim();
                s.FirstOrDefault().ContactName = contact.Trim();
                s.FirstOrDefault().Info = info.Trim();
                s.FirstOrDefault().ModifiedAt = DateTime.Now;
                s.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin nhà cung cấp, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;

    }
    [WebMethod]
    public static result removeSupplier(string Id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var s = from x in db.tSuppliers where x.Id == int.Parse(Id.Trim()) select x;
            if (s.Count() > 0)
            {
                s.FirstOrDefault().Status = 0;
                s.FirstOrDefault().ModifiedAt = DateTime.Now;
                s.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();
                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin nhà cung cấp, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;

    }
    [WebMethod]
    public static result insertStockInput(string branchTypeId, string branchId,string supplierId,string note,string totalPrice,string data)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();

        try
        {
            var codeId = db.sp_StockInput_GetCodeId().FirstOrDefault().CodeId.Value;
            
            var si = new tStockInput();
            si.StockInputCode = "PNHH" + DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");
            si.BranchTypeId = int.Parse(branchTypeId.Trim());
            si.BranchId = int.Parse(branchId.Trim());
            si.SupplierId = int.Parse(supplierId.Trim());
            si.InputType = 1;//nhap tu ncc
            si.Note = note.Trim();
            si.TotalPrice = double.Parse(totalPrice.Trim().Replace(",", ""));
            si.Status = 1;
            si.CreateAt = DateTime.Now;
            si.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tStockInputs.InsertOnSubmit(si);
            db.SubmitChanges();

            
            var split = data.Split('#');
            if (split.Length > 0)
            {
                for (int i = 0; i < split.Length; i++)
                {
                    var d = split[i].Split(',');
                    
                    var dsi = new tStockInputDetail();
                    dsi.StockInputId = si.Id;
                    dsi.ProductId = Int64.Parse(d[0]);
                    dsi.Quantity = int.Parse(d[1]);
                    dsi.Price = 0;
                    dsi.IsCombo = false;
                    dsi.ComboId = 0;
                    dsi.ComboQuantity = 0;
                    db.tStockInputDetails.InsertOnSubmit(dsi);

                    //insert inventory
                    var inv = new tStockInventory();
                    inv.BranchTypeId = int.Parse(branchTypeId.Trim());
                    inv.BranchId = int.Parse(branchId.Trim());
                    inv.ProductId = int.Parse(d[0]);
                    inv.QuantityIn = byte.Parse(d[1]);
                    inv.QuantityOut = 0;
                    inv.CreateAt = DateTime.Now;
                    db.tStockInventories.InsertOnSubmit(inv);
                }
            }
            
            db.SubmitChanges();

            r._content = "1";
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }

        return r;
    }

    [WebMethod]
    public static login admin_login(string us, string pw)
    {
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        var l = new login();

        var u = from x in db.tAccounts from y in db.tBranchTypes
                where x.BranchTypeId== y.Id && x.Status == 1 && x.Username == us.Trim().ToLower() && x.Password == cl.Encrypt(pw.Trim())
                select new { x.Id,x.Username, x.FullName, x.Email,x.Status,x.GroupUserId,x.BranchTypeId,x.BranchId, y.Code };
        if (u.Count() == 1)
        {
            HttpContext.Current.Session["cm_branchId"]  = u.FirstOrDefault().BranchId.ToString();
            HttpContext.Current.Session["cm_branchTypeId"] = u.FirstOrDefault().BranchTypeId.ToString();
            HttpContext.Current.Session["cm_branchTypeName"] = u.FirstOrDefault().Code.ToString();
            HttpContext.Current.Session["cm_userId"]  = u.FirstOrDefault().Id.ToString();
            HttpContext.Current.Session["cm_fullname"] = u.FirstOrDefault().FullName.ToString();
            HttpContext.Current.Session["cm_groupId"] = u.FirstOrDefault().GroupUserId.ToString();
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
    public static result insertProductCombo(string idCombo, string productCode, string quantity)
    {
        var l = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        try
        {
            var cb = from m in db.tCombos where m.Id == Int64.Parse(idCombo.Trim()) select new { m.BranchTypeId };
            var p = from x in db.tProducts where x.BranchTypeId==cb.FirstOrDefault().BranchTypeId && 
                    x.CodeId == productCode.Trim()
                    select new { x.Id, x.ProductCode, x.ProductName };
            if (p.Count() == 1)
            {
                var c = new tComboDetail();
                c.ComboId = Int64.Parse(idCombo.Trim());
                c.ProductId = p.FirstOrDefault().Id;
                c.Quantity = byte.Parse(quantity.Trim());
                db.tComboDetails.InsertOnSubmit(c);
                db.SubmitChanges();

                l._mess = p.FirstOrDefault().ProductCode + "#" + p.FirstOrDefault().ProductName;
                l._content = "1";
                l._id = c.Id.ToString();
            }
            else
            {
                l._content = "0";
                l._mess = "Không tìm thấy mã vạch sản phẩm [" + productCode + "]";
            }

        }
        catch(Exception ax)
        {
            l._content = "0";
            l._mess = ax.Message;
        }
        return l;
    }
    [WebMethod]
    public static result insertProductGift(string idSale, string productCode)
    {
        var l = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        try
        {
            var cb = from m in db.tHourGolds where m.Id == int.Parse(idSale.Trim()) select new { m.BranchTypeId };
            var p = db.sp_web_loadGiftDetail_Insert(cb.FirstOrDefault().BranchTypeId.ToString(), productCode);
            int count = 0;
            foreach (var item in p.ToList())
            {
                var c = new tHourGoldDetail();
                c.HourGoldId = int.Parse(idSale.Trim());
                c.ProductId = item.Id;
                db.tHourGoldDetails.InsertOnSubmit(c);
                db.SubmitChanges();

                l._mess = item.ProductCode + "#" + item.ProductName;
                l._content = "1";
                l._id = c.HourGoldId.ToString() + "#" + item.Id.ToString();
                count++;
            }

            if (count == 0)
            {
                l._content = "0";
                l._mess = "Không tìm thấy mã vạch sản phẩm [" + productCode + "]";
            }
        }
        catch (Exception ax)
        {
            l._content = "0";
            l._mess = ax.Message;
        }
        return l;
    }
    [WebMethod]
    public static result updateDetailCombo(string id, string quantity)
    {
        var l = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var p = from x in db.tComboDetails
                where x.Id == int.Parse(id.Trim())
                select x;
        if (p.Count() > 0)
        {
            p.FirstOrDefault().Quantity = byte.Parse(quantity.Trim());
            db.SubmitChanges();
            l._content = "1";
        }
        else
        {
            l._content = "0";
            l._mess = "Không tìm thấy thông tin combo, hãy thử lại";
        }
        return l;
    }
    [WebMethod]
    public static result removeDetailCombo(string id)
    {
        var l = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var p = from x in db.tComboDetails
                where x.Id == int.Parse(id.Trim())
                select x;
        if (p.Count() > 0)
        {
            db.tComboDetails.DeleteAllOnSubmit(p);
            db.SubmitChanges();
            l._content = "1";
        }
        else
        {
            l._content = "0";
            l._mess = "Không tìm thấy thông tin combo, hãy thử lại";
        }
        return l;
    }
    [WebMethod]
    public static result removeGiftDetail(string id, string proId)
    {
        var l = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var p = from x in db.tHourGoldDetails
                where x.HourGoldId == int.Parse(id.Trim()) && x.ProductId==int.Parse(proId.Trim())
                select x;
        if (p.Count() > 0)
        {
            db.tHourGoldDetails.DeleteAllOnSubmit(p);
            db.SubmitChanges();
            l._content = "1";
        }
        else
        {
            l._content = "0";
            l._mess = "Không tìm thấy thông tin khuyến mại, hãy thử lại";
        }
        return l;
    }
    [WebMethod]
    public static List<PriceDetail> getPriceHistory(string productId)
    {
        var l = new List<PriceDetail>();
        CFileManagerDataContext db=new CFileManagerDataContext();
        var p = from x in db.tProductPrices
                where x.ProductId == Int64.Parse(productId.Trim()) orderby x.FromDate descending
                select new {x.ProductId,x.Id, x.Price, x.FromDate, x.EndDate };
        foreach (var item in p.ToList())
        {
            var pr = new PriceDetail();
            pr.ProductId = item.ProductId.ToString();
            pr.Id = item.Id.ToString();
            pr.Price = string.Format("{0:0,0}", item.Price.Value);
            pr.FromDate = item.FromDate.Value.ToString("dd/MM/yyyy");
            pr.ToDate = item.EndDate!=null ? item.EndDate.Value.ToString("dd/MM/yyyy") : "";
            l.Add(pr);
        }
        return l;
    }
    [WebMethod]
    public static result acceptOrder(string orderId)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = from x in db.tOrders where x.Id == int.Parse(orderId.Trim()) select x;
        if (c.Count() > 0)
        {
            c.FirstOrDefault().Status = 2;//xac nhan don hang
            c.FirstOrDefault().ConfirmBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            c.FirstOrDefault().ConfirmStatus = true;
            c.FirstOrDefault().DateConfirm = DateTime.Now;
            db.SubmitChanges();
            r._mess = "Đã xác nhận đơn hàng";
            r._id = "1";
        }
        else
        {
            r._mess = "Không tìm thấy đơn hàng, hãy thử lại";
            r._id = "0";
        }
        return r;
    }
    [WebMethod]
    public static result CancelOrder(string orderId)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = from x in db.tOrders where x.Id == int.Parse(orderId.Trim()) select x;
        if (c.Count() > 0)
        {
            c.FirstOrDefault().Status = 0;//huy don hang
            c.FirstOrDefault().ConfirmBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            c.FirstOrDefault().ConfirmStatus = true;
            c.FirstOrDefault().DateConfirm = DateTime.Now;
            db.SubmitChanges();
            r._mess = "Đã hủy đơn hàng";
            r._id = "1";
        }
        else
        {
            r._mess = "Không tìm thấy đơn hàng, hãy thử lại";
            r._id = "0";
        }
        return r;
    }
    [WebMethod]
    public static result removeProductOrder(string orderId, string proId)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = from x in db.tOrderDetails where x.Id == int.Parse(orderId.Trim()) && x.ProductId==Int64.Parse(proId.Trim())
                select x;
        if (c.Count() > 0)
        {
            db.tOrderDetails.DeleteOnSubmit(c.FirstOrDefault());
            db.SubmitChanges();
            r._mess = "Đã xóa sản phẩm khỏi đơn hàng";
            r._id = "1";
        }
        else
        {
            r._mess = "Không tìm thấy sản phẩm trong đơn hàng, hãy thử lại";
            r._id = "0";
        }
        return r;
    }
    [WebMethod]
    public static result addProductOrder(string orderId, string codeId, string branchType, string quantity)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var c = from x in db.tProducts
                    where x.CodeId == codeId.Trim() && x.BranchTypeId == int.Parse(branchType.Trim())
                    select new { x.Id, x.Score };
            if (c.Count() > 0)
            {
                var p = new tOrderDetail();
                p.OrderId = int.Parse(orderId.Trim());
                p.ProductId = c.FirstOrDefault().Id;
                p.Price = db.sp_getPrice(c.FirstOrDefault().Id.ToString(), DateTime.Now).FirstOrDefault().Price;
                p.Quantity = int.Parse(quantity.Trim());
                p.Score = 0;// c.FirstOrDefault().Score.Value;
                p.IsSale = false;
                db.tOrderDetails.InsertOnSubmit(p);
                db.SubmitChanges();
                r._mess = "Đã thêm sản phẩm vào đơn hàng";
                r._id = "1";
            }
            else
            {
                r._mess = "Không tìm thấy sản phẩm có mã vạch [" + codeId.Trim() + "], hãy thử lại";
                r._id = "0";
            }
        }
        catch (Exception ax)
        {
            r._mess = ax.Message;
            r._id = "0";
        }
        return r;
    }
    [WebMethod]
    public static result updateQuantityOrder(string Id, string quantity)
    {
        var r = new result();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = from x in db.tOrderDetails
                where x.Id == int.Parse(Id.Trim())
                select x;
        if (c.Count() > 0)
        {
            c.FirstOrDefault().Quantity = int.Parse(quantity.Trim().Replace(",", ""));
            db.SubmitChanges();
            r._mess = "Đã cập nhật số lượng sản phẩm";
            r._id = "1";
        }
        else
        {
            r._mess = "Không tìm thấy thông tin sản phẩm, hãy thử lại";
            r._id = "0";
        }
        return r;
    }
    [WebMethod]
    public static List<OrderDetail> getOrderDetail(string orderId)
    {
        var r = new List<OrderDetail>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = db.sp_web_loadOrderDetail(orderId.Trim());
        foreach (var item in c.ToList())
        {
            var l = new OrderDetail();

            l.Id = item.Id.ToString();
            l.BranchType = item.BranchTypeId.ToString();
            l.Status = item.Status.ToString();
            l.ProductId = item.ProductId.ToString();
            l.OrderId = item.OrderId.ToString();
            l.CodeId = item.CodeId;
            l.ProCode = item.ProductCode;
            l.ProName = item.ProductName;
            l.Quantity = item.Quantity.ToString();
            l.Price = string.Format("{0:0,0}", item.Price.Value);
            r.Add(l);
        }
        return r;
    }
    [WebMethod]
    public static Combo getDetailCombo(string comboId)
    {
        var l = new Combo();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var c = from x in db.tCombos
                where x.Id == int.Parse(comboId.Trim()) select x;
        if (c.Count() > 0)
        {
            l.Id = c.FirstOrDefault().Id.ToString();
            l.ComboCode = c.FirstOrDefault().ComboCode;
            l.ComboId = c.FirstOrDefault().ComboId.ToString();
            l.BranchType = c.FirstOrDefault().BranchTypeId.ToString();
            l.Branch = c.FirstOrDefault().BranchId.ToString();
            l.Name = c.FirstOrDefault().ComboName;
            l.Description = c.FirstOrDefault().Description;
            l.Total = string.Format("{0:0,0}", c.FirstOrDefault().TotalPrice);
            l.FromDate = c.FirstOrDefault().StartDate.ToString("dd/MM/yyyy");
            l.ToDate = c.FirstOrDefault().EndDate != null ? c.FirstOrDefault().EndDate.Value.ToString("dd/MM/yyyy") : "";
            l.OK = "1";
        }
        else
        {
            l.OK = "0";
            l.Mess = "Không tìm thấy thông tin combo";
        }
        return l;
    }
    [WebMethod]
    public static List<ComboDetail> getComboDetail(string comboId)
    {
        var l = new List<ComboDetail>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var p = db.sp_web_loadComboDetail(comboId);
        foreach (var item in p.ToList())
        {
            var pr = new ComboDetail();
            pr.Id = item.Id.ToString();
            pr.ComboId = item.ComboId.ToString();
            pr.CodeId = item.CodeId;
            pr.ProCode = item.ProductCode;
            pr.ProName = item.ProductName;
            pr.Quantity = item.Quantity.ToString();
            l.Add(pr);
        }
        return l;
    }
    [WebMethod]
    public static List<HourGoldDetail> getGiftDetail(string saleId)
    {
        var l = new List<HourGoldDetail>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var p = db.sp_web_loadGiftDetail(saleId);
        foreach (var item in p.ToList())
        {
            var pr = new HourGoldDetail();
            pr.Id = item.Id.ToString();
            pr.ProductId = item.ProductId.ToString();
            pr.CodeId = item.CodeId;
            pr.ProCode = item.ProductCode;
            pr.ProName = item.ProductName;
            l.Add(pr);
        }
        return l;
    }
    [WebMethod]
    public static string changepass( string passold,string passnew)
    {
        CFileManagerDataContext db = new CFileManagerDataContext();
        clsProcess cl = new clsProcess();
        var c = from x in db.tAccounts where x.Id == int.Parse(HttpContext.Current.Session["cm_userId"].ToString()) && x.Password == cl.Encrypt(passold.Trim())
                select x;
        if (c.Count() == 1)
        {
            c.FirstOrDefault().Password = cl.Encrypt(passnew.Trim());
            db.SubmitChanges();
            return "Thay đổi mật khẩu thành công";
        }
        else return "Mật khẩu cũ không đúng, kiểm tra lại";
    }
    [WebMethod]
    public static result forgotPass(string email)
    {
        var r = new result();
        //if (email.Trim().Equals(""))
        //{
        //    r._content = "error";
        //    r._mess = "Nhập email của bạn";
        //}
        //else
        //{
        //    CFileManagerDataContext db = new CFileManagerDataContext();
        //    clsProcess cl = new clsProcess();
        //    var check = from x in db.tAccounts where x.Email == email.Trim().ToLower() select x;
        //    if (check.Count() == 1)
        //    {
        //        try
        //        {
        //            string pw = Guid.NewGuid().ToString("n").Substring(0, 8);
        //            check.FirstOrDefault().Password = cl.MaHoa(pw);
        //            db.SubmitChanges();
        //            if (cl.SendMail("Khôi phục mật khẩu", "C'File | Khôi phục mật khẩu", email, "<p>Bạn vừa thực hiện hành động khôi phục lại mật khẩu người dùng tại C'File.</p><p>Tài khoản của bạn: <b>" + email.Trim().ToLower() + "</b></p><p>Mật khẩu mới của bạn là: <b>" + pw + "</b></p>"))
        //            {
        //                r._content = "ok";
        //                r._mess = "Đã gửi lại mật khẩu mới vào mail của bạn. Vui lòng kiểm tra hộp thư";
        //            }
        //            else
        //            {
        //                r._content = "error";
        //                r._mess = "Gửi email chưa thành công, có thể lỗi do đường truyền. Bạn vui lòng thử lại";
        //            }
        //        }
        //        catch (Exception ax)
        //        {
        //            r._content = "error";
        //            r._mess = ax.Message;
        //        }
        //    }
        //    else
        //    {
        //        r._mess = "Tài khoản và email không đúng, vui lòng kiểm tra lại";
        //        r._content = "error";
        //    }
        //}
        return r;
    }
    [WebMethod]
    public static result insertAccount(string branchtype, string branch, string group, string user, string pass, string fullname, string sex,
        string birth, string email, string phone, string add, string note, string status)
    {
        var l = new result();
        try
        {
            
            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();

            var a = new tAccount();
            a.Username = user.Trim();
            a.FullName = fullname.Trim();
            a.Sex = sex.Trim().Equals("1") ? true : false;
            if (birth.Trim() != "")
                a.Birthday = DateTime.Parse(cl.returnDatetime(birth.Trim()));
            a.Email = email.Trim();
            a.Phone = phone.Trim();
            a.Address = add.Trim();
            a.Password = cl.Encrypt(pass.Trim());
            a.GroupUserId = int.Parse(group.Trim());
            a.BranchTypeId = int.Parse(branchtype.Trim());
            a.BranchId = int.Parse(branch.Trim());
            a.Note = note.Trim();
            a.Status = byte.Parse(status.Trim());
            a.CreateAt = DateTime.Now;
            a.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
            db.tAccounts.InsertOnSubmit(a);
            db.SubmitChanges();

            l._content = "1";
            l._id = a.Id.ToString();
        }
        catch(Exception ax)
        {
            l._content = "0";
            l._mess = ax.Message;
        }
        return l;
    }
    [WebMethod]
    public static result updateAccount(string id,string branchtype, string branch, string group, string user, string pass, string fullname, string sex,
       string birth, string email, string phone, string add, string note, string status)
    {
        var l = new result();
        try
        {

            CFileManagerDataContext db = new CFileManagerDataContext();
            clsProcess cl = new clsProcess();

            var a = from x in db.tAccounts where x.Id == int.Parse(id.Trim()) select x;
            if (a.Count() > 0)
            {
                a.FirstOrDefault().Username = user.Trim();
                a.FirstOrDefault().FullName = fullname.Trim();
                a.FirstOrDefault().Sex = sex.Trim().Equals("1") ? true : false;
                if (birth.Trim() != "")
                    a.FirstOrDefault().Birthday = DateTime.Parse(cl.returnDatetime(birth.Trim()));
                else a.FirstOrDefault().Birthday = null;

                a.FirstOrDefault().Email = email.Trim();
                a.FirstOrDefault().Phone = phone.Trim();
                a.FirstOrDefault().Address = add.Trim();
                a.FirstOrDefault().GroupUserId = int.Parse(group.Trim());
                a.FirstOrDefault().BranchTypeId = int.Parse(branchtype.Trim());
                a.FirstOrDefault().BranchId = int.Parse(branch.Trim());
                a.FirstOrDefault().Note = note.Trim();
                a.FirstOrDefault().Status = byte.Parse(status.Trim());
                a.FirstOrDefault().ModifiedAt = DateTime.Now;
                a.FirstOrDefault().ModifiedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                l._content = "1";
            }
            else
            {
                l._content = "0";
                l._mess = "Không tìm thấy thông tin tài khoản, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            l._content = "0";
            l._mess = ax.Message;
        }
        return l;
    }
    [WebMethod]
    public static result deleteAccount(string id)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();

            var b = from x in db.tAccounts where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Status = 0;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifiedBy= int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy thông tin tài khoản, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = "Có lỗi khi xóa tài khoản, chi tiết: " + ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<result> getGroupUser()
    {
        var r = new List<result>();

        CFileManagerDataContext db = new CFileManagerDataContext();
        var g = from x in db.tGroupUsers where x.Status == 1 select new { x.Id, x.GroupName };
        foreach (var item in g.ToList())
        {
            var gr = new result();
            gr._id = item.Id.ToString();
            gr._content = item.GroupName;
            r.Add(gr);
        }
        return r;
    }
    [WebMethod]
    public static string loadRoleGroup(string idGroup)
    {
        string result = ""; int c = 0;
        CFileManagerDataContext db = new CFileManagerDataContext();
        var l = db.sp_web_loadRole(int.Parse(idGroup));
        foreach (var item in l.ToList())
        {
            c++;
            result += "[";
            result += "\"" + item.name + "\",";
            if (item.sView.Value)
                result += "\"<input role='view' name='" + item.idRole + "' type='checkbox' checked>\",";
            else
                result += "\"<input role='view' name='" + item.idRole + "' type='checkbox'>\",";

            if (item.sInsert.Value)
                result += "\"<input role='insert' name='" + item.idRole + "' type='checkbox' checked>\",";
            else
                result += "\"<input role='insert' name='" + item.idRole + "' type='checkbox'>\",";

            if (item.sModified.Value)
                result += "\"<input role='mod' name='" + item.idRole + "' type='checkbox' checked>\",";
            else
                result += "\"<input role='mod' name='" + item.idRole + "' type='checkbox'>\",";

            if (item.sDel.Value)
                result += "\"<input role='del' name='" + item.idRole + "' type='checkbox' checked>\"";
            else
                result += "\"<input role='del' name='" + item.idRole + "' type='checkbox'>\"";
            result += "],";

        }

        if (c > 0)
        {
            result = result.Substring(0, result.Length - 1);

        }
        return result;
    }
    [WebMethod]
    public static List<result> loadReportMail()
    {
        var r = new List<result>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var l = from x in db.tReports where x.IsActive == true select new { x.Id, x.ReportName };
        foreach (var item in l.ToList())
        {
            var n = new result();
            n._id = item.Id.ToString();
            n._content = item.ReportName;
            r.Add(n);
        }
        
        return r;
    }
    [WebMethod]
    public static result insertReportMail(string branchType, string branch, string user, string report, string time)
    {
        var r = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var check = from k in db.tSendMails
                        where k.BranchTypeId == int.Parse(branchType.Trim()) && k.BranchId == int.Parse(branch.Trim()) && k.ReportId == int.Parse(report.Trim()) && k.UserId == int.Parse(user.Trim())
                        select k;
            if (check.Count() > 0)
            {
                r._content = "0";
                r._mess = "Đã tồn tại báo cáo này, kiểm tra lại";
            }
            else
            {
                var s = new tSendMail();
                s.UserId = int.Parse(user.Trim());
                s.BranchTypeId = int.Parse(branchType.Trim());
                s.BranchId = int.Parse(branch.Trim());
                s.ReportId = int.Parse(report.Trim());
                s.TimeSend = time.Trim();
                db.tSendMails.InsertOnSubmit(s);
                db.SubmitChanges();
                r._content = "1";
            }
        }
        catch (Exception ax)
        {
            r._content = "0";
            r._mess = ax.Message;
        }
        return r;
    }
    [WebMethod]
    public static List<result> loadUserByBranchType(string branchType)
    {
        var r = new List<result>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var l = from x in db.tAccounts
                where x.Status == 1 && x.BranchTypeId == int.Parse(branchType.Trim())
                select new { x.Id, Name = x.Username + " | " + x.FullName };
        foreach (var item in l.ToList())
        {
            var n = new result();
            n._id = item.Id.ToString();
            n._content = item.Name;
            r.Add(n);
        }

        return r;
    }
    [WebMethod]
    public static result updateRole(string data, string groupId)
    {
        var rs = new result();
        try
        {
            CFileManagerDataContext db = new CFileManagerDataContext();
            var t = data.Trim();
            var r = t.Split('@');

            var del = from d in db.tGroupRoles where d.GroupId == int.Parse(groupId.Trim()) select d;
            db.tGroupRoles.DeleteAllOnSubmit(del);
            for (int i = 0; i < r.Length - 1; i++)
            {
                var index = r[i].IndexOf(':');
                var roleId = r[i].Substring(0, index);
                var f = r[i].Substring(index + 1).Split('#');

                var role = new tGroupRole();
                role.GroupId = int.Parse(groupId.Trim());
                role.RoleId = int.Parse(roleId);
                role.sView = f[0] == "1" ? true : false;
                role.sInsert = f[1] == "1" ? true : false;
                role.sModifie = f[2] == "1" ? true : false;
                role.sDel = f[3] == "1" ? true : false;
                role.CreateAt = DateTime.Now;
                role.CreateBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.tGroupRoles.InsertOnSubmit(role);
            }

            db.SubmitChanges();
            rs._content = "ok";
            rs._mess = "Lưu thông tin thành công";
        }
        catch (Exception ax)
        {
            rs._content = "error";
            rs._mess = ax.Message;
        }
        return rs;
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
    public class staff
    {
        private string name = "", status = "", id = "", mess = "";
        private bool ok = false;
        public bool Ok
        {
            set { ok = value; }
            get { return ok; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
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
    public class account
    {
        private string name = "", email = "", status = "", id = "", us = "", mess = "", staffid = "", staffname = "";
        private bool ok = false, admin=false;
        public bool Ok
        {
            set { ok = value; }
            get { return ok; }
        }
        public bool IsAdmin
        {
            set { admin = value; }
            get { return admin; }
        }
        public string Email
        {
            set { email = value; }
            get { return email; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Account
        {
            set { us = value; }
            get { return us; }
        }
        public string StaffId
        {
            set { staffid = value; }
            get { return staffid; }
        }
        public string StaffName
        {
            set { staffname = value; }
            get { return staffname; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
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
    public class Account
    {
        private string user = "", pass = "", fullname = "", sex = "", birth = "", email = "", phone = "", add = "", group = "", branchtype = "", branch = "", note = "", status = "", mess = "", ok = "";
        public string Username
        {
            get { return user; }
            set { user = value; }
        }
        public string Pass
        {
            get { return pass; }
            set { pass = value; }
        }
        public string FullName
        {
            get { return fullname; }
            set { fullname = value; }
        }
        public string Sex
        {
            get { return sex; }
            set { sex = value; }
        }
        public string Birthday
        {
            get { return birth; }
            set { birth = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        public string Address
        {
            get { return add; }
            set { add = value; }
        }
        public string GroupUserId
        {
            get { return group; }
            set { group = value; }
        }
        public string BranchTypeId
        {
            get { return branchtype; }
            set { branchtype = value; }
        }
        public string BranchId
        {
            get { return branch; }
            set { branch = value; }
        }
        public string Note
        {
            get { return note; }
            set { note = value; }
        }
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        public string Mess
        {
            get { return mess; }
            set { mess = value; }
        }
        public string OK
        {
            get { return ok; }
            set { ok = value; }
        }
    }
    public class result
    {
        private string id="", content = "", mess = "";
        public string _id
        {
            set { id = value; }
            get { return id; }
        }
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
    public class feedback
    {
        private string code = "", name = "", material = "", compositon = "", quantity = "";
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
        public string Material
        {
            set { material = value; }
            get { return material; }
        }
        public string Compositon
        {
            set { compositon = value; }
            get { return compositon; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
    }
    public class category
    {
        private string type="",id = "", name = "";
        public string Type
        {
            set { type = value; }
            get { return type; }
        }
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
    }
    public class addProduct
    {
        private string id = "", codeid = "", productcode="", productname="", quantity="", price="", ok="";
        public string OK
        {
            set { ok = value; }
            get { return ok; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string CodeId
        {
            set { codeid = value; }
            get { return codeid; }
        }
        public string ProductCode
        {
            set { productcode = value; }
            get { return productcode; }
        }
        public string ProductName
        {
            set { productname = value; }
            get { return productname; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
    }
    public class role
    {
        private string code="", name="",arr="";
        private bool sview=false, sinsert=false, supdate=false, sdel=false;
        public bool View
        {
            set { sview = value; }
            get { return sview; }    
        }
        public bool Insert
        {
            set { sinsert = value; }
            get { return sinsert; }    
        }
        public bool Update
        {
            set { supdate = value; }
            get { return supdate; }    
        }
        public bool Del
        {
            set { sdel = value; }
            get { return sdel; }    
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
        public string Arr
        {
            set { arr = value; }
            get { return arr; }
        }
    }
    public class PriceDetail
    {
        private string id="",fromdate="", todate="",price ="", productid="";
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string FromDate
        {
            set { fromdate = value; }
            get { return fromdate; }    
        }
        public string ToDate
        {
            set { todate = value; }
            get { return todate; }    
        }
        public string Price
        {
            set { price = value; }
            get { return price; }    
        }
        public string ProductId
        {
            set { productid = value; }
            get { return productid; }
        }
    }
    public class Supplier
    {
        private string id = "", code = "", name = "", branchtype = "", add = "", phone = "", contactname = "", info = "";
        private string ok = "", mess = "";
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
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Address
        {
            set { add = value; }
            get { return add; }
        }
        public string Phone
        {
            set { phone = value; }
            get { return phone; }
        }
        public string ContactName
        {
            set { contactname = value; }
            get { return contactname; }
        }
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
        public string Info
        {
            set { info = value; }
            get { return info; }
        }
    }
    public class OrderDetail
    {
        private string id = "", orderid = "", proid = "", codeid = "", procode = "", proname = "", quantity = "", price = "", status = "", branchtype="";
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string OrderId
        {
            set { orderid = value; }
            get { return orderid; }
        }
        public string ProductId
        {
            set { proid = value; }
            get { return proid; }
        }
        public string CodeId
        {
            set { codeid = value; }
            get { return codeid; }
        }
        public string ProCode
        {
            set { procode = value; }
            get { return procode; }
        }
        public string ProName
        {
            set { proname = value; }
            get { return proname; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
        }
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
    }
    public class Combo
    {
        private string id = "",combocode="", comboid = "", branchtypeid = "", branchtypename = "", branchid = "", branchname = "", name = "", des = "", total = "", fromdate = "", todate = "";
        private string ok = "", mess = "";
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
        public string ComboCode
        {
            set { combocode = value; }
            get { return combocode; }
        }
        public string Total
        {
            set { total = value; }
            get { return total; }
        }
        public string FromDate
        {
            set { fromdate = value; }
            get { return fromdate; }
        }
        public string ToDate
        {
            set { todate = value; }
            get { return todate; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string ComboId
        {
            set { comboid = value; }
            get { return comboid; }
        }
        public string BranchTypeName
        {
            set { branchtypename = value; }
            get { return branchtypename; }
        }
        public string BranchName
        {
            set { branchname = value; }
            get { return branchname; }
        }
        public string BranchType
        {
            set { branchtypeid = value; }
            get { return branchtypeid; }
        }
        public string Branch
        {
            set { branchid = value; }
            get { return branchid; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Description
        {
            set { des = value; }
            get { return des; }
        }
    }
    public class ComboDetail
    {
        private string id = "",comboid="", codeid = "", procode = "", proname="", quantity="";
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string ComboId
        {
            set { comboid = value; }
            get { return comboid; }
        }
        public string CodeId
        {
            set { codeid = value; }
            get { return codeid; }
        }
        public string ProCode
        {
            set { procode = value; }
            get { return procode; }
        }
        public string ProName
        {
            set { proname = value; }
            get { return proname; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
    }
    public class HourGoldDetail
    {
        private string id = "",proid="", codeid = "", procode = "", proname = "";
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string ProductId
        {
            set { proid = value; }
            get { return proid; }
        }
        public string CodeId
        {
            set { codeid = value; }
            get { return codeid; }
        }
        public string ProCode
        {
            set { procode = value; }
            get { return procode; }
        }
        public string ProName
        {
            set { proname = value; }
            get { return proname; }
        }
        
    }
    public class Menu
    {
        private string id = "", branchtype = "", name = "", code = "", parent = "", position = "", link = "", status = "";
        private string ok = "", mess = "";
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
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Code
        {
            set { code = value; }
            get { return code; }
        }
        public string Parent
        {
            set { parent = value; }
            get { return parent; }
        }
        public string Link
        {
            set { link = value; }
            get { return link; }
        }
        public string Status
        {
            set { status= value; }
            get { return status; }
        }
        public string Position
        {
            set { position = value; }
            get { return position; }
        }
    }
    public class News
    {
        private string id = "", branchtype = "",title="", des = "", body = "", image = "", type = "", tag = "", status = "";
        private string ok = "", mess = "";
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
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
        public string Title
        {
            set { title = value; }
            get { return title; }
        }
        public string Description
        {
            set { des = value; }
            get { return des; }
        }
        public string Body
        {
            set { body = value; }
            get { return body; }
        }
        public string Type
        {
            set { type = value; }
            get { return type; }
        }
        public string Status
        {
            set { status = value; }
            get { return status; }
        }
        public string Tag
        {
            set { tag = value; }
            get { return tag; }
        }
    }
    public class Discount
    {
        private string id = "", branchtype = "", name = "", type = "", number = "", values = "", fromdate = "", todate = "", minorder = "";
        private string ok = "", mess = "";
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
        public string BranchType
        {
            set { branchtype = value; }
            get { return branchtype; }
        }
        public string Name
        {
            set { name = value; }
            get { return name; }
        }
        public string Type
        {
            set { type = value; }
            get { return type; }
        }
        public string Value
        {
            set { values = value; }
            get { return values; }
        }
        public string Number
        {
            set { number = value; }
            get { return number; }
        }
        public string FromDate
        {
            set { fromdate = value; }
            get { return fromdate; }
        }
        public string ToDate
        {
            set { todate = value; }
            get { return todate; }
        }
        public string MinOrder
        {
            set { minorder = value; }
            get { return minorder; }
        }
       
    }
    public class StockOutputInternalDetail
    {
        private string mess="", ok="", id = "", note = "", createat = "", createby = "",branchid="", branchfrom = "", branchto = "", proid = "", price ="", quantity="", proname="", codeid="", procode="";
        public string Mess
        {
            set { mess = value; }
            get { return mess; }
        }
        public string OK
        {
            set { ok = value; }
            get { return ok; }
        }
        public string ProCode
        {
            set { procode = value; }
            get { return procode; }
        }
        public string CodeId
        {
            set { codeid = value; }
            get { return codeid; }
        }
        public string ProId
        {
            set { proid = value; }
            get { return proid; }
        }
        public string Price
        {
            set { price = value; }
            get { return price; }
        }
        public string BranchId
        {
            set { branchid = value; }
            get { return branchid; }
        }
        public string BranchFrom
        {
            set { branchfrom = value; }
            get { return branchfrom; }
        }
        public string BranchTo
        {
            set { branchto = value; }
            get { return branchto; }
        }
        public string Id
        {
            set { id = value; }
            get { return id; }
        }
        public string Note
        {
            set { note = value; }
            get { return note; }
        }
        public string CreateAt
        {
            set { createat = value; }
            get { return createat; }
        }
        public string CreateBy
        {
            set { createby = value; }
            get { return createby; }
        }
        public string ProName
        {
            set { proname = value; }
            get { return proname; }
        }
        public string Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }
    }
}