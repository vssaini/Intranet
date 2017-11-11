using System;
using System.Collections;
using System.Web;
using System.DirectoryServices;
using System.Globalization;
using System.Configuration;

/// <summary>
/// All AD related stuff
/// </summary>
public class AD
{
    static string path = ConfigurationManager.ConnectionStrings["ADConnection"].ConnectionString;
    static string adminPath = ConfigurationManager.ConnectionStrings["ADAdminConnection"].ConnectionString;
    static string userName = ConfigurationManager.AppSettings["ADUser"];
    static string password = ConfigurationManager.AppSettings["ADPassword"];

    public AD()
    { }

    public static string ADExists(string adUser, string adPass)
    {
        string user = null;
        DirectoryEntry AD = new DirectoryEntry(adminPath, adUser, adPass, AuthenticationTypes.Secure);

        try
        {
            using (DirectorySearcher ds = new DirectorySearcher(AD))
            {
                ds.Filter = "DisplayName=" + adUser;

                SearchResult sr = ds.FindOne();
                if (sr != null)
                {
                    user = "User Found";
                }
            }
        }
#pragma warning disable CS0168 // Variable is declared but never used
        catch (DirectoryServicesCOMException exc)
#pragma warning restore CS0168 // Variable is declared but never used
        {
            user = null;
        }
        catch (System.Runtime.InteropServices.COMException ex)
        {
            if (ex.Message.Equals("The server is not operational.\r\n"))
            {
                ErrorHandler.WriteError(ex);
            }
        }

        return user;
    }

    public static DirectoryEntry SetAD()
    {
        DirectoryEntry AD = null;
        if (ADExists(userName, password) != null)
        {
            AD = new DirectoryEntry(path, userName, password, AuthenticationTypes.Secure);
        }
        return AD;
    }

    public static int UpdateADUsers()
    {
        string name = null;
        string logon = null;
        int rowsAffected = 0;
        HttpContext.Current.Application["records"] = 0;

        if (DAL.ExecuteQuery("DELETE * FROM AD_RSO_Users") > 0)
        {
            DirectoryEntry DE = SetAD();

            if (DE != null)
            {
                foreach (DirectoryEntry de in DE.Children)
                {
                    // CN - DisplayName and sAMAccountName - UserLogon
                    logon = de.Properties["sAMAccountName"].Value.ToString();
                    name = de.Properties["CN"].Value.ToString().ToUpper();

                    string query = "INSERT INTO AD_RSO_Users VALUES ('" + logon + "', '" + name + "')";
                    rowsAffected = DAL.ExecuteQuery(query);
                    HttpContext.Current.Application["records"] = rowsAffected + Convert.ToInt32(HttpContext.Current.Application["records"]);
                }
            }
        }
        return rowsAffected;
    }

    public static string GetUserName()
    {
        string userName = "";
        //string pfNumber = HttpContext.Current.Request.ServerVariables["LOGON_USER"];

        string pfNumber = HttpContext.Current.User.Identity.Name;

        if (HttpContext.Current.Session["Admin"] != null)
        {
            userName = WhatIsUserName(HttpContext.Current.Session["Admin"].ToString());
        }
        else
        {
            userName = WhatIsUserName(pfNumber);
        }
        return userName;
    }

    public static string GetUserName(string machineName)
    {
        string userName = "";
        string pfNumber = HttpContext.Current.Request.ServerVariables["LOGON_USER"];

        if (HttpContext.Current.Session["Admin"] != null)
        {
            userName = WhatIsUserName(HttpContext.Current.Session["Admin"].ToString());
        }
        else
        {
            userName = WhatIsUserName(pfNumber);
        }
        return userName;
    }

    public static string WhatIsUserName(string pfNumber)
    {
        string user = "Guest";
        DirectoryEntry DE = SetAD();

        if (DE != null)
        {
            if (pfNumber.Contains("IOC"))
            {
                pfNumber = pfNumber.Remove(0, 4);

                using (DirectorySearcher ds = new DirectorySearcher(DE))
                {
                    // SAMAccountName - Logon Name 
                    ds.Filter = "SAMAccountName=" + pfNumber;
                    SearchResult sr = ds.FindOne();

                    if (sr != null)
                    {
                        user = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(sr.Properties["CN"][0].ToString().ToLower());
                    }
                }
            }
        }
        return user;
    }

    public static string ToUpperFirstLetter(string source)
    {
        // convert to char array of the string
        char[] letters = source.ToCharArray();

        // upper case the first char
        letters[0] = char.ToUpper(letters[0]);

        // return the array made of the new char array
        return new string(letters);
    }
}