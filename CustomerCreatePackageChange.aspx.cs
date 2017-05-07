using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerCreatePackageChange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                Session["addcartID"] = Request.QueryString["cartid"];
                pnlItemDetail.Visible = false;
                DataView dvChange = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
                if (dvChange.Count != 0)
                {
                    string category = dvChange[0].Row[0].ToString();
                    if (category == "Ceiling")
                    {
                        MultiView1.SetActiveView(View1);
                        ListView1.DataSourceID = "SqlDataSource2";
                        ListView1.DataBind();
                    }
                    else if (category == "Wall")
                    {
                        MultiView1.SetActiveView(View2);
                        ListView2.DataSourceID = "ForAllWall";
                        ListView2.DataBind();
                    }
                    else if (category == "Floor")
                    {
                        MultiView1.SetActiveView(View3);
                        ListView3.DataSourceID = "SqlDataSource13";
                        ListView3.DataBind();
                    }
                    else if (category == "Lightning")
                    {
                        MultiView1.SetActiveView(View4);
                        ListView4.DataSourceID = "SqlDataSource15";
                        ListView4.DataBind();
                    }
                    else if (category == "Furniture")
                    {
                        MultiView1.SetActiveView(View5);
                        ListView5.DataSourceID = "SqlDataSource17";
                        ListView5.DataBind();
                    }
                    else if (category == "Accessories")
                    {
                        MultiView1.SetActiveView(View6);
                        ListView6.DataSourceID = "SqlDataSource19";
                        ListView6.DataBind();
                    }
                }
            }catch (Exception) { }
        }
    }
    //To get Image
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    //To Get Image Status
    protected string getStatus(Object itemCategory)
    {
        if (itemCategory.ToString() == "Ceiling")
        {
            return "per one square feet";
        }
        else if (itemCategory.ToString() == "Floor")
        {
            return "per one square feet";
        }
        else if (itemCategory.ToString() == "Wall")
        {
            return "per one square feet";
        }
        else if (itemCategory.ToString() == "Lightning")
        {
            return "per one unit";
        }
        else if (itemCategory.ToString() == "Furniture")
        {
            return "per one unit or per one set";
        }
        else
        {
            return "per one unit";
        }
    }//End of for status
    protected void lnkbtnChangePackage_Click(object sender, EventArgs e)
    {
        MultiView1.Visible = false;
        pnlItemDetail.Visible = true;
    }
    //To Change The Sub Category
    protected void ddlCeilingSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "SqlDataSource6";
        ListView1.DataBind();
    }
    protected void ddlWall_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView2.DataSourceID = "SqlDataSource8";
        ListView2.DataBind();
    }
    protected void ddlFloor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView3.DataSourceID = "SqlDataSource14";
        ListView3.DataBind();
    }
    protected void ddlLightning_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView4.DataSourceID = "SqlDataSource16";
        ListView4.DataBind();
    }
    protected void ddlFurniture_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView5.DataSourceID = "SqlDataSource18";
        ListView5.DataBind();
    }
    protected void ddlAccessories_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView6.DataSourceID = "SqlDataSource20";
        ListView6.DataBind();
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        MultiView1.Visible = true;
        pnlItemDetail.Visible = false;
        DataView dvSelect = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        if (dvSelect.Count != 0)
        {
            string cat = dvSelect[0].Row[2].ToString();
            if (cat == "Ceiling")
            {
                MultiView1.SetActiveView(View1);
            }
            else if (cat == "Wall")
            {
                MultiView1.SetActiveView(View2);
            }
            else if (cat == "Floor")
            {
                MultiView1.SetActiveView(View3);
            }
            else if (cat == "Lightning")
            {
                MultiView1.SetActiveView(View4);
            }
            else if (cat == "Furniture")
            {
                MultiView1.SetActiveView(View5);
            }
            else if (cat == "Accessories")
            {
                MultiView1.SetActiveView(View6);
            }
        }
    }
    protected void btnChooseItem_Click(object sender, EventArgs e)
    {
        //itemcartid
        try
        {
            SqlDataSource5.Update();
            Response.Redirect("CustomerCreatePackageView.aspx");
        }
        catch (Exception) { }
    }
    protected void btnGoGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerCreatePackageView.aspx");
    }
}