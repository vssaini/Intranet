using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Department_CS_Sales_Market_Share : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HiddenField)this.Master.FindControl("hfMenu")).Value = "sms";
        if (!IsPostBack)
        {
            this.ddlYears_SelectedIndexChanged(this, null);
        }
    }

    protected void ddlYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddlYears.SelectedItem.Text)
        {
            case "2007-2008":
                imgShare.ImageUrl = this.ResolveUrl("~/Documents/Department/Consumer Sales/2007-2008.bmp");
                break;

            case "2008-2009":
                imgShare.ImageUrl = this.ResolveUrl("~/Documents/Department/Consumer Sales/2008-2009.bmp");
                break;

            case "2009-2010":
                imgShare.ImageUrl = this.ResolveUrl("~/Documents/Department/Consumer Sales/2009-2010.bmp");
                break;
        }
    }
}