using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ServiceTeamViewCreateDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //for display image
    protected string getImage(object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    protected void btnDelivery_Click(object sender, EventArgs e)
    {
        try
        {
            DataView dv = SqlDataSource3.Select(DataSourceSelectArguments.Empty) as DataView;
            if (dv != null)
            {
                SqlDataSource3.Update();
            }
            Response.Redirect("ServiceTeamHome.aspx");
        }
        catch (Exception) { }
       
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ServiceTeamHome.aspx");
    }
}