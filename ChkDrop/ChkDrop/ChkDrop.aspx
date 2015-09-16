<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChkDrop.aspx.cs" Inherits="ChkDrop.ChkDrop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery-1.11.3.js" />
            <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.4.js" />
            <asp:ScriptReference Path="~/Scripts/bootstrap.js" />
        </Scripts>
        </asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
