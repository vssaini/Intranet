<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Page_Login"
    MasterPageFile="~/Template/Main.master" %>

<asp:Content ID="contentLogin" runat="server" ContentPlaceHolderID="cphMaster">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="brownLeft">
                </td>
                <td class="brownMiddle">
                    <span class="loginImg" /><span class="padLeft">Login Window on Unauthorized User's Computer</span>
                </td>
                <td class="brownRight">
                </td>
            </tr>
        </tbody>
    </table>
    <div class=" loginGrayBox">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td class="padBottom">
                        <b>Unauthorized Access</b> - You are not authorized user to access the page. Contact IS Administrator for help.
                    </td>
                </tr>
                <tr>
                    <%--Login Page--%>
                    <td width="100%">
                        <table width="70%" align="center" border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td class="iboxLC">
                                    </td>
                                    <td class="iboxTL">
                                    </td>
                                    <td class="iboxRC">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="iboxLL">
                                    </td>
                                    <td align="center">
                                        <div class="iboxBG">
                                            <asp:Login ID="loginAdmin" runat="server" DisplayRememberMe="False" OnAuthenticate="loginAdmin_Authenticate"
                                                CssClass="login">
                                                <LayoutTemplate>
                                                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0">
                                                                    <tr align="left">
                                                                        <td class="lblSize">
                                                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                                        </td>
                                                                        <td class="lftMrgn">
                                                                            <asp:TextBox ID="UserName" runat="server" CssClass="loginUTxt"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="loginAdmin"><img src='<%=ResolveClientUrl("~/Documents/Images/exclamation-red.png")%>' /></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <td class="lblSize">
                                                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                                        </td>
                                                                        <td class="lftMrgn">
                                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="loginPTxt"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="loginAdmin"><img src='<%=ResolveClientUrl("~/Documents/Images/exclamation-red.png")%>' /></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" colspan="2" class="loginFail">
                                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" align="center">
                                                                            <asp:ImageButton ID="LoginButton" runat="server" CommandName="Login" ValidationGroup="loginAdmin"
                                                                                ImageUrl="~/Style/Images/login.png" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </LayoutTemplate>
                                            </asp:Login>
                                        </div>
                                    </td>
                                    <td class="iboxRL">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="iboxBLC">
                                    </td>
                                    <td class="iboxBL">
                                    </td>
                                    <td class="iboxBRC">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
