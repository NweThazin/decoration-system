using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                SqlDataSource2.Update();
                MultiView1.SetActiveView(View1);
            }
            catch (Exception) { }
        }
        
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminViewMessage.aspx");
    }
    protected void lnkbtnEmail_Click(object sender, EventArgs e)
    {
        try
        {
              DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
              if (dv.Count != 0)
              {
                    MultiView1.SetActiveView(View2);
              }
        }
        catch (Exception)
        {
            MultiView1.SetActiveView(View1);
        }
  
    }
    protected void btnCustomerGoBack_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
}