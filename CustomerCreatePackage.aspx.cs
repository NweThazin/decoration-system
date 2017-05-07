using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerCreatePackag : System.Web.UI.Page
{
    public static int c1, c2, c3, c4, c5, c6;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                c1 = c2 = c3 = c4 = c5 = c6 = 0;
                //When page load, The panel will be invisible and show View1
                pnlCreatePackage.Visible = false;
                createPackageView.SetActiveView(View1);
                Panel1.Visible = true;
                //To get Order Number,Payment Number,Package Number
                #region GenerateIDGroup
                int num = 10000; //For Order ID
                DataView dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    try
                    {
                        num = int.Parse(dv[0].Row[0].ToString());
                        num++;
                    }
                    catch (Exception)
                    {
                        num++;
                    }
                    Session["orderid"] = num.ToString();
                }

                int paynum = 00000; //For PaymentID
                DataView dvPayment = (DataView)SqlDataSource11.Select(DataSourceSelectArguments.Empty);
                if (dvPayment.Count != 0)
                {
                    try
                    {
                        paynum = int.Parse(dvPayment[0].Row[0].ToString());
                        paynum++;
                    }
                    catch (Exception)
                    {
                        paynum++;
                    }
                    Session["paymentid"] = paynum.ToString();
                }

                int packagenum = 1000; //For Package ID
                DataView dvPackage = (DataView)SqlDataSource10.Select(DataSourceSelectArguments.Empty);
                if (dvPackage.Count != 0)
                {
                    try
                    {
                        packagenum = int.Parse(dvPackage[0].Row[0].ToString());
                        packagenum++;
                    }
                    catch (Exception)
                    {
                        packagenum++;
                    }
                    Session["packageid"] = packagenum.ToString();
                }
                #endregion

                //To invisible customer profile
                Session["readycreate"] = "CustomerCreatePackage.aspx";
                GridView1.DataSourceID = "";
                GridView1.DataBind();
                //For Deleting the Add To Carts table
                SqlDataSource26.Delete();
            }
            catch (Exception) { }
         
        }
        Session["sessionid"] = Session.SessionID;
        
    }

    //This Function is to show images in lists views.
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }

    protected void btnViewCeiling_Click1(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "SqlDataSource1";
        ListView1.DataBind();
        createPackageView.SetActiveView(CeilingView);
    }
    protected void btnViewWall_Click(object sender, EventArgs e)
    {
        ListView2.DataSourceID = "SqlDataSource2";
        ListView2.DataBind();
        createPackageView.SetActiveView(WallView);    
    }
    protected void btnViewFloor_Click(object sender, EventArgs e)
    {
        ListView3.DataSourceID = "SqlDataSource3";
        ListView3.DataBind();
        createPackageView.SetActiveView(FloorView);
    }
    protected void btnViewLightning_Click(object sender, EventArgs e)
    {
        ListView4.DataSourceID = "SqlDataSource4";
        ListView4.DataBind();
        createPackageView.SetActiveView(LightningView);
    }
    protected void btnViewFurniture_Click(object sender, EventArgs e)
    {
        ListView5.DataSourceID = "SqlDataSource5";
        ListView5.DataBind();
        createPackageView.SetActiveView(FurnitureView);
    }
    protected void btnViewAccessories_Click(object sender, EventArgs e)
    {
        ListView6.DataSourceID = "SqlDataSource6";
        ListView6.DataBind();
        createPackageView.SetActiveView(AccessoriesView);
    }
    protected void lnkbtnPackageImage_Click(object sender, EventArgs e)
    {
        //When user click the View Detail link, Panel will shown..
        createPackageView.Visible = false;
        pnlCreatePackage.Visible = true;
        createPackageView.SetActiveView(View1);
    
    }
    //To create the package and insert the data to the package table
    protected void btnCreatePackage_Click(object sender, EventArgs e)
    {
        try
        {
            if (c1 > 0 && c2 > 0 && c3 > 0 && c4 > 0 && c5 > 0 && c6 > 0)
            {
                //To take the delivery address and order date to the other page
                Session["sessionid"] = Session.SessionID;
                Session["orderdate"] = System.DateTime.Today;
                Session["cartbutton"] = "CustomerCreatePackage";
                Session["readycreate"] = "CustomerCreatePackage.aspx";

                //decrese cartcount
                if (Session["cartcount"] == null)
                {
                    Session["cartcount"] = "0";
                    int count = int.Parse(Session["cartcount"].ToString());
                    count++;
                    Session["cartcount"] = count.ToString();
                }
                else
                {
                    int count = int.Parse(Session["cartcount"].ToString());
                    count++;
                    Session["cartcount"] = count.ToString();
                }

                Session["picpackgeid"]= Session["packageid"];
                Response.Redirect("CustomerCreatePackageView.aspx");
            }
            else
            {
                lblCreatePackage.Text = "You need to choose all items to create your own package";
            }
        }
        catch (Exception) { }
    }
    //For DDL Group
    protected void ddlCeiling_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "SqlDataSource14";
        ListView1.DataBind();
    }
    //SqlDS16
    protected void ddlWall_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView2.DataSourceID = "SqlDataSource25";
        ListView2.DataBind();
    }
    protected void ddlFloor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView3.DataSourceID = "SqlDataSource18";
        ListView3.DataBind();
    }
    protected void ddlLight_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView4.DataSourceID = "SqlDataSource20";
        ListView4.DataBind();
    }
    protected void ddlFurniture_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView5.DataSourceID = "SqlDataSource22";
        ListView5.DataBind();
    }
    protected void ddlAccessories_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView6.DataSourceID = "SqlDataSource24";
        ListView6.DataBind();
    }
    protected string getScale(Object itemCategory)
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
    }
    protected void btnGoBackCeiling_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    protected void btnGoBackWall_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    protected void btnGoBackFloor_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    protected void btnGoBackLigtning_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    protected void btnGoBackFurniture_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    protected void btnGoBackAccessories_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    protected void btnGoBackPanel_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
    }
    #region Choose Item
    protected void btnChooseItem_Click(object sender, EventArgs e)
    {
        createPackageView.Visible = true;
        createPackageView.SetActiveView(View1);
        pnlCreatePackage.Visible = false;
        Panel1.Visible = true;
        try
        {
            //For Detail View Item Detail Page
            DataView dv = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["itemid"] = dv[0].Row[0].ToString();//For Item ID
                String category = dv[0].Row[2].ToString();
                if (category == "Ceiling")
                { 
                    c1++;
                }
                else if (category == "Wall")
                {
                    c2++;
                }
                else if (category == "Floor")
                {
                    c3++;
                }
                else if (category == "Lightning")
                {
                    c4++;
                }
                else if (category == "Furniture")
                {
                    c5++;
                }
                else if (category == "Accessories")
                {
                    c6++;
                }
            }
            SqlDataSource8.Insert(); //To add data into the cart
            //To get from grid View 
            GridView1.DataSourceID = "SqlDataSource12";
            GridView1.DataBind();
        }
        catch (Exception) { }
    }
    #endregion
}