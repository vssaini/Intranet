<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="ViewerPDF.aspx.cs" Inherits="Pages_ViewerPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>
                        <asp:Label ID="lblFileName" runat="server" /></span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <iframe id="pdfFrame" runat="server" class="iframe" frameborder="0" scrolling="auto"
            height="450px" width="100%"></iframe>
    </div>
</asp:Content>
