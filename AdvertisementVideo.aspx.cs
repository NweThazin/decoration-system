using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdvertisementVideo : System.Web.UI.Page
{
    string source = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\User\Desktop\CoffeeShopDecoration\App_Data\CoffeeDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                GridView1.Visible = false;
                DataView dv = SqlDataSource6.Select(DataSourceSelectArguments.Empty) as DataView;
                if (dv.Count != 0)
                {
                    int st = int.Parse(dv[0].Row[3].ToString());
                    if (st == 1)
                    {
                        FlashControl1.MovieUrl = dv[0].Row[2].ToString();
                        FlashControl1.Play = true;
                        FlashControl1.Loop = true;
                        FlashControl1.Width = 400;
                        FlashControl1.Height = 400;
                    }
                }

                DropDownList1.DataBind();
            }
            catch (Exception) { }
        }

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (!FileUpload1.HasFile)
            {
                lblmessage.Text = "Please Select Video File!!!!";
            }
            else
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Video/" + filename));

                SqlConnection con = new SqlConnection(source);
                con.Open();
                string set = @"insert into VTable(VideoName,VideoUrl) values(@videoname,@videourl)";
                SqlCommand cmd = new SqlCommand(set, con);
                cmd.Parameters.AddWithValue("@videoname", filename);
                cmd.Parameters.AddWithValue("@videourl", "~/Video/" + filename);
                cmd.ExecuteNonQuery();

                con.Close();
                DropDownList1.DataBind();
                GridView1.DataBind();
                GridView1.Visible = false;
                lblmessage.Visible = false;
            }
        }
        catch (Exception)
        { }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Session["vname"] = DropDownList1.SelectedItem.Text;

            SqlDataSource5.Update();

            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            if (dv.Count != null)
            {
                Session["status"] = null;
                SqlDataSource1.Update();
            }
            FlashControl1.MovieUrl = DropDownList1.SelectedValue;
            FlashControl1.Play = true;
            FlashControl1.Loop = true;
            FlashControl1.Width = 400;
            FlashControl1.Height = 400;

            GridView1.DataBind();
            GridView1.Visible = false;
        }
        catch (Exception) { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        GridView1.Visible = true;

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(source);
            con.Open();
            string set = @"select VideoName from VTable";
            SqlCommand cmd = new SqlCommand(set, con);
            cmd.ExecuteNonQuery();
            con.Close();
            DropDownList1.DataBind();
        }
        catch (Exception) { }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}