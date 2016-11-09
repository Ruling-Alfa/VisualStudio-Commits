<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CachingEg2.aspx.cs" Inherits="CachingEg2" %>
<%@ OutputCache Duration="10" VaryByControl="DropDownList1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>a</asp:ListItem>
            <asp:ListItem>b</asp:ListItem>
            <asp:ListItem>c</asp:ListItem>
            <asp:ListItem>d</asp:ListItem>
        </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" 
            onselectedindexchanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>p</asp:ListItem>
            <asp:ListItem>q</asp:ListItem>
            <asp:ListItem>r</asp:ListItem>
            <asp:ListItem>s</asp:ListItem>
            <asp:ListItem>t</asp:ListItem>
            <asp:ListItem>u</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div style="margin-left: 80px">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
