using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
        }
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View2);
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["adminid"] = dv[0].Row[0].ToString();
                Session["adminemail"] = dv[0].Row[2].ToString();
                Session["adminpwd"] = dv[0].Row[3].ToString();
            }
        }
        catch (Exception) { }
    }
    //To check the password length..
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 8;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        if (Page.IsValid)
        {
            try
            {
                //To change new password
                DataView dvSave = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dvSave.Count != 0)
                {
                    SqlDataSource2.Update();
                    Session["adminpwd"] = txtNewPassword.Text;
                    MultiView1.SetActiveView(View1);
                    txtOldPassword.Text = txtNewPassword.Text = txtConfirmNewPassword.Text = "";
                }
                else
                {
                    lblMessage.Text = "Incorrect Current Password";
                    txtOldPassword.Text = txtNewPassword.Text = txtConfirmNewPassword.Text = "";
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Error";
            }
            
        }
    }
}