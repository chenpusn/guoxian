<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SendSmsDemo_web.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 151px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    <asp:Button ID="Button2" runat="server" Text="查询余额" onclick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="发送短信" onclick="Button3_Click" />
    <asp:CheckBox ID="CheckBox1" runat="server" Text="定时发送：" />
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:Label ID="Label4" runat="server" 
        Text="日期格式为 yyyymmddhhnnss 如 20110520120000" ForeColor="Blue"></asp:Label>
    <br />
    <asp:Label ID="Label1" runat="server" Text="手机号码："></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="647px">在这里输入手机号码，多个号码用逗号(,)间隔。</asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="短信内容："></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Height="70px" TextMode="MultiLine" 
        Width="648px">这里输入短信内容</asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="返回结果："></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Width="648px"></asp:TextBox>
    </form>
    
</body>
</html>
