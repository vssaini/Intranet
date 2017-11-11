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
using System.Data.OleDb;
using AjaxControlToolkit;

public partial class Pages_Hotel : System.Web.UI.Page
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

        string query = "SELECT DISTINCT(City) FROM Hotels";
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
                        #region Get distinct city
                        
                        ArrayList fixLoc = new ArrayList();
                        while(dr.Read())
                        {
                            fixLoc.Add(dr["City"]);                        
                        }
                        
                        #endregion

                        foreach (object o in fixLoc)
                        {
                            location = o.ToString();
                            locQuery = "SELECT * FROM Hotels WHERE City='" + location + "';";

                            da = new OleDbDataAdapter(locQuery, con);
                            ds = new DataSet();
                            da.Fill(ds);

                            #region Adding Controls to Page at Runtime

                            // Loading UserControl in GridUserControll                            
                            UserControls_UCHotels ucHotel = (UserControls_UCHotels)LoadControl("~/UserControls/UCHotels.ascx");

                            // Accessing controls within GridUserControll
                            Label lbl = (Label)ucHotel.FindControl("lblCity");

                            GridView gv = (GridView)ucHotel.FindControl("gvHotel");

                            // Setting control's values on basis of Database entities
                            lbl.Text = location;
                            gv.DataSource = ds;
                            gv.DataBind();

                            // Adding guc to Page's Controls
                            this.phHotel.Controls.Add(ucHotel);                           

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
