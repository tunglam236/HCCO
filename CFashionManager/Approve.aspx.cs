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
        var color = new string[] { "label label-default", "label label-primary", "label label-success", "label label-danger", "label label-warning", "label label-info", "label label-6", "label label-7","label label-8" };
        var m = db.sp_web_loadConfigApprove();

        foreach (var item in m.ToList())
        {
            result += "<tr id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.tTable + "</td>";
            result += "<td>" + item.tTableName + "</td>";
            if(item.GroupCode!=null)
                result += "<td>" + item.GroupCode + " | " + item.GroupName + "</td>";
            else
                result += "<td>---</td>";

            if (item.Username != null)
                result += "<td>" + item.Username + " | " + item.FullName + "</td>";
            else
                result += "<td>---</td>";
            result += "<td><label class='" + color[item.Level.Value >8 ? item.Level.Value % 8 : item.Level.Value] + "'>Cấp " + item.Level + "</label></td>";
            result += "<td><a href='#' data-toggle='modal' data-target='#addDept' class='label label-success' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.tTable + "\",\"" + item.tTableName + "\",\""+item.GroupApproveBy.ToString()+"\",\"" + item.AproveBy.ToString() + "\",\"" + item.Level.ToString() + "\",\"" + item.LevelName + "\");'>Chỉnh sửa</a>";
            result += "&nbsp;<a href='#' data-toggle='modal' data-target='#addDept' class='label label-primary' onclick='addLevel(\"" + item.tTable + "\",\"" + item.tTableName + "\");'>Thêm cấp</a></td>";
            result += "<td>" + item.LevelName + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}