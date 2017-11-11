using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Templates_Master : System.Web.UI.MasterPage
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




