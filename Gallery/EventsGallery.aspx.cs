using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gallery_EventsGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetAnnouncement();
    }

    protected void SetAnnouncement()
    {
        if (Application["Announce"] != null)
            hfAnnounce.Value = Application["Announce"].ToString();
    }    
}