using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewFinancalReportPage : System.Web.UI.Page
{
    SqlCommand cmd=new SqlCommand();
    List<string> lstday = new List<string>();
    List<string> lstmonth = new List<string>();
    List<string> lstyear = new List<string>();
    DateTime d = Convert.ToDateTime(System.DateTime.Now);
    List<string> Nday = new List<string> {"","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };
    List<string> Rday = new List<string> { "","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"};
    List<string> Fday = new List<string> { "","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28" };
    List<string> LFday = new List<string> {"", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29" };
    List<string> years = new List<string> { "","2011", "2012", "2013", "2014", "2015", "2016"};
   
    protected void Page_Load(object sender, EventArgs e)
    {
        string m=DropDownList_DailyViewMonth.SelectedItem.Text;
        if (!IsPostBack)
        {
            //for binding existing date from order table
            #region Get_Year_From_Table

            DataView dv = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                lstday.Add(" ");lstyear.Add(" ");
                for (int i = 0; i < dv.Count; i++)
                {
                    DateTime dt=Convert.ToDateTime(dv[i].Row[0].ToString());
                    string day=dt.ToString("dd");
                    string year=dt.ToString("yyyy");
                    lstday.Add(day);
                    lstyear.Add(year);
                }
                var lday = lstday.Distinct();
                var lyear = lstyear.Distinct();
                
                DropDownList_DailyViewDay.DataSource = lday.ToList();
                DropDownList_DailyViewDay.DataBind();
                DropDownList_DailyViewYear.DataSource = lyear.ToList();
                DropDownList_DailyViewYear.DataBind();
            }
            #endregion

            #region To_Get_Today_Date
            Session["todayDate"] = d.ToShortDateString();

            ////Bind in Daily GridView
            GridView_DailyView.Visible = true;
            GridView_DailyView.DataSourceID ="SqlDataSource4";
            GridView_DailyView.DataBind();

            Session["dailyYear"] = d.ToString("yyyy");
            Session["dailyMonth"] = d.ToString("MM");
            Session["dailyDay"] = d.ToString("dd");

            Session["monthlyYear"] = d.ToString("yyyy");
            Session["monthlyMonth"] = d.ToString("MM");
            Session["yearlyYear"] = d.ToString("yyyy");
            #endregion
        }
    }

    //When Choose Daily or Monthly or Yearly in radio Button Lists..
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedValue == "Daily")
            {
                MultiView1.SetActiveView(DailyView);
                GridView_DailyView.DataSourceID = "SqlDataSource4";
                GridView_DailyView.DataBind();
                
            }
            else if (RadioButtonList1.SelectedValue == "Monthly")//For Monthly
            {
                MultiView1.SetActiveView(MonthlyView);
                lstyear.Add(" ");

                #region To_Get_Year_From_Table_In_MonthlySection
                DataView dv = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    for (int i = 0; i < dv.Count; i++)
                    {
                        DateTime dt=Convert.ToDateTime(dv[i].Row[0].ToString());
                        string year=dt.ToString("yyyy");
                        lstyear.Add(year);
                    }
                    var lyear = lstyear.Distinct();

                    DropDownList_MonthlyViewYear.DataSource = lyear.ToList() ;
                    DropDownList_MonthlyViewYear.DataBind();
    
                    String Month = Session["monthlyMonth"].ToString();
                    String Year = Session["monthlyYear"].ToString() ;
                    Session["fromMonth"] = Month + "/" + "01" + "/" + Year;
                    Session["toMonth"] = Month + "/" + "31" + "/" + Year;

                    GridView2.DataSourceID = "SqlDataSource5";
                    GridView2.DataBind();
                }
                #endregion
            }
            else if (RadioButtonList1.SelectedValue == "Yearly")
            {
                MultiView1.SetActiveView(YearlyView);
                #region To_Get_Year_From_DataTable_In_YearlySection
                lstyear.Add(" ");
                DataView dv = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    for (int i = 0; i < dv.Count; i++)
                    {
                        DateTime dt = Convert.ToDateTime(dv[i].Row[0].ToString());
                        string year = dt.ToString("yyyy");
                        lstyear.Add(year);
                    }
                    var lyear = lstyear.Distinct();
                    //In Year DropDown in Yearly
                    DropDownList_YearlyViewYear.DataSource = lyear.ToList();
                    DropDownList_YearlyViewYear.DataBind();
                    
                    string Year = Session["yearlyYear"].ToString();//To DataBind();
                    Session["fromYear"] = "01/01/" + Year;
                    Session["toYear"] = "12/31/" + Year;

                    GridView3.DataSourceID = "SqlDataSource6";
                    GridView3.DataBind();
                }
                #endregion
            }
        }
        catch(Exception) {

            lblmessage.Text = "There is no order for this date!!";
        }
    }


    #region For_Daily_Report

    protected void DropDownList_DailyViewYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        //For Daily Year DropDown
        Session["dailyYear"] = DropDownList_DailyViewYear.SelectedValue;
    }

    protected void DropDownList_DailyViewMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        //For Daily Month DropDown
        Session["dailyMonth"] = DropDownList_DailyViewMonth.SelectedValue;
        int month = int.Parse(DropDownList_DailyViewMonth.SelectedValue);
        if (month == 02)
        {
            int y = int.Parse(DropDownList_DailyViewYear.SelectedValue);
            if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0)
            {
                DropDownList_DailyViewDay.DataSource = LFday;
                DropDownList_DailyViewDay.DataBind();
            }
            else
            {
                DropDownList_DailyViewDay.DataSource = Fday;
                DropDownList_DailyViewDay.DataBind();
            }
        }
        else if (month == 04 || month == 06 || month == 09 || month == 11)
        {
            DropDownList_DailyViewDay.DataSource = Rday;
            DropDownList_DailyViewDay.DataBind();
        }
        else
        {
            DropDownList_DailyViewDay.DataSource = Nday;
            DropDownList_DailyViewDay.DataBind();
        }
    }
   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //For Daily Day Drop Down
        Session["dailyDay"] = DropDownList_DailyViewDay.SelectedValue;
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        //For Daily Search Button
        try
        {
            string concatday = Session["dailyMonth"].ToString() + "/" + Session["dailyDay"].ToString() + "/" + Session["dailyYear"].ToString();
            DateTime dt = Convert.ToDateTime(concatday);
            Session["concatday"] = dt.ToLongDateString();
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {   GridView_DailyView.Visible = true;
                GridView_DailyView.DataSourceID = "SqlDataSource1";
                GridView_DailyView.DataBind();
                lblmessage.Text = "";
            }
            else
            {
                lblmessage.Text = "There is no order for this date!!";
                 GridView_DailyView.Visible=false;
                GridView_DailyView.DataBind();
            }
        }
        catch
        {
            lblmessage.Text = "There is no order for this date!!";
        }
    }
    #endregion



    #region For_Monthly_Report
   
    protected void DropDownList_MonthlyViewYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        //To Monthly Year Drop Down
        Session["monthlyYear"] = DropDownList_MonthlyViewYear.SelectedValue;
    }
   
    protected void DropDownList_MonthlyViewMonth_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //For Monthly Month Drop Down
        Session["monthlyMonth"] = DropDownList_MonthlyViewMonth.SelectedValue;
    }
    
    protected void btnmonthlysearch_Click(object sender, EventArgs e)
    {
        //For Montly Search Button
        try
        {
            string  month = DropDownList_MonthlyViewMonth.SelectedValue;
            int year = int.Parse(DropDownList_MonthlyViewYear.SelectedValue);
            if (DropDownList_MonthlyViewMonth.SelectedValue == "02")
            {
                #region For_Feb_Month
                if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
                {
                    string fromMonth = Session["monthlyMonth"].ToString() + "/" + "01" + "/" + Session["monthlyYear"].ToString();
                    string toMonth = Session["monthlyMonth"].ToString() + "/" + "29" + "/" + Session["monthlyYear"].ToString();
                    Session["fromMonth"] = fromMonth.ToString();
                    Session["toMonth"] = toMonth.ToString();

                   
                    DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count != 0)
                    {
                        GridView2.DataSourceID = "SqlDataSource2";
                        GridView2.DataBind();
                        lblmessage1.Text = "";
                    }
                    else
                    {
                        lblmessage1.Text = "There is no order for this date!!";
                        GridView2.DataBind();
                    }
                }
                else
                {
                    string fromMonth = Session["monthlyMonth"].ToString() + "/" + "01" + "/" + Session["monthlyYear"].ToString();
                    string toMonth = Session["monthlyMonth"].ToString() + "/" + "28" + "/" + Session["monthlyYear"].ToString();
                    Session["fromMonth"] = fromMonth.ToString();
                    Session["toMonth"] = toMonth.ToString();

                    DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count != 0)
                    {
                        GridView2.DataSourceID = "SqlDataSource2";
                        GridView2.DataBind();
                        lblmessage1.Text = "";
                    }
                    else
                    {
                        lblmessage1.Text = "There is no order for this date!!";
                        GridView2.DataBind();
                    }

                }
                #endregion

            }
            else if (month == "04" || month == "06" || month == "09" || month == "11")
            {
                #region For_April_June_Nov_Sept
                string fromMonth = Session["monthlyMonth"].ToString() + "/" + "01" + "/" + Session["monthlyYear"].ToString();
                string toMonth = Session["monthlyMonth"].ToString() + "/" + "30" + "/" + Session["monthlyYear"].ToString();
                Session["fromMonth"] = fromMonth.ToString();
                Session["toMonth"] = toMonth.ToString();
                DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    GridView2.DataSourceID = "SqlDataSource2";
                    GridView2.DataBind();
                    lblmessage1.Text = "";
                }
                else
                {
                    lblmessage1.Text = "There is no order for this date!!";
                    GridView2.DataBind();
                }
                #endregion
            }
            else
            {
                #region For_Other_Months
                string fromMonth = month + "/" + "01" + "/" + Session["monthlyYear"].ToString();
                string toMonth =month + "/" + "31" + "/" + Session["monthlyYear"].ToString();
                Session["fromMonth"] = fromMonth.ToString();
                Session["toMonth"] = toMonth.ToString();
                DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    GridView2.DataSourceID = "SqlDataSource2";
                    GridView2.DataBind();
                    lblmessage1.Text = "";
                }
                else
                {
                    lblmessage1.Text = "There is no order for this date!!";
                    GridView2.DataBind();
                }
                #endregion

            }

        }
        catch (Exception)
        {

        }
    }
    #endregion


    #region For_Yearly_Report
    protected void DropDownList_YearlyViewYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["yearlyYear"] = DropDownList_YearlyViewYear.SelectedValue;
    }
    
    protected void btnyearsearch_Click(object sender, EventArgs e)
    {
        //For YearlySearch
        try
        {
            string fromYear = "01" + "/" + "01" + "/" + Session["yearlyYear"].ToString();
            string toYear = "12" + "/" + "31" + "/" + Session["yearlyYear"].ToString();
            Session["fromYear"] = fromYear;
            Session["toYear"] = toYear;
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                GridView3.DataSourceID = "SqlDataSource3";
                GridView3.DataBind();
                lblmessage2.Text = "";
            }
            else
            {
                lblmessage2.Text = "There is no order for this date!!";
                GridView3.DataBind();
            }

        }
        catch (Exception) { }
    }
    #endregion
}