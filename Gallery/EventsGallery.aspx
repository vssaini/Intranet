<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EventsGallery.aspx.cs" Inherits="Gallery_EventsGallery" %>

<%@ Register Src="~/UserControls/Header.ascx" TagName="header" TagPrefix="site" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagName="footer" TagPrefix="site" %>
<%@ Register Src="~/UserControls/Horizontal-Menu.ascx" TagName="horizontal" TagPrefix="menu" %>
<%@ Register Src="~/UserControls/EventsGallery.ascx" TagName="gallery" TagPrefix="event" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rajasthan State Office - Intranet</title>
    <link rel="Stylesheet" href="../Style/General.css" type="text/css" />
    <link rel="Stylesheet" href="../Style/DeptMenu/dmenu.css" type="text/css" />
    <link rel="stylesheet" href="../Gallery/SilverlightNotFound/css/slInstall.css"
        type="text/css" />
    <link rel="stylesheet" href="../Gallery/SilverlightNotFound/css/slInstallWide.css"
        type="text/css" />
    <link rel="Shortcut Icon" href="../favicon.ico" />
</head>
<body onload="startclock(); startType(100, 'txtDestination');">
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
            <div class="adminBox">
                <event:gallery ID="Gallery1" runat="server" />
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
