using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PackagesInCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
            try
            {
                if (Session["cartbutton"].ToString() != "")
                {
                    pnlCreate.Visible = true;
                }
                else
                {
                    pnlCreate.Visible = false;
                }
            }
            catch (Exception) {
                pnlCreate.Visible = false;
            }
        }
    }
    //To get Image
    //protected void btnShow_Click(object sender, EventArgs e)
    //{
    //    if (Session["email"] != null)
    //    {
    //        Response.Redirect("CustomerPaymentForm.aspx");
    //    }
    //    else
    //    {
    //        Server.Transfer("LoginFormPage.aspx");
    //    }
    //}
    //This is for Image...
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        try
        {
            Session["packageid"] = Session["picpackgeid"];
            Response.Redirect("CustomerCreatePackageView.aspx");
        }
        catch (Exception) { }
     
    }
    //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Session["pid"] = GridView1.Rows[GridView1.SelectedIndex].Cells[0].ToString();
    //}
    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("AddToCardpage.aspx");
    //}
}