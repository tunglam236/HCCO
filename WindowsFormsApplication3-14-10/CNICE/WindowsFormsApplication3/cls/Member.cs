using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication3.cls
{
    
    public class Member
    {
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        clsProcess cls = new clsProcess();
        public bool insertMember(string name, string birthday,string sex, string phone, string add,string email, string note, int branchtype, out string mess)
        {
            mess = "";
            bool ok = false;
            
            try
            {
                var u = new tMember();
                u.MemberCode = phone.Replace(" ", "");
                u.MemberName = name;
                u.Phone = phone;
                u.Email = email.Trim();
                u.Address = add;
                u.Note = note;
                u.Sex = sex == "1";
                if(birthday!="")
                    u.Birthday = DateTime.Parse(cls.returnDatetime(birthday));
                u.BranchTypeId = branchtype;
                u.CreateAt = DateTime.Now;
                u.JoinCreateAt = DateTime.Now;
                u.Status = 1;
                u.CreateBy = WindowsFormsApplication3.Form1.user_id;
                db.tMembers.InsertOnSubmit(u);
                db.SubmitChanges();
                ok = true;
            }
            catch(Exception ax)
            {
                ok = false;
                mess = ax.Message;
            }
            return ok;
        }
        public bool updateMember(string id, string name, string birthday,string sex, string phone, string add, string email, string note, int branchtype, out string mess)
        {
            mess = "";
            bool ok = false;
            try
            {
                var u = from x in db.tMembers where x.Id == int.Parse(id) select x;
                if (u.Count() > 0)
                {
                    u.FirstOrDefault().MemberCode = phone.Replace(" ","");
                    u.FirstOrDefault().MemberName = name;
                    u.FirstOrDefault().Phone = phone;
                    u.FirstOrDefault().Email = email;
                    u.FirstOrDefault().Address = add;
                    u.FirstOrDefault().Sex = sex == "1";
                    if (birthday != "")
                        u.FirstOrDefault().Birthday = DateTime.Parse(cls.returnDatetime(birthday));
                    else u.FirstOrDefault().Birthday = null;
                    u.FirstOrDefault().Note = note;
                    u.FirstOrDefault().ModifiedAt = DateTime.Now;
                    u.FirstOrDefault().ModifiedBy = WindowsFormsApplication3.Form1.user_id;
                    u.FirstOrDefault().BranchTypeId = branchtype;
                    db.SubmitChanges();
                    ok = true;
                }
                else
                {
                    ok = false;
                    mess = "Không tìm thấy thành viên [" + name + "], hãy thử lại";
                }
            }
            catch (Exception ax)
            {
                ok = false;
                mess = ax.Message;
            }
            return ok;
        }
        public bool deleteMember(string id,string name, out string mess)
        {
            mess = "";
            bool ok = false;
            try
            {
                var u = from x in db.tMembers where x.Id == int.Parse(id) select x;
                if (u.Count() > 0)
                {
                    u.FirstOrDefault().Status = 0;
                    u.FirstOrDefault().ModifiedAt = DateTime.Now;
                    u.FirstOrDefault().ModifiedBy = WindowsFormsApplication3.Form1.user_id;
                    db.SubmitChanges();
                    ok = true;
                }
                else
                {
                    ok = false;
                    mess = "Không tìm thấy thành viên [" + name + "], hãy thử lại";
                }
            }
            catch (Exception ax)
            {
                ok = false;
                mess = ax.Message;
            }
            return ok;
        }
    }
    
}
