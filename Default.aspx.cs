using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Threading;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       //System.Web.VirtualPathUtility.ToAbsolute("~");   
	   
    }

    public void Page_Error(object sender, EventArgs e)
    {
        // Handles page level error and log same
        Exception objErr = Server.GetLastError().GetBaseException();       
        ErrorHandler.WriteError(objErr);

        // Clear errors to prevent error going to the Application_Error event handler
        // Server.ClearError(); //  
    }
}
