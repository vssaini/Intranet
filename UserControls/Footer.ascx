<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="UserControls_Footer" %>
<div id="footer">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td align="left" width="30%">
                    <center>
                        <a href="">Geography</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/RSO-Glance.aspx">
                            RSO at Glance</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Pages/RSO-Locations.aspx">
                                RSO Locations</a></center>
                </td>
                <td align="center" width="49%">
                    &#169; 2011-2012 Rajasthan State Office (IS Department). All rights reserved.<br />
                    <span class="footInfo">(Best viewed in Mozilla Firefox 3.6 & IE 7.0 with screen resolution
                        1024 x 768)</span>
                </td>
                <td align="right" width="25%">
                    <center>
                        No. of Users Online:
                        <%= Application["OnlineUsers"].ToString() %><br />
                    </center>
                </td>
            </tr>
        </tbody>
    </table>
</div>
