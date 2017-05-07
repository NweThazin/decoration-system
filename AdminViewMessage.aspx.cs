using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class AdminViewMessage : System.Web.UI.Page
{
    private Color Red;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected string getMessageStatus(Object status)
    {
        if (status.ToString() == "0")
        {
            return "New";
        }
        else
        {
            return "Read";
        }
    }
}