using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_EventsGallery : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Set cache dependency on file(s)        
        Response.AddFileDependency(MapPath("~/Gallery/Data.xml"));

        // Set additional properties to enable caching.
        Response.Cache.SetExpires(DateTime.Now.AddMinutes(60));
        Response.Cache.SetCacheability(HttpCacheability.Public);
        Response.Cache.SetValidUntilExpires(true);
    }
}