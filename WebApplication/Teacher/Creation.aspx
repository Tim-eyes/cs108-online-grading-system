<%@ Page Title="Student Account Creation" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Creation.aspx.cs" Inherits="WebApplication.Teacher.Creation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style4 {
            width: 144px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE Student
SET
StudentID=@StudentID,Name=@Name,DepartmentID=@DepartmentID,Gender=@Gender,PhotoNum=@PhotoNum,EmailAddress=@EmailAddress,Password=@Password,GPA=@GPA
WHERE StudentID=@StudentID" DeleteCommand="DELETE FROM Student
WHERE StudentID=@StudentID">
        <DeleteParameters>
            <asp:Parameter Name="StudentID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentID" />
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="DepartmentID" />
            <asp:Parameter Name="Gender" />
            <asp:Parameter Name="PhotoNum" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="GPA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT DISTINCT [DepartmentID] FROM [Department]"></asp:SqlDataSource>

    <div class="main" style="text-align:center;">
        <p style="font-size: larger; font-weight: bold">
            Create Accounts for Students
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="StudentID ："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="&quot;StudentID&quot; must  be matched by request" ValidationExpression="^([S])(\d{7})(\w{1})([-])(\w{4})([-])(\w{4})$" ValidationGroup="create"></asp:RegularExpressionValidator>
        </p>
        <p>
            
            <asp:Label ID="Label2" runat="server" Text="Name ："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="&quot;Name&quot; is not allowed NULL!" ValidationGroup="create"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="DepartmentID : "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="119px" DataSourceID="SqlDataSource2" DataTextField="DepartmentID" DataValueField="DepartmentID" />
            
           
        </p>
        <p> 
            <asp:Label ID="Label4" runat="server" Text="Gender ："></asp:Label>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">M</asp:ListItem>
                <asp:ListItem>F</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="PhotoNum ："></asp:Label>
             <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="&quot;PhotoNum&quot; is not allowed NULL!" ValidationGroup="create"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="EmailAddress ："></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Email"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" ErrorMessage="&quot;EmailAddress&quot; is not allowed NULL!" ValidationGroup="create"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="Password ："></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox5" ErrorMessage="&quot;Password&quot; is not allowed NULL!" ValidationGroup="create"></asp:RequiredFieldValidator>
            <br/>
            <asp:Label ID="Label8" runat="server" Text="Password Again ："></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="TextBox6" ErrorMessage="&quot;Password&quot; is not allowed NULL!" ValidationGroup="create"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="ButtonAdd" runat="server" Text="Create Account" 
                onclick="ButtonAdd_Click" ValidationGroup="create" />
             <input id="Reset1" type="reset" value="Reset" class="auto-style4" />
        </p>

    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="1167px" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" NewText="New" SelectText="Select" UpdateText="Update" InsertText="Insert" DeleteText="Delete" EditText="Edit" CancelText="Cancel" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="PhotoNum" HeaderText="PhotoNum" SortExpression="PhotoNum" />
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>

    <br />

</asp:Content>
