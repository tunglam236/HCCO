using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GanttDetail : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                hdId.Value = Request.QueryString["Id"];

                var job = db.sp_GanttDetail(int.Parse(hdId.Value.Trim())).ToList();
                if (job.Count() > 0)
                {
                    txtComment.Text = job.FirstOrDefault().Comment;
                    txtContent.Text = job.FirstOrDefault().Name;
                    txtDateCreate.Text = job.FirstOrDefault().CreateAt;
                    txtExpectDate.Text = job.FirstOrDefault().ExpectDate;
                    txtNote.Text = job.FirstOrDefault().Note;
                    txtStartDate.Text = job.FirstOrDefault().StartDate;
                    txtUserCreate.Text = job.FirstOrDefault().UserCreate;
                    txtUserReceiver.Text = job.FirstOrDefault().UserReceiver;
                    if (job.FirstOrDefault().Status == 1)
                    {
                        btnSubmit.Text = "Hoàn thành công việc";
                        btnSubmit.Enabled = true;
                    }
                    else
                    {
                        btnSubmit.Text = "Đã hoàn thành công việc";
                        btnSubmit.Enabled = false;
                    }
                }
                else
                {
                    btnSubmit.Enabled = false;
                }
            }
        }
    }
}