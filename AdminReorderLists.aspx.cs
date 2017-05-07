using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminReorderLists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
        }
    }
    //To get Image
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    //When Selected Index Changed
    protected void radbtnItemInformation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radbtnItemInformation.SelectedValue == "add")
        {
            Response.Redirect("AdminManageItem.aspx");
        }
        else if (radbtnItemInformation.SelectedValue == "view")
        {
            Response.Redirect("AdminManageViewItem.aspx");
        }
        else
        {
            Response.Redirect("AdminReorderLists.aspx");
        }
    }
    protected void ddlViewByCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlViewByCategory.SelectedValue == "Ceiling")
        {
            MultiView1.SetActiveView(View1);
        }
        else if (ddlViewByCategory.SelectedValue == "Wall")
        {
            MultiView1.SetActiveView(View2);
        }
        else if (ddlViewByCategory.SelectedValue == "Floor")
        {
            MultiView1.SetActiveView(View3);
        }
        else if (ddlViewByCategory.SelectedValue == "Lightning")
        {
            MultiView1.SetActiveView(View4);
        }
        else if (ddlViewByCategory.SelectedValue == "Furniture")
        {
            MultiView1.SetActiveView(View5);
        }
        else if (ddlViewByCategory.SelectedValue == "Accessories")
        {
            MultiView1.SetActiveView(View6);
        }
    }
}