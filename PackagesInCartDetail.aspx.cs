using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PackagesInCartDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Session["pid"]=Request.QueryString["packageid"];
            DataView dvDelete = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (dvDelete.Count != 0)
            {
                Session["ptid"] = dvDelete[0].Row[0].ToString();
            }
        }
    }
    //Get Total Price
    public string getTotal(object unit, object qty)
    {
        int i = 0;
        int j = 0;
        int.TryParse(unit.ToString(), out i);
        int.TryParse(qty.ToString(), out j);
        return (i * j).ToString();
    }
    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv2 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (dv2.Count != 0)
            {
                int p, q;
                long t = 0;
                foreach (DataRowView dr in dv2)
                {
                    int.TryParse(dr[4].ToString(), out p);
                    int.TryParse(dr[5].ToString(), out q);
                    t += p * q;
                }
                Session["GrandTotal"] = t.ToString();
                ((Label)GridView2.FooterRow.Cells[6].FindControl("lblGrandtotal")).Text = t.ToString();
            }
        }
        catch (Exception) { }
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("PackagesInCart.aspx");
    }
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            int count = int.Parse(Session["cartcount"].ToString());
            if (count != 0)
            {
                count--;
                Session["cartcount"] = count.ToString();
            }
            else
            {
                Session["cartcount"] = "0";
            }
            SqlDataSource2.Delete();
            SqlDataSource3.Delete();
            Response.Redirect("PackagesInCart.aspx");
        }
        catch (Exception) { }
    
    }
    protected void btnOrder_Click(object sender, EventArgs e)
    {
        try
        {
            Session["pid"] = Request.QueryString["packageid"];
            Session["sid"] = Request.QueryString["sessionid"];
            Response.Redirect("AddToCardpage.aspx");
        }
        catch (Exception) { }
     
    }
}