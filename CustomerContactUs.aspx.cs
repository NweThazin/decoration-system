using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //For not logged in user
                if (Session["email"] == null)
                {
                    Session["userid"] = null;
                    HiddenField1.Value = DateTime.Now.ToString();
                }
                else
                {
                    txtName.Text = Session["username"].ToString();
                    txtEmail.Text = Session["email"].ToString();
                    HiddenField1.Value = DateTime.Now.ToString();
                }
            }
           catch (Exception) { }
        }
    }
    //Send Click Event
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            DataView dv = SqlDataSource3.Select(DataSourceSelectArguments.Empty) as DataView;
            int id = 0;
            if (dv.Count > 0)
            {
                int.TryParse(dv[0].Row[0].ToString(), out id);
                id++;
                //To Write in file
                StreamWriter w = File.CreateText(Server.MapPath(@"~/Message/" + id + ".txt"));
                w.Write(txtName.Text + txtEmail.Text + txtPhone.Text + txtMsg.Text);
                w.Close();
            }

            SqlDataSource3.Insert();
            txtMsg.Text = txtPhone.Text = "";
            if (Session["email"] == null)
            {
                Response.Redirect("CustomerMainHomePage.aspx");
            }
            else
            {
                Response.Redirect("CustomerHomePage.aspx");
            }
        }
        catch (Exception) { }

    }//End of the btnSend Event..
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("CustomerMainHomePage.aspx");
        }
        else
        {
            Response.Redirect("CustomerHomePage.aspx");
        }
    }
}