<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forms.aspx.cs" Inherits="Pages_Forms"
    MasterPageFile="~/Template/Main.master" %>

<asp:Content ID="contentForms" runat="server" ContentPlaceHolderID="cphMaster">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>Download Forms</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox" style="font-size:9.3pt">
        <asp:AccessDataSource ID="adsForms" runat="server" SelectCommand="SELECT * FROM OfficeForms ORDER BY Forms"
            DeleteCommand="DELETE FROM OfficeForms WHERE Forms=@forms" DataFile="~/App_Data/Intranet.mdb" />
        <asp:GridView ID="gvForms" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
            BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="adsForms" GridLines="Vertical"
            AllowPaging="true" PageSize="15" DataKeyNames="Forms" OnDataBound="gvForms_DataBound"
            OnRowDataBound="gvForms_RowDataBound" RowStyle-HorizontalAlign="Center">
            <HeaderStyle CssClass="gvheader" />
            <RowStyle CssClass="gvRow" />
            <PagerStyle HorizontalAlign="Center" CssClass="pager" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="Forms,Format" DataNavigateUrlFormatString="~/Upload/Department/InformationSystem/Forms/{0}.{1}"
                    DataTextField="Forms" HeaderText="Documents" Target="_blank" />
            </Columns>
            <Columns>
                <asp:BoundField HeaderText="Format" DataField="Format" Visible="false" />
                <asp:TemplateField HeaderText="Format">
                    <ItemTemplate>
                        <asp:Image ID="imgFormat" runat="server" /></ItemTemplate>
                </asp:TemplateField>
            </Columns>
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
    </div>
</asp:Content>
