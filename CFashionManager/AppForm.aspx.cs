using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AppForm : System.Web.UI.Page
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
                loadStatus();
                lbData.Text = loadForm(int.Parse(rdStatus.SelectedValue), int.Parse(rdUser.SelectedValue));
            }
        }
    }
    void loadStatus()
    {
        rdUser.DataSource = from x in db.tGroupUsers
                            from y in db.tAccounts
                            where x.Id == y.GroupUserId && y.Status != 0
                            && x.GroupCode == "DESIGN"
                            select new { y.Id, y.FullName };
        rdUser.DataTextField = "FullName";
        rdUser.DataValueField = "Id";
        rdUser.DataBind();
        rdUser.Items.Insert(0, new ListItem("Tất cả", "0"));
        rdUser.SelectedIndex = 0;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(int.Parse(rdStatus.SelectedValue), int.Parse(rdUser.SelectedValue));
    }
    public string loadForm(int status, int user)
    {
        string result = ""; int i = 1;
        string label = "";
        var user_id = Session["cm_userId"].ToString();

        var m = db.sp_web_loadFormApproved(status, user, int.Parse(user_id), 1);

        foreach (var item in m.ToList())
        {
            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.FormId.ToString() + "\",\"" + item.ProductTypeName.ToString() + "\",\"" + item.Code + "\",\"" + item.Name + "\",\"" + item.Month + "\",\"" + item.ColorName + "\",\"" + item.Description + "\",\"" + item.FullName + "\"," + item.StatusId.ToString() + ");' id='delete" + item.FormId.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.ApprovedStatus.Value == 1) label = "blink label label-success";
            else if (item.ApprovedStatus.Value == 2) label = "label label-primary";
            else if (item.ApprovedStatus.Value == 3) label = "label label-danger";

            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Month + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "<td>" + item.ApproName + "</td>";
            result += "<td>" + item.ApprovedAt + "</td>";
            result += "<td>" + item.ApprovedNote + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}