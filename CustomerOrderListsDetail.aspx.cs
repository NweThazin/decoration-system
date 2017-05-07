using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerOrderListsDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //To get Image
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    //To Show Customer Name
    protected void lnkbtnCustomerName_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View1);
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["customerid"] = dv[0].Row[5].ToString();
            }
        }
        catch (Exception) { }
    }
    //To Show Package Name
    protected void lnkbtnPackageName_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View2);
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["packageid"] = dv[0].Row[4].ToString();
            }
        }
        catch (Exception) { }

    }
    //To Calculate Grand Total

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[10].ToString(), out q);
                int.TryParse(dr[11].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[7].FindControl("lblGrandTotal")).Text = total.ToString();
            Session["grandtotal"] = int.Parse(total.ToString());
        }
        catch (Exception) { }

    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerOrderLists.aspx");
    }
    //To Get Order Status..
    protected string getOrderStatus(Object status)
    {
        if (status.ToString() == "0")
        {
            return "Undeliver";
        }
        else if (status.ToString() == "1")
        {
            return "Delivered";
        }
        else
        {
            return "Finished";
        }
    }
}