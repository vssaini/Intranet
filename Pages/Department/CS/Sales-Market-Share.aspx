<%@ Page Language="C#" MasterPageFile="~/Template/Department.master" AutoEventWireup="true"
    CodeFile="Sales-Market-Share.aspx.cs" Inherits="Pages_Department_CS_Sales_Market_Share" %>

<asp:Content ID="contentSMS" ContentPlaceHolderID="cphMaster" runat="Server">
<b>Select year to view Market Share:</b>
    <asp:DropDownList ID="ddlYears" runat="server" AutoPostBack="true" 
        onselectedindexchanged="ddlYears_SelectedIndexChanged">
        <asp:ListItem Text="2007-2008" />
        <asp:ListItem Text="2008-2009" />
        <asp:ListItem Text="2009-2010" />
    </asp:DropDownList>
    <br /><br />
    <asp:Image ID="imgShare" runat="server" Height="100%" Width="100%" />
</asp:Content>
