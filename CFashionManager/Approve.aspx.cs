using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Approve : System.Web.UI.Page
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
            {
                lbData.Text = loadForm();
            }
        }
    }
    public string loadForm()
    {
        string result = ""; int i = 1;
        var color = new string[] { "label label-default", "label label-primary", "label label-success", "label label-danger" };
        var m = from x in db.tConfigApproves
                from y in db.tAccounts
                where x.AproveBy == y.Id
                orderby x.tTable, x.Level
                select new { x.Id, x.AproveBy, x.tTable,x.tTableName, x.Level, y.FullName };

        foreach (var item in m.ToList())
        {
            result += "<tr id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.tTable + "</td>";
            result += "<td>" + item.tTableName + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td><label class='" + color[item.Level.Value] + "'>Cấp " + item.Level + "</label></td>";
            result += "<td><a href='#' data-toggle='modal' data-target='#addDept' class='label label-success' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.tTable + "\",\"" + item.tTableName + "\",\"" + item.AproveBy.ToString() + "\",\"" + item.Level.ToString() + "\");'>Chỉnh sửa</a>";
            result += "&nbsp;<a href='#' data-toggle='modal' data-target='#addDept' class='label label-primary' onclick='addLevel(\"" + item.tTable + "\",\"" + item.tTableName + "\");'>Thêm cấp</a></td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}