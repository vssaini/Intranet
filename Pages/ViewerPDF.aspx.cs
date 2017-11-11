using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;

public partial class Pages_ViewerPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Get path of file
        string pdfPath = Request.QueryString["fileName"];
        string index = Request.QueryString["index"];

        if (pdfPath != null)
        {
            lblFileName.Text = Path.GetFileNameWithoutExtension(pdfPath);
            pdfFrame.Attributes["src"] = this.ResolveClientUrl(pdfPath);
            string pdf = this.ResolveClientUrl(pdfPath);            
        }

        if (index != null)
        {
            #region Set accordion selected index
            Accordion accMain = (Accordion)(this.Master.FindControl("menuRight")).FindControl("accMenu");
            if (accMain != null)
            {
                accMain.SelectedIndex = Convert.ToInt32(index);
            }
            #endregion
        }
    }


}
