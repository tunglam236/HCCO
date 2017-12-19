using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendReport : System.Web.UI.Page
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
            {
                loadBranchType();
                loadUser(rdBranchType.SelectedValue);
                lbData.Text = loadReport(rdBranchType.SelectedValue, rdUser.SelectedValue);
            }
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        lbData.Text = loadReport(rdBranchType.SelectedValue, rdUser.SelectedValue);
    }
    void loadBranchType()
    {
        rdBranchType.DataSource = from x in db.tBranchTypes
                                  where x.Status == 1
                                  select new { x.Id, x.Name };
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    void loadUser(string branchType)
    {
        rdUser.DataSource = from x in db.tAccounts
                            where x.Status == 1 && x.BranchTypeId == int.Parse(branchType.Trim())
                            select new { x.Id, Name = x.Username.ToUpper() + " | " + x.FullName.ToUpper() };
        rdUser.DataTextField = "Name";
        rdUser.DataValueField = "Id";
        rdUser.DataBind();
        rdUser.Items.Insert(0, new ListItem("TẤT CẢ", ""));
        rdUser.SelectedIndex = 0;
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadUser(rdBranchType.SelectedValue);
    }
    public string loadReport(string branchType, string user)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_SendReport(branchType, user);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='send" + item.Id.ToString() + "'>";
            result += "<td class='center algn'>" + i.ToString() + "</td>";
            result += "<td class='algn'>" + item.BranchName + "</td>";
            result += "<td class='algn'>" + item.Username + "</td>";
            result += "<td class='algn'>" + item.FullName + "</td>";
            result += "<td class='algn'>" + item.ReportName + "</td>";
            result += "<td><input type='text' class='form-control' style='width:80px;' id='id_" + item.Id.ToString() + "' value='" + item.TimeSend + "'></td>";
            result += "<td <div class='btn-group'><button type='button' title='Cập nhật thời gian gửi báo cáo' class='btn btn-sm btn-success' onclick='update(" + item.Id.ToString() + ")'>Cập nhật</button>";
            result += "<button type='button' class='btn btn-sm btn-success' title='Xóa báo cáo này' onclick='remove(" + item.Id.ToString() + ")'>Xóa</button></div></td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}