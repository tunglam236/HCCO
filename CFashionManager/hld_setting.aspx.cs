using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hld_setting : System.Web.UI.Page
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
                lbData.Text = loadSetting();
            }
        }
    }
   
    public string loadSetting()
    {
        string result = ""; int i = 1;

        var m = from x in db.tSettings select x;

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#updateModal' class='detail-rows' onclick='showDetail(" + item.Id.ToString() + ");' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td width='100px'>" + item.Code + "</td>";
            result += "<td width='150px'>" + item.Title1 + "</td>";
            result += "<td width='200px'>" + item.Title2 + "</td>";
            result += "<td>" + item.Title3 + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
    [WebMethod]
    public static result updateSetting(string id, string tit1, string tit2, string tit3)
    {
        var r = new result();
        try
        {
            HoldingsDataContext db = new HoldingsDataContext();

            var b = from x in db.tSettings where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                b.FirstOrDefault().Title1 = tit1.Trim();
                b.FirstOrDefault().Title2 = tit2.Trim();
                b.FirstOrDefault().Title3 = tit3.Trim();
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
    public static result getSettingDetail(string id)
    {
        var r = new result();
        try
        {
            HoldingsDataContext db = new HoldingsDataContext();

            var b = from x in db.tSettings where x.Id == int.Parse(id.Trim()) select x;
            if (b.Count() > 0)
            {
                r._ok = "1";
                r._id = b.FirstOrDefault().Title1;
                r._mess = b.FirstOrDefault().Title2;
                r._content = b.FirstOrDefault().Title3;
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
        private string id = "", content = "", mess = "", ok="";
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