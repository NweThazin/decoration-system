using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportingDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    //Go Back to Financial Report page
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewFinancalReportPage.aspx");
    }
    //To Change Status
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
    protected string getImage(object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    protected void GridView1_DataBound1(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[6].ToString(), out q);
                int.TryParse(dr[7].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[6].FindControl("lblGrandTotal")).Text = total.ToString();
        }
        catch (Exception) { }
    }
}