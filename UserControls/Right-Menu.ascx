<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Right-Menu.ascx.cs" Inherits="UserControls_Right_Menu" %>
<div class="rightCol ulImage" align="center">
    <ajax:ToolkitScriptManager ID="scriptManager" runat="server" CombineScripts="true" />
    <ajax:Accordion ID="accMenu" HeaderCssClass="header" SelectedIndex="0" ContentCssClass="content"
        HeaderSelectedCssClass="selected" AutoSize="Limit" EnableViewState="true" runat="server"
        CssClass="rmenu" Height="340px" Width="100%">
        <Panes>
            <ajax:AccordionPane ID="ESSManuals" runat="server">
                <Header>
                    <span class="essm">ESS Manuals</span>
                </Header>
                <Content>
                    <ul>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/ESS/Controlling Officer Approval.pdf">
                            Controlling Officer Approval</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/ESS/Leave Encashment.pdf">
                            Leave Encashment</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/ESS/Lumpsum LFA.pdf">
                            Lumpsum LFA</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/ESS/Spectacles Claim.pdf">
                            Spectacles Claim</a></li>
                    </ul>
                </Content>
            </ajax:AccordionPane>
            <ajax:AccordionPane ID="Download" runat="server">
                <Header>
                    <span class="download">Download Forms</span>
                </Header>
                <Content>
                    <ul>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Forms.aspx?index=1">View
                            all forms</a></li>
                    </ul>
                </Content>
            </ajax:AccordionPane>
            <ajax:AccordionPane ID="Telephone" runat="server">
                <Header>
                    <span class="telephone">Telephone Directory</span>
                </Header>
                <Content>
                    <ul>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/All India.pdf&index=2">
                            All India</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/HO Telephone Directory.pdf&index=2">
                            Head Office</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Corporate IS Department.pdf&index=2">
                            Corporate IS</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/NRO - Telephone.pdf&index=2">
                            NRO</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/RSO - Mobile and Intercom.pdf&index=2">
                            RSO</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Ajmer.pdf&index=2">
                            Ajmer</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Chittorgarh.pdf&index=2">
                            Chittorgarh</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Hanumangarh.pdf&index=2">
                            Hanumangarh</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Jaipur.pdf&index=2">
                            Jaipur</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Jhunjhunu.pdf&index=2">
                            Jhunjhunu</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Jodhpur.pdf&index=2">
                            Jodhpur</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Kota.pdf&index=2">
                            Kota</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/ViewerPDF.aspx?fileName=~/Documents/Telephone/Udaipur.pdf&index=2">
                            Udaipur</a></li>
                    </ul>
                </Content>
            </ajax:AccordionPane>
            <ajax:AccordionPane ID="UsefulInfo" runat="server">
                <Header>
                    <span class="information">Useful Information</span>
                </Header>
                <Content>
                    <ul>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Hotel.aspx?index=3">Nominated
                            Hotels</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Hospital.aspx?index=3">Nominated
                            Hospitals</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/GuestHouse.aspx?index=3">
                            Guest House</a></li>
                </Content>
            </ajax:AccordionPane>
            <ajax:AccordionPane ID="Holidays" runat="server">
                <Header>
                    <span class="holiday">Holidays</span>
                </Header>
                <Content>
                    <ul>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Holidays.aspx?type=ALL&index=4">
                            All Region Holidays</a></li>
                        <li><a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/Holidays.aspx?type=RSO&index=4">
                            RSO Holidays</a></li></ul>
                </Content>
            </ajax:AccordionPane>
            <ajax:AccordionPane ID="Distance" runat="server">
                <Header>
                    <span class="distance">Distance Calculator</span>
                </Header>
                <Content>
                    <ul>
                        <li><a href="<%=System.Web.VirtualPathUtility.ToAbsolute("~")%>/Pages/DistCalculator.aspx?index=5">
                            View Distance Calculator</a></li>
                    </ul>
                </Content>
            </ajax:AccordionPane>
            <ajax:AccordionPane ID="IPAddress" runat="server">
                <Header>
                    <span class="ip">Your IP Address</span>
                </Header>
                <Content>
                    <center>
                        IP Address:
                        <%=Request.UserHostAddress %>
                </Content>
            </ajax:AccordionPane>
        </Panes>
    </ajax:Accordion>
</div>
<div class="clear">
</div>
