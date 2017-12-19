using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart : DataTable
{
    public string tb = "";
    public string _Re = "";
    public ShoppingCart()
    {
        this.Columns.Add("ID", typeof(string));
        this.PrimaryKey = new DataColumn[] { this.Columns[0] };
        this.Columns.Add("Code", typeof(string));
        this.Columns.Add("ProductCode", typeof(string));
        this.Columns.Add("ProductName", typeof(string));
        this.Columns.Add("Image", typeof(string));
        this.Columns.Add("Quantity", typeof(int));
        this.Columns.Add("Price", typeof(double));
        this.Columns.Add("PriceSale", typeof(double));
        this.Columns.Add("TotalPrice", typeof(float));
        this.Columns.Add("Score", typeof(float));
        this.Columns.Add("Brand", typeof(string));
        this.Columns.Add("CountryName", typeof(string));
        this.Columns.Add("IsSale", typeof(bool));
        this.Columns.Add("ColorName", typeof(string));
        this.Columns.Add("SizeName", typeof(string));
    }

    public void AddProduct(string ID, string code, string procode, string proname, string image, int quantity, double price, double pricesale, double score, string brand, string countryname, bool sale, string colorName, string sizeName)
    {
        if (ReturnID(ID) == false)
        {
            DataRow r = this.NewRow();
            r["ID"] = ID;
            r["Code"] = code;
            r["ProductCode"] = procode;
            r["ProductName"] = proname;
            r["Image"] = image;
            r["Quantity"] = quantity;
            r["Price"] = price;
            r["PriceSale"] = pricesale;
            r["TotalPrice"] = quantity * price;
            r["Score"] = score;
            r["Brand"] = brand;
            r["CountryName"] = countryname;
            r["IsSale"] = sale;
            r["ColorName"] = colorName;
            r["SizeName"] = sizeName;
            this.Rows.Add(r);
            tb = "Add Success " + proname;
        }
        else
        {
            tb = "Had Product " + proname;
        }
    }
    public double getPrice(string ID)
    {
        if (ReturnID(ID) == true)
        {
            DataRow objDR = this.Rows.Find(ID);
            return double.Parse(objDR["Price"].ToString());
        }
        else return 0;
    }

    public void Update(string ID, double quantity)
    {
        if (ReturnID(ID) == true)
        {
            DataRow objDR = this.Rows.Find(ID);
            DataRow objDR2;
            objDR2 = this.NewRow();
            objDR2["ID"] = ID;
            objDR2["Code"] = objDR["Code"];
            objDR2["ProductCode"] = objDR["ProductCode"];
            objDR2["ProductName"] = objDR["ProductName"];
            objDR2["Image"] = objDR["Image"];
            objDR2["Quantity"] = quantity;
            objDR2["Price"] = objDR["Price"];
            objDR2["PriceSale"] = objDR["PriceSale"];
            objDR2["Score"] = objDR["Score"];
            objDR2["Brand"] = objDR["Brand"];
            objDR2["IsSale"] = objDR["IsSale"];
            objDR2["ColorName"] = objDR["ColorName"];
            objDR2["SizeName"] = objDR["SizeName"];
            objDR2["CountryName"] = objDR["CountryName"];
            objDR2["TotalPrice"] = Convert.ToSingle((Convert.ToSingle(objDR["Price"]) * quantity));

            this.Rows.Remove(objDR);
            this.Rows.Add(objDR2);
            tb = "Update Suceessfully Produce(s)";
        }
        else
        {
            tb = "Update NO Suceessfully Produce(s)";
        }

    }

    public void Delete(string ID)
    {
        if (ReturnID(ID) == true)
        {
            DataRow objDR = this.Rows.Find(ID);
            this.Rows.Remove(objDR);
            tb = "Delete Suceessfully Produce(s)";
        }
        else
        {
            tb = "Delete NO Suceessfully Produce(s)";
        }
    }
    public int GetCurrentQuantity(string ID)
    {
        string sl = "";
        for (int i = 0; i < this.Rows.Count; i++)
        {
            if (this.Rows[i]["ID"].ToString() == ID)
            {
                sl = this.Rows[i]["Quantity"].ToString();
            }
        }
        return int.Parse(sl) + 1;
    }
    public double getProductNotSale()
    {
        double price = 0;
        for (int i = 0; i < this.Rows.Count; i++)
        {
            if (double.Parse(this.Rows[i]["PriceSale"].ToString()) == 0)
            {
                price += double.Parse(this.Rows[i]["Price"].ToString());
            }
        }
        return price;
    }
    public bool ReturnID(string ID)
    {
        DataRow r = this.Rows.Find(ID);
        try
        {
            if (r.IsNull("ID"))
                return false;
            else return true;
        }
        catch (Exception) { };
        return false;
    }
    public float GetTotalPrice
    {
        get
        {
            object value = this.Compute("SUM(TotalPrice)", "");
            if (value.Equals(DBNull.Value) == true)
                return 0;
            else
                return float.Parse(value.ToString());
        }
    }

    public int GetCartCount
    {
        get { return this.Rows.Count; }
    }
    public string HasProduce
    {
        get { return tb; }
    }
    public double GetTotalQuantity
    {
        get
        {
            double s = 0;
            for (int i = 0; i < this.Rows.Count; i++)
            {
                s += double.Parse(this.Rows[i]["Quantity"].ToString());
            }
            return s;
        }
    }

}