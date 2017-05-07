using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageServiceTeam : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Go to Service Team Home Page
    protected void lnkbtnServiceTeamHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("ServiceTeamHome.aspx");
    }
    //Go to Service Profile Page
    protected void lnkbtnProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("ServiceTeamProfile.aspx");
    }
    //Go to Logout 
    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("CustomerMainHomePage.aspx");
    }
}
