<%@ Page Title="Summary of the Assignments" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WebApplication.Student.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT CourseID, Grade
FROM Grade
WHERE StudentID=@StudentID">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="user_name" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="main">
        <p></p>
        <p>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="192px" HorizontalAlign="Center" Width="330px">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </p>
    </div>
</asp:Content>
