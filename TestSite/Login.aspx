<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Pocket Sogang</title>
    <meta charset="UTF-8" />
    <style>
        body {
            background-image: url('images/login_bg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-panel {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 10px;
            width: 320px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .login-panel h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-panel input[type="text"],
        .login-panel input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .login-panel input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        .login-panel input[type="submit"]:hover {
            background-color: darkblue;
        }

        .message {
            margin-top: 10px;
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-panel">
            <h2>로그인</h2>
            <asp:TextBox ID="txtUserId" runat="server" placeholder="아이디" /><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="비밀번호" /><br />
            <asp:Button ID="btnLogin" runat="server" Text="로그인" OnClick="btnLogin_Click" /><br />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
