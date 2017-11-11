<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCLocation.ascx.cs" Inherits="GridUserControll" %>
<center>
    <div class="bgYellow" style="width: 30%">
        <asp:Label ID="lblLocation" runat="server" />
    </div>
</center>
<%--GridView--%>
<asp:GridView ID="gvLocation" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
    BorderWidth="1" BorderColor="Gray" Width="100%">
    <HeaderStyle CssClass="grdHeader" />
    <RowStyle CssClass="grdRow" />
    <Columns>
        <asp:BoundField HeaderText="Location" DataField="Location" />
    </Columns>
    <Columns>
        <asp:BoundField HeaderText="Address" DataField="Address" />
    </Columns>
</asp:GridView>
<br />
