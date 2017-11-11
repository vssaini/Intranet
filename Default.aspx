<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/Template/Main.master" %>

<%@ Register Src="~/UserControls/HomePage.ascx" TagName="homepage" TagPrefix="site" %>
<asp:Content ID="defaultContent" runat="server" ContentPlaceHolderID="cphMaster">
    <site:homepage ID="homePage" runat="server" />	
</asp:Content>
