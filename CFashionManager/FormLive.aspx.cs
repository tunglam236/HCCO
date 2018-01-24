using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FormLive : System.Web.UI.Page
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
                lbData.Text = loadForm(rdUser.SelectedValue, rdStatus.SelectedValue);
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(rdUser.SelectedValue, rdStatus.SelectedValue);
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
        rdUser.Items.Insert(0, new ListItem("Tất cả", ""));
        rdUser.SelectedIndex = 0;
    }
    public string loadForm(string userId, string status)
    {
        string result = ""; int i = 1;
        string label = "";
        var m = db.sp_web_loadFormLive(userId, status);

        int edit = 0, complete = 0;
        foreach (var item in m.ToList())
        {
            if (item.ApprovedStatus == 1)//chua ai nhan kiem thi
                complete = 1;
            else
                complete = 0;

            if (item.ApprovedStatus == 4)//neu phai sua lai thi moi hoan thanh mau
                edit = 1;
            else
                edit = 0;

            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.FormId.ToString() + "\",\"" + item.Code + "\",\"" + item.Name + "\",\"" + item.Month + "\",\"" + item.ColorName + "\",\"" + item.Description + "\",\"" + item.FullName + "\"," + complete + ",\"" + edit + "\");' id='delete" + item.FormId.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.ApprovedStatus == 1) label = "blink label label-success";
            else if (item.ApprovedStatus == 2) label = "label label-primary";
            else if (item.ApprovedStatus == 3) label = "label label-warning";
            else if (item.ApprovedStatus == 4) label = "label label-8";

            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.ApprovedBy + "</td>";
            result += "<td>" + item.CompleteDate + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Month + "</td>";
            result += "<td>" + item.ColorName + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.ApprovedContent + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}