using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminManageViewItem : System.Web.UI.Page
{
    //SqlDataSource1 is for to select All Items Lists
    //SqlDataSource2 is for to select Items by category type
    //SqlDataSource3 is for to sub category types form ItemsSubCategory Table
    //SqlDataSource4 is for to selects items by category and itemssubcategory
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }
            catch (Exception) { }
            
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblCategory.Text = DropDownList1.SelectedValue;
        if (DropDownList1.SelectedValue == "All")
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
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "add")
        {
            Response.Redirect("AdminManageItem.aspx");
        }
        else if (RadioButtonList1.SelectedValue == "view")
        {
            Response.Redirect("AdminManageViewItem.aspx");
        }
        else
        {
            Response.Redirect("AdminReorderLists.aspx");
        }
    }
    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource4";
        GridView1.DataBind();
    }
}