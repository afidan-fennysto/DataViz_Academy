<%@ Page Title="Auth" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="DataViz_Academy.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auth-container">
        <asp:MultiView ID="AuthMultiView" runat="server" ActiveViewIndex="0">

            <asp:View ID="ViewLogin" runat="server">

                <div class="login-box">
                    <h2 style="text-align:center">
                        Login to DataViz Academy</h2>
                    <br />
                    <br />
                    Username: 
                    <asp:TextBox ID="txtLoginUsername" runat="server" Placeholder="Username"></asp:TextBox>
                    <br />
                    <br />
                    Password:
                    <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                    <br />
                    <br />
                    <asp:LinkButton ID="lnkGoToRegister" runat="server" OnClick="lnkGoToRegister_Click">Don't have an account? Register here</asp:LinkButton>
                </div>
                
            </asp:View>

            <asp:View ID="ViewRegister" runat="server">
                <div class="register-box">
                    <h2 style="text-align:center">
                        Create New Student Account</h2>
                    <br />
                    <br />
                    First Name:
                    <asp:TextBox ID="txtRegFirstName" runat="server" Placeholder="First Name"></asp:TextBox>
                    <br />
                    <br />
                    Email:
                    <asp:TextBox ID="txtRegEmail" runat="server" Placeholder="Email Address"></asp:TextBox>
                    <br />
                    <br />
                    Password:
                    <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnRegister" runat="server" Text="Register Account" OnClick="btnRegister_Click" />
                    <br />
                    <br />
                    <asp:LinkButton ID="lnkGoToLogin" runat="server" OnClick="lnkGoToLogin_Click" CausesValidation="false">Already have an account? Sign in</asp:LinkButton>
                </div>
            </asp:View>

        </asp:MultiView>
    </div>
    
</asp:Content>
