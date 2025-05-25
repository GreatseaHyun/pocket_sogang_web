<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
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
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .welcome-panel {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .welcome-panel h2 {
            margin-bottom: 25px;
            color: #333;
        }

        .welcome-panel input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
        }

        .welcome-panel input[type="submit"]:hover {
            background-color: darkblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="welcome-panel">
            <h2>환영합니다, <%= Session["UserId"] %>님!</h2>
            <asp:Button runat="server" ID="btnStartChatbot" Text="서강챗봇 시작"
                        PostBackUrl="~/Chatbot.aspx" /><br />
            <asp:Button ID="btnGoToPetitions" runat="server" Text="학생청원 보기"
                        PostBackUrl="~/PetitionAll.aspx" />
        </div>
    </form>
</body>
</html>
