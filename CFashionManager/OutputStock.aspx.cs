using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OutputStock : System.Web.UI.Page
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

                loadBranch(rdBranchType.SelectedValue);

                txtFromDate.Text = txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                lbData.Text = loadBill(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim(), rdOutputType.SelectedValue);
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
    void loadBranch(string branchTypeId)
    {
        rdBranch.DataSource = from x in db.tBranches
                                  where x.Status == 1 && x.BranchTypeId == int.Parse(branchTypeId)
                                  select new { x.Id, x.BranchName };
        rdBranch.DataTextField = "BranchName";
        rdBranch.DataValueField = "Id";
        rdBranch.DataBind();
        rdBranch.SelectedIndex = 0;
        rdBranch.Items.Insert(0, new ListItem("Tất cả", ""));
        rdBranch.SelectedValue = "";
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(rdBranchType.SelectedValue);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadBill(rdBranchType.SelectedValue, rdBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim(), rdOutputType.SelectedValue);
    }
    public string loadBill(string branchType, string branchId, string fromdate, string todate, string outputType)
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
        var m = db.sp_web_loadBill(branchType, branchId, fDate, tDate, outputType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' title='Click để xem chi tiết'>";
            result += "<td class='center'><a href='#' class='btn btn-xs btn-success showchild' id='" + item.Id.ToString() + "'>Xem</a>";
            if (item.OutputType.Equals("Xuất điều chuyển"))
                result += " <a target='_blank' href='/printoutputstock/" + item.Id.ToString() + "' class='btn btn-xs btn-success'>In</a>";
            result += "</td>";
            result += "<td>" + item.StockCode + "</td>";
            result += "<td>" + item.OutputType + "</td>";
            result += "<td>" + item.ObjectReceiver + "</td>";
            result += "<td>" + item.ObjectName + "</td>";
            result += "<td class='right'>" + (item.Total.Value > 999 ? string.Format("{0:0,0}", item.Total.Value) : item.Total.ToString()) + "</td>";
            result += "<td class='center'>" + item.DiscountPercent.ToString() + "%</td>";
            result += "<td class='right'>" + (item.TotalDiscount.Value > 999 ? string.Format("{0:0,0}", item.TotalDiscount.Value) : item.TotalDiscount.ToString()) + "</td>";
            result += "<td class='right'>" +(item.TotalPrice.Value >999 ? string.Format("{0:0,0}", item.TotalPrice.Value) : item.TotalPrice.ToString()) + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "<td>" + item.PaymentType + "</td>";
            result += "<td class='center'>" + item.CreateAt.Value.ToString("dd/MM/yyyy") + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }

}