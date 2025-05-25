<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetitionRead.aspx.cs" Inherits="PetitionRead" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>청원 상세보기</title>
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

        .petition-detail-panel {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            width: 700px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .petition-detail-panel h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .petition-detail-panel p {
            font-size: 15px;
            line-height: 1.6;
        }

        .petition-detail-panel input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }

        .petition-detail-panel input[type="submit"]:hover {
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
        <div class="petition-detail-panel">
            <h2><asp:Label ID="lblTitle" runat="server" /></h2>
            <p><asp:Label ID="lblContent" runat="server" /></p>
            <p>
                <b>공감:</b> <asp:Label ID="lblAgree" runat="server" /> &nbsp;&nbsp;
                <b>비공감:</b> <asp:Label ID="lblDisagree" runat="server" />
            </p>
            <asp:Button ID="btnAgree" runat="server" Text="공감하기" OnClick="btnAgree_Click" />
            <asp:Button ID="btnDisagree" runat="server" Text="비공감하기" OnClick="btnDisagree_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>

        <div class="footer-button">
            <asp:Button ID="btnToAllPetitions" runat="server" Text="전체 청원 보기" PostBackUrl="~/PetitionAll.aspx" />
        </div>
    </form>
</body>
</html>
