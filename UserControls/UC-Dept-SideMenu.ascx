<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC-Dept-SideMenu.ascx.cs"
    Inherits="UserControls_UC_Dept_SideMenul" %>
<div class="deptMenuBg" align="center">
    <div class="deptHeader">
        Department Menu
    </div>
    <div class="deptMenu deptMenu_Office2007">
        <ul class="rmRootGroup rmVertical">
            <li class="rmItem rmFirst">
                <asp:HyperLink ID="hlHome" CssClass="rmLink" runat="server"><span class="rmText "><u>H</u>ome</span></asp:HyperLink>
            </li>
            <li class="rmItem rmFirst">
                <asp:HyperLink ID="hlOrganogram" CssClass="rmLink" runat="server"><span class="rmText "><u>O</u>rganogram</span></asp:HyperLink>
            </li>
            <li class="rmItem rmFirst"><a id="upload" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/UploadedFiles.aspx"
                class="rmLink"><span class="rmText "><u>U</u>ploaded Files</span></a></li>
            <li class="rmItem rmLast"><a id="admin" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/DeptAdmin.aspx"
                class="rmLink"><span class="rmText "><u>A</u>dmin Space</span></a> </li>
            <asp:PlaceHolder ID="phInformation" runat="server" Visible="false">
                <li class="rmItem rmLast"><a id="software" href="#" class="rmLink"><span class="rmText ">
                    <u>S</u>oftware</span></a> </li>
                <li class="rmItem rmLast"><a id="tips" href="#" class="rmLink"><span class="rmText ">
                    <u>T</u>ips & Tricks</span></a> </li>
                <li class="rmItem rmLast"><a id="cpolicy" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/IS/IT Policy.pdf&menu=cpolicy"
                    class="rmLink"><span class="rmText "><u>C</u>orporate IT Policy</span></a> </li>
                <li class="rmItem rmLast"><a id="csecurity" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/IS/IT Security Guidelines.pdf&menu=csecurity"
                    class="rmLink"><span class="rmText "><u>C</u>orporate IT Security</span></a>
                </li>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phConsumer" runat="server" Visible="false">
                <li class="rmItem rmLast"><a id="sms" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/CS/Sales-Market-Share.aspx"
                    class="rmLink"><span class="rmText "><u>S</u>ales & Market Share</span></a>
                </li>
                <li class="rmItem rmLast"><a id="dus" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/ImageViewer.aspx?fileName=~/Documents/Department/Consumer Sales/DefenceSales.bmp&menu=dus"
                    class="rmLink"><span class="rmText "><u>D</u>efence Unit Sales</span></a> </li>
                <li class="rmItem rmLast"><a id="rus" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/ImageViewer.aspx?fileName=~/Documents/Department/Consumer Sales/BorderSales.bmp&menu=rus"
                    class="rmLink"><span class="rmText "><u>B</u>order Road Unit Sales </span></a>
                </li>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phEngineering" runat="server" Visible="false">
                <li class="rmItem rmLast"><a id="circular" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Engineering/Circulars.aspx"
                    class="rmLink"><span class="rmText "><u>C</u>irculars</span></a> </li>
                <li class="rmItem rmLast"><a href="http://10.212.64.100/infoshare/engg/engg.asp"
                    class="rmLink"><span class="rmText "><u>P</u>LCAL </span></a></li>
                <li class="rmItem rmLast"><a id="emanual" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Department/Engineering/Manual Volume 5.pdf&menu=emanual"
                    class="rmLink"><span class="rmText "><u>E</u>ngineering Manual </span></a></li>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phPPES" runat="server" Visible="false">
                <li class="rmItem rmLast"><a id="rsp" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/XcelViewer.aspx?xcelFile=~/Documents/Highlights/RSP of MS and HSD.xls&menu=rsp"
                    class="rmLink"><span class="rmText "><u>R</u>SP of MS/HSD</span></a> </li>
                <li class="rmItem rmLast"><a id="sales" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/XcelViewer.aspx?xcelFile=~/Documents/Highlights/Sales and Marketing Monthwise.xls&menu=sales"
                    class="rmLink"><span class="rmText "><u>S</u>ales-Marketing Monthwise </span></a>
                </li>
                <li class="rmItem rmLast"><a id="marketing" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Department/Common/PDFViewer.aspx?fileName=~/Documents/Highlights/MD Performance 2010-11.pdf&menu=marketing"
                    class="rmLink"><span class="rmText "><u>M</u>arketing Performance </span></a>
                </li>
            </asp:PlaceHolder>
        </ul>
    </div>
    <asp:Image ID="imgDept" runat="server" Style="position: relative; top: 140px;" />
</div>
