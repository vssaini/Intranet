using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Department_PPES : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DeptPage.SetPageName("PPES");

        ((HiddenField)this.Master.FindControl("hfMenu")).Value = "sideMenu_hlHome";
    }
}