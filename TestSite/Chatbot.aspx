<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chatbot.aspx.cs" Inherits="Chatbot" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>서강챗봇</title>
    <style>
        a[href^="tel:"] {
            color: blue;               
            text-decoration: none;     /* 밑줄 제거 */
            font-weight: normal;       /* 굵기 기본 */
            font-family: inherit;      /* 기본 폰트 */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:500px; margin:50px auto;">
        <h2>서강챗봇</h2>
        <asp:TextBox ID="txtQuestion" runat="server" Width="100%" TextMode="MultiLine" Rows="4" /><br /><br />
        <asp:Button ID="btnAsk" runat="server" Text="질문하기" OnClientClick="showLoading()" OnClick="btnAsk_Click" /><br /><br />
        <asp:Label ID="lblAnswer" runat="server" Text="" />        
    </div>

    <div style="position: fixed; bottom: 20px; left: 0; width: 100%; text-align: center;">
        <asp:Button ID="btnBackToMain" runat="server" Text="메인메뉴로 돌아가기" PostBackUrl="~/Welcome.aspx" />
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

