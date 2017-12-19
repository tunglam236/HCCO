﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LastDay : System.Web.UI.Page
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
                txtFromDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                txtToDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                loadBranchType();
                loadBranch(dlBranchType.SelectedValue);
                lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
            }
        }
    }
    void loadBranchType()
    {
        dlBranchType.DataSource = from x in db.tBranchTypes
                                  where x.Status == 1
                                  select new { x.Id, x.Name };
        dlBranchType.DataTextField = "Name";
        dlBranchType.DataValueField = "Id";
        dlBranchType.DataBind();
        dlBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    void loadBranch(string branchTypeId)
    {
        dlBranch.DataSource = from x in db.tBranches
                              where x.Status == 1 && x.BranchTypeId == int.Parse(branchTypeId)
                              select new { x.Id, x.BranchName };
        dlBranch.DataTextField = "BranchName";
        dlBranch.DataValueField = "Id";
        dlBranch.DataBind();
        dlBranch.Items.Insert(0, new ListItem("Tất cả chi nhánh", ""));
        dlBranch.SelectedValue = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    protected void dlBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadBranch(dlBranchType.SelectedValue);
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());

    }
    protected void dlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbData.Text = loadBill(dlBranchType.SelectedValue, dlBranch.SelectedValue, txtFromDate.Text.Trim(), txtToDate.Text.Trim());
    }
    public string loadBill(string branchType, string branchId, string fromdate, string todate)
    {
        string outputType = "1";//xuat ban, 2//dieu chuyen
        string result = "", product=""; int i = 1;
        string fDate = "", tDate = "";
        if (fromdate.Trim() != "")
            fDate = cl.returnDatetime(fromdate.Trim());
        if (todate.Trim() != "")
            tDate = cl.returnDatetime(todate.Trim());
        if (fDate == "" || tDate == "")
        {
            fDate = ""; tDate = "";
        }
      
        //var m = db.sp_web_loadBill(branchType, branchId, fDate, tDate, outputType);
        var m = db.sp_web_baocaoxuathang(branchType.Trim(), branchId.Trim(), fDate, tDate);
        double total_discount = 0, total_revenue = 0;
        int total_code = 0;
        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchCode + "</td>";
            result += "<td>" + item.BranchName + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "<td>" + item.StockCode + "</td>";
            result += "<td>" + item.MemberCode + "</td>";
            result += "<td>" + item.MemberName + "</td>";
            result += "<td>" + item.Address + "</td>";
            result += "<td>" + item.Phone + "</td>";
            result += "<td>" + item.FullName + "</td>";
            result += "<td>" + item.Code + "</td>";
            result += "<td>" + item.Name + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td>" + item.UnitName + "</td>";
            result += "<td>" + item.Quantity.ToString() + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.Price.Value) + "</td>";
            result += "<td>" + item.DiscountPercent.ToString() + " %</td>";
            if(item.Discount.Value > 999)
                result += "<td>" + string.Format("{0:0,0}", item.Discount) + "</td>";
            else
                result += "<td>" + item.Discount.ToString() + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.TotalPrice) + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.TTPrice) + "</td>";
            result += "<td>" + item.TotalDiscountPercent.ToString() + " %</td>";
            if(item.TotalDiscount > 999)
                result += "<td>" + string.Format("{0:0,0}", item.TotalDiscount) + "</td>";
            else
                result += "<td>" + item.TotalDiscount.ToString() + "</td>";

            result += "<td>" + string.Format("{0:0,0}", item.Total_Price) + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.CustomePay) + "</td>";
            result += "<td>" + string.Format("{0:0,0}", item.CustomeReturn) + "</td>";
            result += "<td>" + item.PaymentType + "</td>";
            result += "<td>" + item.Note + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }

}