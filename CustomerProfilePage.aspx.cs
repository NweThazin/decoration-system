using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


//SqlDataSource1 is for to show customer profile in detailed view
//SqlDataSource3 is for update..

public partial class CustomerProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //When load the page, Customer Information View will show..
            MultiView1.SetActiveView(CustomerInformationView);
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //To View Update Customer View
        MultiView1.SetActiveView(UpdateCustomerView);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //When Cancel Show View 1
        MultiView1.SetActiveView(CustomerInformationView);
    }
    //For Password Length
    protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 8;
    }
    //To Save Updated Information
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //To Select the Customer Profile Information from Customer tables..
        if (Page.IsValid)
        {
            try
            {
                DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    SqlDataSource3.Update();
                    Session["pwd"] = txtNewPassword.Text;
                    MultiView1.SetActiveView(CustomerInformationView);
                }
                else
                {
                    lblMessage.Text = "Incorrect Password!";
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Sorry!! Error";
            }
  
        }
   
    }
}