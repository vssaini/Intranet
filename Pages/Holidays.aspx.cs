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
using System.Xml.XPath;
using AjaxControlToolkit;

public partial class Pages_Holidays : System.Web.UI.Page
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

        #region Make panel visible accordingly holiday type

        string strHoliType = Request.QueryString["type"];

        if (strHoliType != null)
        {
            switch (strHoliType)
            {
                case "RSO":
                    lblHoliday.Text = "Rajasthan State Office Holidays";
                    pnlCombined.Visible = false;
                    pnlNorthern.Visible = true;
                    break;

                case "ALL":
                    lblHoliday.Text = "All Region Holidays";
                    pnlNorthern.Visible = false;
                    pnlCombined.Visible = true;
                    break;
            }
        }

        #endregion

        #region Populate holiday year

        if (!IsPostBack)
        {
            DataSet ds = DAL.GetDataSet("SELECT DISTINCT HYear FROM RSO_Holidays ORDER BY HYear DESC", "RSO_Holidays");

            ddlYear.DataTextField = "HYear";
            ddlYear.DataValueField = "HYear";
            ddlCYear.DataTextField = "HYear";
            ddlCYear.DataValueField = "HYear";

            ddlYear.DataSource = ds.Tables[0].DefaultView;
            ddlCYear.DataSource = ds.Tables[0].DefaultView;
            ddlYear.DataBind();
            ddlCYear.DataBind();           
        }

        #endregion

        if (!IsPostBack)
        {
            this.btnGo_Click(this, null);
        }
    }

    #region Set active holidays images

    protected void gvCommonHoliday_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string strGreen = this.ResolveClientUrl("~/Documents/Images/green_circle.png");
        string strWhite = this.ResolveClientUrl("~/Documents/Images/white.gif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {            
            string[] regions = { "HO", "NR", "ER", "SR", "CO" };
            foreach (string region in regions)
            {
                Image img = (Image)e.Row.FindControl("img" + region);
                if ((e.Row.DataItem as DataRowView).Row[region].ToString().ToUpper().Equals("YES"))
                {
                    img.ImageUrl = strGreen;
                }
                else
                {
                    img.ImageUrl = strWhite;
                }
            }
        }
    }

    #endregion

    #region Show holiday by year

    protected void btnGo_Click(object sender, EventArgs e)
    {
        string region = Request.QueryString["type"];

        switch (region)
        {
            case "RSO":
                string ryear = ddlYear.SelectedItem.Text;
                ShowHolidays(ryear);
                lblCHYear.Text = ryear;
                lblRHYear.Text = ryear;
                lblTCHYear.Text = ryear;
                break;

            case "ALL":
                string year = ddlCYear.SelectedItem.Text;
                ShowHolidays(year);
                lblRegH.Text = year;
                break;
        }

    }

    protected void ShowHolidays(string year)
    {
        rsoTerHoliday.SelectCommand = "SELECT * FROM RSO_Holidays WHERE Category='TCH' AND HYear='" + year + "'";
        rsoCloseHoliday.SelectCommand = "SELECT * FROM RSO_Holidays WHERE Category='CH' AND HYear='" + year + "'";
        rsoRestHoliday.SelectCommand = "SELECT * FROM RSO_Holidays WHERE Category='RH' AND HYear='" + year + "'";
        regionHoliday.SelectCommand = "SELECT * FROM Region_Holidays WHERE RYear='" + year + "'";

        gvRsoCloseHoliday.DataBind();
        gvRsoCloseHoliday.DataBind();
        gvRsoCloseHoliday.DataBind();
        gvCommonHoliday.DataBind();
    }

    #endregion

}
