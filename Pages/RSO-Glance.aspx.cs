using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_RSO_Glance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime date = Convert.ToDateTime(DAL.ExecuteStringScalar("SELECT VDate FROM RSO_Glance ORDER BY VDate DESC"));

        lblHeader.Text = "Rajasthan State Office at Glance as on " + date.ToString("dd MMMM yyyy");
    }
}