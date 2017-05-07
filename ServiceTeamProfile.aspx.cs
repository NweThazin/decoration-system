using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceTeamProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            MultiView1.SetActiveView(View2);

    }
    //Check Password Email
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Count != 0)
        {
            Session["steamid"] = dv[0].Row[0].ToString();
            Session["steamemail"] = dv[0].Row[3].ToString();
            Session["steampwd"] = dv[0].Row[2].ToString();
        }
        //Get Service Team
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        if (Page.IsValid)
        {
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                SqlDataSource2.Update();
                txtNewPassword.Text = txtConfirmPassword.Text = txtOldPassword.Text = "";
                //MultiView1.Visible = false;
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //MultiView1.Visible = false;
        MultiView1.SetActiveView(View2);
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 8;
    }
}