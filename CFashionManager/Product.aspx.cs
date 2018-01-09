using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;
//using Excel = Microsoft.Office.Interop.Excel;
using System.IO;

public partial class Product : System.Web.UI.Page
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

                loadProductType(rdBranchType.SelectedValue);

                lbData.Text = loadProduct(rdBranchType.SelectedValue, rdProductType.SelectedValue);
            }
        }
    }
    void loadBranchType()
    {
        var data= from x in db.tBranchTypes
                  where x.Status == 1
                  select new { x.Id, x.Name };
        rdBranchType.DataSource = data;
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();

        dlBranchTypeUpload.DataSource = data;
        dlBranchTypeUpload.DataTextField = "Name";
        dlBranchTypeUpload.DataValueField = "Id";
        dlBranchTypeUpload.DataBind();
    }
    void loadProductType(string branchTypeId)
    {
        rdProductType.DataSource = from x in db.tProductTypes
                                  where x.Status == 1 && x.BranchTypeId==int.Parse(branchTypeId) && x.ParentTypeId==null
                                   select new { x.Id,x.ProductTypeName };
        rdProductType.DataTextField = "ProductTypeName";
        rdProductType.DataValueField = "Id";
        rdProductType.DataBind();
        rdProductType.Items.Insert(0, new ListItem("Tất cả", ""));
        rdProductType.SelectedValue = "";
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadProductType(rdBranchType.SelectedValue);
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //string result = "";
        //if (fu.HasFile)
        //{
        //    FileInfo f = new FileInfo(Server.MapPath("file/" + fu.FileName));
        //    if (f.Exists) f.Delete();

        //    fu.SaveAs(Server.MapPath("file/" + fu.FileName));
        //    Excel.Application xlApp;
        //    Excel.Workbook xlWorkBook;
        //    Excel.Worksheet xlWorkSheet;
        //    Excel.Range range;

        //    string str;
        //    int rCnt;
        //    int cCnt;
        //    int rw = 0;
        //    int cl = 0;

        //    xlApp = new Excel.Application();
        //    xlWorkBook = xlApp.Workbooks.Open(Server.MapPath("file/"+fu.FileName), 0, true, 5, "", "", true, 
        //        Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //    xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

        //    range = xlWorkSheet.UsedRange;
        //    rw = range.Rows.Count;
        //    cl = range.Columns.Count;


        //    for (rCnt = 2; rCnt <= rw; rCnt++)
        //    {
        //        for (cCnt = 1; cCnt <= cl; cCnt++)
        //        {
        //            str = Convert.ToString((range.Cells[rCnt, cCnt] as Excel.Range).Value);
        //            result += str + ";";
        //        }
        //    }

        //    xlWorkBook.Close(true, null, null);
        //    xlApp.Quit();

        //    Marshal.ReleaseComObject(xlWorkSheet);
        //    Marshal.ReleaseComObject(xlWorkBook);
        //    Marshal.ReleaseComObject(xlApp);
        //}
        //else
        //{

        //}
        //var t = result;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
        lbData.Text = loadProduct(rdBranchType.SelectedValue, rdProductType.SelectedValue);
        Session["cm_branchTypeId"] = rdBranchType.SelectedValue;
    }
    public string loadProduct(string branchType,string productType)
    {
        string result = ""; int i = 1;
        
        var m = db.sp_web_loadProduct(branchType, productType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' onclick='showModalUpdate("+ item.Id.ToString() + ");' data-toggle='modal' data-target='#addProduct' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchTypeName + "</td>";
            result += "<td>" + item.CodeId + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.ProductTypeCode + "</td>";
            result += "<td>" + item.Color + "</td>";
            result += "<td>" + item.Size + "</td>";

            result += "<td>" + item.UnitName + "</td>";
            result += "<td>" + item.CapacityName + "</td>";
            result += "<td>" + item.CountryName + "</td>";
            result += "<td>" + item.Composition + "</td>";
            result += "<td>" + item.Material + "</td>";
            result += "<td>" + item.BrandName + "</td>";
            result += "<td>" + item.SupplierName + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }

}