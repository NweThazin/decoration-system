using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerReadyPackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ListView1.DataSourceID = "SqlDataSource1";
            ListView1.DataBind();
            Session["readycreate"] = "CustomerReadyPackge.aspx";
        }
    }
    //To Show Images..
    public string getImage(Object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }
    //For All Packages and Specified Type Packages
    protected void ddlPackage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPackage.SelectedValue == "all")
        {
            ListView1.DataSourceID = "SqlDataSource1";
            ListView1.DataBind();
        }
        else
        {
            ListView1.DataSourceID = "SqlDataSource2";
            ListView1.DataBind();
        }
    }
}