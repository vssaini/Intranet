<%@ Page Language="C#" MasterPageFile="~/Template/Department.master" AutoEventWireup="true"
    CodeFile="Circulars.aspx.cs" Inherits="Pages_Department_Engineering_Circulars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <b>Select category to view Circulars:</b>
    <asp:DropDownList ID="ddlCirculars" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCirculars_SelectedIndexChanged">
        <asp:ListItem Text="29.06.2009 to 26.04.2010" />
        <asp:ListItem Text="23.10.2008 to 29.06.2009" />
        <asp:ListItem Text="Till 23.10.2008" />
    </asp:DropDownList>
    <br />
    <br />
    <div class="pdfLabel">
        <asp:Label ID="lblInfo" runat="server" />
    </div>
    <iframe id="pdfFrame" runat="server" style="background-color: transparent; z-index: -10;"
        allowtransparency="true" border="0" frameborder="0" scrolling="auto" height="450px"
        width="100%"></iframe>
</asp:Content>
