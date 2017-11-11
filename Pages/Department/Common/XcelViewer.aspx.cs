using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemBox.Spreadsheet;
using System.Collections;
using System.IO;
using System.Drawing;

public partial class Pages_Department_Common_XcelViewer : System.Web.UI.Page
{
    static string nameOfFile;

    // Application instance unload from memory after 20 minutes
    // And so Static Variables are lost
    static ExcelFile xcel;

    // private property to save viewstate
    private Dictionary<string, string> dictControl
    {
        get
        {
			if (ViewState["dictControl"] == null)
			{
				ViewState["dictControl"] = new Dictionary<string, string>();
			}
            return (Dictionary<string, string>)ViewState["dictControl"];
        }		
    }

    // LoadViewState fires before Page_Load BUT AFTER OnPreInit
    protected override void LoadViewState(object savedState)
    {
        // Loads the ViewState into memory
        base.LoadViewState(savedState);

        // Loop through all items of Dictionary
        IDictionaryEnumerator en = dictControl.GetEnumerator();
        while (en.MoveNext())
        {
            LinkButton lb = new LinkButton();
            lb.ID = en.Key as String;
            lb.Text = en.Value as String;
            lb.Click += new EventHandler(Sheet_Click);

            phContainer.Controls.Add(lb);
            phContainer.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;"));
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Set respective menu active

        ((HiddenField)this.Master.FindControl("hfMenu")).Value = Request.QueryString["menu"];
        #endregion

        #region Clear PlaceHolder controls if any

        if (phContainer.Controls.Count > 0)
        {
            phContainer.Controls.Clear();
        }

        #endregion

        #region Open respective Excel file

        string strExcel = Request.QueryString["xcelFile"];

        if (strExcel != null)
        {
            LoadSheets(strExcel);
            OpenDefaultSheet();
        }
        #endregion
    }

    public void LoadSheets(string fileName)
    {
        nameOfFile = Path.GetFileNameWithoutExtension(fileName);
        excelFrame.Visible = false;
        lblSheet.Text = String.Empty;

        #region Creating dynamic sheets on basis of excel file
        ExcelFile ef = GetExcelFile(fileName);
        ExcelWorksheetCollection worksheets = ef.Worksheets;
        xcel = ef;
        dictControl.Clear(); // To avoid mixing of sheets of different excel file   

        foreach (ExcelWorksheet ew in worksheets)
        {
            // Creating controls dynamically
            LinkButton lb = new LinkButton();
            lb.ID = "lbl" + ew.Name;
            lb.Text = ew.Name;
            lb.Click += new EventHandler(Sheet_Click);

            // Adding hashControl dynamically            
            phContainer.Controls.Add(lb);
            phContainer.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;"));

            // Preserving ViewState
            dictControl.Add(lb.ID, lb.Text);
        }

        #endregion
    }

    protected ExcelFile GetExcelFile(string fileName)
    {
        string xlPath = Server.MapPath(fileName);
        ExcelFile ef = new ExcelFile();

        // Load Excel file 
        ef.LoadXls(xlPath, XlsOptions.PreserveAll);
        return ef;
    }

    protected void OpenDefaultSheet()
    {
        ExcelWorksheetCollection worksheets = xcel.Worksheets;
        OpenInIFrame(worksheets, null);
    }

    protected void Sheet_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        ExcelWorksheetCollection worksheets = xcel.Worksheets;
        OpenInIFrame(worksheets, lb.Text);
    }

    protected void OpenInIFrame(ExcelWorksheetCollection worksheets, string currentSheet)
    {
        #region Set Active Worksheet

        if (currentSheet != null)
        {
            worksheets.ActiveWorksheet = worksheets[currentSheet];
        }
        else
        {
            worksheets.ActiveWorksheet = worksheets[0];
        }

        #endregion

        #region Save Html file of Excel file

        WebColorConverter converter = new WebColorConverter();
        lblSheet.ForeColor = (Color)converter.ConvertFromString("ThreeDDarkShadow");
        lblSheet.Text = "You are watching sheet <b>" + worksheets.ActiveWorksheet.Name + "</b> of total <b>" + worksheets.Count + "</b> sheets in excel file <b>" + nameOfFile + "</b>";

        string file = nameOfFile + "_" + worksheets.ActiveWorksheet.Name;
        string uplPath = Server.MapPath(@"~/Documents/Excel_Html/" + file + ".html");
        string virPath = HttpRuntime.AppDomainAppVirtualPath + @"/Documents/Excel_Html/" + file + ".html";
        xcel.SaveHtml(uplPath, null, true);

        #endregion

        #region Set Iframe src path

        excelFrame.Visible = true;
        excelFrame.Attributes["src"] = virPath;

        #endregion

        #region Show error if there is no data in the sheet

        CellRange range = worksheets.ActiveWorksheet.GetUsedCellRange(true);
        if (range == null)
        {
            lblSheet.ForeColor = System.Drawing.Color.Red;
            lblSheet.Text = "<b>ERROR</b> - There is no data in the selected sheet <b>" + worksheets.ActiveWorksheet.Name + "</b>";
        }

        #endregion
    }

    protected void btnExport_Click(object sender, ImageClickEventArgs e)
    {
        #region Export to Excel

        ExcelFile ef = xcel;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + nameOfFile + ".xls");
        ef.SaveXls(Response.OutputStream);


        #endregion
    }
}