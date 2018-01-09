using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Image : System.Web.UI.Page
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
                lbData.Text = loadImage(rdBranchType.SelectedValue);
            }
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
            {
                
            }
        }
    }
    void loadBranchType()
    {
        var br_type = from x in db.tBranchTypes
                      where x.Status == 1
                      select new { x.Id, x.Name };
        rdBranchType.DataSource = br_type;
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (fckContent.Value.Trim() !="")
        {
            string id = hdProductId.Value;
            var p = from x in db.tProducts where x.Id == int.Parse(id.Trim()) select x;
            if (p.Count() > 0)
            {
                p.FirstOrDefault().Content = fckContent.Value.Trim();
                db.SubmitChanges();
                Response.Redirect("/image");
            }
        }
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        lbData.Text = loadImage(rdBranchType.SelectedValue);
        Session["cm_branchTypeId"] = rdBranchType.SelectedValue;
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string result = hdProductId.Value;
        string color = result.Split('#')[0];
        string id = result.Split('#')[1];
        var p = from x in db.tProducts where x.Color == int.Parse(color) && x.ProductTypeCode == id.Trim() select x;
        if (p.Count() > 0)
        {
            if(id != "")
            {
                if (fuImage.HasFile)//anh to
                {
                    string filename = fuImage.FileName.Trim();
                    string date = DateTime.Now.ToString("ddMMyyyyHHmmss");

                    string img_path = "/upload/product/" + date + "_" + filename.Substring(filename.LastIndexOf('.'));

                    string img_save = "";

                    if (p.FirstOrDefault().BranchTypeId.ToString() == "1")
                        img_save = "/upload/cnice/product/" + date + "_" + filename.Substring(filename.LastIndexOf('.'));
                    else
                        img_save = "/upload/cfashion/product/" + date + "_" + filename.Substring(filename.LastIndexOf('.'));

                    fuImage.SaveAs(Server.MapPath(img_save));

                    foreach (var item in p.ToList())
                    {
                        if (item.ImageZoom == null || item.ImageZoom == "")
                        {
                            item.ImageZoom = img_path;
                        }
                        else
                        {
                            item.ImageZoom = item.ImageZoom + "#" + img_path;
                        }
                    }
                    
                }
                if (fuThumb.HasFile)//anh nho
                {
                    string filename = fuThumb.FileName.Trim();
                    string date = DateTime.Now.ToString("ddMMyyyyHHmmss");

                    string img_path = "/upload/product/thumb_" + date + "_" + filename.Substring(filename.LastIndexOf('.'));

                    string img_save = "";

                    if (p.FirstOrDefault().BranchTypeId.ToString() == "1")
                        img_save = "/upload/cnice/product/thumb_" + date + "_" + filename.Substring(filename.LastIndexOf('.'));
                    else
                        img_save = "/upload/cfashion/product/thumb_" + date + "_" + filename.Substring(filename.LastIndexOf('.'));

                    fuThumb.SaveAs(Server.MapPath(img_save));

                    foreach (var item in p.ToList())
                    {
                        if (item.Image == null || item.Image == "")
                        {
                            item.Image = img_path;
                        }
                        else
                        {
                            item.Image = item.Image + "#" + img_path;
                        }
                    }
                }
                db.SubmitChanges();
            }
            
            Response.Redirect("/image");
        }
    }
    public string loadImage(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadProductImage(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' branchtype='" + branchType.Trim() + "' imageZoom=\"" + Convert.ToString(item.ImageZoom).Replace("/", "@") + "\" image=\"" + Convert.ToString(item.Image).Replace("/", "@") + "\" id='" + item.ColorId.ToString() + "#" + item.ProductTypeCode.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.CodeId + "</td>";
            result += "<td>" + item.ProductTypeCode + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td id='imageCount" + item.Id.ToString() + "'>" + item.ImageCount.ToString() + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}