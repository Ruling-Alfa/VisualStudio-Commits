<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FragmentCaching.aspx.cs" Inherits="FragmentCaching" %>
<%@ Register TagPrefix="alfa"  TagName="TimePlz" Src="~/MyCustomControl.ascx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Refresh Page To See the Fragment Caching<br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <alfa:TimePlz runat="server"/>
    </div>
    </form>
</body>
</html>
