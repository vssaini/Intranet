using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Department_Common_ImageViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Get path of file
        string pdfPath = Request.QueryString["fileName"];
        string menu = Request.QueryString["menu"];

        if (pdfPath != null)
        {
            imgShower.ImageUrl = this.ResolveClientUrl(pdfPath);            
        }

        if (menu != null)
        {
            ((HiddenField)this.Master.FindControl("hfMenu")).Value = menu;
        }
        else
        {
            ((HiddenField)this.Master.FindControl("hfMenu")).Value = "sideMenu_hlOrganogram";
        }
        
    }
}