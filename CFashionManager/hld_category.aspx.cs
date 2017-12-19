using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hld_category : System.Web.UI.Page
{
    HoldingsDataContext db = new HoldingsDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["cm_branchTypeId"])))
            {
                Response.Redirect("/login");
            }
            else
            {
                lbData.Text = loadCategory();
            }
        }
    }

    public string loadCategory()
    {
        string result = ""; int i = 1;

        var m = from x in db.tCategories select new { x.Id,x.Caption,x.Content, x.IsActive};

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#updateModal' class='detail-rows' onclick='showDetail(" + item.Id.ToString() + ");' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td width='250px'>" + item.Caption + "</td>";
            result += "<td>" + item.Content + "</td>";
            if(item.IsActive.Value)
                result += "<td width='80px'>" + "Hiển thị" + "</td>";
            else result += "<td width='80px'>" + "Không hiển thị" + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
    [WebMethod]
    public static result updateCategory(string id, string cap, string content, string active)
    {
        var r = new result();
        try
        {
            HoldingsDataContext db = new HoldingsDataContext();

            var b = from x in db.tCategories where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Caption = cap.Trim();
                b.FirstOrDefault().Content = content.Trim();
                b.FirstOrDefault().IsActive = active.Trim() == "1" ? true : false;
                b.FirstOrDefault().ModifiedAt = DateTime.Now;
                b.FirstOrDefault().ModifedBy = int.Parse(HttpContext.Current.Session["cm_userId"].ToString());
                db.SubmitChanges();

                r._content = "1";
            }
            else
            {
                r._content = "0";
                r._mess = "Không tìm thấy dữ liệu, hãy thử lại";
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
    public static result getCategoryDetail(string id)
    {
        var r = new result();
        try
        {
            HoldingsDataContext db = new HoldingsDataContext();

            var b = from x in db.tCategories where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                r._ok = "1";
                r._id = b.FirstOrDefault().Caption;
                r._mess = b.FirstOrDefault().Content;
                r._content = b.FirstOrDefault().IsActive.Value ? "1" : "0";
            }
            else
            {
                r._ok = "0";
                r._mess = "Không tìm thấy dữ liệu, hãy thử lại";
            }
        }
        catch (Exception ax)
        {
            r._ok = "0";
            r._mess = "Có lỗi khi lưu thông tin, chi tiết: " + ax.Message;
        }
        return r;
    }
    public class result
    {
        private string id = "", content = "", mess = "", ok = "";
        public string _ok
        {
            set { ok = value; }
            get { return ok; }
        }
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
}