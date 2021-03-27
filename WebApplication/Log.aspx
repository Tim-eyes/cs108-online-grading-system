<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="WebApplication.Log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 400px;
        }

       body {
				background: url('/images/loginbackground.jpg') no-repeat center center fixed;
                -webkit-background-size: cover;
				-o-background-size: cover;                
				background-size: cover;
			}

    </style>
</head>
<body >
    <form id="form1" runat="server">
        <div class="auto-style1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Login ID="Login" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="2px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="316px" TextLayout="TextOnTop" Width="524px" LoginButtonText="Login" FailureText="Your login attempt was unsuccessful. Please try again." OnAuthenticate="Login_Authenticate" PasswordLabelText="Password:" PasswordRequiredErrorMessage="&quot;Password&quot; is required" RememberMeText="Remember me" TitleText="Online Grading System" UserNameLabelText="Username:" UserNameRequiredErrorMessage="&quot;Username&quot; is required">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                <TextBoxStyle Font-Size="0.8em" Height="20px" Width="300px" />
                <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            
            </asp:Login>
            <asp:CheckBox ID="CheckBoxTeacher" runat="server"  Text="Teacher" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderStyle="Solid" OnCheckedChanged="CheckBoxTeacher_CheckedChanged" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="CheckBoxStudent" runat="server" Text="Student" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderStyle="Solid" OnCheckedChanged="CheckBoxStudent_CheckedChanged" />
        </div>
    </form>
</body>
</html>
