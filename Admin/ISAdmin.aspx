<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ISAdmin.aspx.cs" Inherits="Admin_ISAdmin"
    Async="true" AsyncTimeout="60" %>

<%@ Register Src="~/UserControls/Header.ascx" TagName="header" TagPrefix="site" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagName="footer" TagPrefix="site" %>
<%@ Register Src="~/UserControls/Admin-SideMenu.ascx" TagName="sidemenu" TagPrefix="admin" %>
<%@ Register Src="~/UserControls/Horizontal-Menu.ascx" TagName="horizontal" TagPrefix="menu" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rajasthan State Office - Intranet</title>
    <link rel="Stylesheet" href="../Style/General.css" type="text/css" />
    <link rel="Stylesheet" href="../Style/DeptMenu/dmenu.css" type="text/css" />
    <link rel="Shortcut Icon" href="../favicon.ico" />
</head>
<body onload="startclock(); startType(100, 'txtDestination'); menuClicked();">
    <form id="master" runat="server">
    <div class="main">
        <div id="header">
            <%--HEADER--%>
            <site:header ID="siteHeader" runat="server" />
            <%--HORIZONTAL MENU--%>
            <div class="clear hideSkiplink">
                <menu:horizontal ID="horzMenu" runat="server" />
            </div>
            <%--ANNOUNCEMENT--%>
            <table class="announcement">
                <tr>
                    <asp:HiddenField ID="hfAnnounce" runat="server" Value="Welcome to RSO Intranet Portal!" />
                    <td id="txtDestination" class="annImg" />
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
        <div style="min-height: 355px; width: 100%">
            <%--LEFT VERTICAL MENU--%>
            <div class="leftCol">
                <admin:sidemenu ID="adminMenu" runat="server" />
                <asp:HiddenField ID="hfMenu" runat="server" Value="Dashboard" EnableViewState="true" />
            </div>
            <%--RIGHT SIDE--%>
            <div class="deptRightColumn">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <tr>
                            <td class="greenLeft">
                            </td>
                            <td class="greenMiddle">
                                <span class="adminImg" /><span class="padLeft">
                                    <asp:Label ID="lblAdmin" runat="server" Text="Control Panel for IS Administrator" /></span>
                            </td>
                            <td class="greenRight">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="adminBox">
                    <div class="infoPanel">
                        <div class="lblPadding">
                            <span class="infoImg">
                                <asp:Label ID="lblInfo" runat="server" Text="Welcome Administrator!" /></span>
                        </div>
                    </div>
                    <%--ANNOUNCEMENT PANEL--%>
                    <asp:Panel ID="pnlAnnouncement" Visible="false" runat="server" CssClass="pnlBrdr">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-top: 3px;">
                            <tbody>
                                <tr>
                                    <td width="18%">
                                        Announcement message:
                                    </td>
                                    <td width="77%">
                                        <asp:TextBox ID="txtAnnounce" runat="server" TextMode="MultiLine" CssClass="annTxt" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <a id="A1" class="AdminButton Office2010Silver rbSkinnedButton" href="javascript:void(0)">
                                            <span class="rbPrimaryIcon saveImg"></span>
                                            <asp:Button ID="btnSaveAnnounce" runat="server" ValidationGroup="ADConfig" Text="Save Announcement"
                                                CssClass="rbDecorated rbPrimary" OnClick="btnSaveAnnounce_Click" />
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                    <%--EDIT UPLOADED FORMS--%>
                    <asp:Panel ID="pnlEditIntranet" runat="server" Visible="false" CssClass="pnlBrdr">
                        <label>
                            Orientation:&nbsp;</label>
                    </asp:Panel>
                    <%--ACTIVE DIRECTORY SETTINGS--%>
                    <asp:Panel ID="pnlADSettings" Visible="false" runat="server" CssClass="pnlBrdr">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-top: 2px;">
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:ScriptManager ID="scriptManager" runat="server" />
                                        <asp:UpdatePanel runat="server" ID="Panel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <a id="btnIcon" class="AdminButton Office2010Silver rbSkinnedButton" href="javascript:void(0)">
                                                    <span class="rbPrimaryIcon adImg"></span>
                                                    <asp:Button ID="btnTest" runat="server" Text="Update AD Users" CssClass="rbDecorated rbPrimary"
                                                        OnClick="btnUpdateADMember_Click" OnClientClick="document.getElementById('lblUpdate').innerText = 'Updating AD users...please wait. It might take several minute(s).';" />
                                                </a>
                                                <asp:UpdateProgress ID="progress" runat="server">
                                                    <ProgressTemplate>
                                                        <div style="padding-top: 10px;" align="center">
                                                            <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Documents/Images/ajax_busy.gif"
                                                                style="padding-right: 3px; padding-left: 10px;" alt="" />
                                                            <asp:Label ID="lblUpdate" runat="server" Text="Fetching data. Please wait..." />
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                                <div style="padding-top: 6px; padding-bottom: 5px;" align="center">
                                                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusBG" />
                                                </div>
                                                <asp:GridView ID="gvADUsers" runat="server" Width="100%" DataSourceID="adsADUser"
                                                    GridLines="Vertical" AllowPaging="true" PageSize="10" DataKeyNames="UserLogon"
                                                    AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" CssClass="grdDeptAdmin"
                                                    OnRowCommand="gvADUsers_RowCommand" OnDataBound="gvADUsers_DataBound">
                                                    <HeaderStyle CssClass="deptheader bodyboldmediumwhite" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Logon ID" DataField="UserLogon" />
                                                        <asp:BoundField HeaderText="User Name" DataField="UserName" />
                                                        <asp:TemplateField HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ImageUrl="~/Documents/Images/Delete.gif" ID="imgBtnDel"
                                                                    CommandName="deleteUser" OnClientClick="return confirm('Are you sure you want to delete this user ?');"
                                                                    CommandArgument='<%#Eval("UserLogon") %>' AlternateText="Delete" ToolTip="Delete user" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerTemplate>
                                                        <asp:TextBox ID="txtSlide" runat="server" Text='<%# gvADUsers.PageIndex + 1 %>' AutoPostBack="true"
                                                            OnTextChanged="txtSlide_Changed" />
                                                        <ajax:SliderExtender ID="ajaxSlider" runat="server" TargetControlID="txtSlide" Orientation="Horizontal"
                                                            Minimum="1" Steps='<%# gvADUsers.PageCount %>' Maximum='<%# ((GridView)Container.NamingContainer).PageCount %>'
                                                            RaiseChangeOnlyOnMouseUp="true" />
                                                        <asp:Label ID="lblPage" runat="server" Text='<%# "Page " + (gvADUsers.PageIndex + 1) + " of " + gvADUsers.PageCount %>' />
                                                    </PagerTemplate>
                                                    <EmptyDataTemplate>
                                                        <div class="deptBlank">
                                                            <img src='<%= ResolveClientUrl("~/Documents/Images/user_delete.png") %>' alt="noUser" />&nbsp;
                                                            There is no user in AD_RSO_Users.
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                                <br />
                                                <div class="lblAdmin" align="center">
                                                    <asp:Label ID="lblDelStatus" runat="server" Visible="false" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:AccessDataSource ID="adsADUser" runat="server" SelectCommand="SELECT * FROM AD_RSO_Users ORDER BY UserName"
                            DataFile="~/App_Data/Intranet.mdb" />
                    </asp:Panel>
                    <%--SET DEPARTMENT ADMINISTRATOR--%>
                    <asp:Panel ID="pnlDeptAdmin" runat="server" Visible="false" CssClass="pnlBrdr">
                        <div class="DeptAdminBg">
                            <div class="padAll">
                                <table cellspacing="0" cellpadding="1" border="0" align="center" width="100%">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>
                                                    Administrative User:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlADUsers" runat="server" CssClass="ddlStyle" />
                                            </td>
                                            <td>
                                                <label>
                                                    Department:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="ddlStyle">
                                                    <asp:ListItem>Consumer Sales</asp:ListItem>
                                                    <asp:ListItem>Engineering</asp:ListItem>
                                                    <asp:ListItem>Finance</asp:ListItem>
                                                    <asp:ListItem>Hindi</asp:ListItem>
                                                    <asp:ListItem>Human Resources</asp:ListItem>
                                                    <asp:ListItem>Information System</asp:ListItem>
                                                    <asp:ListItem>Law</asp:ListItem>
                                                    <asp:ListItem>LPG</asp:ListItem>
                                                    <asp:ListItem>Lubes</asp:ListItem>
                                                    <asp:ListItem>Operation</asp:ListItem>
                                                    <asp:ListItem>PP & ES</asp:ListItem>
                                                    <asp:ListItem>Retail Sales</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td align="center">
                                                <a id="A12" class="AdminButton Green rbSkinnedButton" href="javascript:void(0)"><span
                                                    class="rbPrimaryIcon saveImg"></span>
                                                    <asp:Button ID="btnSaveAdmin" runat="server" Text="Save Department Admin" OnClick="btnSaveAdmin_Click"
                                                        CssClass="rbDecorated rbPrimary" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br />
                        <div id="divLabel" runat="server" visible="false" class="lblAdmin" align="center">
                            <asp:Label ID="lblAdminInfo" runat="server" /><br />
                        </div>
                        <asp:AccessDataSource ID="adsLogin" runat="server" SelectCommand="SELECT * FROM Login ORDER BY UserName"
                            DataFile="~/App_Data/Intranet.mdb" />
                        <asp:GridView ID="gvLogin" runat="server" Width="100%" DataSourceID="adsLogin" GridLines="Vertical"
                            AllowPaging="true" PageSize="15" DataKeyNames="PFNumber" AutoGenerateColumns="false"
                            RowStyle-HorizontalAlign="Center" CssClass="grdDeptAdmin" OnRowCommand="gvLogin_RowCommand">
                            <HeaderStyle CssClass="deptheader bodyboldmediumwhite" />
                            <Columns>
                                <asp:BoundField HeaderText="PF Number" DataField="PFNumber" />
                                <asp:BoundField HeaderText="User Name" DataField="UserName" />
                                <asp:BoundField HeaderText="Department" DataField="Department" />
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ImageUrl="~/Documents/Images/Delete.gif" ID="imgBtnDel"
                                            CommandName="deleteUser" OnClientClick="return confirm('Are you sure you want to delete this user ?');"
                                            CommandArgument='<%#Eval("PFNumber") %>' AlternateText="Delete" ToolTip="Delete user" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="deptBlank">
                                    <img src='<%= ResolveClientUrl("~/Documents/Images/user_delete.png") %>' alt="noFile" />&nbsp;
                                    No user has been assigned Administrative right for any of the department.
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <div class="lblAdmin" align="center">
                            <asp:Label ID="lblDeleteStatus" runat="server" Visible="false" />
                        </div>
                    </asp:Panel>
                    <%--DASHBOARD--%>
                    <asp:Panel ID="pnlDashboard" runat="server" Visible="false" CssClass="pnlBrdr">
                        <div class="lCol">
                            <table class="tablebg" cellspacing="0" cellpadding="0" border="0" align="center"
                                width="100%">
                                <tbody>
                                    <tr>
                                        <td class="topstripbg">
                                            <span class="bodyboldmediumwhite">&nbsp;&nbsp;&nbsp;Administrator(s) Activities &nbsp;
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="padTbl">
                                            Subrata Das uploaded form <b>Medical Claim</b>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="rCol">
                            <table class="tablebg" cellspacing="0" cellpadding="0" border="0" align="center"
                                width="100%">
                                <tbody>
                                    <tr>
                                        <td class="topstripbg">
                                            <span class="bodyboldmediumwhite">&nbsp;&nbsp;&nbsp;Website Errors &nbsp; </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="padTbl">
                                            User name and password for AD not matched.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div class="lCol">
                            <table class="tablebg" cellspacing="0" cellpadding="0" border="0" align="center"
                                width="100%">
                                <tbody>
                                    <tr>
                                        <td class="topstripbg">
                                            <span class="bodyboldmediumwhite">&nbsp;&nbsp;&nbsp;Department Administrator &nbsp;
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="padTbl">
                                            <ul>
                                                <li>Shrawan Yadav - Marketing department</li></ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="rCol">
                            <table class="tablebg" cellspacing="0" cellpadding="0" border="0" align="center"
                                width="100%">
                                <tbody>
                                    <tr>
                                        <td class="topstripbg">
                                            <span class="bodyboldmediumwhite">&nbsp;&nbsp;&nbsp;Website Updates&nbsp; </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="padTbl">
                                            <ul>
                                                <li>Holidays list updated by Narendar Singh Rawat</li></ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </asp:Panel>
                    <%--UPDATE GALLERY--%>
                    <asp:Panel ID="pnlGallery" Visible="false" runat="server" CssClass="pnlBrdr">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-top: 3px;">
                            <tbody>
                                <tr>
                                    <td>
                                        <a id="A3" class="AdminButton Office2010Silver rbSkinnedButton" href="javascript:void(0)">
                                            <span class="rbPrimaryIcon dbImg"></span>
                                            <asp:Button ID="btnUpdateGallery" runat="server" Text="Update Gallery Database" OnClick="btnUpdateGallery_Click"
                                                CssClass="rbDecorated rbPrimary" />
                                        </a>&nbsp;&nbsp;
                                        <asp:Label ID="lblUpdated" runat="server" Visible="false" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <asp:GridView ID="gvGalleryFolders" runat="server" Width="100%" AutoGenerateColumns="false"
                            GridLines="Vertical" DataKeyNames="Album" RowStyle-HorizontalAlign="Center" CssClass="grdDeptAdmin"
                            OnRowCommand="gvGalleryFolders_RowCommand">
                            <HeaderStyle CssClass="deptheader bodyboldmediumwhite" />
                            <Columns>
                                <asp:BoundField HeaderText="Sl. No." DataField="S.No" />
                                <asp:BoundField HeaderText="Album" DataField="Album" />
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ImageUrl="~/Documents/Images/Delete.gif" ID="imgBtnDel"
                                            CommandName="deleteFolder" OnClientClick="return confirm('Are you sure you want to delete this album ?');"
                                            CommandArgument='<%#Eval("Album") %>' AlternateText="Delete" ToolTip="Delete album" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="deptBlank">
                                    <img src='<%= ResolveClientUrl("~/Styles/page_images/user_delete.png") %>' alt="noFile" />&nbsp;
                                    There is no folder to show.
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <div class="lblAdmin" align="center">
                            <asp:Label ID="lblDeleteNotice" runat="server" Visible="false" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="clear">
            </div>
            <%--FOOTER--%>
            <site:footer ID="siteFooter" runat="server" />
        </div>
    </div>
    </form>
    <script type="text/javascript" defer="defer" src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Scripts/script.js"></script>
</body>
</html>
