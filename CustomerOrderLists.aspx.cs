﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerOrderLists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "create")
        {
            Response.Redirect("CustomerOrderLists.aspx");
        }
        else
        {
            Response.Redirect("CustomerOrderReadyPackages.aspx");
        }
    }
}