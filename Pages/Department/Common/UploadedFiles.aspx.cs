using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Department_Common_UploadedFiles : System.Web.UI.Page
{
    string pageName;
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HiddenField)this.Master.FindControl("hfMenu")).Value = "upload";
        ShowData();
    }

    protected void ShowData()
    {
        pageName = DeptPage.nameOfPage;
        adsUploadedFiles.SelectCommand = "SELECT * FROM Dept" + pageName + " ORDER BY UDate DESC";
    }

    protected void gvUploadedFiles_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void gvUploadedFiles_DataBound(object sender, EventArgs e)
    {
        #region Gridview Pager Settings

        GridViewRow gvrPager = gvUploadedFiles.BottomPagerRow;

        if (gvrPager == null) return;

        // Find controls within gridview bottom row
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPagecount = (Label)gvrPager.Cells[0].FindControl("lblPagecount");

        if (ddlPages != null)
        {
            // Populate DropDownList with Pages
            for (int i = 0; i < gvUploadedFiles.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());

                if (i == gvUploadedFiles.PageIndex)
                    lstItem.Selected = true;

                ddlPages.Items.Add(lstItem);
            }
        }

        // Update label with PageCount
        if (lblPagecount != null)
            lblPagecount.Text = gvUploadedFiles.PageCount.ToString();
        #endregion

        #region Formatting Hyperlink NavigateUrl in GridView
        HyperLinkField hLink = gvUploadedFiles.Columns[0] as HyperLinkField;
        hLink.DataNavigateUrlFormatString = @"~/Upload/Department/" + pageName + "/{0}.{1}";
        #endregion
    }

    #region Set GridView Pager's Events

    protected void ddlPages_SelectedIndexChanged(Object sender, EventArgs e)
    {
        GridViewRow gvrPager = gvUploadedFiles.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");

        gvUploadedFiles.PageIndex = ddlPages.SelectedIndex;

        // A method to populate your grid
        PopulateGrid();
    }

    protected void Paginate(object sender, CommandEventArgs e)
    {
        // Get the current page selected
        int intCurIndex = gvUploadedFiles.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                gvUploadedFiles.PageIndex = 0;
                break;
            case "prev":
                gvUploadedFiles.PageIndex = intCurIndex - 1;
                break;
            case "next":
                gvUploadedFiles.PageIndex = intCurIndex + 1;
                break;
            case "last":
                gvUploadedFiles.PageIndex = gvUploadedFiles.PageCount;
                break;
        }
    }

    // Populate the gridview control
    public void PopulateGrid()
    {
        gvUploadedFiles.DataSourceID = "adsUploadedFiles";
        gvUploadedFiles.DataBind();
    }

    #endregion
}