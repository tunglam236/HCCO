using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Web.UI;

/// <summary>
/// Summary description for clsProcess
/// </summary>
public class clsProcess
{
	public clsProcess()
	{
		//
		// TODO: Add constructor logic here
		//
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
    public string Encrypt(string toEncrypt)
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
    
    public string returnDatetime(string date)
    {
        var x = date.Split('/');
        return x[1] + "/" + x[0] + "/" + x[2];
    }
    public bool SendMail(string title, string tieude, string Mail, string content)
    {
        try
        {
            int port = 587;
            SmtpClient client = new SmtpClient();
            client.EnableSsl = true;
            client.Port = port;
            client.Host = "smtp.gmail.com";
            client.Credentials = new NetworkCredential("it@hcco.vn", "Haibakhongsau2306");
            MailAddress from = new MailAddress("it@hcco.vn", title);
            MailAddress toAddress = new MailAddress(Mail);
            MailMessage message = new MailMessage(from, toAddress);
            message.IsBodyHtml = true;
            message.Body = content;
            message.Subject = tieude;
            client.Send(message);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }
}
