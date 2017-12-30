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
                lbData.Text = loadForm(byte.Parse(rdStatus.SelectedValue), int.Parse(rdUser.SelectedValue));
            }
        }
    }
    void loadStatus()
    {
        rdStatus.Items.Add(new ListItem("Chờ duyệt", "1"));
        rdStatus.Items.Add(new ListItem("Đã duyệt", "2"));
        rdStatus.SelectedValue = "1";


        rdUser.DataSource = from x in db.tGroupUsers from y in db.tAccounts
                                  where x.Id==y.GroupUserId && y.Status != 0
                                  && x.GroupCode=="DESIGN"
                                  select new { y.Id, y.FullName };
        rdUser.DataTextField = "FullName";
        rdUser.DataValueField = "Id";
        rdUser.DataBind();
        rdUser.Items.Insert(0, new ListItem("Tất cả", "0"));
        rdUser.SelectedIndex = 0;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(byte.Parse(rdStatus.SelectedValue), int.Parse(rdUser.SelectedValue));
    }
    public string loadForm(byte status, int user)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadFormApproved(status,user);

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.FormId.ToString() + "\",\"" + item.ProductTypeName.ToString() + "\",\"" + item.Code + "\",\"" + item.Name + "\",\"" + item.Month + "\",\"" + item.Description + "\",\"" + item.FullName + "\"," + status.ToString() + ");' id='delete" + item.FormId.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td><label class='label label-sm label-success'>" + item.Status + "</label></td>";
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