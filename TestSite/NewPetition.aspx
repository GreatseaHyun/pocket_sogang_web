<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewPetition.aspx.cs" Inherits="NewPetition" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>청원 작성</title>
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

        .petition-panel {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            width: 600px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .petition-panel h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .petition-panel input[type="text"],
        .petition-panel textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .petition-panel input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        .petition-panel input[type="submit"]:hover {
            background-color: darkblue;
        }

        .footer-button {
            position: fixed;
            bottom: 20px;
            left: 0;
            width: 100%;
            text-align: center;
            z-index: 999;
        }

        .footer-button input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .footer-button input[type="submit"]:hover {
            background-color: darkblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="petition-panel">
            <h2>청원 작성</h2>

            <asp:Label runat="server" Text="제목" /><br />
            <asp:TextBox runat="server" ID="txtTitle" /><br />

            <asp:Label runat="server" Text="내용" /><br />
            <asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine" Rows="10" /><br />

            <asp:Button runat="server" ID="btnSubmit" Text="등록" CssClass="btn" OnClick="btnSubmit_Click" /><br /><br />
            <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />
        </div>

        <div class="footer-button">
            <asp:Button ID="btnToAllPetitions" runat="server" Text="전체 청원 보기" PostBackUrl="~/PetitionAll.aspx" />
        </div>
    </form>
</body>
</html>
