<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GuestHouse.aspx.cs" Inherits="Pages_GuestHouse"
    MasterPageFile="~/Template/Main.master" %>

<asp:Content ID="contentGuestHouse" runat="server" ContentPlaceHolderID="cphMaster">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>Guest Houses</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <asp:AccessDataSource ID="adsGuestHouse" runat="server" SelectCommand="SELECT * FROM GuestHouse"
            DataFile="~/App_Data/Intranet.mdb" />
        <asp:GridView ID="gvGuestHouse" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
            BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="adsGuestHouse"
            GridLines="Vertical">
            <HeaderStyle CssClass="gvheader" />
            <RowStyle CssClass="gvRow" />
            <Columns>
                <asp:BoundField HeaderText="Guest House" DataField="GuestHouse" />
            </Columns>
            <Columns>
                <asp:BoundField HeaderText="Address" DataField="Address" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
