<%@ Page Title="Assignment Marking" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Marking.aspx.cs" Inherits="WebApplication.Teacher.Marking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT DISTINCT C.CourseID
FROM Teacher AS T
JOIN Course AS C
ON T.TeacherID=C.TeacherID
WHERE T.TeacherID=@TeacherID">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="user_name" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="WITH T AS(
SELECT DISTINCT C.CourseID
FROM Teacher AS T
JOIN Course AS C
ON T.TeacherID=C.TeacherID
WHERE T.TeacherID=@TeacherID 
AND C.CourseID=@CourseID
)
SELECT T.CourseID,A.AssignmentNo,
		A.Name AS [AssName],A.Score AS [AssScore],
		S.SubmissionNo,Q.QuestionNo,Q.Score AS [QueScore],
		S.StudentID,Q.Solution,S.Answer,S.Score AS [SubScore]
FROM T
JOIN Assignment AS A
ON T.CourseID=A.CourseID
JOIN Question AS Q
ON Q.AssignmentNo=A.AssignmentNo
JOIN Submission AS S
ON S.AssignmentNo=A.AssignmentNo">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="user_name" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="CourseID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="WITH T AS(
SELECT DISTINCT C.CourseID
FROM Teacher AS T
JOIN Course AS C
ON T.TeacherID=C.TeacherID
WHERE T.TeacherID=@TeacherID 
AND C.CourseID=@CourseID
)
SELECT DISTINCT S.StudentID
FROM T
JOIN Assignment AS A
ON T.CourseID=A.CourseID
JOIN Question AS Q
ON Q.AssignmentNo=A.AssignmentNo
JOIN Submission AS S
ON S.AssignmentNo=A.AssignmentNo">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="user_name" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="CourseID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="WITH T AS(
SELECT DISTINCT C.CourseID
FROM Teacher AS T
JOIN Course AS C
ON T.TeacherID=C.TeacherID
WHERE T.TeacherID=@TeacherID 
AND C.CourseID=@CourseID
)
SELECT DISTINCT A.AssignmentNo
FROM T
JOIN Assignment AS A
ON T.CourseID=A.CourseID
JOIN Question AS Q
ON Q.AssignmentNo=A.AssignmentNo
JOIN Submission AS S
ON S.AssignmentNo=A.AssignmentNo">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="user_name" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="CourseID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="WITH T AS(
SELECT DISTINCT C.CourseID
FROM Teacher AS T
JOIN Course AS C
ON T.TeacherID=C.TeacherID
WHERE T.TeacherID=@TeacherID 
AND C.CourseID=@CourseID
)
SELECT DISTINCT Q.QuestionNo
FROM T
JOIN Assignment AS A
ON T.CourseID=A.CourseID
JOIN Question AS Q
ON Q.AssignmentNo=A.AssignmentNo 
AND Q.AssignmentNo=@AssignmentNo
JOIN Submission AS S
ON S.AssignmentNo=A.AssignmentNo">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="user_name" />
            <asp:ControlParameter ControlID="RadioButtonList1" Name="CourseID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownListAss" Name="AssignmentNo" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="main">
        <p>
           <asp:Label ID="Label1" runat="server" Text="Hi Teacher! Please choose the course from your department." Font-Bold="True" Font-Italic="False" Font-Size="Large"></asp:Label>
        </p>
        <p>
           <asp:Label ID="Label2" runat="server" Text="Course : "></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseID" DataValueField="CourseID">
            </asp:RadioButtonList>
            <asp:Button ID="ButtonUp" runat="server" OnClick="ButtonUp_Click" Text="Update" />
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="StudentID ："></asp:Label>
            <asp:DropDownList ID="DropDownListStu" runat="server" DataSourceID="SqlDataSource3" DataTextField="StudentID" DataValueField="StudentID">
            </asp:DropDownList>
        </p>
        <p>
           <asp:Label ID="Label3" runat="server" Text="AssignmentNo : "></asp:Label>
            <asp:DropDownList ID="DropDownListAss" runat="server" DataSourceID="SqlDataSource4" DataTextField="AssignmentNo" DataValueField="AssignmentNo">
            </asp:DropDownList>
        </p>
        <p>
           <asp:Label ID="Label4" runat="server" Text="QuestionNo : "></asp:Label>
            <asp:DropDownList ID="DropDownListQue" runat="server" DataSourceID="SqlDataSource5" DataTextField="QuestionNo" DataValueField="QuestionNo">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="Solution : "></asp:Label>
            <asp:TextBox ID="TextBoxSol" runat="server" Enabled="False"  TextMode="MultiLine"></asp:TextBox>

        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="Answer : "></asp:Label>
            <asp:TextBox ID="TextBoxAns" runat="server" Enabled="False"  TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="ButtonUpdate" runat="server"  Text="Update" OnClick="ButtonUpdate_Click" />
        </p>
        <p>
            <asp:Label ID="Label8" runat="server" Text="Score : "></asp:Label>
            <asp:TextBox ID="TextBoxSco" runat="server" TextMode="Number" Width="161px">0</asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxSco" ErrorMessage="&quot;Score&quot; is not allowed NULL or beyond range!" MaximumValue="100" MinimumValue="0" Type="Integer" ValidationGroup="sumission"></asp:RangeValidator>
        </p>
        <p>
            <asp:Button ID="ButtonSub" runat="server" Text="Sumission" OnClick="ButtonSub_Click" ValidationGroup="sumission" />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CourseID,AssignmentNo,SubmissionNo,QuestionNo" DataSourceID="SqlDataSource2" Width="1106px" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="AssignmentNo" HeaderText="AssignmentNo" ReadOnly="True" SortExpression="AssignmentNo" />
                    <asp:BoundField DataField="AssName" HeaderText="AssName" SortExpression="AssName" />
                    <asp:BoundField DataField="AssScore" HeaderText="AssScore" SortExpression="AssScore" />
                    <asp:BoundField DataField="SubmissionNo" HeaderText="SubmissionNo" ReadOnly="True" SortExpression="SubmissionNo" />
                    <asp:BoundField DataField="QuestionNo" HeaderText="QuestionNo" ReadOnly="True" SortExpression="QuestionNo" />
                    <asp:BoundField DataField="QueScore" HeaderText="QueScore" SortExpression="QueScore" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                    <asp:BoundField DataField="Solution" HeaderText="Solution" SortExpression="Solution" />
                    <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
                    <asp:BoundField DataField="SubScore" HeaderText="SubScore" SortExpression="SubScore" />
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
            &nbsp;</p>
    </div>
</asp:Content>
