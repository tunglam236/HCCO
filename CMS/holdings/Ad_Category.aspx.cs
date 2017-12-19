using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Ad_Category : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Category";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
                LoadGrid();
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
        {
            if (txtName.Text.Trim().Equals(""))
                Mess("Nhập tên lĩnh vực", "");
            else
            {
                try
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex1 = "", file_ex2 = "";
                    tCategory cat = new tCategory();
                    if (fuImage.HasFile)
                    {
                        file_ex1 = fuImage.FileName.Trim();
                        file_ex1 = file_ex1.Substring(file_ex1.LastIndexOf('.'));
                        cat.Image = "/wp-content/uploads/category/" + filename + file_ex1;
                    }
                    cat.Content = txtContent.Text.Trim();
                    cat.Caption = txtName.Text.Trim();
                    if (fuIcon.HasFile)
                    {
                        file_ex2 = fuImage.FileName.Trim();
                        file_ex2 = file_ex2.Substring(file_ex2.LastIndexOf('.'));
                        cat.Icon = "/wp-content/uploads/category/icon_" + filename + file_ex2;
                    }
                    cat.IsActive = ckActive.Checked;
                    cat.CreateAt = DateTime.Now;
                    db.tCategories.InsertOnSubmit(cat);
                    db.SubmitChanges();

                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/category/" + filename + file_ex1));
                    if (fuIcon.HasFile)
                        fuIcon.SaveAs(Server.MapPath("/wp-content/uploads/category/icon_" + filename + file_ex2));

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
        gvCat.DataSource = from x in db.tCategories select new { x.Id, x.Caption, x.Content, x.Image, x.Icon, x.IsActive };
        gvCat.DataBind();
    }
    void ResetControl()
    {
        txtName.Text = "";
        txtContent.Text = "";
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
                Mess("Nhập tên lĩnh vực", "");
            else
            {
                try
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex1 = "", file_ex2 = "";
                    var up = (from x in db.tCategories where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                    up.Caption = txtName.Text.Trim();
                    up.ModifiedAt = DateTime.Now;
                    up.Content = txtContent.Text.Trim();

                    if (fuImage.HasFile)
                    {
                        file_ex1 = fuImage.FileName.Trim();
                        file_ex1 = file_ex1.Substring(file_ex1.LastIndexOf('.'));
                        up.Image = "/wp-content/uploads/category/" + filename + file_ex1;
                    }
                    if (fuIcon.HasFile)
                    {
                        file_ex2 = fuImage.FileName.Trim();
                        file_ex2 = file_ex2.Substring(file_ex2.LastIndexOf('.'));
                        up.Icon = "/wp-content/uploads/category/icon_" + filename + file_ex2;
                    }
                    up.IsActive = ckActive.Checked;
                    db.SubmitChanges();

                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/category/" + filename + file_ex1));
                    if (fuIcon.HasFile)
                        fuIcon.SaveAs(Server.MapPath("/wp-content/uploads/category/icon_" + filename + file_ex2));

                    LoadGrid();
                    btnCancel_Click(sender, e);
                    Mess("Cập nhật thành công", "");
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

    protected void gvCat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tCategories where x.Id == gID select x).FirstOrDefault();
                txtContent.Text = ct.Content;
                txtName.Text = ct.Caption;
                ckActive.Checked = ct.IsActive.Value;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    var del = from x in db.tCategories where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        var img = del.FirstOrDefault().Image;
                        var img_icon = del.FirstOrDefault().Icon;
                        db.tCategories.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        LoadGrid();

                        FileInfo f = new FileInfo(Server.MapPath(img));
                        if (f.Exists)
                            f.Delete();

                        f = new FileInfo(Server.MapPath(img_icon));
                        if (f.Exists)
                            f.Delete();

                        ResetControl();
                        Mess("Xóa thành công", "");
                    }
                    else
                        Mess("Lĩnh vực không tồn tại", "");
                }
                else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
            }
        }
        catch (Exception ax)
        {
            Mess(ax.Message, "");
        }
    }
}