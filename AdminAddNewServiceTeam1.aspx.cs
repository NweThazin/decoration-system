using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAddNewServiceTeam1 : System.Web.UI.Page
{
    string pass;
    string conpass;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           pass = txtpass.Text;
           conpass = txtconfirmpass.Text;
        }
    }
    //For Add New Service Team Button
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            if (dv.Count != 0)
            {
                lbMag.Text = "Service Team Name or Email is already exit";
                txtconfirmpass.Text = conpass;
                txtpass.Text = pass;
                txteamil.Text = "";
                txtname.Text = "";
                txteamil.Focus();
            }
            else
            {
                SqlDataSource1.Insert();
                lbMag.Text = "Successful!";
                txtname.Text = txtpass.Text = txteamil.Text = txtconfirmpass.Text = "";
                Response.Redirect("AdminAddServiceTeam.aspx");
            }
        }
        catch (Exception)
        { 
            
        }
    }
   //For Radio Selected Changed
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "2")
        {
            Response.Redirect("AdminAddNewServiceTeam1.aspx");
        }
        else
        {
            Response.Redirect("AdminAddServiceTeam.aspx");
        }
    }

    //For Cancel Event
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtname.Text = txtpass.Text = txteamil.Text = txtconfirmpass.Text = "";
        Response.Redirect("AdminAddServiceTeam.aspx");
    }
}