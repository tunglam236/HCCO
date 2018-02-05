using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Maps : System.Web.UI.Page
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
                lbData.Text = loadForm(rdStatus.SelectedValue);
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(rdStatus.SelectedValue);
    }
    public string loadForm(string status)
    {
        string result = ""; int i = 1;
        string label = "";

        var m = db.sp_web_loadMaps(status);

        int edit = 0;
        foreach (var item in m.ToList())
        {
            if (item.StatusId == 1)//chua nhap
                edit = 1;
            else
                edit = 0;

            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.FormId.ToString() + "\",\"" + item.FormName + " | " + item.FormCode + " - " + item.DesignBy + "\",\"" + item.UserReceiverId.ToString() + "\",\"" + item.DateReceiver + "\",\"" + item.Note + "\"," + edit + ");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.StatusId == 1)
                label = "blink label label-success";
            else label = "label label-primary";

            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.DateReceiver + "</td>";
            result += "<td>" + item.UserReceiver + "</td>";
            result += "<td>" + item.FormCode + " - " + item.FormName + "</td>";
            result += "<td>" + item.DesignBy + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}