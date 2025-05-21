<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewPetition.aspx.cs" Inherits="NewPetition" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>청원 작성</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:600px; margin:50px auto;">
        <h2>청원 작성</h2>

        <asp:Label runat="server" Text="제목" /><br />
        <asp:TextBox runat="server" ID="txtTitle" Width="100%" /><br /><br />

        <asp:Label runat="server" Text="내용" /><br />
        <asp:TextBox runat="server" ID="txtContent" Width="100%" TextMode="MultiLine" Rows="10" /><br /><br />

        <asp:Button runat="server" ID="btnSubmit" Text="등록" OnClick="btnSubmit_Click" />
        <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />
    </div>

    <div style="position: fixed; bottom: 20px; left: 0; width: 100%; text-align: center; z-index: 999;">
        <asp:Button ID="btnToAllPetitions" runat="server" Text="전체 청원 보기" PostBackUrl="~/PetitionAll.aspx" />
    </div>

    </form>
</body>
</html>

