<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hospital.aspx.cs" Inherits="Pages_Hospital"
    MasterPageFile="~/Template/Main.master" %>

<asp:Content ID="contentHospital" runat="server" ContentPlaceHolderID="cphMaster">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>Nominated Hospitals</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <asp:AccessDataSource ID="adsHospital" runat="server" SelectCommand="SELECT * FROM Hospital"
            DataFile="~/App_Data/Intranet.mdb" />
        <asp:GridView ID="gvHospital" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
            BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="adsHospital" RowStyle-HorizontalAlign="Center">
            <HeaderStyle CssClass="grdHeader" />
            <RowStyle CssClass="grdRow" />
            <Columns>
                <asp:BoundField HeaderText="Hospital Name" DataField="Hospital" />
            </Columns>
            <Columns>
                <asp:BoundField HeaderText="Address" DataField="Address" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
