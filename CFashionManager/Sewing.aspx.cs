using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sewing : System.Web.UI.Page
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(int.Parse(rdStatus.SelectedValue), int.Parse(rdUser.SelectedValue));
    }
    void loadStatus()
    {
        rdUser.DataSource = from x in db.tGroupUsers
                            from y in db.tAccounts
                            where x.Id == y.GroupUserId && y.Status != 0
                            && x.GroupCode == "MM"
                            select new { y.Id, y.FullName };
        rdUser.DataTextField = "FullName";
        rdUser.DataValueField = "Id";
        rdUser.DataBind();
        rdUser.Items.Insert(0, new ListItem("Tất cả", "0"));
        rdUser.SelectedIndex = 0;
    }
    public string loadForm(int status, int userId)
    {
        string result = ""; int i = 1;
        string label = "";

        var m = db.sp_web_loadSewing(status, userId);

        int edit = 0, complete = 0;
        foreach (var item in m.ToList())
        {
            if (item.StatusId == 1)//chua ai nhan mau thi dc phep chon mau
                edit = 1;
            else
                edit = 0;

            if (item.DateCut != null && item.DateComplete == null)//dang cat thi duoc hoan thanh mau
                complete = 1;
            else
                complete = 0;

            result += "<tr  data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.FormId.ToString() + "\",\"" + item.ProductTypeName + "\",\"" + item.Code + "\",\"" + item.Name + "\",\"" + item.Month + "\",\"" + item.ColorName + "\",\"" + item.Description + "\",\"" + item.FullName + "\"," + edit + ",\"" + complete + "\");' id='delete" + item.FormId.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.StatusId == 0) label = "label label-8";
            else if (item.StatusId == 1) label  = "blink label label-success";
            else if (item.StatusId == 2 || item.StatusId==4) label = "label label-warning";
            else if (item.StatusId == 3) label = "label label-primary";

            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.UserCut + "</td>";
            result += "<td>" + item.DateCut + "</td>";
            result += "<td>" + item.DateComplete + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.Month + "</td>";
            result += "<td>" + item.ColorName + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}