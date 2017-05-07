using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerMainHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            Session["vv"] = 1;
            DataView dv = SqlDataSource2.Select(DataSourceSelectArguments.Empty) as DataView;
            string url = dv[0].Row[1].ToString();

            FlashControl2.MovieUrl = url;
            FlashControl2.Play = true;
            FlashControl2.Loop = true;
        }
        catch (Exception) { }
    }
    protected string getImage(object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}