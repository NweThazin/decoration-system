using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageHome : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int count = int.Parse(Session["cartcount"].ToString());
            if (count != 0)
            {
                Label1.Text = Session["cartcount"].ToString();
            }
            else
            Label1.Text = "0";
        }
        catch (Exception) {

            //Label1.Text = "0";
        }
    }
    //To Login Page
    protected void btnimage_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("LoginFormPage.aspx");
    }
    //To Create Package Page
    protected void lnkbtnCreatePackage_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerCreatePackage.aspx");
    }
    //To Ready Package Page
    protected void lnkbrnReadyPackage_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerReadyPackage.aspx");
    }
    protected void lnkbtnAdminHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerMainHomePage.aspx");
    }
    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerContactUs.aspx");
    }
    protected void lnkbtnAboutUs_Click(object sender, EventArgs e)
    {
        Response.Redirect("IndexAboutUs.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("PackagesInCart.aspx");
    }
}
