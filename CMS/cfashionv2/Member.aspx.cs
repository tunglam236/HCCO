using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string param = "";
            if (!string.IsNullOrEmpty(Request.QueryString["t"]))
                param = Request.QueryString["t"];

            pnInfo.Visible = param == "" || param == "0";
            pnLike.Visible = param == "1";
            pnOrder.Visible = param == "2";
            pnScore.Visible = param == "3";
            pnBuy.Visible = param == "4";

            if (!string.IsNullOrEmpty(Convert.ToString(Session["cf_mbuser_id"])) &&
            (string.IsNullOrEmpty(Request.QueryString["t"]) || Request.QueryString["t"] == "0"))
            {
                
                loadInfoMember();
            }
            if (!string.IsNullOrEmpty(Convert.ToString(Session["cf_mbuser_id"])))
               lbMess.Text = "";
            else lbMess.Text = "<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>x</button><b>Thông báo ! </b><div id='lbmessage' style='display: inline; padding: 10px;'>Phiên đăng nhập hết hạn, vui lòng đăng nhập lại !</div></div>";
            
        }
    }
    private void loadInfoMember()
    {
        try
        {
            CFManagerDataContext db = new CFManagerDataContext();
            var item = from n in db.tMembers where n.BranchTypeId == branchTypeId && n.Id == int.Parse(Session["cf_mbuser_id"].ToString()) select n;
            if (item.Count() > 0)
            {
                l_name.InnerText = m_name.Value = Convert.ToString(item.FirstOrDefault().MemberName);
                if (item.FirstOrDefault().Birthday != null)
                    l_birth.InnerText = m_birth.Value = item.FirstOrDefault().Birthday.Value.ToString("dd/MM/yyyy");
                else l_birth.InnerText = m_birth.Value = "";

                l_email.InnerText = m_email.Value = Convert.ToString(item.FirstOrDefault().Email);
                l_sex.InnerText = item.FirstOrDefault().Sex.Value.ToString() == "False" ? "Nữ" : "Nam";
                l_phone.InnerText = m_phone.Value = Convert.ToString(item.FirstOrDefault().Phone);

                dl_sex.Items.FindByValue(item.FirstOrDefault().Sex.ToString() == "False" ? "0" : "1").Selected = true;

                l_p_add.InnerText = p_add.Value = Convert.ToString(item.FirstOrDefault().p_add);
                l_p_country.InnerText = Convert.ToString(item.FirstOrDefault().p_countryname);
                l_p_district.InnerText = Convert.ToString(item.FirstOrDefault().p_districtname);
                l_p_name.InnerText = p_name.Value = Convert.ToString(item.FirstOrDefault().p_name);
                l_p_phone.InnerText = p_phone.Value = Convert.ToString(item.FirstOrDefault().p_phone);

                if (item.FirstOrDefault().r_countryid != null)
                    hd_r_countryId.Value = Convert.ToString(item.FirstOrDefault().r_countryid);

                if (item.FirstOrDefault().r_districtid != null)
                    hd_r_districtId.Value = Convert.ToString(item.FirstOrDefault().r_districtid);

                if (item.FirstOrDefault().p_countryid != null)
                    hd_p_countryId.Value = Convert.ToString(item.FirstOrDefault().p_countryid);

                if (item.FirstOrDefault().p_districtid != null)
                    hd_p_districtId.Value = Convert.ToString(item.FirstOrDefault().p_districtid);

                r_dlcountry.DataSource = from n in db.tCountries where n.ParentId == -1 && n.IsActive == true select new { n.Id, n.CountryName };
                r_dlcountry.DataTextField = "CountryName";
                r_dlcountry.DataValueField = "Id";
                r_dlcountry.DataBind();
                r_dlcountry.Items.Insert(0, new ListItem("Vui lòng chọn", ""));
                if (item.FirstOrDefault().r_countryid != null)
                {
                    r_dlcountry.Items.FindByValue(item.FirstOrDefault().r_countryid.ToString()).Selected = true;
                }

                p_dlcountry.DataSource = from n in db.tCountries where n.ParentId == -1 && n.IsActive == true select new { n.Id, n.CountryName };
                p_dlcountry.DataTextField = "CountryName";
                p_dlcountry.DataValueField = "Id";
                p_dlcountry.DataBind();
                p_dlcountry.Items.Insert(0, new ListItem("Vui lòng chọn", ""));
                if (item.FirstOrDefault().p_countryid != null)
                {
                    p_dlcountry.Items.FindByValue(item.FirstOrDefault().p_countryid.ToString()).Selected = true;
                }

                l_r_add.InnerText = r_add.Value = Convert.ToString(item.FirstOrDefault().r_add);
                l_r_country.InnerText = Convert.ToString(item.FirstOrDefault().r_countryname);
                l_r_district.InnerText = Convert.ToString(item.FirstOrDefault().r_districtname);
                l_r_name.InnerText = r_name.Value = Convert.ToString(item.FirstOrDefault().r_name);
                l_r_phone.InnerText = r_phone.Value = Convert.ToString(item.FirstOrDefault().r_phone);

            }
        }
        catch
        {
            Response.Redirect("/notfound");
        }
    }
    public string loadOrderRecent()
    {
        string result = "";
        try
        {
           
            if (!string.IsNullOrEmpty(Convert.ToString(Session["cf_mbuser_id"])) &&
                (string.IsNullOrEmpty(Request.QueryString["t"]) || Request.QueryString["t"] == "0"))
            {
                CFManagerDataContext db = new CFManagerDataContext();
                var x = db.sp_web_cf_mb_getorder_recent(Session["cf_mbuser_id"].ToString());
                foreach (var item in x.ToList())
                {
                    result += "<tr><td class='text-center'>";
                    result += item.OrderCode + "</td><td class='text-center'>";
                    result += item.CreatedAt.Value.ToString("dd/MM/yyyy") + "<td class='text-right'>" + string.Format("{0:0,0}", item.Total.Value);
                    result += "</td><td class='text-center'>" + item.Status;
                    result += "</td></tr>";

                }
            }
            else
            {
                result += "<tr><td colspan='4'>Không có dữ liệu nào</td></tr>";
            }
        }
        catch
        {
            Response.Redirect("/notfound");
        }
        return result;
    }
}