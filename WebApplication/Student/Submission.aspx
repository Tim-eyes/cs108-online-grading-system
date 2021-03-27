<%@ Page Title="Assignment Submission" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Submission.aspx.cs" Inherits="WebApplication.Student.Submission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT DISTINCT S.StudentID,C.CourseID,C.Name AS [Course Name]
FROM Student AS S
JOIN Course AS C
ON S.DepartmentID=C.DepartmentID
WHERE S.StudentID=@StudentID">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="user_name" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT DISTINCT C.CourseID,A.AssignmentNo
FROM Course AS C
JOIN Assignment AS A
ON C.CourseID=A.CourseID
WHERE C.CourseID=@CourseID
ORDER BY CourseID">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="CourseID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT DISTINCT C.CourseID,A.AssignmentNo,Q.QuestionNo,Q.Question
FROM Course AS C
JOIN Assignment AS A
ON C.CourseID=A.CourseID
JOIN Question AS Q
ON Q.AssignmentNo=A.AssignmentNo
WHERE Q.AssignmentNo=@AssignmentNo
ORDER BY CourseID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListAss" Name="AssignmentNo" PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
    <div class="main">
        <p style="font-size: larger; font-weight: bold">
            Hi Student!  Please add the course from your department.
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Course : "></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseID" DataValueField="CourseID"
                RepeatDirection="Horizontal" >
            </asp:RadioButtonList>

            <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Add Course" />

        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="AssignmentNo : "></asp:Label>
            <asp:DropDownList ID="DropDownListAss" runat="server" DataSourceID="SqlDataSource2" DataTextField="AssignmentNo" DataValueField="AssignmentNo"></asp:DropDownList>
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update" Width="90px" OnClick="ButtonUpdate_Click" />
        </p>
         <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1210px" DataSourceID="SqlDataSource3" DataKeyNames="CourseID,AssignmentNo,QuestionNo" HorizontalAlign="Center">
                 <Columns>
                     <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                     <asp:BoundField DataField="AssignmentNo" HeaderText="AssignmentNo" ReadOnly="True" SortExpression="AssignmentNo" />
                     <asp:BoundField DataField="QuestionNo" HeaderText="QuestionNo" ReadOnly="True" SortExpression="QuestionNo" />
                     <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
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
        <p>
            <asp:Button ID="ButtonUpdate2" runat="server" OnClick="ButtonUpdate2_Click" Text="Update" />
        </p>
        <p>
            <asp:Label ID="Label11" runat="server" Text="Question : "></asp:Label>
            <asp:DropDownList ID="DropDownListQue" runat="server" DataSourceID="SqlDataSource3" DataTextField="QuestionNo" DataValueField="QuestionNo">
            </asp:DropDownList>
            <asp:TextBox ID="TextBoxQue" runat="server" Height="42px" TextMode="MultiLine" Width="361px" Enabled="False" ></asp:TextBox>
            <asp:Button ID="ButtonUpdate3" runat="server" OnClick="ButtonUpdate3_Click" Text="Update" />
        </p>
        <p>
            <asp:Label ID="Label10" runat="server" Text="Answer : "></asp:Label>
            <asp:TextBox ID="TextBoxAns" runat="server" Height="209px" TextMode="MultiLine" Width="419px"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBoxAns" ErrorMessage="&quot;Answer&quot; is not allowed NULL" ValidationGroup="submission"></asp:CustomValidator>
        </p>
         <p>
             <asp:Button ID="ButtonSub" runat="server" Text="Submission" OnClick="ButtonSub_Click" ValidationGroup="submission" />
        </p>
        
    </div>
</asp:Content>
