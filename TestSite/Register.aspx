<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
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

        .register-panel {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .register-panel h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .register-panel label {
            font-weight: bold;
        }

        .register-panel input[type="text"],
        .register-panel input[type="password"],
        .register-panel select {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .register-panel input[type="submit"],
        .register-panel input[type="button"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .register-panel input[type="submit"]:hover,
        .register-panel input[type="button"]:hover {
            background-color: darkblue;
        }

        .message {
            color: red;
            font-size: 13px;
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-panel">
            <h2>회원가입</h2>

            <asp:Label runat="server" Text="아이디" AssociatedControlID="txtUserId" /><br />
            <asp:TextBox runat="server" ID="txtUserId" /><br />

            <asp:Label runat="server" Text="비밀번호" AssociatedControlID="txtPassword" /><br />
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" /><br />

            <asp:Label runat="server" Text="학번" AssociatedControlID="txtStudentNo" /><br />
            <asp:TextBox runat="server" ID="txtStudentNo" /><br />

            <asp:Label runat="server" Text="전공" AssociatedControlID="ddlMajor" /><br />
            <asp:DropDownList runat="server" ID="ddlMajor" /><br />

            <asp:Button runat="server" ID="btnRegister" Text="가입하기" OnClick="btnRegister_Click" /><br />

            <asp:Label runat="server" ID="lblMessage" CssClass="message" /><br />

            <asp:Button runat="server" ID="btnGoToLogin" Text="로그인 화면으로 이동"
                PostBackUrl="~/Login.aspx" Visible="false" />
        </div>
    </form>
</body>
</html>
