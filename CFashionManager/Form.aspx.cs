using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form : System.Web.UI.Page
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
        string label = "";
        var m = db.sp_web_loadForm();

        var edit = 0;
        foreach (var item in m.ToList())
        {
            if (item.CreateBy.Value.ToString() == Session["cm_userId"].ToString() && item.StatusId.Value==1)
                edit = 1;
            else
                edit = 0;
            result += "<tr  data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.FormId.ToString() + "\",\"" + item.ProductTypeId.ToString() + "\",\"" + item.Code + "\",\"" + item.Name + "\",\"" + item.Month + "\",\"" + item.Description + "\"," + edit + ");' id='delete" + item.FormId.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.StatusId.Value == 1) label = "label-success";
            else if (item.StatusId.Value == 2) label = "label-primary";
            else if (item.StatusId.Value == 3) label = "label-danger";

            result += "<td><label class='label " + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Month + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}