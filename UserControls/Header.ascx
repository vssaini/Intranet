<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="UserControls_Header" %>
<table class="logotable" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <td style="padding-top: 5px;" align="left" valign="top" width="3%">
                <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Default.aspx">
                    <img class="imgNoBorder" src="<%=VirtualPathUtility.ToAbsolute("~")%>/Documents/Images/Logo/iocLogo.jpg"
                        alt="" height="65" /></a>
            </td>
            <td style="padding-top: 5px;" align="left" valign="middle" width="10%">
                <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Default.aspx">
                    <img class="imgNoBorder" src="<%=VirtualPathUtility.ToAbsolute("~")%>/Documents/Images/Logo/rsoLogo.bmp"
                        alt="Rajasthan State Office" /></a>
            </td>
            <td align="center" class="intranet" width="15%">
                Intranet
            </td>
            <td class="anch" align="right" valign="top" height="22" width="70%">
                <span style="color: #3399FF;">
                    <asp:Label ID="lblEmployee" runat="server" /></span> | <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/AboutUs.aspx">
                        About Us</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Intercom.aspx">Intercom</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Help.aspx">Help</a>
                <div style="padding-top: 8px;">
                    <asp:Label ID="lblSelectLanguage" runat="server" Text="Select site version:" />
                    <asp:RadioButtonList ID="rbLanguage" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                        RepeatLayout="Flow">
                        <asp:ListItem Text="English" Selected="True" />
                        <asp:ListItem Text="Hindi" Enabled="false" />
                    </asp:RadioButtonList>
                </div>
                <div class="time">
                    <asp:Label ID="lblDate" runat="server" />
                    <label id="lblTime">
                        10:10:10 AM
                    </label>
                </div>
            </td>
        </tr>
    </tbody>
</table>
