using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//SqlDataSource1 is for to select all packages lists
//SqlDataSource2 is for to select by package category
public partial class AdminPackageDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
    }
    //To View All Package Lists Accordind to radiio button lsits
    protected void radbtnPackgeType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radbtnPackgeType.SelectedValue == "view")
        {
            Response.Redirect("AdminPackageDetail.aspx");
        }
        else
        {
            Response.Redirect("AdminManagePackage.aspx");
        }
    }
    //To View packages lists according to ddlvalue
    protected void ddlByPackageCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlByPackageCategory.SelectedValue == "all")
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSourceID = "SqlDataSource2";
            GridView1.DataBind();
        }
    }
}