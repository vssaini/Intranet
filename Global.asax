<%@ Application Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<script RunAt="server">     
    
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application["OnlineUsers"] = 0;
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }

    void Application_BeginRequest(object sender, EventArgs e)
    {

    }

    void Application_EndRequest(object sender, EventArgs e)
    {

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Log application errors
        Exception objErr = Server.GetLastError().GetBaseException();
        ErrorHandler.WriteError(objErr);

        // To inform ASP.NET that you have handled the error. 
        //Server.ClearError();     

        /*
         * If you dont clear the error, the exception would propagate.
         * However, since there isn't any higher scope where the exception
         * could be caught, ASP.NET is forced to handle it. The way ASP.NET
         * handles the exception depends upon the settings specified in the
         * customErrors section we saw before. If no settings are defined,
         * ASP.NET would use the defaults and display the infamous 'yellow' error page.
         * */

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
        Application.UnLock();

    }
   
</script>
