<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="RSO-Glance.aspx.cs" Inherits="Pages_RSO_Glance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>
                        <asp:Label ID="lblHeader" runat="server" Text="31st August 2010" /></span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <asp:AccessDataSource ID="adsGlance" runat="server" SelectCommand="SELECT * FROM RSO_Glance ORDER BY Particulars"
            DataFile="~/App_Data/Intranet.mdb" />
        <asp:GridView ID="gvForms" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
            BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="adsGlance" GridLines="Vertical"
            AllowPaging="true" PageSize="15" DataKeyNames="Particulars" RowStyle-HorizontalAlign="Center">
            <HeaderStyle CssClass="gvheader" />
            <RowStyle CssClass="gvRow" />
            <PagerStyle HorizontalAlign="Center" CssClass="pager" />
            <Columns>
                <asp:BoundField HeaderText="Particulars" DataField="Particulars" />
                <asp:BoundField HeaderText="In Number" DataField="InNumber" />               
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
