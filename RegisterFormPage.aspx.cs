using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterFormPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //For Cancel Case
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtCustName.Text = txtCustNRC.Text = txtCustPhone.Text = txtCustPwd.Text = "";
        txtCustAddress.Text = txtCustConfirmPwd.Text = txtCustEmail.Text = "";
        Response.Redirect("CustomerMainHomePage.aspx");
    }
    //This is for Phone Number length..
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 7;
    }
    //This is for Password Length...
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 8;
    }

    //For Register Case
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //This is check email address is already exit or not..
            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            if (dv.Count != 0)
            {
                lblMessage.Text = "The email you entered is already existed,Please reenter new Email !";
                txtCustPwd.Attributes.Add("value", txtCustPwd.Text);
                txtCustConfirmPwd.Attributes.Add("value", txtCustConfirmPwd.Text);
                txtCustEmail.Text = "";

            }
            else
            {
                SqlDataSource2.Insert();
                Response.Redirect("LoginFormPage.aspx");

            }
        }
    }
}