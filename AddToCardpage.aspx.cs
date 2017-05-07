using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddToCardpage : System.Web.UI.Page
{
    CoffeeDBEntities1 dbobj = new CoffeeDBEntities1();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    #region Calculate TotalPrice
    public string getTotal(object unit, object qty)
    {
        int i = 0;
        int j = 0;
        int.TryParse(unit.ToString(), out i);
        int.TryParse(qty.ToString(), out j);
        return (i * j).ToString();
    }
    #endregion

    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        try
        {
            //To Show Total Price and View
            MultiView1.SetActiveView(OrderView);
            GridView2.DataBind();
        }
        catch (Exception)
        { }
    }

    protected void btnBuy_Click(object sender, EventArgs e)
    {
        //If the customers is not logged in user,go to loginform page otherwise goto customerpayment form..aspx
        try
        {
            if (Session["email"] != null)
            {
                Response.Redirect("CustomerPaymentForm.aspx");
            }
            else
            {   
                Server.Transfer("LoginFormPage.aspx");
            }
        }
        catch (Exception) { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(UpdateView);
    }

    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("CustomerReadyPackage.aspx");
        }
        catch (Exception) { }
    }

    //To Update the data..
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int packid = int.Parse(Session["pid"].ToString());
            List<PackageItem> obj = dbobj.PackageItems.Where(pId => pId.Package_packageID == packid).ToList();
            String connection = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\User\Desktop\CoffeeShopDecoration\App_Data\CoffeeDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            SqlConnection conn = new SqlConnection(connection);
            conn.Open();
            foreach (PackageItem iid in obj)
            {
                //toget itemnumber
                if (GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text == iid.Item_itemID.ToString())
                {
                    Session["Itemid"] = iid.Item_itemID.ToString();
                    int i = int.Parse(Session["Itemid"].ToString());
                }
            }
            conn.Close();

        }catch (Exception) {    }
   
    }//End of the GridView1 selected index changed..

    #region Calculate GrandTotal
    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            int p, q;
            long t = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[4].ToString(), out p);
                int.TryParse(dr[5].ToString(), out q);
                t += p * q;
            }
            Session["GrandTotal"] = t.ToString();
            ((Label)GridView2.FooterRow.Cells[5].FindControl("lblGrandTotal")).Text = t.ToString();
        }
        catch (Exception) {  }     
    }
    #endregion

    //To Check the quantity is enough or not..///
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int uqty = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("qtyTextBox")).Text);
            DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            DataView dvadd = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0 && dvadd.Count != 0)
            {
                //Change
                for (int i = 0; i < dvadd.Count; i++)
                {
                    if (dv[i].Row[0].ToString() == dvadd[i].Row[2].ToString())
                    {
                        if (int.Parse(dv[i].Row[1].ToString()) <= uqty)
                        {
                            //SqlDataSource6.Update();
                            lblqtymsg.Text = "Sorry Customer.. We don't have enough Quantity";
                            btnCalculate.Enabled = false;
                        }
                        else
                        {
                            lblqtymsg.Text = "";
                            btnCalculate.Enabled = true;
                        }
                    }
                }
            }
        }
        catch (Exception)
        { 
            
        }

    }//End of GridView1 Row Updating Event..

    public string getPackageName()
    {
        try
        {
            string packgeName = Session["packageName"].ToString();
            return packgeName;
        }
        catch (Exception) {
            
            return "";
        } 
    }
    //To Show Image
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
}