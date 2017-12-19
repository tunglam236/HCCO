using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for clsProcess
/// </summary>
public class clsProcess
{
    HoldingDataContext db = new HoldingDataContext();
	public clsProcess()
	{
		
	}
    public bool checkRole(string idUser, string codeModule, int typeFunction)
    {
        bool result = false;
        var r=from c in db.tRoles where c.ModuleCode == codeModule select c;
        if (r.Count() > 0)
        {
            int idModule = r.FirstOrDefault().Id;
            var check = from x in db.tUserRoles where x.UserId == int.Parse(idUser) && x.RoleId == idModule select x;
            if (check.Count() > 0)
            {
                switch (typeFunction)
                {
                    case 0:
                        result = check.FirstOrDefault().sView.Value;
                        break;
                    case 1:
                        result = check.FirstOrDefault().sInsert.Value;
                        break;
                    case 2:
                        result = check.FirstOrDefault().sModifie.Value;
                        break;
                    case 3:
                        result = check.FirstOrDefault().sDel.Value;
                        break;
                }

            }
        }
        
        return result;
    }
    public string ConvertToUnSign(string text)
    {
        for (int i = 32; i < 48; i++)
        {
            text = text.Replace(((char)i).ToString(), " ");
        }
        text = text.Replace(".", "-");
        text = text.Replace("?", "");
        text = text.Replace(" ", "-");
        text = text.Replace(",", "-");
        text = text.Replace(";", "-");
        text = text.Replace(":", "-");

        Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");

        string strFormD = text.Normalize(System.Text.NormalizationForm.FormD);
        return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }
    public string MaHoa(string toEncrypt)
    {

        byte[] keyArray;

        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

        MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();

        keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes("cuocsonghcc29"));


        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

        tdes.Key = keyArray;

        tdes.Mode = CipherMode.ECB;

        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateEncryptor();

        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);

    }
}