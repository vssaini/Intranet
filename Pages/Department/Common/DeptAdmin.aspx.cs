using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class Pages_Department_Common_DeptAdmin : System.Web.UI.Page
{
    string pageName, format;
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HiddenField)this.Master.FindControl("hfMenu")).Value = "admin";
        ShowData();

        #region If not IOC authenticated user redirect to Login Page

		//if (String.IsNullOrEmpty(RSOUser.IsISAdmin()))
		//{
		//    if (String.IsNullOrEmpty(RSOUser.VerifyUser()))
		//    {
		//        Server.Transfer("~/Pages/Login.aspx?sender=DeptAdmin");
		//    }
		//}
        #endregion

    }

    #region Setting GridView

    protected void ShowData()
    {
        pageName = DeptPage.nameOfPage;
        adsFiles.SelectCommand = "SELECT * FROM Dept" + pageName + " ORDER BY UDate DESC";
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
        gvUploadedFiles.DataSourceID = "adsFiles";
        gvUploadedFiles.DataBind();
    }

    #endregion

    #endregion

    #region Upload file from here

    protected void btnFileUpload_Click(object sender, EventArgs e)
    {
        string strDept = "~/Upload/Department/" + DeptPage.nameOfPage + "/";
        double intFileSize=0;
        string strFileSize = String.Empty;

        // limitation of maximum file size
        int intFileSizeLimit = 10;

        if (fileUploader.HasFile)
        {
            string strFileNameWithPath = fileUploader.PostedFile.FileName;            
            string strExtension = Path.GetExtension(strFileNameWithPath);
            string strFileName = Path.GetFileName(strFileNameWithPath);

            #region Whether KB or MB

            double sizeInKB = fileUploader.PostedFile.ContentLength / 1024f;
            if (sizeInKB > 1024)
            {
                intFileSize = sizeInKB / 1024f;
                strFileSize = Math.Round(intFileSize, 2) + " MB";
            }
            else
            {
                strFileSize = Math.Round(sizeInKB, 2) + " KB";
            }
           

            #endregion
            
            // Restrict the user to upload only pdf, word and excel files
            if (CheckFileType(strExtension.ToLower()))
            {
                // Restrict the File Size 
                if (intFileSize < intFileSizeLimit)
                {
                    if (txtFileName.Text.Length > 0)
                    {
                        if (CheckFileExist(txtFileName.Text, strExtension))
                        {
                            // upload the file on the server
                            string query = "INSERT INTO Dept" + pageName + " VALUES ('" + txtFileName.Text + "','" + strExtension.Remove(0, 1) + "','" + strFileSize + "','" + DateTime.Now.ToString("dd/MM/yyyy") + "')";

                            if (DAL.ExecuteQuery(query) != 0)
                            {
                                fileUploader.PostedFile.SaveAs(Server.MapPath(strDept) + txtFileName.Text + strExtension);
                                gvUploadedFiles.DataBind();

                                HideLabels(lblFileUploaded, "Blue");
                                lblFileUploaded.Text = "Uploaded file named<b> " + strFileName + "</b> (" + strFileSize + ") by title <b>" + txtFileName.Text + "</b> successfully!";
                            }
                        }
                        else
                        {
                            HideLabels(lblFileUploaded, "Red");
                            lblFileUploaded.Text = "<b>Error</b> - Duplicate file names not allowed. File with name <b>" + txtFileName.Text + "</b> already exists. Try to save file with some other name.";
                        }
                    }
                    else
                    {
                        HideLabels(lblMessage, "Red");
                        lblMessage.Text = "* File title cannot be left blank.";
                    }
                }
                else
                {
                    HideLabels(lblMessage, "Red");
                    lblMessage.Text = "File size (" + strFileSize + ") exceeded " + intFileSizeLimit + " MB limit.";
                }
            }
            else
            {
                HideLabels(lblMessage, "Red");
                lblMessage.Text = "* Only pdf, word & excel files are allowed.";
            }
        }
        else
        {
            HideLabels(lblMessage, "Red");
            lblMessage.Text = "* Either file is of zero bytes <b>or</b> You have not selected any file for uploading.";
        }        
    }

    bool CheckFileType(string ext)
    {
        switch (ext)
        {
            case ".pdf":
                return true;

            case ".doc":
                return true;

            case ".docx":
                return true;

            case ".xls":
                return true;

            case ".xlsx":
                return true;

            default:
                return false;
        }
    }

    bool CheckFileExist(string fileName, string extension)
    {
        bool checker = false;
        string strPath = "~/Upload/Department/" + pageName + "/" + fileName + extension;
        string query = "SELECT * FROM Dept" + pageName + " WHERE Files='" + fileName + "'";

        if (!File.Exists(Server.MapPath(strPath)) && DAL.ExecuteQuery(query) < 1)
        {
            checker = true;
        }
        return checker;
    }

    protected void HideLabels(Label lblToShow, string color)
    {
        lblDeleteStatus.Visible = false;
        lblFileUploaded.Visible = false;
        lblMessage.Visible = false;

        lblToShow.Visible = true;
        WebColorConverter converter = new WebColorConverter();
        lblToShow.ForeColor = (System.Drawing.Color)converter.ConvertFromString(color);
    }

    #endregion

    #region Delete file from here

    protected void gvUploadedFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "deleteFile":
                if (DeleteFile(e.CommandArgument.ToString()) != 0)
                {
                    HideLabels(lblDeleteStatus, "Black");
                    lblDeleteStatus.Text = "Note:- File <b> " + e.CommandArgument.ToString() + "." + format + "</b> deleted successfully!";
                }
                else
                {
                    HideLabels(lblDeleteStatus, "Red");
                    lblDeleteStatus.Text = "Error - Cannot delete file as file was not found.";
                }
                gvUploadedFiles.DataBind();
                break;
        }
    }

    public int DeleteFile(string FileName)
    {
        int num = 0;

        string query = "DELETE * FROM Dept" + pageName + " WHERE Files='" + FileName + "'";
        string formatQuery = "SELECT Format FROM Dept" + pageName + " WHERE Files='" + FileName + "'";
        format = DAL.ExecuteStringScalar(formatQuery);

        string strPath = "~/Upload/Department/" + DeptPage.nameOfPage + "/" + FileName + "." + format;

        try
        {
            if (File.Exists(Server.MapPath(strPath)) == true)
            {
                File.Delete(Server.MapPath(strPath));
                num = DAL.ExecuteQuery(query);
            }
        }
        catch (Exception ex)
        {
            ErrorHandler.WriteError(ex);
        }
        return num;
    }

    #endregion
}