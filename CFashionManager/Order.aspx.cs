using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
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
                txtFromDate.Text = txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                lbData.Text = loadOrder(rdBranchType.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
            }
        }
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadOrder(rdBranchType.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }

    public string loadOrder(string branchType, string fromdate, string todate)
    {
        string result = ""; int i = 1;

        string fDate = "", tDate = "";
        if (fromdate.Trim() != "")
            fDate = cl.returnDatetime(fromdate.Trim());
        if (todate.Trim() != "")
            tDate = cl.returnDatetime(todate.Trim());

        if (fDate == "" || tDate == "")
        {
            fDate = ""; tDate = "";
            txtFromDate.Text = "";
            txtToDate.Text = "";
        }
        if (fDate != "" && tDate != "")
        {
            var m = db.sp_web_loadOrder(branchType, DateTime.Parse(fDate), DateTime.Parse(tDate));

            foreach (var item in m.ToList())
            {
                result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
                result += "<td class='center childrows'></td>";
                result += "<td>" + item.BranchName + "</td>";
                result += "<td>" + item.CreateAt + "</td>";
                result += "<td>" + item.OrderCode + "</td>";
                result += "<td>" + item.CustomerName + "</td>";
                result += "<td>" + item.Phone + "</td>";
                result += "<td>" + item.Email + "</td>";
                result += "<td>" + item.Address + "</td>";
                result += "<td>" + item.Note + "</td>";
                result += "<td>" + item.Status + "</td>";
                result += "</tr>";
                i++;
            }
        }
        return result;
    }
}