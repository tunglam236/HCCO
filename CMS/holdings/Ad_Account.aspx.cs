using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Account : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Account";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
                LoadGrid();
            else
                Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
        {
            if (txtAccount.Text.Trim().Equals(""))
                Mess("Nhập tên tài khoản", "");
            else
            {
                try
                {
                    tAccount ac = new tAccount();
                    ac.Username = txtAccount.Text.Trim().ToLower();
                    ac.Password = cl.MaHoa(txtPass.Text.Trim());
                    ac.FullName = txtName.Text.Trim();
                    ac.IsActive = ckActive.Checked;
                    ac.CreateAt = DateTime.Now;
                    db.tAccounts.InsertOnSubmit(ac);
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
        gvAccount.DataSource = from x in db.tAccounts select new { x.Id, x.FullName, x.Username, x.IsActive };
        gvAccount.DataBind();
    }
    void ResetControl()
    {
        txtName.Text = "";
        txtAccount.Text = "";
        txtPass.Text = "";
        ckActive.Checked = true;
        btnSave.Visible = true;
        btnUpdate.Visible = false;
        txtAccount.Enabled = true;
        txtPass.Enabled = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 2))
        {
            if (txtAccount.Text.Trim().Equals(""))
                Mess("Nhập tên tài khoản", "");
            else
            {
                try
                {
                    var up = (from x in db.tAccounts where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                    up.FullName = txtName.Text.Trim();
                    up.ModifiedAt = DateTime.Now;
                    up.IsActive = ckActive.Checked;
                    db.SubmitChanges();
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

    protected void gvAccount_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tAccounts where x.Id == gID select x).FirstOrDefault();
                txtAccount.Text = ct.Username;
                txtName.Text = ct.FullName;
                ckActive.Checked = ct.IsActive.Value;
                btnSave.Visible = false;
                txtAccount.Enabled = false;
                txtPass.Enabled = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    var del = from x in db.tAccounts where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        db.tAccounts.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        LoadGrid();

                        ResetControl();
                        Mess("Xóa thành công", "");
                    }
                    else
                        Mess("Tài khoản không tồn tại", "");
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