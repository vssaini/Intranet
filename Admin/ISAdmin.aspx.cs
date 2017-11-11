using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.Text.RegularExpressions;
using System.IO;
using AjaxControlToolkit;

public partial class Admin_ISAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Methods activated on Page Load

        // If not IOC ISAdmin user redirect to Login Page          
        //if (String.IsNullOrEmpty(RSOUser.VerifyUser()))
        //{
        //    Response.Redirect("~/Pages/Login.aspx?sender=ISAdmin");
        //}

        if (!IsPostBack)
        {
            if (Application["Announce"] != null)
            {
                txtAnnounce.Text = Application["Announce"].ToString();
            }

            GetFilesAndFolders();
        }

        SetAnnouncement();
        OpenActivePanel();
        ddlADUsers.Attributes["onChange"] = "javascript:ddlChange('cphMaster_ddlADUsers');";

        #endregion
    }

    #region Set Announcement
    protected void SetAnnouncement()
    {
        if (Application["Announce"] != null)
            hfAnnounce.Value = Application["Announce"].ToString();
    }
    #endregion

    #region Open Active Panel
    protected void OpenActivePanel()
    {
        string lnkValue = Request.QueryString["lnk"];
        switch (lnkValue)
        {
            case "AD":
                pnlADSettings.Visible = true;
                lblAdmin.Text = "Update A.D. Users";
                lblInfo.Text = "Update AD's <b>Logon</b> and <b>Username</b> for authentication from Active Directory (AD).";
                hfMenu.Value = lnkValue;
                break;

            case "Files":
                //((Panel)cph.FindControl("pnlAnnouncement")).Visible = true;
                lblAdmin.Text = "Activities done by respective Administrator";
                lblInfo.Text = "Check files uploaded, edited or deleted by department administrator(s).";
                hfMenu.Value = lnkValue;
                break;

            case "Announce":
                pnlAnnouncement.Visible = true;
                lblAdmin.Text = "Announcement for Employees";
                lblInfo.Text = "Set announcement for employees.";
                hfMenu.Value = lnkValue;
                break;

            case "Dashboard":
                pnlDashboard.Visible = true;
                lblAdmin.Text = "Dashboard - Overview of activities";
                lblInfo.Text = "As administrator get insight of different activities pertaining to site.";
                hfMenu.Value = lnkValue;
                break;

            case "DeptAdmin":
                pnlDeptAdmin.Visible = true;
                lblAdmin.Text = "Set Department Administrator";
                lblInfo.Text = "Assign and edit administrative user for respective department.";
                hfMenu.Value = lnkValue;

                if (!IsPostBack)
                {
                    DataSet ds = DAL.GetDataSet("SELECT * FROM AD_RSO_Users ORDER BY UserName ASC", "Login");
                    ddlADUsers.DataSource = ds;
                    ddlADUsers.DataTextField = "UserName";
                    ddlADUsers.DataValueField = "UserLogon";
                    ddlADUsers.DataBind();
                }
                break;

            case "Form":
                pnlEditIntranet.Visible = true;
                lblAdmin.Text = "Edit Intranet Data";
                lblInfo.Text = "Upload new forms / Edit & delete existing forms / Update holiday, hospital, hotel and guest house details.";
                hfMenu.Value = lnkValue;
                break;

            case "Error":
                lblAdmin.Text = "Error Reports of Website";
                lblInfo.Text = "See error(s) report of website <i>(Meant especially for Web Developer)</i>.";
                hfMenu.Value = lnkValue;
                break;

            case "Hits":
                lblAdmin.Text = "Hits on Website";
                lblInfo.Text = "Check what your users like most in your site.";
                hfMenu.Value = lnkValue;
                break;

            case "Gallery":
                pnlGallery.Visible = true;
                lblAdmin.Text = "Manage Events Gallery";
                lblInfo.Text = "Manage and update events gallery database.";
                hfMenu.Value = lnkValue;
                break;

        }
    }
    #endregion

    #region Update A.D. Users
    protected void btnUpdateADMember_Click(object sender, EventArgs e)
    {       
        if (AD.UpdateADUsers() > 0)
        {                   
            lblStatus.Visible = true;
            lblStatus.Text = "Updated A.D. users (" + Application["records"].ToString() + " records) successfully!";
            gvADUsers.DataBind();
            lblDelStatus.Visible = false;
        }
        else
        {
            lblStatus.Text = "Updation of A.D. users failed! Contact Web Administrator.";
        }
    }
    
    #endregion

    #region Save Announcement

    protected void btnSaveAnnounce_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtAnnounce.Text))
        {
            Application["Announce"] = txtAnnounce.Text;
            hfAnnounce.Value = txtAnnounce.Text;
        }
    }

    #endregion

    #region Save Administrative User for Department

    protected void btnSaveAdmin_Click(object sender, EventArgs e)
    {
        SaveAdminUser(ddlDepartment.SelectedItem.ToString(), ddlADUsers);
    }

    protected void SaveAdminUser(string dept, DropDownList ddlUser)
    {
        lblDeleteStatus.Visible = false;
        string query = "INSERT INTO Login VALUES(" + Convert.ToInt32(ddlUser.SelectedValue) + ",'" + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ddlUser.SelectedItem.ToString().ToLower()) + "','" + Regex.Replace(dept, @"\s", "") + "')";
        string loginExist = "SELECT * FROM Login WHERE PFNumber=" + Convert.ToInt32(ddlUser.SelectedValue);

        if (DAL.ExecuteScalar(loginExist) < 1)
        {
            if (DAL.ExecuteQuery(query) > 0)
            {
                divLabel.Visible = true;
                lblAdminInfo.ForeColor = System.Drawing.Color.Black;
                lblAdminInfo.Text = "Note:- <b>" + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ddlUser.SelectedItem.ToString().ToLower()) + "</b> has been set as Administrative user for <b>" + dept + "</b> department successfully!";
                gvLogin.DataBind();
            }
            else
            {
                divLabel.Visible = true;
                lblAdminInfo.Text = "Error - Unable to save data. Consult Administrator!";
            }
        }
        else
        {
            divLabel.Visible = true;
            lblAdminInfo.ForeColor = System.Drawing.Color.Red;
            lblAdminInfo.Text = "Error - <b>" + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ddlUser.SelectedItem.ToString().ToLower()) + "</b> already exists. Duplicate entries not allowed.";
        }
    }

    #endregion

    #region Delete Administrative user

    protected void gvLogin_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "deleteUser":
                divLabel.Visible = false;
                if (DeleteAdmin(e.CommandArgument.ToString()) != 0)
                {
                    lblDeleteStatus.Visible = true;
                    lblDeleteStatus.Text = "Note:- Record with PF Number<b> " + e.CommandArgument.ToString() + "</b> deleted successfully!";
                }
                gvLogin.DataBind();
                break;
        }
    }

    public int DeleteAdmin(string pfnumber)
    {
        string query = "DELETE * FROM  Login WHERE PFNumber=" + Convert.ToInt32(pfnumber);
        return DAL.ExecuteQuery(query);
    }

    #endregion

    #region Slide Extender Code

    protected void txtSlide_Changed(object sender, EventArgs e)
    {
        lblDelStatus.Visible = false;
        lblStatus.Visible = false;

        TextBox txtCurrentPage = sender as TextBox;
        GridViewRow rowPager = gvADUsers.BottomPagerRow;
        TextBox txtSliderExt = (TextBox)rowPager.Cells[0].FindControl("txtSlide");
        gvADUsers.PageIndex = Int32.Parse(txtSliderExt.Text) - 1;
    }

    protected void gvADUsers_DataBound(object sender, EventArgs e)
    {
        GridViewRow rowPager = gvADUsers.BottomPagerRow;
        SliderExtender slide = (SliderExtender)rowPager.Cells[0].FindControl("ajaxSlider");
        slide.Minimum = 1;
        slide.Maximum = gvADUsers.PageCount;
        slide.Steps = gvADUsers.PageCount;
    }

    #endregion

    #region Delete AD User

    protected void gvADUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "deleteUser":
                divLabel.Visible = false;
                if (DeleteADUser(e.CommandArgument.ToString()) != 0)
                {
                    lblDelStatus.Visible = true;
                    lblDelStatus.Text = "Note:- Record with LogonID<b> " + e.CommandArgument.ToString() + "</b> deleted successfully!";
                }

                gvADUsers.DataBind();
                break;
        }
    }

    public int DeleteADUser(string userLogon)
    {
        string query = "DELETE * FROM  AD_RSO_Users WHERE UserLogon='" + userLogon + "'";
        return DAL.ExecuteQuery(query);
    }

    #endregion

    #region Update Gallery

    protected void btnUpdateGallery_Click(object sender, EventArgs e)
    {
        (new Gallery()).CreateNewXmlFile();
        (new Gallery()).AppendDataToXml();

        GetFilesAndFolders();

        lblDeleteNotice.Visible = false;
        lblUpdated.Visible = true;
        lblUpdated.Text = "Note:- Gallery database updated successfully!";
    }

    #endregion

    #region Get Files & Folders from Album

    public void GetFilesAndFolders()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("S.No", typeof(string));
        dt.Columns.Add("Album", typeof(string));

        DataRow dr;
        int i = 1;

        foreach (string folder in Directory.GetDirectories(Server.MapPath("~/Gallery/EventsGallery"), "*", SearchOption.AllDirectories))
        {
            dr = dt.NewRow();
            dr[0] = i.ToString();
            dr[1] = new DirectoryInfo(folder).Name;
            dt.Rows.Add(dr);
            i += 1;
        }

        gvGalleryFolders.DataSource = dt;
        gvGalleryFolders.DataBind();

    }

    #endregion

    #region Delete Files & Folders from Album

    protected void gvGalleryFolders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "deleteFolder":
                string path = MapPath("~/SlideShow/EventsGallery/" + e.CommandArgument.ToString());
                Directory.Delete(path, true);

                if (!Directory.Exists(path))
                {
                    lblUpdated.Visible = false;
                    lblDeleteNotice.Visible = true;
                    lblDeleteNotice.Text = "<br/> Note:- Album named<b> " + e.CommandArgument.ToString() + "</b> deleted successfully!";
                    GetFilesAndFolders();
                }
                break;
        }
    }

    #endregion
}