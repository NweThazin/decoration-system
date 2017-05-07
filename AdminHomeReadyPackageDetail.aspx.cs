using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHomeReadyPackageDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    //To Show Images
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }

    protected void btnGiveServiceTeam_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource5.Update();
            DataView dvServiceTeam = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            if (dvServiceTeam.Count != 0)
            {
                Session["steamname"] = dvServiceTeam[0].Row[0].ToString();
            }
            DataView dvPaymentID = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
            if (dvPaymentID.Count != 0)
            {
                int payid = int.Parse(dvPaymentID[0].Row[0].ToString());
                DataView dvCustomer = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
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
            }
                //To Send Email
            Response.Redirect("AdminHomePage.aspx");
        }
        catch (Exception)
        { }
       
    }
    //To Show Customer Information
    protected void lnkbtnCustomerName_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View1);
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["customerid"] = dv[0].Row[7].ToString();
            }
        }
        catch (Exception) { }

    }
    protected void lnkbtnPackageName_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(View2);
            DataView dvPackageName = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dvPackageName.Count != 0)
            {
                Session["packageid"] = dvPackageName[0].Row[4].ToString();
                Session["orderid"] = dvPackageName[0].Row[0].ToString();
            }
        }
        catch (Exception) { }
    }
    //To Show Grand Total 
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[5].ToString(), out q);
                int.TryParse(dr[6].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[7].FindControl("lblGrandTotal")).Text = total.ToString();
            Session["grandtotal"] = int.Parse(total.ToString());
        }
        catch (Exception) { }
     
    }
    protected void lnkbtnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHomePage.aspx");
    }
}