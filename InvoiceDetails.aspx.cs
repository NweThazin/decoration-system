using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InvoiceDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[2].ToString(), out q);
                int.TryParse(dr[3].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[6].FindControl("lblGrandTotal")).Text = total.ToString();
        }
        catch (Exception) { }
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerRequestOrderLists.aspx");
    }
}