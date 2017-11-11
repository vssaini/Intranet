using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

public partial class Pages_LocationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = "SELECT * FROM LocationDetail WHERE Active='Y' ORDER BY Code";
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string location, locQuery;
        OleDbDataAdapter da;
        DataSet ds;

        if (!IsPostBack)
        {
            using (OleDbConnection con = new OleDbConnection(conString))
            {
                using (OleDbCommand command = new OleDbCommand(query, con))
                {
                    con.Open();

                    using (OleDbDataReader dr = command.ExecuteReader())
                    {
                        #region Retrieving LocationType in ArrayList

                        ArrayList allLoc = new ArrayList();
                        ArrayList fixLoc = new ArrayList();

                        while (dr.Read())
                        {
                            allLoc.Add(dr["LocationType"]);
                        }

                        foreach (string item in allLoc)
                        {
                            if (!fixLoc.Contains(item))
                            {
                                fixLoc.Add(item);
                            }
                        }

                        #endregion

                        foreach (object o in fixLoc)
                        {
                            location = o.ToString();
                            locQuery = "SELECT * FROM LocationDetail WHERE LocationType='" + location + "';";

                            da = new OleDbDataAdapter(locQuery, con);
                            ds = new DataSet();
                            da.Fill(ds);

                            #region Adding Controls to Page at Runtime

                            // Loading UserControl in GridUserControll
                            GridUserControll guc = (GridUserControll)LoadControl("~/UserControls/UCLocation.ascx");

                            // Accessing controls within GridUserControll
                            Label lbl = (Label)guc.FindControl("lblLocation");

                            GridView gv = (GridView)guc.FindControl("gvLocation");

                            // Setting control's values on basis of Database entities
                            lbl.Text = location;
                            gv.DataSource = ds;
                            gv.DataBind();

                            // Adding guc to Page's Controls
                            this.phLocation.Controls.Add(guc);

                            #endregion
                        }
                    }
                }
            }
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* 1. Confirms that an HtmlForm control is rendered for the specified ASP.NET server control at run time.
           2. We need to tell ASP.NET that there is a control in our form that will be rendered at runtime.*/
    }
}