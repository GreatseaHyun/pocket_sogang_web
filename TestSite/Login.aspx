<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>로그인</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:300px; margin:50px auto;">
        <h2>로그인</h2>

        <asp:Label runat="server" Text="아이디" /><br />
        <asp:TextBox runat="server" ID="txtUserId" /><br /><br />

        <asp:Label runat="server" Text="비밀번호" /><br />
        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" /><br /><br />

        <asp:Button runat="server" ID="btnLogin" Text="로그인" OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />
    </div>
    </form>
</body>
</html>

