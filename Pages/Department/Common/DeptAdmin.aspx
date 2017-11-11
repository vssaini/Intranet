<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Department.master" AutoEventWireup="true"
    CodeFile="DeptAdmin.aspx.cs" Inherits="Pages_Department_Common_DeptAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <div id="dvUpload" class="Img Information">
        <u>U</u>pload files from here</div>
    <div class="deptUpl">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-top: 3px;">
            <tbody>
                <tr>
                    <td width="18%">
                        <label>
                            Select a file to upload:</label>&nbsp;
                    </td>
                    <td>
                        <asp:FileUpload ID="fileUploader" runat="server" CssClass="file" Width="350" size="50" />&nbsp;&nbsp;<asp:Label
                            ID="lblMessage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            Set file title:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFileName" runat="server" CssClass="txtfile" MaxLength="60" Height="15"
                            Width="260" size="50" />
                        <a id="btnIcon" class="AdminButton Office2010Silver rbSkinnedButton" href="javascript:void(0)">
                            <span class="rbPrimaryIcon upImg"></span>
                            <asp:Button ID="btnFileUpload" runat="server" Text="Upload File" CssClass="rbDecorated rbPrimary"
                                OnClick="btnFileUpload_Click" />
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="uplFile">
        <asp:Label ID="lblFileUploaded" runat="server" />
    </div>
    <div id="dvDelete" class="Img Information">
        <u>D</u>elete uploaded files from here</div>
    <div class="deptUpl">
        <asp:AccessDataSource ID="adsFiles" runat="server" DataFile="~/App_Data/Intranet.mdb" />
        <asp:GridView ID="gvUploadedFiles" runat="server" CssClass="grid" AutoGenerateColumns="false"
            Width="100%" DataSourceID="adsFiles" GridLines="Vertical" AllowPaging="true"
            PageSize="15" DataKeyNames="Files" OnRowCommand="gvUploadedFiles_RowCommand"
            OnDataBound="gvUploadedFiles_DataBound" OnRowDataBound="gvUploadedFiles_RowDataBound"
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
                <asp:BoundField HeaderText="Size" DataField="Size" />
                <asp:BoundField HeaderText="Uploaded On" DataField="UDate" DataFormatString="{0:dd MMMM yyyy}" />
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/Documents/Images/Delete.gif" ID="imgBtnDel"
                            CommandName="deleteFile" OnClientClick="return confirm('Are you sure you want to delete this file ?');"
                            CommandArgument='<%#Eval("Files")%>' ToolTip='Delete File' AlternateText="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div style="padding-left: 5px;">
                    <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Documents/Images/nofile.png" alt="noFile" />&nbsp;
                    No file available for deleting. First upload files...
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
        <br />
        <div class="lblAdmin" align="center">
            <asp:Label ID="lblDeleteStatus" runat="server" Visible="false" />
        </div>
    </div>
</asp:Content>
