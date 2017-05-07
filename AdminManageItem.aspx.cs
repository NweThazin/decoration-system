using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminManageItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lblItemID_PreRender(object sender, EventArgs e)
    {
        try
        {
            #region Generate AUTO Item ID

            int num = 1000;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dv.Count != 0)
            {
                try
                {
                    num = int.Parse(dv[0].Row[0].ToString());
                    num++;
                    lblItemID.Text = num.ToString();
                }
                catch (Exception)
                {
                    num++;
                    lblItemID.Text = num.ToString();
                }
            }
            #endregion
        }
        catch (Exception) { }

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
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            int size = fileItemImage.PostedFile.ContentLength;
            byte[] theImage = new byte[size];
            HttpPostedFile Image = fileItemImage.PostedFile;
            Image.InputStream.Read(theImage, 0, size);
            imgItem.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])theImage);
            Session["itemImage"] = theImage;
        }
        catch (Exception) { }
    }
    protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        try
        {
            byte[] theImage = Session["itemImage"] as byte[];
            SqlParameter sqlUpload = new SqlParameter("@itemImage", SqlDbType.Image);
            sqlUpload.Value = theImage;
            e.Command.Parameters.Add(sqlUpload);
        }
        catch (Exception) { }
    }
    protected void btnAddNewItem_Click(object sender, EventArgs e)
    {
        try
        {
            #region Insert New Item

            SqlDataSource1.Insert();
            txtItemName.Text = txtItemPrice.Text = txtItemQuantity.Text= txtDescription.Text = "";
            imgItem.ImageUrl = "";

            #endregion

            Response.Redirect("AdminManageViewItem.aspx");
        }
        catch (Exception) { }
    }
}