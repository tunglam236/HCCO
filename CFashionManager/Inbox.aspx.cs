using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inbox : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
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
               lbData.Text= loadMember();
        }
    }
    
    public string loadMember()
    {
        string result = ""; int i = 1;

        var m = db.sp_mail_list();

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.mailitem_id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + item.mailitem_id.ToString() + "</td>";
            result += "<td>" + item.subject + "</td>";
            result += "<td>" + item.recipients + "</td>";
            result += "<td>" + item.send_request_date.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "<td>" + item.sent_date.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "<td>" + item.sent_status + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}