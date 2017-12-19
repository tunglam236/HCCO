using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Data;

namespace WindowsFormsApplication3.cls
{
    public class clsProcess
    {
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
        public string Decrypt(string toDecrypt)
        {

            byte[] keyArray;

            byte[] toEncryptArray = Convert.FromBase64String(toDecrypt);

            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();

            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes("cuocsonghcc29"));

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;

            tdes.Mode = CipherMode.ECB;

            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateDecryptor();

            byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

            return UTF8Encoding.UTF8.GetString(resultArray);

        }
        public string returnDatetime(string date)
        {
            var x = date.Split('/');
            return x[1] + "/" + x[0] + "/" + x[2];
        }
        public string money_code(double total_price)
        {
            string am = "";
            if (total_price == 0)
                return "0 đồng";
            else if (total_price < 0)
            {
                am = "Âm ";
                total_price = total_price * (-1);
            }
            int i; string t = "";

            string s = Math.Round(total_price, 0).ToString();
            string n = s.ToString();
            int[] A = new int[s.Length + 1];
            for (i = n.Length; i > 0; i--)
            {
                A[i] = Int32.Parse(n.Substring(n.Length - i, 1));
                t += docso(i, A[i], n) + hang(i, A[i], n);
            }
            var up = t.Substring(0, 1).ToUpper();

            return am + up + t.Substring(1) + "đồng";
        }
        public static string docso(int i, int x, string n)
        {

            string s = "";
            switch (x)
            {
                case 0: if (i % 3 == 0 && (n.Substring(n.Length - i + 1, 2) != "00"))
                        s = "không ";
                    else s = "";
                    break;
                case 1:
                    if (i % 3 == 2)
                        s = "";
                    else
                        s = "một ";
                    break;
                case 2:
                    s = "hai ";
                    break;
                case 3:
                    s = "ba ";
                    break;
                case 4:
                    s = "bốn ";
                    break;
                case 5:
                    if (n.Length != i && i % 3 == 1 && n.Substring(n.Length - i - 1, 1) != "0")
                        s = "lăm ";
                    else
                        s = "năm ";
                    break;
                case 6:
                    s = "sáu ";
                    break;
                case 7:
                    s = "bảy ";
                    break;
                case 8:
                    s = "tám ";
                    break;
                case 9:
                    s = "chín ";
                    break;
            }
            return s;
        }
        public static string hang(int i, int x, string n)
        {
            string s = "";
            int t = i % 3;
            switch (t)
            {
                case 0: if (n.Substring(n.Length - i, 3) != "000")
                        s = "trăm ";
                    else s = "";
                    break;
                case 1:
                    if (i % 9 == 1)
                    {
                        if (i - 1 == 0)
                            s = "";
                        else
                            s = "tỷ ";
                    }
                    else if (i % 6 == 1)
                        if (n.Length > 9 && n.Substring(n.Length - i - 2, 3) == "000")
                            s = "";
                        else
                            s = "triệu ";
                    else
                        if (n.Length > 6 && n.Substring(n.Length - i - 2, 3) == "000")
                            s = "";
                        else
                            s = "ngàn ";
                    break;
                case 2:
                    if (x == 0 && n.Substring(n.Length - i + 1, 1) != "0")
                        s = "linh ";
                    else
                        if (n.Substring(n.Length - i, 2) == "00")
                            s = "";
                        else
                            s = "mươi ";
                    break;
            }
            return s;
        }
    }
    
}
