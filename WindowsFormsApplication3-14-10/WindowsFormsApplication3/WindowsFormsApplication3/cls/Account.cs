using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication3.cls
{
    
    public class Account
    {
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        
        public bool insertAccount(string us, string pw, string name, string email, bool sex, string birth, string phone, string add, string stt, int group, string note,int branch, int branchtype, out string mess)
        {
            mess = "";
            bool ok = false;
            clsProcess cls = new clsProcess();
            try
            {
                var u = new tAccount();
                u.Username = us;
                u.FullName = name;
                u.Password = cls.Encrypt(pw);
                u.Email = email;
                u.Sex = sex;
                if(birth!="")
                    u.Birthday = DateTime.Parse(birth);
                u.Phone = phone;
                u.Address = add;
                u.Status = byte.Parse(stt);
                u.GroupUserId = group;
                u.Note = note;
                u.CreateAt = DateTime.Now;
                u.CreateBy = WindowsFormsApplication3.Form1.user_id;
                u.BranchTypeId = branchtype;
                u.BranchId = branch;
                db.tAccounts.InsertOnSubmit(u);
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
        public bool updateAccount(string id,string us, string name, string email, bool sex, string birth, string phone, string add, string stt, int group, string note,int branch, int branchtype, out string mess)
        {
            mess = "";
            bool ok = false;
            try
            {
                var u = from x in db.tAccounts where x.Id == int.Parse(id) select x;
                if (u.Count() > 0)
                {
                    u.FirstOrDefault().Username = us;
                    u.FirstOrDefault().FullName = name;
                    u.FirstOrDefault().Email = email;
                    u.FirstOrDefault().Sex = sex;
                    if (birth != "")
                        u.FirstOrDefault().Birthday = DateTime.Parse(birth);
                    else u.FirstOrDefault().Birthday = null;

                    u.FirstOrDefault().Phone = phone;
                    u.FirstOrDefault().Address = add;
                    u.FirstOrDefault().Status = byte.Parse(stt);
                    u.FirstOrDefault().GroupUserId = group;
                    u.FirstOrDefault().Note = note;
                    u.FirstOrDefault().ModifiedAt = DateTime.Now;
                    u.FirstOrDefault().ModifiedBy = WindowsFormsApplication3.Form1.user_id;
                    u.FirstOrDefault().BranchTypeId = branchtype;
                    u.FirstOrDefault().BranchId = branch;
                    db.SubmitChanges();
                    ok = true;
                }
                else
                {
                    ok = false;
                    mess = "Không tìm thấy tài khoản [" + us + "], hãy thử lại";
                }
            }
            catch (Exception ax)
            {
                ok = false;
                mess = ax.Message;
            }
            return ok;
        }
        public bool deleteAccount(string id,string us, out string mess)
        {
            mess = "";
            bool ok = false;
            try
            {
                var u = from x in db.tAccounts where x.Id == int.Parse(id) select x;
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
                    mess = "Không tìm thấy tài khoản [" + us + "], hãy thử lại";
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
