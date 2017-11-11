<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Rajasthan State Office - Intranet (Error Reporting Page)</title>
    <link href="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Error/error.css" type="text/css" rel="Stylesheet" />
    <link rel="shortcut icon" href="<%=VirtualPathUtility.ToAbsolute("~")%>/favicon.ico"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <div class="header">
            <div class="heading">
                Rajasthan State Office - Intranet</div>
        </div>
        <div class="body">
            <p id="errorHeading">
                Oops! Unhandled Error...</p>
            <p id="errorText">
                Rajasthan State Office Website reported serious error. We are sorry for inconvenience
                caused to you. We have logged all details about error. However we recommends you
                to let us know what you were doing & what caused error;  so that we can test same
                error on our system. We would try to resolve problem within time span of 24 hours.
            </p>
            <b><i>Back to Home:</i></b> <a href="<%=VirtualPathUtility.ToAbsolute("~")%>/Default.aspx">Rajasthan State Office - Intranet</a>
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
