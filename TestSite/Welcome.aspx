<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>환영합니다</title>
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