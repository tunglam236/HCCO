using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Ad_Member : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Personal";
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
                Mess("Nhập họ và tên", "");
            else
            {
                try
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";

                    tPersonal p = new tPersonal();
                    p.Name = txtName.Text.Trim();
                    p.Position = txtPosition.Text.Trim();
                    p.Description = txtNoiDung.Text.Trim();
                    p.IsActive = ckActive.Checked;
                    p.CreateAt = DateTime.Now;
                    if (fuImage.HasFile)
                    {
                        file_ex = fuImage.FileName.Trim();
                        file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                        p.Image = "/wp-content/uploads/member/" + filename + file_ex;
                    }
                    db.tPersonals.InsertOnSubmit(p);
                    db.SubmitChanges();
                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/member/" + filename + file_ex));
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
        gvMember.DataSource = from x in db.tPersonals select new { x.Id, x.Name, x.Image, x.Position, x.Description, x.IsActive };
        gvMember.DataBind();
    }
    void ResetControl()
    {
        txtName.Text = "";
        txtPosition.Text = "";
        txtNoiDung.Text = "";
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
                Mess("Nhập họ và tên", "");
            else
            {
                try
                {
                    var up = (from x in db.tPersonals where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";
                    up.Name = txtName.Text.Trim();
                    up.Position = txtPosition.Text.Trim();
                    up.Description = txtNoiDung.Text.Trim();
                    if (fuImage.HasFile)
                    {
                        file_ex = fuImage.FileName.Trim();
                        file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                        up.Image = "/wp-content/uploads/member/" + filename + file_ex;
                    }
                    up.ModifiedAt = DateTime.Now;
                    up.IsActive = ckActive.Checked;
                    db.SubmitChanges();
                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/member/" + filename + file_ex));
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

    protected void gvMember_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tPersonals where x.Id == gID select x).FirstOrDefault();
                txtName.Text = ct.Name;
                txtPosition.Text = ct.Position;
                txtNoiDung.Text = ct.Description;
                ckActive.Checked = ct.IsActive.Value;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    var del = from x in db.tPersonals where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        var img = del.FirstOrDefault().Image;
                        db.tPersonals.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        FileInfo f = new FileInfo(Server.MapPath(img));
                        if (f.Exists)
                            f.Delete();

                        LoadGrid();

                        ResetControl();
                        Mess("Xóa thành công", "");

                    }
                    else
                        Mess("Thành viên không tồn tại", "");
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