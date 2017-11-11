using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Hindi2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetAnnouncement();

        #region Enable hindi admin tab

        if (!String.IsNullOrEmpty(RSOUser.IsISAdmin()))
        {
            panelAdmin.Visible = true;
        }

        if (!String.IsNullOrEmpty(RSOUser.IsHindiAdmin()))
        {
            panelAdmin.Visible = true;
        }
        #endregion
    }

    protected void SetAnnouncement()
    {
        if (Application["Announce"] != null)
            hfAnnounce.Value = Application["Announce"].ToString();
    }

    protected void Tabs_ActiveTabChanged(object sender, EventArgs e)
    {
        switch (Tabs.ActiveTabIndex)
        {
            case 1:
                i1.Attributes["src"] = this.ResolveClientUrl("~/Documents/Hindi/Hindi Divas.pdf");
                break;

            case 2:
                //i2.Attributes["src"] = this.ResolveClientUrl("~/Documents/Hindi/Rajbhasha Niti.pdf");
                break;

            case 3:
                //i3.Attributes["src"] = this.ResolveClientUrl("~/Documents/Hindi/Rajbhasha Margdarshan.pdf");
                break;

            case 4:
                break;
        }
    }
}