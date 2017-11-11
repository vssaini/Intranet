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
using AjaxControlToolkit;

public partial class Pages_Hospital : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Set accordion selected index
        Accordion accMain = (Accordion)(this.Master.FindControl("menuRight")).FindControl("accMenu");
        if (accMain != null)
        {
            accMain.SelectedIndex = Int32.Parse(Request.QueryString["index"]);
        }
        #endregion
    }
}
