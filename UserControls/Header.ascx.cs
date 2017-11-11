using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployee.Text = "Welcome " + AD.GetUserName();
        lblDate.Text = DateTime.Now.DayOfWeek + ", " + DateTime.Now.ToString("dd MMMM yyyy") + ", ";
        //AD.UpdateADUsers();        
    }   
}