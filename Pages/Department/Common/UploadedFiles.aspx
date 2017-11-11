<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Department.master" AutoEventWireup="true"
    CodeFile="UploadedFiles.aspx.cs" Inherits="Pages_Department_Common_UploadedFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <asp:AccessDataSource ID="adsUploadedFiles" runat="server" DataFile="~/App_Data/Intranet.mdb" />
    <asp:GridView ID="gvUploadedFiles" runat="server" CssClass="grid" AutoGenerateColumns="false" Width="100%" DataSourceID="adsUploadedFiles"
        GridLines="Vertical" AllowPaging="true" PageSize="13" DataKeyNames="Files" OnDataBound="gvUploadedFiles_DataBound" OnRowDataBound="gvUploadedFiles_RowDataBound"
        RowStyle-HorizontalAlign="Center">
        <HeaderStyle CssClass="gvheader" />
        <RowStyle CssClass="gvRow" />
        <PagerStyle HorizontalAlign="Center" CssClass="pager" />
        <EmptyDataRowStyle CssClass="empty" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="Files,Format" DataTextField="Files" HeaderText="Files"
                Target="_blank" />
        </Columns>
        <Columns>
            <asp:BoundField HeaderText="Format" DataField="Format" Visible="false" />
            <asp:TemplateField HeaderText="Format">
                <ItemTemplate>
                    <asp:Image ID="imgFormat" runat="server" /></ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div style="padding-left:5px;" >
                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Documents/Images/nofile.png" alt="noFile"/>&nbsp; No file(s) uploaded by
                Admin. Please visit later...
            </div>
        </EmptyDataTemplate>
        <PagerTemplate>        
            <asp:ImageButton ID="imgFirst" runat="server" ToolTip="First Page" ImageUrl="~/Documents/Images/first.gif"
                CommandArgument="First" CommandName="Page" />
            <asp:ImageButton ID="imgPrevious" runat="server" ToolTip="Previous Page" ImageUrl="~/Documents/Images/previous.gif"
                CommandArgument="Prev" CommandName="Page" />
            Page
            <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged" />
            of
            <asp:Label ID="lblPageCount" runat="server" />
            <asp:ImageButton ID="imgNext" runat="server" ToolTip="Next Page" ImageUrl="~/Documents/Images/next.gif"
                CommandArgument="Next" CommandName="Page" />
            <asp:ImageButton ID="imgLast" runat="server" ToolTip="Last Page" ImageUrl="~/Documents/Images/last.gif"
                CommandArgument="Last" CommandName="Page" />
        </PagerTemplate>
    </asp:GridView>
</asp:Content>
