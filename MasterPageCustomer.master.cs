using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageCustomer : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                #region To_Invisible_Links
                if (Session["email"] != null)
                {
                    lnkbtnUserProfile.Visible = true;
                    lnkbtnLogout.Visible = true;
                    btnimage.Visible = false;
                    lnkbtnOrderLists.Visible = true;
                }
                else
                {
                    lnkbtnUserProfile.Visible = false;
                    lnkbtnLogout.Visible = false;
                    btnimage.Visible = true;
                    lnkbtnOrderLists.Visible = false;
                }
                #endregion

                #region Video_Section
                Session["vv"] = 1;
                DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
                string url = dv[0].Row[1].ToString();
                FlashControl2.MovieUrl = url;
                FlashControl2.Play = true;
                FlashControl2.Loop = true;
                #endregion

                Label1.Text = Session["cartcount"].ToString(); 
            }
            catch (Exception) { }
        }
    }
    //To Create Package Page...
    protected void lnkbtnCreatePackage_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerCreatePackage.aspx");
    }
    //To Ready Package Page
    protected void lnkbrnReadyPackage_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerReadyPackage.aspx");
    }
    //To User Profile Page..
    protected void lnkbtnUserProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerProfilePage.aspx");
    }
    //Logout Link and to Main Home Page
    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource2.Delete();//To Delete Add To Carts Table
            SqlDataSource3.Delete();//To Delete Package Table 
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("CustomerMainHomePage.aspx");
        }
        catch (Exception) { }
      
    }
    //To Customer Home Page
    protected void lnkbtnCustomerHome_Click(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            //If Customer has logged in , to Customer Home Page
            Response.Redirect("CustomerHomePage.aspx");
        }
        else
        {
            //If Customer has not logged in , to No login Main page
            Response.Redirect("CustomerMainHomePage.aspx");
        }
    }
    //To Login Page
    protected void btnimage_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("LoginFormPage.aspx");
    }
    protected void lnkbtnHelp_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerContactUs.aspx");
    }
    protected void lnkbtnOrderLists_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerRequestOrderLists.aspx");
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
