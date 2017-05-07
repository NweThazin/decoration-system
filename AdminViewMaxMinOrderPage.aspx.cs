using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewMaxMinOrderPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(MaxSelling);
        }
        if (RadioButtonList1.SelectedValue == "1")
        {
            Label1.Text = "Maximun Selling Package List";
        }
        else
        {
            Label1.Text = "Minimun Selling Package list";
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "2")
        {
            MultiView1.SetActiveView(MinSelling);
        }
        else
        {
            MultiView1.SetActiveView(MaxSelling);
        }
    }
    //display image
    protected string getImage(object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
}