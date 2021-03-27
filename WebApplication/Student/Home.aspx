<%@ Page Title="Student Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication.Student.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="Home.aspx">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT [StudentID], [Name], [DepartmentID], [Gender], [PhotoNum], [EmailAddress], [GPA] FROM [Student]
WHERE StudentID=@StudentID">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="user_name" />
        </SelectParameters>
        </asp:SqlDataSource>
    <div><asp:Label runat="server" Text="Home" ID="LabelHome" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" Caption="Information" CaptionAlign="Top" CellPadding="2" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="499px" ForeColor="Black" Height="260px">
            <EditItemTemplate>
                StudentID:
                <asp:Label ID="StudentIDLabel1" runat="server" Text='<%# Eval("StudentID") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                DepartmentID:
                <asp:TextBox ID="DepartmentIDTextBox" runat="server" Text='<%# Bind("DepartmentID") %>' />
                <br />
                Gender:
                <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                <br />
                PhotoNum:
                <asp:TextBox ID="PhotoNumTextBox" runat="server" Text='<%# Bind("PhotoNum") %>' />
                <br />
                EmailAddress:
                <asp:TextBox ID="EmailAddressTextBox" runat="server" Text='<%# Bind("EmailAddress") %>' />
                <br />
                GPA:
                <asp:TextBox ID="GPATextBox" runat="server" Text='<%# Bind("GPA") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <InsertItemTemplate>
                StudentID:
                <asp:TextBox ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                DepartmentID:
                <asp:TextBox ID="DepartmentIDTextBox" runat="server" Text='<%# Bind("DepartmentID") %>' />
                <br />
                Gender:
                <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                <br />
                PhotoNum:
                <asp:TextBox ID="PhotoNumTextBox" runat="server" Text='<%# Bind("PhotoNum") %>' />
                <br />
                EmailAddress:
                <asp:TextBox ID="EmailAddressTextBox" runat="server" Text='<%# Bind("EmailAddress") %>' />
                <br />
                GPA:
                <asp:TextBox ID="GPATextBox" runat="server" Text='<%# Bind("GPA") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                StudentID:
                <asp:Label ID="StudentIDLabel" runat="server" Text='<%# Eval("StudentID") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                DepartmentID:
                <asp:Label ID="DepartmentIDLabel" runat="server" Text='<%# Bind("DepartmentID") %>' />
                <br />
                Gender:
                <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                <br />
                PhotoNum:
                <asp:Label ID="PhotoNumLabel" runat="server" Text='<%# Bind("PhotoNum") %>' />
                <br />
                EmailAddress:
                <asp:Label ID="EmailAddressLabel" runat="server" Text='<%# Bind("EmailAddress") %>' />
                <br />
                GPA:
                <asp:Label ID="GPALabel" runat="server" Text='<%# Bind("GPA") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:FormView>
        <br />
        </div>
    </form>
</asp:Content>
