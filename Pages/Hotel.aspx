<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hotel.aspx.cs" Inherits="Pages_Hotel"
    MasterPageFile="~/Template/Main.master" %>

<%@ Register Src="~/UserControls/UCHotels.ascx" TagName="Hotel" TagPrefix="gv" %>
<asp:Content ID="contentHotel" runat="server" ContentPlaceHolderID="cphMaster">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>Nominated Hotels</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <asp:PlaceHolder ID="phHotel" runat="server"></asp:PlaceHolder>
    </div>
</asp:Content>
