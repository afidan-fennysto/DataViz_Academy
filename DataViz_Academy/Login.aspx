<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DataViz_Academy.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p></p>
    <h1 style="text-align:center">
        Test Login for DataViz :3
    </h1>
    <p></p>
    <p>Username:
        <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
    </p>
    <p>Password:
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
    </p>
    <p></p>
    <p></p>
</asp:Content>
