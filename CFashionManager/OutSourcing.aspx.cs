using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OutSourcing : System.Web.UI.Page
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
                rdSupplier.DataSource = (from x in db.tOutSourcings
                                    from y in db.tSuppliers
                                    where x.SupplierId== y.Id && y.Status != 0
                                    select new { y.Id, y.SupplierName }).Distinct();
                rdSupplier.DataTextField = "SupplierName";
                rdSupplier.DataValueField = "Id";
                rdSupplier.DataBind();
                rdSupplier.Items.Insert(0, new ListItem("Tất cả", ""));
                rdSupplier.SelectedIndex = 0;

                lbData.Text = loadForm(rdStatus.SelectedValue, rdSupplier.SelectedValue);
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadForm(rdStatus.SelectedValue, rdSupplier.SelectedValue);
    }
    public string loadForm(string status,string supplier)
    {
        string result = ""; int i = 1;
        string label = "";

        var m = db.sp_web_loadOutSourcing(status.Trim(), supplier.Trim());

        byte edit = 0;
        foreach (var item in m.ToList())
        {
            edit = item.StatusId.Value;

            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.FormId.ToString() + "\",\"" + item.FormName + " | " + item.FormCode + " - " + item.DesignBy + "\",\"" + item.DateCreate + "\",\"" + item.DateExpect + "\",\"" + item.SupplierId + "\",\"" + item.Note + "\"," + edit + ");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.StatusId == 1)
                label = "blink label label-success";
            else label = "label label-primary";

            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.SupplierName + "</td>";
            result += "<td>" + item.DateCreate + "</td>";
            result += "<td>" + item.DateExpect + "</td>";
            result += "<td>" + item.DateReceiver + "</td>";
            result += "<td>" + item.FormCode + " - " + item.FormName + "</td>";
            result += "<td>" + item.DesignBy + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "<td>" + item.CutUserBy + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}