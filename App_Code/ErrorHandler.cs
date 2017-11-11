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
using System.Globalization;

/// <summary>
/// Handles error by accepting the exception raised. 
/// And displays all details of page on which error occured.
/// </summary>
public class ErrorHandler
{
    public ErrorHandler() { }

    public static void WriteError(Exception ex)
    {
        //try
        //{
            string fileName = "~/Error/error_log/" + DateTime.Today.ToString("dd-MM-yy") + ".txt";
            string path = HttpContext.Current.Server.MapPath(fileName);

            // Create file if it doesn't exists
            if (!File.Exists(path))
            {
                File.Create(path).Close();
            }

            // Generates some errors using URLs with "NoCatch" in them; 
            // ignore these here to simulate what would happen
            // if a global.asax handler were not implemented.              
            if (ex.GetType() == typeof(HttpException))
            {
                if (ex.Message.Contains("NoCatch") || ex.Message.Contains("maxUrlLength"))
                    return;

                //Redirect HTTP errors to HttpError page
                HttpContext.Current.Server.Transfer("~/Error/GenericErrorPage.htm");
            }

            // Write to created file or append to it
            using (StreamWriter w = File.AppendText(path))
            {
                w.WriteLine("Error at {0}", DateTime.Now.ToString("T"));
                w.WriteLine("In Page: " + System.Web.HttpContext.Current.Request.Url.ToString());
                w.WriteLine("Message: " + ex.Message);
                w.WriteLine("More Details:" + ex.StackTrace);
                w.WriteLine("=============================================================================================================================\r\n");
                w.Flush();
            }
        //}
        //catch (Exception exc)
        //{
            //HttpContext.Current.Response.Write(exc.ToString());
            //Redirect to ErrorHandlerException
            //HttpContext.Current.Server.Transfer("~/Error/ErrorHandlerException.aspx");
        //}


    }
}
