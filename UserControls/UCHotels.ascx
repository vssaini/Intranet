<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCHotels.ascx.cs" Inherits="UserControls_UCHotels" %>
<center>
    <div class="bgYellow" style="width: 30%">
        <asp:Label ID="lblCity" runat="server" />
    </div>
</center>
<%--GridView--%>
<asp:GridView ID="gvHotel" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
    BorderWidth="1" BorderColor="Gray" Width="100%">
    <HeaderStyle CssClass="grdHeader" />
    <RowStyle CssClass="grdRow" />
    <Columns>
        <asp:BoundField HeaderText="Hotel" DataField="HotelName" />
    </Columns>
    <Columns>
        <asp:BoundField HeaderText="Address" DataField="Address" />
    </Columns>
    <Columns>
        <asp:BoundField HeaderText="Grade" DataField="Grade" />
    </Columns>
    <Columns>
        <asp:BoundField HeaderText="Complimentary Items" DataField="Items" />
    </Columns>
    <Columns>
        <asp:BoundField HeaderText="Phone/Email" DataField="Contact" />
    </Columns>
</asp:GridView>
<br />

