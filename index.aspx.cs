using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Session["vv"] = 1;
            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            string url = dv[0].Row[1].ToString();

            FlashControl3.MovieUrl = url;
            FlashControl3.Play = true;
            FlashControl3.Loop = true;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerMainHomePage.aspx");
    }
    protected void imgbtnShow_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CustomerMainHomePage.aspx");
    }
}