using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerReadyPackageDetails : System.Web.UI.Page
{
    CoffeeDBEntities1 dbobj = new CoffeeDBEntities1();
    int a, b;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["readycreate"] = "CustomerReadyPackge.aspx";
            Session["sessionid"] = Session.SessionID;
        }
    }
    //To Show Images in image table
    protected string getImage(Object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }

    protected void DetailsView1_PreRender(object sender, EventArgs e)
    {
        try
        {
            #region GenerateAUTOID
            int j = 1; int i = 10000;
            Session["sid"] = Session.SessionID;
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                try
                {
                    i = int.Parse(dv[0].Row[0].ToString());
                    i++;
                }
                catch (Exception)
                {
                    i++;
                }
                Session["orderid"] = i.ToString();
            }
            DataView dvj = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            if (dvj.Count != 0)
            {
                try
                {
                    b = int.Parse(dvj[0].Row[0].ToString());
                    b++;
                }
                catch (Exception)
                {
                    b++;
                }
                Session["payID"] = b.ToString();
                Session["paymentID"] = b.ToString();
            }
            else
            {
                Session["payID"] = j.ToString();
            }
            #endregion
        }
        catch (Exception) { }
     }//End of PreRender Event..
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerReadyPackage.aspx");
    }
    //for first inserting to AddToCart Table
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        try
        {
            DataView dvPackageName = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dvPackageName.Count != 0)
            {
                Session["packageName"] = dvPackageName[0].Row[1].ToString();
                Session["packageid"] = dvPackageName[0].Row[0].ToString();
                //To get PackageName
            }
            String pid = Request.QueryString["packageid"];
            Session["pid"] = pid;
            int packid = int.Parse(Session["pid"].ToString());
            List<PackageItem> obj = dbobj.PackageItems.Where(pId => pId.Package_packageID == packid).ToList();
            String connection = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\User\Desktop\CoffeeShopDecoration\App_Data\CoffeeDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            SqlConnection conn = new SqlConnection(connection);
            conn.Open();
            //Inserting into the add to cart tables..
            foreach (PackageItem iid in obj)
            {
                string str = @"insert into AddToCarts values(@pID,@iID,@oID,@payID,@sID,@qty)";
                SqlCommand cmd = new SqlCommand(str, conn);
                cmd.Parameters.AddWithValue("@pID", int.Parse(Session["pid"].ToString()));
                cmd.Parameters.AddWithValue("@iID", iid.Item_itemID);
                cmd.Parameters.AddWithValue("@oID", int.Parse(Session["orderid"].ToString()));
                cmd.Parameters.AddWithValue("@payID", int.Parse(Session["payID"].ToString()));
                cmd.Parameters.AddWithValue("@sID", (Session["sid"].ToString()));
                cmd.Parameters.AddWithValue("@qty", 1);
                int i = (int)cmd.ExecuteNonQuery();

            }
            conn.Close();
            SqlDataSource6.Insert();
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
            Response.Redirect("AddToCardpage.aspx");
        }
        catch (Exception) { }

    }//End of Add To Cart Event...
    protected string getStatus(Object category)
    {
        if (category.ToString() == "Ceiling")
        {
            return "per one square feet";
        }
        else if (category.ToString() == "Wall")
        {
            return "per one square feet";
        }
        else if (category.ToString() == "Floor")
        {
            return "per one square feet";
        }
        else if (category.ToString() == "Lightning")
        {
            return "per one unit";
        }
        else if (category.ToString() == "Furniture")
        {
            return "per one unit or one set";
        }
        else
        {
            return "per one unit";
        }
    }
}