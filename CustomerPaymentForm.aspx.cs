using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerPaymentForm : System.Web.UI.Page
{
    CoffeeDBEntities1 dbobj = new CoffeeDBEntities1();
    int Qty, qty1, qty2;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
        int count=int.Parse(Session["cartcount"].ToString());
        
        #region GenerateOrderID_AND_PAYMENTID_AGAIN
        int inc=10000;
        DataView dvOrderID= (DataView)SqlDataSource15.Select(DataSourceSelectArguments.Empty);
        if (dvOrderID.Count != 0)
        {
            try
            {
                inc = int.Parse(dvOrderID[0].Row[0].ToString());
                inc++;
            }
            catch (Exception)
            {
                inc++;
            }
            Session["orderid"] = inc.ToString();

        }
        int numpay = 00000;
        DataView dvj = (DataView)SqlDataSource16.Select(DataSourceSelectArguments.Empty);
        if (dvj.Count != 0)
        {
            try
            {
                numpay = int.Parse(dvj[0].Row[0].ToString());
                numpay++;
            }
            catch (Exception)
            {
                numpay++;
            }
            Session["payID"] = numpay.ToString();
        }
        else
        {
            Session["payID"] = numpay.ToString();
        }
        #endregion

        //SqlDataSource1 is to check bank amount and bankname
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                lblmessage.Text = "Your Order is Successful!";
                DataView dv1 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
                if (dv1.Count != 0)
                {
                    Session["cid"] = dv1[0].Row[0].ToString();
                    Session["orderdate"] = System.DateTime.Now;
                    SqlDataSource5.Insert();//Insert to the order table..
                }
                //SqlDataSource9 is for add to cart table grid view and SqlDataSource10 is for second grand total grid view
                DataView dvAddtoCard = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
                DataView dvItem = (DataView)SqlDataSource10.Select(DataSourceSelectArguments.Empty);
                //int orderid = int.Parse(dvAddtoCard[0].Row[3].ToString());
                int orderid = int.Parse(Session["orderid"].ToString());//Changing
                if (dvAddtoCard.Count != 0 && dvItem.Count != 0)
                {
                    for (int i = 0; i < dvAddtoCard.Count; i++)
                    {
                        qty1 = int.Parse(dvAddtoCard[i].Row[6].ToString());
                        qty2 = int.Parse(dvItem[i].Row[1].ToString());
                        int unitp = int.Parse(dvItem[i].Row[2].ToString());
                        int totalp = unitp * qty1;
                        Qty = qty2 - qty1;
                        Session["qty"] = Qty.ToString();

                        // SqlDataSource11.Update();
                        String connection = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\User\Desktop\CoffeeShopDecoration\App_Data\CoffeeDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
                        SqlConnection conn = new SqlConnection(connection);
                        conn.Open();

                        string str = @"update Items set  itemQuantity=@Qty Where itemID=@iID";
                        SqlCommand cmd = new SqlCommand(str, conn);

                        cmd.Parameters.AddWithValue("@iID", int.Parse(dvItem[i].Row[0].ToString()));
                        cmd.Parameters.AddWithValue("@Qty", Qty);
                        cmd.ExecuteNonQuery();
                        string str1 = @"insert into  Payments values(@payid,@unit,@amt,@totprice,@iid,@oid)";
                        SqlCommand cmd1 = new SqlCommand(str1, conn);

                        cmd1.Parameters.AddWithValue("@payid", int.Parse(Session["payID"].ToString()));
                        cmd1.Parameters.AddWithValue("@unit", unitp);
                        cmd1.Parameters.AddWithValue("@amt", qty1);
                        cmd1.Parameters.AddWithValue("@totprice", totalp);
                        cmd1.Parameters.AddWithValue("@iid", int.Parse(dvItem[i].Row[0].ToString()));
                        cmd1.Parameters.AddWithValue("@oid", orderid);
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                Session["paymentID"] = Session["payID"];
                Session["packageid"] = Session["pid"];
                SqlDataSource8.Update();//SqlDataSource8 is to increase the package count...
                //SqlDataSource9 is to delete the addto card table..
                SqlDataSource13.Update();
                SqlDataSource14.Delete();
                SqlDataSource7.Delete();
                //Email Section
                #region gmail
                var fromAddress = new MailAddress("moderncafemyanmar@gmail.com", "Modern Interior Coffee Shop Decoration Myanmar");
                var toAddress = new MailAddress(Session["email"].ToString(), Session["username"].ToString());
                const string fromPassword = "095177966";
                const string subject = "Delivery Order Information";
                string body = "Hello Dear:" + Session["username"].ToString() + "\nThanks you so much for ordering.\nYour total is: " + Session["GrandTotal"].ToString();

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
                //Response.Write("Send successfully");
                #endregion

                if (count != 0)
                {
                    count--;
                    Session["cartcount"] = count.ToString();
                }
                else
                    Session["cartcount"] = "0";

                Response.Redirect("InvoicePage.aspx");
            }
            else
            {
                lblmessage.Text = "Your Balance is not Enough! & No Card Number";
            }
        }
        catch (Exception)
        {

        }
        AccNoTextBox.Text = dAddressTextBox.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddToCardpage.aspx");
    }
}