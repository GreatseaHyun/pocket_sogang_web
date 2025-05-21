<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetitionRead.aspx.cs" Inherits="PetitionRead" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>청원 상세보기</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 700px; margin: 50px auto;">
        <h2><asp:Label ID="lblTitle" runat="server" /></h2>
        <p><asp:Label ID="lblContent" runat="server" /></p>
        <p>
            <b>공감:</b> <asp:Label ID="lblAgree" runat="server" /> &nbsp;
            <b>비공감:</b> <asp:Label ID="lblDisagree" runat="server" />
        </p>
        <asp:Button ID="btnAgree" runat="server" Text="공감하기" OnClick="btnAgree_Click" />
        <asp:Button ID="btnDisagree" runat="server" Text="비공감하기" OnClick="btnDisagree_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>

    <div style="position: fixed; bottom: 20px; left: 0; width: 100%; text-align: center; z-index: 999;">
        <asp:Button ID="btnToAllPetitions" runat="server" Text="전체 청원 보기" PostBackUrl="~/PetitionAll.aspx" />
    </div>

    </form>
</body>
</html>

