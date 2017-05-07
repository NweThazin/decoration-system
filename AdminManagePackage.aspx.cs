using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//SqlDataSource1 is for To Insert New Package
//SqlDataSource2 is for all Ceiling SqlDS10 is for SubCategory by Ceiling SqlDS 11 is for ceiling by ceiling subcategory..
//SqlDataSource 4,12,13 is for Wall View
//SqlDataSource 5,14,15 is for Floor View
//SqlDataSource 6,16,17 is for Lightning View
//SqlDataSource 7,18,19 is for Furniture View
//SqlDataSource 8,20,21 is for Accessories View

public partial class AdminManagePackage : System.Web.UI.Page
{
    public static int c1, c2, c3, c4, c5, c6;
    protected void Page_Load(object sender, EventArgs e)
    {
        //When the page load, the panel will not be visible....
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            pnlDetailView.Visible = false;
            c1 = c2 = c3 = c4 = c5 = c6 = 0;
        }
        Session["sessionid"] = Session.SessionID;
    }
    //This Event is Auto Generate ID....
    protected void lblPackageID_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region Auto Generate PackageID
            int num = 2000;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dv.Count != 0)
            {
                try
                {
                    num = int.Parse(dv[0].Row[0].ToString());
                    num++;
                    lblPackageID.Text = num.ToString();
                }
                catch (Exception)
                {
                    num++;
                    lblPackageID.Text = num.ToString();
                }
                //This is to add package into session...
                Session["packageid"] = num.ToString();
            }
            #endregion
        }
    }
    //This Event is to upload image when click upload button
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            int size = filePackage.PostedFile.ContentLength;
            byte[] theImage = new byte[size];
            HttpPostedFile Image = filePackage.PostedFile;
            Image.InputStream.Read(theImage, 0, size);
            imgPackage.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])theImage);
            Session["packageImage"] = theImage;
        }
        catch (Exception) { }
    
    }
    //This Event is to change image parameter when sqldatasource 1 is inserting
    protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //To Insert the image into the table
        try
        {
            byte[] theImage = Session["packageImage"] as byte[];
            SqlParameter sqlUpload = new SqlParameter("@packageImage", SqlDbType.Image);
            sqlUpload.Value = theImage;
            e.Command.Parameters.Add(sqlUpload);
        }
        catch (Exception) { }
        
    }
    //This Function is to show images in lists views.
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    //The Start of Button Group
    protected void btnViewCeiling_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.SetActiveView(View2);

        ListView1.DataSourceID = "SqlDataSource2";
        ListView1.DataBind();
    }
    protected void btnViewWall_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.SetActiveView(View3);

        ListView2.DataSourceID = "SqlDataSource4";
        ListView2.DataBind();
    }
    protected void btnViewFloor_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.SetActiveView(View4);

        ListView3.DataSourceID = "SqlDataSource5";
        ListView3.DataBind();
    }
    protected void btnViewLightning_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.SetActiveView(View5);

        ListView4.DataSourceID = "SqlDataSource6";
        ListView4.DataBind();
    }
    protected void btnViewFurniture_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.SetActiveView(View6);

        ListView5.DataSourceID = "SqlDataSource7";
        ListView5.DataBind();
    }
    protected void btnViewAccessories_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.SetActiveView(View7);

        ListView6.DataSourceID = "SqlDataSource8";
        ListView6.DataBind();
    }

    protected void btnCreatePackage_Click(object sender, EventArgs e)
    {
        try
        {
            if (c1 > 0 && c2 > 0 && c3 > 0 && c4 > 0 && c5 > 0 && c6 > 0)
            {
                SqlDataSource1.Insert();
                Session["sessionid"] = Session.SessionID;
                Response.Redirect("AdminManageViewPackage.aspx");
            }
            else
            {
                lblCreatePaclage.Text = "Please choose all items to create new package!!!";
            }

        }
        catch (Exception) { }
   
    }//The End of Button Group
    protected void lnkbtnItemImage_Click(object sender, EventArgs e)
    {
        MultiView1.Visible = false;
        pnlDetailView.Visible = true;
    }
    //Choose Item and Insert item to PackageItem table and show package
    protected void btnChooseItem_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View1);
            MultiView1.Visible = true;
            pnlDetailView.Visible = false;
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["itemid"] = dv[0].Row[0].ToString();

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
                //To Add Iteminto PackageItem Table
                SqlDataSource9.Insert();
            }
        
        }
        catch (Exception) { }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "view")
        {
            Response.Redirect("AdminPackageDetail.aspx");
        }
        else
        {
            Response.Redirect("AdminManagePackage.aspx");
        }
    }
    //By DDL
    #region SUB Category Group
    protected void ddlCeiling_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "SqlDataSource11";
        ListView1.DataBind();
    }
    protected void ddlWall_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView2.DataSourceID = "SqlDataSource13";
        ListView2.DataBind();
    }
    protected void ddlFloor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView3.DataSourceID = "SqlDataSource15";
        ListView3.DataBind();
    }
    protected void ddlLightning_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView4.DataSourceID = "SqlDataSource17";
        ListView4.DataBind();
    }
    protected void ddlFurniture_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView5.DataSourceID = "SqlDataSource19";
        ListView5.DataBind();
    }
    protected void ddlAccessories_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView6.DataSourceID = "SqlDataSource21";
        ListView6.DataBind();
    }
    #endregion

    #region Go Back Button Group
    protected void btnGoBackCeiling_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBackWall_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBackFloor_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBackLightning_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBackFurniture_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBackAccess_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    protected void btnGoBackPanel_Click(object sender, EventArgs e)
    {
        pnlDetailView.Visible = false;
        MultiView1.Visible = true;
        MultiView1.SetActiveView(View1);
    }
    #endregion
}