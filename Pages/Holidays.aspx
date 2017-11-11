<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Holidays.aspx.cs" Inherits="Pages_Holidays"
    MasterPageFile="~/Template/Main.master" %>

<asp:Content ID="contentHolidays" runat="server" ContentPlaceHolderID="cphMaster">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>
                        <asp:Label ID="lblHoliday" runat="server" /></span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <asp:Panel ID="pnlNorthern" runat="server" Visible="false">
            <div class="bgBlack">
                <label>
                    Select holiday year:</label>&nbsp;<asp:DropDownList Font-Names="Consolas" ID="ddlYear"
                        runat="server" />
                &nbsp;<a id="A1" class="AdminButton Office2010Silver rbSkinnedButton" href="javascript:void(0)">
                    <span class="rbPrimaryIcon holiImg"></span>
                    <asp:Button ID="btnGo" runat="server" Text="Show Holidays" CssClass="rbDecorated rbPrimary"
                        OnClick="btnGo_Click" />
                </a>
            </div>
            <center class="bgYellow">
                Terminals, LPG Plants, AFS's Closed Holidays for the Year
                <asp:Label ID="lblTCHYear" runat="server" />
            </center>
            <asp:AccessDataSource ID="rsoTerHoliday" runat="server" DataFile="~/App_Data/Intranet.mdb" />
            <asp:GridView ID="gvRsoTermHoliday" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
                BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="rsoTerHoliday"
                RowStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="gvheader" />
                <RowStyle CssClass="rows" />
                <AlternatingRowStyle CssClass="alts" />
                <Columns>
                    <asp:BoundField DataField="Holiday" HeaderText="Name of Holiday" />
                    <asp:BoundField DataField="HDate" HeaderText="Date" DataFormatString="{0:dd MMMM}" />
                    <asp:BoundField DataField="WeekDay" HeaderText="Day of Week" />
                </Columns>
            </asp:GridView>
            <br />
            <center class="bgYellow">
                RSO, DO, AO, Marketing Coordination's Closed Holidays for the Year
                <asp:Label ID="lblCHYear" runat="server" />
            </center>
            <asp:AccessDataSource ID="rsoCloseHoliday" runat="server" DataFile="~/App_Data/Intranet.mdb" />
            <asp:GridView ID="gvRsoCloseHoliday" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
                BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="rsoCloseHoliday"
                AlternatingRowStyle-CssClass="alts" RowStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="gvheader" />
                <RowStyle CssClass="rows" />
                <Columns>
                    <asp:BoundField DataField="Holiday" HeaderText="Name of Holiday" />
                    <asp:BoundField DataField="HDate" HeaderText="Date" DataFormatString="{0:dd MMMM}" />
                    <asp:BoundField DataField="WeekDay" HeaderText="Day of Week" />
                </Columns>
            </asp:GridView>
            <br />
            <center class="bgYellow">
                RSO, DO, AO, Marketing Coordination's Restricted Holidays for the Year
                <asp:Label ID="lblRHYear" runat="server" />
            </center>
            <asp:AccessDataSource ID="rsoRestHoliday" runat="server" DataFile="~/App_Data/Intranet.mdb" />
            <asp:GridView ID="gvRsoRestHoliday" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
                BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="rsoRestHoliday"
                AlternatingRowStyle-CssClass="alts" RowStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="gvheader" />
                <RowStyle CssClass="rows" />
                <Columns>
                    <asp:BoundField DataField="Holiday" HeaderText="Name of Holiday" />
                    <asp:BoundField DataField="HDate" HeaderText="Date" DataFormatString="{0:dd MMMM}" />
                    <asp:BoundField DataField="WeekDay" HeaderText="Day of Week" />
                </Columns>
            </asp:GridView>
            * Karva Chauth will be observed as Restricted Holiday as and when falls in.
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlCombined" runat="server" Visible="false">
            <div class="bgBlack">
                <label>
                    Select holiday year:</label>&nbsp;
                <asp:DropDownList Font-Names="Consolas" ID="ddlCYear" runat="server" />
                &nbsp;<a id="A2" class="AdminButton Office2010Silver rbSkinnedButton" href="javascript:void(0)">
                    <span class="rbPrimaryIcon holiImg"></span>
                    <asp:Button ID="btnShow" runat="server" Text="Show Holidays" CssClass="rbDecorated rbPrimary"
                        OnClick="btnGo_Click" />
                </a>
            </div>
            <center class="bgYellow">
                All Region's Holidays for the Year
                <asp:Label ID="lblRegH" runat="server" />
            </center>
            <asp:AccessDataSource ID="regionHoliday" runat="server" DataFile="~/App_Data/Intranet.mdb" />
            <asp:GridView ID="gvCommonHoliday" runat="server" AutoGenerateColumns="false" BorderStyle="Solid"
                BorderWidth="1" BorderColor="Gray" Width="100%" DataSourceID="regionHoliday"
                AlternatingRowStyle-CssClass="alts" OnRowDataBound="gvCommonHoliday_RowDataBound"
                RowStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="gvheader" />
                <RowStyle CssClass="rows" />
                <Columns>
                    <asp:BoundField DataField="HolidayName" HeaderText="Name of Holiday" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="HO" Visible="false" />
                    <asp:BoundField DataField="NR" Visible="false" />
                    <asp:BoundField DataField="ER" Visible="false" />
                    <asp:BoundField DataField="SR" Visible="false" />
                    <asp:BoundField DataField="CO" Visible="false" />
                    <asp:TemplateField HeaderText="HO/WR">
                        <ItemTemplate>
                            <asp:Image ID="imgHO" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="NR">
                        <ItemTemplate>
                            <asp:Image ID="imgNR" runat="server" /></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ER">
                        <ItemTemplate>
                            <asp:Image ID="imgER" runat="server" /></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SR">
                        <ItemTemplate>
                            <asp:Image ID="imgSR" runat="server" /></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CO & Ref.Divn.">
                        <ItemTemplate>
                            <asp:Image ID="imgCO" runat="server" /></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </div>
</asp:Content>
