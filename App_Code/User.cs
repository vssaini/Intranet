using System;
using System.Web;
using System.Configuration;
using System.IO;

/// <summary>
/// Provide methods for checking authenticity of RSO User
/// </summary>
public class RSOUser
{
    public RSOUser()
    { }

    public static string VerifyUser()
    {
        string userExist = null;
        string query = null;
        string pageName = HttpContext.Current.Cache["pageName"] as String;
        
        if (Path.GetFileName(HttpContext.Current.Request.Url.AbsolutePath).Equals("ISAdmin.aspx"))
        {
            query = "SELECT PFNumber FROM Login WHERE UserName='" + AD.GetUserName() + "' AND Department='InformationSystem'";
        }
        else
        {            
            query = "SELECT PFNumber FROM Login WHERE UserName='" + AD.GetUserName() + "' AND Department='" + pageName + "'";
        }        

        if (DAL.ExecuteScalar(query) > 1)
        {
            userExist = "Yes";
        }           
        return userExist;
    }

    public static string IsISAdmin()
    {
        string isUser = null;
        string query = "SELECT PFNumber FROM Login WHERE UserName='" + AD.GetUserName() + "' AND Department='InformationSystem'";
        if (DAL.ExecuteScalar(query) > 1)
        {
            isUser = "Yes";
        }   
        return isUser;
    }

    public static string IsHindiAdmin()
    {
        string isUser = null;
        string query = "SELECT PFNumber FROM Login WHERE UserName='" + AD.GetUserName() + "' AND Department='Hindi'";
        if (DAL.ExecuteScalar(query) > 1)
        {
            isUser = "Yes";
        }
        return isUser;
    }
}