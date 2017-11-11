<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Admin-SideMenu.ascx.cs"
    Inherits="UserControls_UC_Admin_SideMenu " %>
<%@ OutputCache Duration="60" VaryByParam="None" %>
<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="adminLeft">
                </td>
                <td class="adminMiddle">
                    <center>
                        Admin Control Panel</center>
                </td>
                <td class="adminRight">
                </td>
            </tr>
        </tbody>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" class="deptMenu adminMenu_Green adminMenuBg"
        width="100%">
        <tr>
            <td>
                <div style="height: 375px;">
                    <ul class="rmRootGroup rmVertical">
                        <li class="rmItem rmFirst"><a id="AD" title="Update AD User's Database" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=AD"
                            class="rmLink"><span class="rmText ">Update A.D. Users</span></a> </li>
                        <li class="rmItem rmFirst"><a id="Files" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Files"
                            title="Check files uploaded by Admin" class="rmLink"><span class="rmText ">Admin's Activites</span></a></li>
                        <li class="rmItem rmFirst"><a id="Announce" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Announce"
                            title="Set announcement for Employees" class="rmLink"><span class="rmText ">Announcement</span></a></li>
                        <li class="rmItem rmFirst"><a id="Dashboard" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Dashboard"
                            title="Dashboard" class="rmLink"><span class="rmText ">Dashboard</span></a></li>
                        <li class="rmItem rmFirst"><a id="DeptAdmin" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=DeptAdmin"
                            title="Set Administrator for respective Department" class="rmLink"><span class="rmText ">
                                Department Admin</span></a></li>
                        <li class="rmItem rmFirst"><a id="Form" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Form"
                            title="Edit intranet details" class="rmLink"><span class="rmText ">Edit Intranet</span></a></li>
                        <li class="rmItem rmFirst"><a id="Gallery" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Gallery"
                            title="Maange gallery details" class="rmLink"><span class="rmText ">Manage Gallery</span></a></li>
                        <li class="rmItem rmFirst"><a id="Error" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Error"
                            title="View errors occured in website" class="rmLink"><span class="rmText ">Website
                                Errors</span></a></li>
                        <li class="rmItem rmLast"><a id="Hits" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Admin/ISAdmin.aspx?lnk=Hits"
                            title="Check your site popularity" class="rmLink"><span class="rmText ">Website Hits</span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</div>
