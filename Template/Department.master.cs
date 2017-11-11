using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Template_Department : System.Web.UI.MasterPage
{
    // Declaration of common controls
    Label lbl;
    Image img, imgDept;
    HyperLink hlHome, hlOrganogram;

    protected void Page_Load(object sender, EventArgs e)
    {
        SetDepartmentPage();
        SetAnnouncement();

        //Response.Cache.SetExpires(DateTime.Now.AddMonths(1));
        //Response.Cache.SetCacheability(HttpCacheability.Public);
        //Response.Cache.SetValidUntilExpires(true);    
    }

    protected void SetAnnouncement()
    {
        if (Application["Announce"] != null)
            hfAnnounce.Value = Application["Announce"].ToString();
    }

    protected void SetDepartmentPage()
    {
        #region Initialize Common Controls from UserControl

        lbl = (Label)deptHeader.FindControl("lblDeptName");
        img = (Image)deptHeader.FindControl("imgLogo");
        imgDept = (Image)sideMenu.FindControl("imgDept");
        hlHome = (HyperLink)sideMenu.FindControl("hlHome");
        hlOrganogram = (HyperLink)sideMenu.FindControl("hlOrganogram");

        #endregion

        #region Creating Settings for Department Page

        string pageName = DeptPage.nameOfPage;   
        
        switch (pageName)
        {
            case "ConsumerSales":
                CSPage();
                break;
            case "Engineering":
                EngPage();
                break;
            case "Finance":
                FinPage();
                break;
            case "HumanResources":
                HRPage();
                break;
            case "InformationSystem":
                ISPage();
                break;
            case "Law":
                LawPage();
                break;
            case "LPG":
                LPGPage();
                break;
            case "Lubes":
                LubesPage();
                break;
            case "Operation":
                OpernPage();
                break;
            case "PPES":
                PPESPage();
                break;
            case "RetailSales":
                RSPage();
                break;
        }

        #endregion

    }

    #region Contains Department Pages Settings Functions

    protected void CSPage()
    {
        lbl.Text = "Consumer Sales Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/cs.png");

        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/ConsumerSales.png");
        imgDept.Attributes.Add("Style", "position:relative; top: 75px");

        PlaceHolder phConsumer = (PlaceHolder)sideMenu.FindControl("phConsumer");
        phConsumer.Visible = true;

        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/ConsumerSales.aspx");
        hlOrganogram.NavigateUrl = this.ResolveUrl("~/Pages/Department/Common/ImageViewer.aspx?fileName=~/Documents/Department/Organogram/CS.gif");
    }

    protected void EngPage()
    {
        lbl.Text = "Engineering Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/engin.png");

        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/Engineering.png");
        imgDept.Attributes.Add("Style", "position:relative; top: 60px");

        PlaceHolder phEngineering = (PlaceHolder)sideMenu.FindControl("phEngineering");
        phEngineering.Visible = true;

        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/Engineering.aspx");
        hlOrganogram.NavigateUrl = this.ResolveUrl("~/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/Organogram/Engineering.pdf");
    }

    protected void FinPage()
    {
        lbl.Text = "Finance Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/finc.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/Finance.png");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/Finance.aspx");
        hlOrganogram.NavigateUrl = this.ResolveUrl("~/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/Organogram/Finance.pdf");
    }

    protected void HRPage()
    {
        lbl.Text = "Human Resources (HR) Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/hr.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/HumanResources.png");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/HumanResources.aspx");
        hlOrganogram.NavigateUrl = this.ResolveUrl("~/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/Organogram/HR.pdf");
    }

    protected void ISPage()
    {
        lbl.Text = "Information System (IS) Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/infos.png");

        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/InformationSystem.png");
        imgDept.Attributes.Add("Style", "position:relative; top: 40px");

        PlaceHolder phInformation = (PlaceHolder)sideMenu.FindControl("phInformation");
        phInformation.Visible = true;

        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/InformationSystem.aspx");
        hlOrganogram.NavigateUrl = this.ResolveUrl("~/Pages/Department/Common/ImageViewer.aspx?fileName=~/Documents/Department/Organogram/IS.bmp");
    }

    protected void LawPage()
    {
        lbl.Text = "Law Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/law.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/Law.png");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/Law.aspx");
    }

    protected void LPGPage()
    {
        lbl.Text = "LPG Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/lpgas.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/LPG.gif");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/LPG.aspx");
    }

    protected void LubesPage()
    {
        lbl.Text = "Lubes Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/lubes.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/Lubes.png");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/Lubes.aspx");
    }

    protected void OpernPage()
    {
        lbl.Text = "Operation Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/oper.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/Operation.png");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/Operation.aspx");
    }

    protected void PPESPage()
    {
        lbl.Text = "PP and ES Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/ppes.png");

        PlaceHolder phPPES = (PlaceHolder)sideMenu.FindControl("phPPES");
        phPPES.Visible = true;

        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/PPES.png");
        imgDept.Attributes.Add("Style", "position:relative; top: 60px");

        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/PPES.aspx");
    }

    protected void RSPage()
    {
        lbl.Text = "Retail Sales Department";
        img.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/icons/retail.png");
        imgDept.ImageUrl = this.ResolveUrl("~/Documents/Images/Dept/thumbnails/RetailSales.png");
        hlHome.NavigateUrl = this.ResolveUrl("~/Pages/Department/RetailSales.aspx");
        hlOrganogram.NavigateUrl = this.ResolveUrl("~/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/Organogram/RS.pdf");

    }

    #endregion

}