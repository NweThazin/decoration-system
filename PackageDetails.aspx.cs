using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PackageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int num = int.Parse(Request.QueryString["pstatus"]);
            if (num == 0)
            {
                MultiView1.SetActiveView(View1);
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                MultiView1.SetActiveView(View2);
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }
    }
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
    protected string getStatus(Object status)
    {
        if (status.ToString() == "0")
        {
            return "Provided Package";
        }
        else
        {
            return "Create Package";
        }
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerRequestOrderLists.aspx");
    }
}