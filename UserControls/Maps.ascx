<%@ Control Language="C#" ClassName="Maps" %>
<div class="deptMenuBg" align="center">
    <div class="deptHeader">
        Rajasthan Districts
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
        </ul>
    </div>
    <asp:Image ID="imgDept" runat="server" Style="position: relative; top: 140px;" />
</div>
