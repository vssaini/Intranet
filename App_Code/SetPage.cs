using System;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Maintain page's name in web application
/// </summary>
public class DeptPage
{
    public DeptPage() { }

    public static string nameOfPage=null;
    public static void SetPageName(string pageName)
    {
        Page page = HttpContext.Current.Handler as Page;
        MasterPage master = page.Master;

        if (master != null)
        {
            HiddenField hf = master.FindControl("hfPage") as HiddenField;
            hf.Value = pageName;
            nameOfPage = hf.Value;
        }
    }
}