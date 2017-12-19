using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Ad_Product : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Product";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
            {
                dlCategory.Items.Clear();
                var cat = from x in db.tCategories where x.IsActive == true select new { x.Id, x.Caption };
                foreach (var item in cat.ToList())
                {
                    dlCategory.Items.Add(new ListItem(item.Caption, item.Id.ToString()));
                }
                dlCategory.DataBind();
                LoadGrid();
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
        {
            if (txtName.Text.Trim().Equals(""))
                Mess("Nhập tên sản phẩm", "");
            else
            {
                try
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";

                    HttpFileCollection hfc = Request.Files;
                    for (int i = 0; i < hfc.Count; i++)
                    {
                        HttpPostedFile hpf = hfc[i];
                        if (hpf.ContentLength > 0)
                        {
                            tProduct p = new tProduct();
                            p.Name = txtName.Text.Trim();
                            p.CategoryId = int.Parse(dlCategory.SelectedValue.Trim());

                            p.IsActive = ckActive.Checked;
                            p.CreateAt = DateTime.Now;

                            file_ex = hpf.FileName.Trim();
                            file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                            p.Image = "/wp-content/uploads/gallery/" + filename + "_" + i.ToString() + file_ex;
                            db.tProducts.InsertOnSubmit(p);
                            hpf.SaveAs(Server.MapPath("/wp-content/uploads/gallery/" + filename + "_" + i.ToString() + file_ex));
                        }
                    }

                    db.SubmitChanges();

                    ResetControl();
                    LoadGrid();
                    Mess("Lưu thành công", "");
                }
                catch (Exception ax)
                {
                    Mess(ax.Message, "");
                }
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }
    void LoadGrid()
    {
        gvProduct.DataSource = from x in db.tProducts
                               from y in db.tCategories
                               where x.CategoryId == y.Id && x.CategoryId == int.Parse(dlCategory.SelectedValue.Trim())
                               orderby x.CreateAt descending, x.IsActive descending
                               select new { x.Id, x.Name, CategoryName = y.Caption, x.Image, x.IsActive };
        gvProduct.DataBind();
    }
    void ResetControl()
    {
        txtName.Text = "";
        dlCategory.SelectedIndex = 0;
        ckActive.Checked = true;
        btnSave.Visible = true;
        btnUpdate.Visible = false;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 2))
        {
            if (txtName.Text.Trim().Equals(""))
                Mess("Nhập tên sản phẩm", "");
            else
            {
                try
                {
                    var hfc = Request.Files;
                    if (hfc.Count > 1)
                        Mess("Chỉ được chọn 1 file để cập nhật", "");
                    else
                    {
                        string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "", file_old = "";
                        var up = (from x in db.tProducts where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                        file_old = up.Image;
                        up.Name = txtName.Text.Trim();
                        up.CategoryId = int.Parse(dlCategory.SelectedValue.Trim());
                        if (fuImage.HasFile)
                        {
                            file_ex = fuImage.FileName.Trim();
                            file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                            up.Image = "/wp-content/uploads/gallery/" + filename + file_ex;
                        }
                        up.ModifiedAt = DateTime.Now;
                        up.IsActive = ckActive.Checked;
                        db.SubmitChanges();
                        if (fuImage.HasFile)
                        {
                            fuImage.SaveAs(Server.MapPath("/wp-content/uploads/gallery/" + filename + file_ex));
                            //xoa img cu
                            FileInfo f = new FileInfo(Server.MapPath(file_old));
                            if (f.Exists)
                                f.Delete();
                        }
                        LoadGrid();
                        btnCancel_Click(sender, e);
                        Mess("Cập nhật thành công", "");
                    }
                }
                catch (Exception ax)
                {
                    Mess(ax.Message, "");
                }
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }
    private void Mess(string gstMess, string gstLink)
    {
        if (gstLink == "")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "')", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "');window.location.href='" + gstLink + "'", true);

    }

    protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        int gID = int.Parse(ID);

        if (e.CommandName.Equals("Select"))
        {
            var ct = (from x in db.tProducts where x.Id == gID select x).FirstOrDefault();
            txtName.Text = ct.Name;
            dlCategory.SelectedValue = ct.CategoryId.ToString();
            ckActive.Checked = ct.IsActive.Value;
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }
        else if (e.CommandName.Equals("Del"))
        {
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
            {
                var del = from x in db.tProducts where x.Id == gID select x;
                if (del.Count() > 0)
                {
                    var img = del.FirstOrDefault().Image;
                    db.tProducts.DeleteAllOnSubmit(del);
                    db.SubmitChanges();
                    FileInfo f = new FileInfo(Server.MapPath(img));
                    if (f.Exists)
                        f.Delete();

                    LoadGrid();

                    ResetControl();
                    Mess("Xóa thành công", "");
                }
                else
                    Mess("Hình ảnh không tồn tại", "");
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        gvProduct.DataSource = from x in db.tProducts
                               from y in db.tCategories
                               where x.CategoryId == y.Id && x.CategoryId == int.Parse(dlCategory.SelectedValue.Trim())
                               orderby x.CreateAt descending, x.IsActive descending
                               select new { x.Id, x.Name, CategoryName = y.Caption, x.Image, x.IsActive };
        gvProduct.DataBind();
    }
}