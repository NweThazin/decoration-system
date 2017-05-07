using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginFormPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //This is to Check the previou page...
        if (!IsPostBack)
        {
            lblmsg.Text = "";
            if (Page.PreviousPage != null)
            {
                Session["prepagename"] = "AddToCardpage.aspx";
            }
        }
    }
    //When Customer clicks log in button...
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            //For Admin Login(SQLDS1)
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["adminid"] = dv[0].Row[0].ToString();
                Response.Redirect("AdminHomePage.aspx");
            }
            else
            {
                //For Customers Login(SqlDS2)
                DataView dvCustomer = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dvCustomer.Count != 0)
                {
                    //Convert.ToString(Session["prepagename"]) != "")
                    if (Session["prepagename"] != null)
                    {
                        Session["email"] = txtUserEmail.Text;
                        Session["username"] = dvCustomer[0].Row[1].ToString();
                        Session["sid"] = Session.SessionID;
                        Session["userid"] = dvCustomer[0].Row[0].ToString();
                        if (Session["readycreate"].ToString() == "CustomerReadyPackge.aspx")
                        {
                            Session["pwd"] = txtUserPwd.Text;
                            Response.Redirect("CustomerPaymentForm.aspx");
                        }
                        else
                        {
                            Session["pwd"] = txtUserPwd.Text;
                            Session["createpackageview"] = "CustomerCreatePackageView.aspx";
                            Response.Redirect("CustomerCreatePackageView.aspx");
                        }

                    }
                    else
                    {
                        Session["email"] = txtUserEmail.Text;
                        Session["pwd"] = txtUserPwd.Text;
                        Session["sid"] = Session.SessionID;
                        Session["username"] = dvCustomer[0].Row[1].ToString();
                        Session["userid"] = dvCustomer[0].Row[0].ToString();
                        Response.Redirect("CustomerHomePage.aspx");
                    }
                }
                else
                {
                    //For Service Team Login
                    DataView dvService = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                    if (dvService.Count != 0)
                    {
                        Session["steamid"] = dvService[0].Row[0].ToString();
                        Session["sid"] = Session.SessionID;
                        Response.Redirect("ServiceTeamHome.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Login";
                    }
                }
            }//End of first if loop
        }
        catch (Exception) { }
    }
    protected void lnkbtnToRegisterPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterFormPage.aspx");
    }
    //To Reset The Password
    protected void lnkbtnToResetPassword_Click(object sender, EventArgs e)
    {
        try
        {
            string username = "";string email = "";string pwd = "";
            if (txtUserEmail.Text != "")
            {
                DataView dv1 = SqlDataSource5.Select(DataSourceSelectArguments.Empty) as DataView;//For Service Team
                if (dv1.Count != 0)
                {
                    username = dv1[0].Row[1].ToString();
                    email = dv1[0].Row[3].ToString();
                    pwd = dv1[0].Row[2].ToString();
                    lblmsg.Text = "You can see your password in your gmail..";
                    //For Send Gmail
                    #region gmail
                    var fromAddress = new MailAddress("moderncafemyanmar@gmail.com", "Modern Interior Decoration Coffee Shop ");
                    var toAddress = new MailAddress(email, "username");
                    const string fromPassword = "095177966";
                    const string subject = "Testing";
                    string body = "Your Password is : " + pwd + "\n You can log in now";
                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }
                    #endregion
                }
                else
                {
                    DataView dv = SqlDataSource4.Select(DataSourceSelectArguments.Empty) as DataView;//For Customer
                    if (dv.Count != 0)
                    {
                        username = dv[0].Row[0].ToString();
                        email = dv[0].Row[1].ToString();
                        pwd = dv[0].Row[2].ToString();
                        lblmsg.Text = "You can see your password in your gmail..";
                        //For Send Gmail
                        #region gmail
                        var fromAddress = new MailAddress("moderncafemyanmar@gmail.com", "Modern Interior Decoration Coffee Shop ");
                        var toAddress = new MailAddress(email, "username");
                        const string fromPassword = "095177966";
                        const string subject = "Testing";
                        string body = "Your Password is : " + pwd + "\nYou can log in now";
                        var smtp = new SmtpClient
                        {
                            Host = "smtp.gmail.com",
                            Port = 587,
                            EnableSsl = true,
                            DeliveryMethod = SmtpDeliveryMethod.Network,
                            UseDefaultCredentials = false,
                            Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                        };
                        using (var message = new MailMessage(fromAddress, toAddress)
                        {
                            Subject = subject,
                            Body = body
                        })
                        {
                            smtp.Send(message);
                        }
                        #endregion
                    }
                    else
                    {
                        lblmsg.Text = "You are not member of Our System! ";
                    }
                }//For ServiceTeam
            }//If Valid
            else
            {
                lblmsg.Text = "Please Enter Your Email, First! ";
            }
        }catch (Exception) { }
    }//End of Reset Password
}