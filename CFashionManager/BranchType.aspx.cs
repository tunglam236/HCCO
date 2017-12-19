using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BranchType : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["cm_branchTypeId"])))
            {
                Response.Redirect("/login");
            }
            else
                lbData.Text= loadBranchType();
        }
    }
    public string loadBranchType()
    {
        string result = ""; int i = 1;

        var m = from x in db.tBranchTypes
                from y in db.tAccounts
                where x.CreateBy == y.Id && x.Status == 1
                select new { x.Id, x.Code, x.Name, x.Website,x.Facebook,x.Instagram, x.Description, x.CreateAt, y.FullName };

        foreach (var item in m.ToList())
        {
            result += "<tr data-toggle='modal' data-target='#addBranch' class='detail-rows' onclick='updateBranch_modal(\"" + item.Id.ToString() + "\",\"" + item.Code.Replace("'", ".") + "\",\"" + item.Name.Replace("'", ".") + "\",\"" + item.Website + "\",\""+item.Facebook+ "\",\"" + item.Instagram+ "\",\"" + item.Description + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Website + "</td>";
            result += "<td>" + item.Facebook + "</td>";
            result += "<td>" + item.Instagram + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}