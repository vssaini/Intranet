using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data;
using System.Globalization;

public partial class Pages_DistanceCalculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Accordion accMain = (Accordion)(this.Master.FindControl("menuRight")).FindControl("accMenu");
        if (accMain != null)
        {
            accMain.SelectedIndex = Int32.Parse(Request.QueryString["index"]);
        }

        #region Binding Database to DropDownList Begin

        if (!IsPostBack)
        {
            ddlBegin.DataSource = DAL.GetDataSet("SELECT DISTINCT Begin FROM CityTable ORDER BY Begin ASC", "CityTable");
            ddlBegin.DataTextField = "Begin";
            ddlBegin.DataBind();

            //Add the item at the first position
            ddlBegin.Items.Insert(0, "--Select Source--");
        }

        #endregion
    }

    protected void ddlBegin_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblResult.Text = "";
        ddlDestination.Enabled = true;
        ddlDestination.Items.Clear();
        string query = "SELECT DISTINCT Destination FROM CityTable WHERE Begin='" + ddlBegin.SelectedItem.Text + "' ORDER BY Destination ASC";

        ddlDestination.DataSource = DAL.GetDataSet(query, "CityTable");
        ddlDestination.DataTextField = "Destination";
        ddlDestination.DataBind();

        //Add the item at the first position
        ddlDestination.Items.Insert(0, "--Select Destination-");
    }

    protected void ddlDestination_SelectedIndexChanged(object sender, EventArgs e)
    {
        object result = null;
        string query = "SELECT Distance FROM CityTable WHERE Begin='" + ddlBegin.SelectedItem.Text + "' AND Destination='" + ddlDestination.SelectedItem.Text + "'";

        // Checking if value is there or not
        result = DAL.ExecuteStringScalar(query);

        if (result != null)
        {
            lblResult.Text = "The distance between <b>" + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ddlBegin.SelectedItem.Text.ToLower()) + "</b> and <b>" + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ddlDestination.SelectedItem.Text.ToLower()) + "</b> is: <b>" + result.ToString() + "</b> Km";

        }
    }
}