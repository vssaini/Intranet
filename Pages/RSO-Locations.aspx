<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="RSO-Locations.aspx.cs" Inherits="Pages_LocationDetails" %>

<%@ Register Src="~/UserControls/UCLocation.ascx" TagName="Location" TagPrefix="gv" %>
<asp:Content ID="contentLocation" ContentPlaceHolderID="cphMaster" runat="Server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>RSO Location Details</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <asp:PlaceHolder ID="phLocation" runat="Server" />
    </div>
    
</asp:Content>
