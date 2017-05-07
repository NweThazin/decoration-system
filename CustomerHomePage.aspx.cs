using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//SqlDataSource3 is to select all the package lists by pacakge status=0
public partial class CustomerHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //This is for to show all packages information...
        if (!IsPostBack)
        {
            try
            {
                ListView1.DataSourceID = "SqlDataSource3";
                ListView1.DataBind();
                Label1.Text = Session["username"].ToString();
            }
            catch (Exception) { }
        }
    }
    //To show images in lists view
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    protected void lnkbtnPackageImage_Click(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (DropDownList1.SelectedValue == "all")
        {
            //sql3 for all 
            ListView1.DataSourceID = "SqlDataSource3";
            ListView1.DataBind();
        }
        else
        {
            //sql4 for value
            ListView1.DataSourceID = "SqlDataSource4";
            ListView1.DataBind();
        }

    }
}