using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHomeOrderPackageDetail : System.Web.UI.Page
{
    //SqlDataSource1 is for 1st gridView
    //SqlDataSource2 is for Customer Grid View
    //SqlDataSource4 is for serviceteam 
    //SqlDataSource3 is for Package Name
    //SqlDataSource5 is for Update Service Team in order table
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtnCustName_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        try
        {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    Session["customerid"] = dv[0].Row[6].ToString();
                }
        }
        catch (Exception)
        { }
       
    }
    protected void lnnkbtnPackageName_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View3);
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["packageid"] = dv[0].Row[3].ToString();
                Session["orderid"] = dv[0].Row[0].ToString();
            }
        }
        catch (Exception) { }
  
    }
    //To Get Image 
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }

    protected void btnGiveServiceTeam_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource5.Update();
            DataView dvServiceTeam = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
            if (dvServiceTeam.Count != 0)
            {
                Session["steamname"] = dvServiceTeam[0].Row[0].ToString();
            }
            DataView dvPaymentID = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty); //SqlDataSource6 is for to get payment id
            if (dvPaymentID.Count != 0)
            {
                int payid = int.Parse(dvPaymentID[0].Row[0].ToString());

                DataView dvCustomer = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);//For To get Customer Name and Customer Email
                if (dvCustomer.Count != 0)
                {
                    string email = dvCustomer[0].Row[5].ToString();
                    string username = dvCustomer[0].Row[1].ToString();

                    #region gmail
                    var fromAddress = new MailAddress("moderncafemyanmar@gmail.com", "Modern Interior Coffee Shop Decoration Myanmar");
                    var toAddress = new MailAddress(email, username);
                    const string fromPassword = "095177966";
                    const string subject = "Sending the Invoice to the Customer";
                    string body = "Hello " + username + "\nThanks you so much for ordering..\nWe have sent an invoice to you with attachment..\n"
                        + Session["steamname"].ToString() + " will come to you to decorate your coffee shop";

                    // instead 1string filename = path + "/" + paymentid + ".pdf";
                    string serverPath = Server.MapPath("~/");
                    string attFile = serverPath + "/" + payid + ".pdf";

                    Attachment att = new Attachment(attFile);
                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (MailMessage message = new MailMessage(fromAddress, toAddress))
                    {
                        message.Subject = subject;
                        message.Body = body;
                        message.Attachments.Add(att);
                        smtp.Send(message);

                    }
                    #endregion
                }
            }//End of SqlDataSource 6 to get paymentid

            Response.Redirect("AdminHomePage.aspx");
        }
        catch (Exception)
        {
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[10].ToString(), out q);
                int.TryParse(dr[11].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[7].FindControl("lblGrandTotal")).Text = total.ToString();
            Session["grandtotal"] = int.Parse(total.ToString());
        }
        catch (Exception)
        { }
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHomePage.aspx");
    }
}