<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rajasthan State Office - Intranet(File Not Found)</title>
    <link href="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Error/error.css" type="text/css"
        rel="Stylesheet" />
    <link rel="shortcut icon" href="<%=VirtualPathUtility.ToAbsolute("~")%>/favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <div class="header">
            <div class="heading">
                Rajasthan State Office - Intranet
            </div>
        </div>
        <div class="body">
            <p id="errorHeading">
                Resource/File Removed</p>
            <p id="errorText">
                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Error/document_error.png"
                    alt="error" />&nbsp;The requested document not found.</p>
            <p>
                <b>Most likely causes:</b></p>
            <ul>
                <li>The resource you are looking for (or one of its dependencies) could have been removed,
                    had its name changed, or is temporarily unavailable. Please review the following
                    URL and make sure that it is spelled correctly.</li></ul>
            <p>
                What you can try:</p>
            <b><i>Back to Home:</i></b> <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Default.aspx">
                Rajasthan State Office - Intranet</a>
        </div>
        <hr />
        <div id="center">
            <div class="advertisement">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
