<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="AboutUs.aspx.cs" Inherits="Pages_AboutUs" %>

<asp:Content ID="contentAbout" ContentPlaceHolderID="cphMaster" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>About Us</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <iframe style="background-color: transparent; z-index: -10;" allowtransparency="true"
            border="0" frameborder="0" scrolling="auto" height="450px" width="100%" src="<%=System.Web.VirtualPathUtility.ToAbsolute("~")%>/Documents/About/Indian Oil Corporation.pdf">
        </iframe>
    </div>
</asp:Content>
