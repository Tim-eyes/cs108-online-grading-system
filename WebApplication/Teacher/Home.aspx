<%@ Page Title="Teacher Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication.Teacher.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="WITH T1 AS(
SELECT G.CourseID,G.Grade,S.StudentID
FROM Grade AS G
JOIN Student AS S
ON S.StudentID=G.StudentID
)
SELECT  DISTINCT C.CourseID,T1.StudentID,T1.Grade
FROM Teacher AS T
JOIN Course AS C
ON C.TeacherID=T.TeacherID
AND T.TeacherID=@TeacherID
JOIN T1
ON T1.CourseID=C.CourseID 
">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="user_name" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="SELECT * FROM [Grade]
WHERE CourseID=@CourseID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListCou" Name="CourseID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CS108DBConnectionString %>" SelectCommand="WITH T AS
(
SELECT S.SubmissionNo,A.AssignmentNo,S.QuestionNo,S.Score AS [Score_Q],A.Score AS [Score_A]
FROM Submission AS S
JOIN Assignment AS A
ON A.AssignmentNo=S.AssignmentNo
WHERE A.CourseID=@CourseID AND S.StudentID=@StudentID)
SELECT AssignmentNo,AVG([Score_Q]) AS [Average Mark of every question],
		SUM([Score_Q]) AS [Mark of Assignment],[Score_A] AS [Total score of Assignment]
FROM T
GROUP BY AssignmentNo,[Score_A]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListCou" Name="CourseID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownListStu" Name="StudentID" PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
    <div class="main">
       <p>
           <asp:Label runat="server" Text="Home" ID="LabelHome" Font-Bold="True" Font-Size="Larger"></asp:Label>
       </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="CourseID : "></asp:Label>
            <asp:DropDownList ID="DropDownListCou" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseID" DataValueField="CourseID">
            </asp:DropDownList>
       </p> 
        <p>

            <asp:Label ID="Label1" runat="server" Text="StudentID : "></asp:Label>
            <asp:DropDownList ID="DropDownListStu" runat="server" DataSourceID="SqlDataSource2" DataTextField="StudentID" DataValueField="StudentID">
            </asp:DropDownList>

        </p>
        <p>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID,StudentID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" Width="614px">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
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
        <p>

            &nbsp;
            <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AssignmentNo" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="AssignmentNo" HeaderText="AssignmentNo" ReadOnly="True" SortExpression="AssignmentNo" />
                    <asp:BoundField DataField="Average Mark of every question" HeaderText="Average Mark of every question" ReadOnly="True" SortExpression="Average Mark of every question" />
                    <asp:BoundField DataField="Mark of Assignment" HeaderText="Mark of Assignment" ReadOnly="True" SortExpression="Mark of Assignment" />
                    <asp:BoundField DataField="Total score of Assignment" HeaderText="Total score of Assignment" SortExpression="Total score of Assignment" />
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

            <asp:Button ID="CalGrade" runat="server" OnClick="CalGrade_Click" Text="Calculate Grade" />
&nbsp;</p>
        <p>

            <asp:Button ID="ButtonGPA" runat="server" Text="Calculate GPA" OnClick="ButtonGPA_Click" />
            &nbsp;
            
        </p>
    </div>
    
</asp:Content>
