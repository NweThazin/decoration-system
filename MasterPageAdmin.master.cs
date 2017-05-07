using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region FOR_Image_ALERT
            try
            {
                //For Image Alert
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    imgbtnAlert.Visible = true;
                    imgbtnFinishedAlert.Visible = false;
                }
                else
                {
                    imgbtnAlert.Visible = false;
                    imgbtnFinishedAlert.Visible = true;
                }
                DataView dvCount = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dvCount.Count != 0)
                {
                    if (dvCount[0].Row[0].ToString() == "0")
                    {
                        lblCount.Visible = false;
                    }
                    else
                    {
                        lblCount.Text = dvCount[0].Row[0].ToString();
                    }

                }
            }
            catch (Exception) { }
            #endregion

        }
    }
    //Go To Service Team Information Page...
    protected void lnkbtnAddService_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminAddServiceTeam.aspx");
    }
    //Go To Item Information and Items Detailed Page
    protected void lnkbtnItem_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminManageViewItem.aspx");
    }
    //Go To Package Information and Create Package Information Pages
    protected void lnkbtnPackage_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPackageDetail.aspx");
    }
    //Go To Admin Home Page
    protected void lnkbtnAdminHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHomePage.aspx");
    }
    //Go To Customer OrderLists Page
    protected void lnkbtnCustomerOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerOrderLists.aspx");
    }
    //Logout Event
    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("CustomerMainHomePage.aspx");
    }
    //Go to Customer Update Profile
    protected void lnkbtnUpdateProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminProfilePage.aspx");
    }
    //To Customer Information Lists
    protected void lnkbtnCustomerInfo_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("AdminCustomerInformationLists.aspx");
    }
    //Go to Message Page (For Unread Message)
    protected void imgbtnAlert_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AdminViewMessage.aspx");
    }
    //Go to Message Page (For Read Message)
    protected void imgbtnFinishedAlert_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AdminViewMessage.aspx");
    }
    //Go to Video Upload Page
    protected void lnkbtnViewReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdvertisementVideo.aspx");
    }
    //Go to Fincancial Report Page
    protected void lnkbtnFinancialReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewFinancalReportPage.aspx");
    }
    //Go to Max Min Package Report Page
    protected void lnkbtnStockReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminViewMaxMinOrderPage.aspx");
    }
}
