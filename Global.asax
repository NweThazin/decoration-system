<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
       // Session["sid"] = "";
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {   DateTime d = Convert.ToDateTime(System.DateTime.Now);
        // Code that runs when a new session is started
        Session["sid"] = "";
        //Session["fromMonth"]=
        //Session["toMonth"]
        //Session["fromYear"] 
        //Session["toYear"] 
        Session["dailyYear"]=d.ToString("yyyy");
        Session["dailyMonth"] = d.ToString("MM");
         
        Session["dailyDay"]=d.ToString("dd");
        
        Session["monthlyYear"]=d.ToString("yyyy");
        Session["monthlyMonth"] = d.ToString("MM");
        Session["yearlyYear"] = d.ToString("yyyy");

        Session["cartbutton"] = "";
        Session["cartcount"] = "0"; 
               
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
