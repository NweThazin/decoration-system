using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerCreatePackageView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                MultiView1.SetActiveView(View1);
                if (Session["createpackageview"] != null)
                {
                    MultiView1.SetActiveView(View2);
                }
            }
            catch (Exception) { }
        }
    }
    //To Calculate the Total Cost
    protected string getTotal(Object q, Object p)
    {
        int i = 0; int j = 0;
        int.TryParse(q.ToString(),out i);
        int.TryParse(p.ToString(),out j);
        return (i * j).ToString();
    }
    //To Calculate the Grand Total Cost 
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[5].ToString(), out q);
                int.TryParse(dr[4].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[3].FindControl("lblGrandTotal")).Text = total.ToString();
            Session["grandtotal"] = int.Parse(total.ToString());
        }
        catch (Exception)
        { 
            
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            int count = int.Parse(Session["cartcount"].ToString());
            if (count != 0)
            {
                count--;
                Session["cartcount"] = count.ToString();
            }
            else
            {
                Session["cartcount"] = "0";
            }
            SqlDataSource11.Delete();
            Session["cartbutton"] = "";
            Response.Redirect("CustomerCreatePackage.aspx");
        }
        catch (Exception) { }

    }
    //When Grid View is selected index changed the selected qty and item id will change
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                Session["itemid"] = dv[0].Row[1].ToString();
            }
            Session["itemqty"] = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
        }
        catch (Exception)
        { 
            
        }
      
    }
    protected void btnMoneyCancel_Click(object sender, EventArgs e)
    {
        //int count = int.Parse(Session["cartcount"].ToString());
        //count--;
        //Session["cartcount"] = count.ToString();
        MultiView1.SetActiveView(View1);
        txtCardNumber.Text = "";
    }
    //To Insert the data into the Orders Payments and PackageItems tables... 
    //SqlDataSource3 is to insert the data into Orders Tables
    //SqlDataSource4 is to insert the data into the payment tables.
    protected void btnMoneyConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            //For Cart Count//paymentid
        #region Generate OrderID AND PaymentID
        int num = 10000;
        DataView dvOrderIDD = (DataView)SqlDataSource12.Select(DataSourceSelectArguments.Empty);
        if (dvOrderIDD.Count != 0)
        {
            try
            {
                num = int.Parse(dvOrderIDD[0].Row[0].ToString());
                num++;
            }
            catch (Exception)
            {
                num++;
            }
            Session["orderid"] = num.ToString();
        }
        int paynum = 00000; //For PaymentID
        DataView dvPayment = (DataView)SqlDataSource13.Select(DataSourceSelectArguments.Empty);
        if (dvPayment.Count != 0)
        {
            try
            {
                paynum = int.Parse(dvPayment[0].Row[0].ToString());
                paynum++;
            }
            catch (Exception)
            {
                paynum++;
            }
            Session["paymentid"] = paynum.ToString();
        }
        #endregion

        int count = int.Parse(Session["cartcount"].ToString());
            count--;
            Session["cartcount"] = count.ToString();
            MultiView1.SetActiveView(View2);

            Session["deliveryaddress"] = txtDeliveryAddress.Text;
            Session["packagename"] = "UserCreate";
            DataView dvMoney = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            if (dvMoney.Count != 0)
            {
                SqlDataSource9.Insert();//To insert into the packge table
                SqlDataSource3.Insert();//For Order Table

                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty); //To insert the package data into the package table
                foreach (DataRowView dr in dv)
                {
                    Session["punitprice"] = dr[4].ToString();
                    Session["pamount"] = dr[5].ToString();
                    Session["itemid"] = dr[1].ToString();
                    Session["itemquantity"] = dr[5].ToString();//Items Quantity from Grid View

                    //To Calculate the total cost in gridview
                    int qty, price;
                    int.TryParse(Session["punitprice"].ToString(), out price);
                    int.TryParse(Session["pamount"].ToString(), out qty);
                    long total = price * qty;
                    Session["ptotalprice"] = total.ToString();

                    SqlDataSource5.Insert();//For PackageItem Table(for insert)
                    SqlDataSource4.Insert();//For Paymemt Table(for insert)

                    int updateQty, originalQty;
                    DataView dvQty = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
                    if (dvQty.Count != 0)
                    {
                        int.TryParse(Session["itemquantity"].ToString(), out updateQty);
                        int.TryParse(dvQty[0].Row[4].ToString(), out originalQty);//item Quantity from items table according to item id
                        if (originalQty > updateQty)
                        {
                            SqlDataSource7.Update();
                        }
                    }

                }//End of DataRow..

                SqlDataSource6.Update();//To update bank database
                SqlDataSource8.Update(); //SqlDataSource8 is for to update the package count..
                txtCardNumber.Text = "";
                lblMessage.Text = "Order is successful..";
                //For Email..
                #region gmail
                var fromAddress = new MailAddress("moderncafemyanmar@gmail.com", "Modern Interior Decoration Coffee Shop Myanmar");
                var toAddress = new MailAddress(Session["email"].ToString(), Session["username"].ToString());
                const string fromPassword = "095177966";
                const string subject = "Delivery the decoration";
                string body = "Hello Dear " + Session["username"].ToString() + "\nThanks you so much for ordering.\nYour total cost is: " + Session["grandtotal"].ToString();

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
                Response.Write("Send successfully");
                #endregion

                Session["cartbutton"] = "";
                Response.Redirect("InvoicePage.aspx");
            }
            else
            {
                lblMessage.Text = "Your Balance is not Enough! & No Card Number";
            }
        }catch (Exception) { }
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        try
        {
            Session["readycreate"] = "CustomerCreatePackage.aspx";
            if (Session["email"] != null)
            {
                MultiView1.SetActiveView(View2);
            }
            else
            {
                Server.Transfer("LoginFormPage.aspx");
            }
        }
        catch (Exception) { }

    }

    //To get Value from grid view textbox in edit template
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int updateRow = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtQuantity")).Text);
            //For Update Items Table SQLDS 7 and 8
            DataView dvItem = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
            if (dvItem.Count != 0)
            {
                int original;
                int.TryParse(dvItem[0].Row[4].ToString(), out original);
                string itemName = dvItem[0].Row[1].ToString();
                if (original < updateRow)
                {
                    //lblPackageOrder.Text = "Sorry!! We have " + original + " Quantity for this item " + itemName;
                    lblPackageOrder.Text = "Sorry Customer.. We don't have enough Quantity";
                    btnBuy.Enabled = false;
                }
                else
                {
                    lblPackageOrder.Text = "";
                    btnBuy.Enabled = true;
                }
            }
        }
        catch (Exception) { }
    }
    //This Function is to show images in lists views.
    protected string getImage(Object image)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])image);
    }
}