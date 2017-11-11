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

public partial class Pages_Forms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Accordion accMain = (Accordion)(this.Master.FindControl("menuRight")).FindControl("accMenu");
        if (accMain != null)
        {
            accMain.SelectedIndex = Int32.Parse(Request.QueryString["index"]);
        }
    }

    protected void gvForms_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        #region Set image format (.pdf,.xls,.xlsx,.doc,.docx)
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Image imgFormat = (Image)e.Row.FindControl("imgFormat");

            switch ((e.Row.DataItem as DataRowView).Row["Format"].ToString().ToLower())
            {
                case "pdf":
                    imgFormat.ImageUrl = this.ResolveClientUrl("~/Documents/Images/document-pdf.png");
                    break;

                case "xls":
                    imgFormat.ImageUrl = this.ResolveClientUrl("~/Documents/Images/document-excel.png");
                    break;

                case "xlsx":
                    imgFormat.ImageUrl = this.ResolveClientUrl("~/Documents/Images/document-excel.png");
                    break;

                case "doc":
                    imgFormat.ImageUrl = this.ResolveClientUrl("~/Documents/Images/document-word.png");
                    break;

                case "docx":
                    imgFormat.ImageUrl = this.ResolveClientUrl("~/Documents/Images/document-word.png");
                    break;

                default:
                    imgFormat.AlternateText = "N/A";
                    break;
            }
        }

        #endregion
    }

    protected void gvForms_DataBound(object sender, EventArgs e)
    {
        #region Set GridView Pager's Settings
        GridViewRow gvrPager = gvForms.BottomPagerRow;

        if (gvrPager == null) return;

        // Find controls within gridview bottom row
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPagecount = (Label)gvrPager.Cells[0].FindControl("lblPagecount");

        if (ddlPages != null)
        {
            // Populate DropDownList with Pages
            for (int i = 0; i < gvForms.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());

                if (i == gvForms.PageIndex)
                    lstItem.Selected = true;

                ddlPages.Items.Add(lstItem);
            }
        }

        // Update label with PageCount
        if (lblPagecount != null)
            lblPagecount.Text = gvForms.PageCount.ToString();
        #endregion
    }

    #region Set GridView Pager's Events

    protected void ddlPages_SelectedIndexChanged(Object sender, EventArgs e)
    {
        GridViewRow gvrPager = gvForms.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");

        gvForms.PageIndex = ddlPages.SelectedIndex;

        // A method to populate your grid
        PopulateGrid();
    }

    protected void Paginate(object sender, CommandEventArgs e)
    {
        // Get the current page selected
        int intCurIndex = gvForms.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                gvForms.PageIndex = 0;
                break;
            case "prev":
                gvForms.PageIndex = intCurIndex - 1;
                break;
            case "next":
                gvForms.PageIndex = intCurIndex + 1;
                break;
            case "last":
                gvForms.PageIndex = gvForms.PageCount;
                break;
        }
    }

    // Populate the gridview control
    public void PopulateGrid()
    {
        gvForms.DataSourceID = "adsForms";
        gvForms.DataBind();
    }

    #endregion
}
