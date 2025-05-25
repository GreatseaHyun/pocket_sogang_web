<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetitionAll.aspx.cs" Inherits="PetitionAll" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>전체 청원 보기</title>
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

        .petition-list-panel {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            width: 800px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .petition-list-panel h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .petition-list-panel input[type="submit"],
        .petition-list-panel input[type="button"] {
            background-color: darkred;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .petition-list-panel input[type="submit"]:hover,
        .petition-list-panel input[type="button"]:hover {
            background-color: darkblue;
        }

        .footer-button {
            position: fixed;
            bottom: 20px;
            left: 0;
            width: 100%;
            text-align: center;
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
        <div class="petition-list-panel">
            <h2>학생 청원 목록</h2>

            <asp:GridView ID="gvPetitions" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True"
                CssClass="petition-grid" PageSize="5" OnRowCommand="gvPetitions_RowCommand"
                GridLines="Horizontal" CellPadding="8">
                <Columns>
                    <asp:BoundField DataField="PetitionTitle" HeaderText="제목" />
                    <asp:BoundField DataField="ClickCountPos" HeaderText="공감수" />
                    <asp:BoundField DataField="DtInsert" HeaderText="작성일" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:TemplateField HeaderText="자세히 보기">
                        <ItemTemplate>
                            <asp:Button runat="server" Text="보기" CommandName="Read" CommandArgument='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="darkred" ForeColor="white" Font-Bold="True" />
                <RowStyle BackColor="white" />
                <AlternatingRowStyle BackColor="#f9f9f9" />
                <PagerStyle BackColor="#eee" ForeColor="black" HorizontalAlign="Right" />
            </asp:GridView>

            <br />
            <asp:Button ID="btnNewPetition" runat="server" Text="청원 올리기" OnClick="btnNewPetition_Click" />
        </div>

        <div class="footer-button">
            <asp:Button ID="btnBackToMain" runat="server" Text="메인메뉴로 돌아가기" PostBackUrl="~/Welcome.aspx" />
        </div>
    </form>
</body>
</html>
