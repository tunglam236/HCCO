using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_ChangePass : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])))
            {
                txtAccount.Text = Session["user_hcc"].ToString();
                txtpw.Text = "";
                txtPass1.Text = "";
                txtPass2.Text = "";
                txtpw.Focus();
            }
            else
                Response.Redirect("/login");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtPass1.Text.Trim() != txtPass2.Text.Trim())
            Mess("Mật khẩu mới không trùng khớp", "");
        else
        {
            try
            {
                var check_acc = from x in db.tAccounts
                                where x.Username == txtAccount.Text.Trim() && x.Password == cl.MaHoa(txtpw.Text.Trim())
                                select x;
                if (check_acc.Count() == 1)
                {
                    check_acc.FirstOrDefault().Password = cl.MaHoa(txtPass1.Text.Trim());
                    db.SubmitChanges();
                    Mess("Thay đổi mật khẩu thành công", "");
                }
                else Mess("Mật khẩu cũ không khớp, kiểm tra lại", "");
            }
            catch (Exception ax)
            {
                Mess(ax.Message, "");
            }
        }
    }
    private void Mess(string gstMess, string gstLink)
    {
        if (gstLink == "")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "')", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "');window.location.href='" + gstLink + "'", true);

    }
}