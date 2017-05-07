using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerOrderReadyPackages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void radbtnOrderLists_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radbtnOrderLists.SelectedValue == "create")
        {
            Response.Redirect("CustomerOrderLists.aspx");
        }
        else
        {
            Response.Redirect("CustomerOrderReadyPackages.aspx");
        }
    }
}