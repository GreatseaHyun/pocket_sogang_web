<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetitionAll.aspx.cs" Inherits="PetitionAll" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>전체 청원 보기</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 800px; margin: 50px auto;">
        <h2>학생 청원 목록</h2>
        



        <asp:GridView ID="gvPetitions" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Vertical"  PageSize="5" OnRowCommand="gvPetitions_RowCommand">
            <AlternatingRowStyle BackColor="White" />
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
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:Button ID="btnNewPetition" runat="server" Text="청원 올리기"
            OnClick="btnNewPetition_Click"/>
    </div>

    <div style="position: fixed; bottom: 20px; left: 0; width: 100%; text-align: center;">
        <asp:Button ID="btnBackToMain" runat="server" Text="메인메뉴로 돌아가기" PostBackUrl="~/Welcome.aspx" />
    </div>

    </form>
</body>
</html>

