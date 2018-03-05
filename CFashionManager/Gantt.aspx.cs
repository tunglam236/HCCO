using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Grantt : System.Web.UI.Page
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
                loadUser();
                lbData.Text = loadForm();
            }
        }
    }
    void loadUser()
    {
        dlUserReceiver.Items.Clear();
        dlUserReceiver.Items.Add(new ListItem("Tất cả", ""));

        var user_id = int.Parse(Session["cm_userId"].ToString());

        var us = db.sp_Gantt_LoadUser(user_id);
        foreach (var item in us.ToList())
        {
            dlUserReceiver.Items.Add(new ListItem(item.FullName, item.Id.ToString()));
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm();
    }
    public string loadForm()
    {
        string result = ""; int i = 1;
        string label = "";
        var user_id = Session["cm_userId"].ToString();
        string fdate = "", tdate = "", fromdate = "", todate = "";
        if (txtFromDate.Text.Trim() != "") fromdate = txtFromDate.Text.Trim();
        if (txtToDate.Text.Trim() != "") todate = txtToDate.Text.Trim();

        if (fromdate != "" && todate != "") {
            fdate = cl.returnDatetime(fromdate); tdate = cl.returnDatetime(todate);
        }
        var m = db.sp_Gantt_load(user_id, dlUserReceiver.SelectedValue, dlStatus.SelectedValue, fdate, tdate);
        string comp = "", module = "", remove = "", complete = "";
        foreach (var item in m.ToList())
        {
            complete = "";
            if (item.IdUserReceiver.ToString() == user_id && item.Status==1 && item.ModuleId==null) complete = "1";

            comp = "";
            if (item.CompleteDate != null) comp = item.CompleteDate.Value.ToString("dd/MM/yyyy");
            module = "";
            if (item.ModuleId != null) module = item.ModuleId.ToString();
            remove = "";
            if (item.IdUser.ToString() == user_id && item.ModuleId==null && item.Status==1)
                remove = "1";

            result += "<tr id='job" + item.Id.ToString() + "' data-toggle='modal' data-target='#updateJob' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.CreateBy + "\",\"" + item.IdUser + "\",\"" + user_id + "\",\"" + item.CreateAt.Value.ToString("dd/MM/yyyy") + "\",\"" + item.StartDate.Value.ToString("dd/MM/yyyy") + "\",\"" + item.ExpectDate.Value.ToString("dd/MM/yyyy") + "\",\"" + comp + "\",\"" + item.FullName + "\",\"" + item.Name + "\",\"" + item.Note + "\",\"" + item.Comment + "\",\"" + item.Status + "\",\"" + module + "\",\"" + remove + "\",\""+ complete + "\");' class='detail-rows' title='Click để xem chi tiết'>";
            result += "<td class='center'><label class='label label-warning'>Xem</label></td>";
            if (item.Status.Value == 1)
                label = "blink label label-success";
            else if (item.Status.Value == 2)
                label = "label label-primary";
            else label = "label label-danger";

            result += "<td><label class='" + label + "'>" + item.StatusName + "</label></td>";
            result += "<td>" + item.CreateBy+ "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.Name + "</td>";

            result += "<td>" + item.StartDate.Value.ToString("dd/MM/yyyy") + "</td>";
            result += "<td>" + item.ExpectDate.Value.ToString("dd/MM/yyyy") + "</td>";

            if (item.CompleteDate != null)
                result += "<td>" + item.CompleteDate.Value.ToString("dd/MM/yyyy") + "</td>";
            else
                result += "<td></td>";
            result += "<td>" + item.Data + "</td>";
            result += "<td>" + item.Comment + "</td>";
            result += "<td>" + item.Note + "</td>";
            
            result += "</tr>";
            i++;
        }
        return result;
    }
}