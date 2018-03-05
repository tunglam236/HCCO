using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KCSManufacture : System.Web.UI.Page
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
                rdSupplier.DataSource = (from x in db.tKCSManufactures
                                         from y in db.tSuppliers
                                         where x.SupplierId == y.Id && y.Status != 0
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
    public string loadForm(string status, string supplier)
    {
        string result = ""; int i = 1;
        string label = "";

        var m = db.sp_web_loadKCSManufacture(status.Trim(), supplier.Trim());

        byte edit = 0;
        foreach (var item in m.ToList())
        {
            edit = item.StatusId.Value;

            result += "<tr data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.FormId.ToString() + "\",\"" + item.FormName + " | " + item.FormCode + " - " + item.DesignName + "\",\"" + item.SupplierName + "\"," + edit + ");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";

            if (item.StatusId == 1)
                label = "blink label label-success";
            else if (item.StatusId == 2) label = "label label-primary";
            else label = "label label-warning";

            result += "<td><label class='" + label + "'>" + item.Status + "</label></td>";
            result += "<td>" + item.SupplierName + "</td>";
            result += "<td>" + item.KCSName + "</td>";
            result += "<td>" + item.CompleteAt + "</td>";
            result += "<td>" + item.FormCode + " - " + item.FormName + "</td>";
            result += "<td>" + item.DesignName + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}