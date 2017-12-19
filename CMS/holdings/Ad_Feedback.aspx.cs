using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Ad_Feedback : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Feedback";
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
                Mess("Nhập họ tên", "");
            else
            {
                try
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex1 = "";
                    tFeedback cat = new tFeedback();
                    if (fuImage.HasFile)
                    {
                        file_ex1 = fuImage.FileName.Trim();
                        file_ex1 = file_ex1.Substring(file_ex1.LastIndexOf('.'));
                        cat.Image = "/wp-content/uploads/feedback/" + filename + file_ex1;
                    }
                    cat.Content = txtContent.Text.Trim();
                    cat.Name = txtName.Text.Trim();
                    cat.Position = txtPosition.Text.Trim();
                    cat.IsActive = ckActive.Checked;
                    cat.CreateAt = DateTime.Now;
                    db.tFeedbacks.InsertOnSubmit(cat);
                    db.SubmitChanges();

                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/feedback/" + filename + file_ex1));

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
        gvFeedback.DataSource = from x in db.tFeedbacks orderby x.CreateAt descending select new { x.Id, x.Position, x.Name, x.Content, x.Image, x.IsActive };
        gvFeedback.DataBind();
    }
    void ResetControl()
    {
        txtName.Text = "";
        txtContent.Text = "";
        txtPosition.Text = "";
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
                Mess("Nhập họ tên", "");
            else
            {
                try
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex1 = "";
                    var up = (from x in db.tFeedbacks where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                    up.Name = txtName.Text.Trim();
                    up.Position = txtPosition.Text.Trim();
                    up.Content = txtContent.Text.Trim();
                    up.ModifiedAt = DateTime.Now;

                    if (fuImage.HasFile)
                    {
                        file_ex1 = fuImage.FileName.Trim();
                        file_ex1 = file_ex1.Substring(file_ex1.LastIndexOf('.'));
                        up.Image = "/wp-content/uploads/feedback/" + filename + file_ex1;
                    }

                    up.IsActive = ckActive.Checked;
                    db.SubmitChanges();

                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/feedback/" + filename + file_ex1));

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

    protected void gvFeedback_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tFeedbacks where x.Id == gID select x).FirstOrDefault();
                txtContent.Text = ct.Content;
                txtName.Text = ct.Name;
                txtPosition.Text = ct.Position;
                ckActive.Checked = ct.IsActive.Value;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    var del = from x in db.tFeedbacks where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        var img = del.FirstOrDefault().Image;
                        db.tFeedbacks.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        LoadGrid();

                        FileInfo f = new FileInfo(Server.MapPath(img));
                        if (f.Exists)
                            f.Delete();

                        ResetControl();
                        Mess("Xóa thành công", "");
                    }
                    else
                        Mess("Feedback không tồn tại", "");
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