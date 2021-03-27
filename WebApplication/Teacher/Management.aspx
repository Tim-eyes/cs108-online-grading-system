<%@ Page Title="Management of the Assignments" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="WebApplication.Teacher.Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT DISTINCT C.CourseID
FROM Course AS C
JOIN Teacher AS T
ON C.TeacherID=@TeacherID">
        <SelectParameters>
            <asp:SessionParameter SessionField="user_name" Name="TeacherID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT * FROM [Assignment]" DeleteCommand="DELETE FROM Assignment WHERE AssignmentNo=@AssignmentNo" UpdateCommand="UPDATE Assignment
SET AssignmentNo=@AssignmentNo, Name=@Name, CourseID=@CourseID, Score=@Score
WHERE AssignmentNo=@AssignmentNo">
        <DeleteParameters>
            <asp:Parameter Name="AssignmentNo" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="AssignmentNo" />
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="CourseID" />
            <asp:Parameter Name="Score" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT * FROM [Question]" DeleteCommand="DELETE FROM Question WHERE QuestionNo=@QuestionNo" UpdateCommand="UPDATE Question
SET QuestionNo=@QuestionNo, AssignmentNo=@AssignmentNo, Question=@Question, Solution=@Solution, Score=@Score
WHERE QuestionNo=@QuestionNo">
        <DeleteParameters>
            <asp:Parameter Name="QuestionNo" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuestionNo" />
            <asp:Parameter Name="AssignmentNo" />
            <asp:Parameter Name="Question" />
            <asp:Parameter Name="Solution" />
            <asp:Parameter Name="Score" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT * 
FROM Assignment
WHERE CourseID=@CourseID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CourseID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="main" style="text-align:center" >
       <p style="font-size: larger; font-weight: bold">
           Management of the Assignments
       </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Coures : "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseID" DataValueField="CourseID" ></asp:DropDownList>

       </p> 
        <p>
            <asp:Label ID="Label3" runat="server" Text="Assignment Name : "></asp:Label>
             <asp:TextBox ID="TextBoxAssName" runat="server" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxAssName" ErrorMessage="&quot;Assignment Name&quot; is not allowed NULL!" ValidationGroup="Ass"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="ButtonAss" runat="server" Text="Creation Assignment" OnClick="ButtonAss_Click" ValidationGroup="Ass" />
        </p>
        <p>
            <asp:Label ID="Lable2" runat="server" Text="AssignmentID : "></asp:Label>
            <asp:DropDownList ID="DropDownListAss" runat="server" DataSourceID="SqlDataSource4" DataTextField="AssignmentNo" DataValueField="AssignmentNo">
            </asp:DropDownList>
            <asp:Button ID="ButtonUp" runat="server" OnClick="ButtonUp_Click" Text="Update" />
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Question : "></asp:Label>
            <asp:TextBox ID="TextBoxQueInfo" runat="server" Height="150px" TextMode="MultiLine" Width="450px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxQueInfo" ErrorMessage="&quot;Question&quot; is not allowed NULL!" ValidationGroup="Que"></asp:RequiredFieldValidator>

        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="Solution : "></asp:Label>
            <asp:TextBox ID="TextBoxSolInfo" runat="server" Height="150px" TextMode="MultiLine" Width="450px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBoxSolInfo" ErrorMessage="&quot;Solution&quot; is not allowed NULL!" ValidationGroup="Que"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="Question Score : "></asp:Label>
            <asp:TextBox ID="TextBoxQueScore" runat="server" TextMode="Number" Width="56px" OnTextChanged="TextBox_TextChanged"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator" runat="server" ControlToValidate="TextBoxQueScore" ErrorMessage="&quot;Question Score&quot; is not allowed NULL or beyond range!" MaximumValue="100" MinimumValue="1" ValidationGroup="Que" Type="Integer"></asp:RangeValidator>
        </p>
        <p>
            <asp:Button ID="ButtonQue" runat="server" Text="Create Question" OnClick="ButtonQue_Click" ValidationGroup="Que" />
        </p>
        <p>
            <input id="Reset1" type="reset" value="Reset" class="auto-style4" /></p>
              
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="AssignmentNo" DataSourceID="SqlDataSource2" Width="1062px" HorizontalAlign="Center" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="New" SelectText="Select" UpdateText="Update" />
                <asp:BoundField DataField="AssignmentNo" HeaderText="AssignmentNo" ReadOnly="True" SortExpression="AssignmentNo" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
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
              
    <br />
       
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="QuestionNo" DataSourceID="SqlDataSource3" Width="1059px" HorizontalAlign="Center">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="New" SelectText="Select" UpdateText="Update"/>
                <asp:BoundField DataField="QuestionNo" HeaderText="QuestionNo" ReadOnly="True" SortExpression="QuestionNo" />
                <asp:BoundField DataField="AssignmentNo" HeaderText="AssignmentNo" SortExpression="AssignmentNo" />
                <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                <asp:BoundField DataField="Solution" HeaderText="Solution" SortExpression="Solution" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
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
       
     <br />

 </div>
</asp:Content>
