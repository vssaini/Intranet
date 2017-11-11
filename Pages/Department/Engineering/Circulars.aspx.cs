using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Department_Engineering_Circulars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HiddenField)this.Master.FindControl("hfMenu")).Value = "circular";
        if (!IsPostBack)
        {
            this.ddlCirculars_SelectedIndexChanged(this, null);
        }
    }

    protected void ddlCirculars_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddlCirculars.SelectedItem.Text)
        {
            case "29.06.2009 to 26.04.2010":
                pdfFrame.Attributes["src"] = this.ResolveClientUrl("~/Documents/Department/Engineering/Circular 290609 - 260410.pdf");
                lblInfo.Text = "Circular from 29 June 2009 to 26 April 2010";
                break;

            case "23.10.2008 to 29.06.2009":
                pdfFrame.Attributes["src"] = this.ResolveClientUrl("~/Documents/Department/Engineering/Circular 23102008 - 29062009.pdf");
                lblInfo.Text = "Circular from 23 October 2008 to 29 June 2009";
                break;

            case "Till 23.10.2008":
                pdfFrame.Attributes["src"] = this.ResolveClientUrl("~/Documents/Department/Engineering/Circular till 231008.pdf");
                lblInfo.Text = "Circular till 23 October 2008";
                break;
        }
    }
}