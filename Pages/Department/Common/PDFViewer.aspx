<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Department.master" AutoEventWireup="true"
    CodeFile="PDFViewer.aspx.cs" Inherits="Pages_Department_Common_PDFViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
     <iframe id="pdfFrame" runat="server" class="iframe" frameborder="0" scrolling="auto"
            height="450px" width="100%"></iframe>
</asp:Content>
