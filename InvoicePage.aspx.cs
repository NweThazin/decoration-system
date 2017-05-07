using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class InvoicePage : System.Web.UI.Page
{
    static int paymentid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                Label3.Text = Session["packageid"].ToString();
                DataView dvName = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dvName.Count != 0)
                {
                    string pname = dvName[0].Row[0].ToString();
                    Session["packagename"] = pname;
                }
                paymentid = int.Parse(Session["paymentID"].ToString());
                pnlView.Visible = true;
                lblDate.Text = Session["orderdate"].ToString();
                lblPackageName.Text = Session["packagename"].ToString();
                lblSlipNumber.Text = Session["paymentID"].ToString();
                lblUserName.Text = Session["username"].ToString();
               
            
            }
            catch (Exception) { }
        }
    } //End of the PageLoad
    //The Start of GridView 
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int p, q; long total = 0;
            foreach (DataRowView dr in dv)
            {
                int.TryParse(dr[8].ToString(), out q);
                int.TryParse(dr[9].ToString(), out p);
                total += q * p;
            }
            ((Label)GridView1.FooterRow.Cells[3].FindControl("lblGrandTotal")).Text = total.ToString();
            //Session["grandtotal"] = int.Parse(total.ToString());
        }
        catch (Exception) { }

    }
    //To Export the PDF
    protected void btnExportPDF_Click(object sender, EventArgs e)
    {
        try
        {
            #region EmailAttachment
            string path = Server.MapPath("~/");
            string imagepath = Server.MapPath("~/");
            string filename = path + "/" + paymentid + ".pdf";
            iTextSharp.text.Image gif = iTextSharp.text.Image.GetInstance(imagepath + "/pdflogo.jpg");
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + paymentid+ ".pdf");

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            HtmlForm frm = new HtmlForm();
            GridView1.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(lblTitle);
            frm.Controls.Add(lblSN);
            frm.Controls.Add(lblSlipNumber);
            frm.Controls.Add(lblPN);
            frm.Controls.Add(lblPackageName);
            frm.Controls.Add(lblD);
            frm.Controls.Add(lblDate);
            frm.Controls.Add(GridView1);
            frm.Controls.Add(lblSeeYou);
            frm.Controls.Add(lblUserName);
            //frm.Controls.Add(gif);
            frm.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            PdfWriter.GetInstance(pdfDoc, new FileStream(filename, FileMode.Create));
            pdfDoc.Open();
            pdfDoc.Add(gif);
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            #endregion

            Response.Redirect("CustomerHomePage.aspx");
        }
        catch (Exception) { }
    
    }
}