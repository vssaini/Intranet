<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="DistCalculator.aspx.cs" Inherits="Pages_DistanceCalculator" %>

<asp:Content ID="DistanceL2M" ContentPlaceHolderID="cphMaster" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="blueLeft">
                </td>
                <td class="blueMiddle">
                    <span>Distance Calculator</span>
                </td>
                <td class="blueRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grayBox">
        <div id="dvUpload" class="acl Information">
            By <b>L</b>ocation to Market</div>
        <div class="deptUpl">
            <center>
                <table style="width: 90%">
                    <tr>
                        <td style="font-family: Calibri;">
                            <label>
                                <b>F</b>rom:</label>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="ddlBegin" runat="server" AutoPostBack="True" CssClass="ddlStyle"
                                OnSelectedIndexChanged="ddlBegin_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <label>
                                <b>T</b>o:</label>&nbsp;&nbsp;
                            <asp:DropDownList ID="ddlDestination" runat="server" Enabled="false" CssClass="ddlStyle"
                                AutoPostBack="True" OnSelectedIndexChanged="ddlDestination_SelectedIndexChanged">
                                <asp:ListItem>--Select Destination--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblResult" runat="Server" CssClass="fontNormal" />
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <div id="dvDelete" class="acdl Information">
            By <b>G</b>eographical Locations</div>
        <div class="deptUpl">
            <center class="fontNormal">
                This portion is under development</center>
        </div>
    </div>
</asp:Content>
