using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminItemDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
                Session["itemImage"] = dv[0].Row[3];
            }
            catch (Exception)
            { }  
        }
    }
    //To Show Image in Detail Page
    protected string getImage(Object img) 
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminManageViewItem.aspx");
    }
    //For Upload Event
    protected void btnUpload_Click1(object sender, EventArgs e)
    {
        try
        {
            FileUpload filePackage = (FileUpload)DetailsView1.FindControl("fileImage");
            int size = filePackage.PostedFile.ContentLength;
            byte[] theImage = new byte[size];
            HttpPostedFile Image = filePackage.PostedFile;
            Image.InputStream.Read(theImage, 0, size);
            (DetailsView1.FindControl("Image2") as Image).ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])theImage);
            Session["itemImage"] = theImage;
        }
        catch (Exception) { }
    }
    //SqlUpdated
    protected void SqlDataSource1_Updated1(object sender, SqlDataSourceStatusEventArgs e)
    {
        try
        {
            Session.Remove("itemImage");
        }
        catch (Exception) { }
    }
    //SqlUpdating..
    protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        try
        {
            byte[] theImage = Session["itemImage"] as byte[];
            SqlParameter sqlupData = new SqlParameter("@itemImage", SqlDbType.Image);
            sqlupData.Value = theImage;
            e.Command.Parameters.Add(sqlupData);
        }
        catch (Exception) { }
    }
}