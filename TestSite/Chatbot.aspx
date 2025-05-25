<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chatbot.aspx.cs" Inherits="Chatbot" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>서강챗봇</title>
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

        .chat-wrapper {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 10px;
            width: 500px;
            height: 600px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
        }

        .chat-header {
            text-align: center;
            font-size: 28px;
            margin-bottom: 10px;
            color: #333;
        }

        .top-answer-box {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 13px;
            color: gray;
            text-align: right;
        }

        .chat-area {
            flex-grow: 1;
            overflow-y: auto;
            padding: 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .user-message {
            align-self: flex-end;
            background-color: darkred;
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
            max-width: 70%;
            word-wrap: break-word;
        }

        .bot-message-container {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            max-width: 80%;
        }

        .bot-message {
            background-color: #f0f0f0;
            color: #333;
            padding: 10px 15px;
            border-radius: 20px;
            word-wrap: break-word;
        }

        .bot-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            object-fit: cover;
        }

        .chat-input {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .chat-input textarea {
            flex-grow: 1;
            padding: 10px;
            font-size: 14px;
            border-radius: 10px;
            border: 1px solid #ccc;
            resize: none;
            height: 60px;
        }

        .chat-input input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .chat-input input[type="submit"]:hover {
            background-color: darkblue;
        }

        .back-button {
            margin-top: 10px;
            text-align: center;
        }

        .back-button input[type="submit"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .back-button input[type="submit"]:hover {
            background-color: darkblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="chat-wrapper">
            <!-- 상단 -->
            <div class="chat-header">서강챗봇</div>

            <!-- 오른쪽 상단 로딩 텍스트 -->
            <div class="top-answer-box">
                
            </div>

            <!-- 채팅 영역 -->
            <div class="chat-area">
                <!-- AI 답변 -->
                <div class="bot-message-container">
                    <img src="images/Alose2.png" class="bot-avatar" alt="Bot Avatar" />
                    <asp:Label ID="lblAnswer" runat="server" Text="" />
                </div>
            </div>

            <!-- 입력 영역 -->
            <div class="chat-input">
                <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Rows="3" placeholder="메시지를 입력하세요..." />
                <asp:Button ID="btnAsk" runat="server" Text="보내기" OnClientClick="showLoading()" OnClick="btnAsk_Click" />
            </div>

            <!-- 메인으로 돌아가기 버튼 -->
            <div class="back-button">
                <asp:Button ID="btnBackToMain" runat="server" Text="메인메뉴로 돌아가기" PostBackUrl="~/Welcome.aspx" />
            </div>
        </div>

        <script type="text/javascript">
            function showLoading() {
                document.getElementById('<%= lblAnswer.ClientID %>').innerHTML =
                    "<small style='color:gray;'>답변 생성 중입니다...</small>";
            }
        </script>
    </form>
</body>
</html>
