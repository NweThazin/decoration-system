using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceTeamHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            lblTitle.Text = "Provided Package Order Information";
        }
    }
    
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "2")
        {
            MultiView1.SetActiveView(View2);
            lblTitle.Text = "Create Package Order Information";
        }
        else
        {
            MultiView1.SetActiveView(View1);
            lblTitle.Text = "Provided Package Order Information";
        }

    }
}