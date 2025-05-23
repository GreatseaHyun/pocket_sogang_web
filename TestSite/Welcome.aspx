<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>환영합니다</title>
    <style>
    body {
        background-image: url('images/login_bg.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px; margin:50px auto; text-align:center;">
            <h2>환영합니다, <%= Session["UserId"] %>님!</h2>
            <asp:Button runat="server" ID="btnStartChatbot" Text="서강챗봇 시작"
                        PostBackUrl="~/Chatbot.aspx" />
            <p/>
            <asp:Button ID="btnGoToPetitions" runat="server" Text="학생청원 보기"
                        PostBackUrl="~/PetitionAll.aspx" />

        </div>
    </form>
</body>
</html>