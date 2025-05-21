<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>회원가입</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:300px; margin:50px auto;">
        <h2>회원가입</h2>
        <asp:Label runat="server" Text="아이디" AssociatedControlID="txtUserId" /><br />
        <asp:TextBox runat="server" ID="txtUserId" /><br /><br />

        <asp:Label runat="server" Text="비밀번호" AssociatedControlID="txtPassword" /><br />
        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" /><br /><br />

        <asp:Label runat="server" Text="학번" AssociatedControlID="txtStudentNo" /><br />
        <asp:TextBox runat="server" ID="txtStudentNo" /><br /><br />

        <asp:Label runat="server" Text="전공" AssociatedControlID="ddlMajor" /><br />
        <asp:DropDownList runat="server" ID="ddlMajor" /><br /><br />


        <asp:Button runat="server" ID="btnRegister" Text="가입하기" OnClick="btnRegister_Click" />
        <asp:Label runat="server" ID="lblMessage" ForeColor="Red" /><br />
        <asp:Button runat="server" ID="btnGoToLogin" Text="로그인 화면으로 이동" 
            PostBackUrl="~/Login.aspx" Visible="false" />
    </div>
    </form>
</body>
</html>