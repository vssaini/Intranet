<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Department.master" AutoEventWireup="true"
    CodeFile="XcelViewer.aspx.cs" Inherits="Pages_Department_Common_XcelViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <table>
        <tr>
            <td>
                <b>Export excel file:</b> in excel 2003 format
            </td>
            <td>
                <asp:ImageButton ID="btnExport" runat="server" ImageUrl="~/Documents/Images/bt_export_excel.gif"
                    ToolTip="Export" OnClick="btnExport_Click" />
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="phContainer" EnableViewState="true" runat="server" />
    <div style="padding-top: 7px; color: Green;">
        <asp:Label ID="lblSheet" runat="server">            
        </asp:Label>
    </div>
    <center>
        <iframe id="excelFrame" runat="server" class="xframe" frameborder="0" scrolling="auto"
            height="450px" width="100%" />
    </center>
</asp:Content>
