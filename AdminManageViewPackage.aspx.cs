using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminManageViewPackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            //Sql Data Source 2 is to select data from Virtual Table
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                Session["pid"] = dr[1].ToString();
                Session["iid"] = dr[2].ToString();
                SqlDataSource3.Insert();
                //SqlDataSource3 is to insert the PackageItems Table
            }
            Response.Redirect("AdminPackageDetail.aspx");
        }
        catch (Exception) { }
      
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            //Sqldatasource4 is to delete from table
            SqlDataSource4.Delete();
            Response.Redirect("AdminManagePackage.aspx");
        }
        catch (Exception) { }

    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int price; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[4].ToString(), out price);
                total = total + price;
            }
            ((Label)GridView1.FooterRow.Cells[5].FindControl("lblGrandTotal")).Text = total.ToString();
        }
        catch (Exception) { }
    }
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
}