using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPackageDetailCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int pstatus = int.Parse(Request.Params["pstatus"].ToString());
                int packageid = int.Parse(Request.Params["pid"].ToString());
                if (pstatus == 0)
                {
                    //Show Ready Package
                    MultiView1.SetActiveView(View1);
                }
                else
                {
                    MultiView1.SetActiveView(View2);
                }
            }
            catch (Exception) { }
         }
    }
    //to show images..
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    protected void lnkbtnPackageName_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View3);
        try
        {
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["packageid"] = dv[0].Row[0].ToString();
            }
        }
        catch (Exception) { }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPackageDetail.aspx");
    }
    protected void lnkbtnPackageName_Click1(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View4);
        try
        {
            DataView dvPackageName = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dvPackageName.Count != 0)
            {
                Session["ppid"] = dvPackageName[0].Row[0].ToString();
            }
        }
        catch (Exception) { }
    }
    //To Show Pacakge Information
    protected void btnV3V2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }
    protected void btnV4V1_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
}