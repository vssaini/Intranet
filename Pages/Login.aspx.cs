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

public partial class Page_Login : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        switch (Request.QueryString["sender"])
        {
            case "DeptAdmin":
                Page.MasterPageFile = "~/Template/Department.master";
                ((HiddenField)this.Master.FindControl("hfMenu")).Value = "admin";
                break;

            case "ISAdmin":
                Page.MasterPageFile = "~/Template/Main.master";
                break;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ((TextBox)this.loginAdmin.FindControl("UserName")).MaxLength = 8;
        Page.SetFocus(this.loginAdmin.FindControl("UserName"));
        Page.Form.DefaultButton = this.loginAdmin.FindControl("LoginButton").UniqueID;
    }
    
    protected void loginAdmin_Authenticate(object sender, AuthenticateEventArgs e)
    {
        #region Validate User

        e.Authenticated = Membership.ValidateUser(loginAdmin.UserName, loginAdmin.Password);

        switch (e.Authenticated)
        {
            case false:
                ((Literal)this.loginAdmin.FindControl("FailureText")).Text = "There is no user in the database with the username " + loginAdmin.UserName + ". Please try again.";
                break;

            case true:
                // If user log on another user's pc
                Session["Admin"] = @"IOC\" + loginAdmin.UserName;

                switch (Request.QueryString["sender"])
                {
                    case "DeptAdmin":
                        Response.Redirect("~/Pages/Department/Common/DeptAdmin.aspx");
                        break;

                    case "ISAdmin":
                        Response.Redirect("~/Admin/ISAdmin.aspx?lnk=Dashboard");
                        break;
                }
                break;
        }

        #endregion
    }
}
