<%@ Page Title="Auth" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="DataViz_Academy.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div id="loginView" class="app-view active-view">
        <h1>Portal Gateway Authentication</h1>
        <p class="view-subtitle">Sign entry credentials or register an APU student account handle.</p>
        <div style="max-width: 480px; margin: 0 auto;">
                
            <%-- 1. SIGN IN VIEW CARD --%>
            <div class="card" id="loginCard">
                <h3 style="margin-bottom: 8px;">Sign In</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 20px;">Provide your registration profile identity parameters.</p>
                
                <div class="form-group">
                    <label>Full Corporate Account Name</label>
                    <asp:TextBox ID="loginName" runat="server" CssClass="form-control" placeholder="e.g. Raif" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>APU Email Address</label>
                    <asp:TextBox ID="loginEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="example@apu.edu.my" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="loginPass" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
                </div>

                <asp:Label ID="lblLoginError" runat="server" CssClass="inline-feedback error" style="display: block; margin-bottom: 16px;" Visible="false"></asp:Label>
                
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="BtnLogin_Click" CssClass="btn btn-primary" style="width: 100%;"/>

                <p style="margin-top:16px; text-align:center; font-size: 0.9rem;"><a onclick="toggleAuthForms(true)" style="color: var(--primary-accent); cursor:pointer;">Create a New Profile Handle</a></p>
            </div>

            <%-- 2. REGISTER VIEW CARD --%>
            <div class="card" id="registerCard" style="display: none;">
                <h3 style="margin-bottom: 8px;">Create Registered Profile</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 20px;">Register using system parameter metrics.</p>
                
                <div class="form-group">
                    <label>Full Corporate Account Name</label>
                    <asp:TextBox runat="server" ID="regName" CssClass="form-control" placeholder="e.g. Zetty Adleena"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>APU Email Address</label>
                    <asp:TextBox ID="regEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="tpXXXXXX@mail.apu.edu.my"></asp:TextBox>
                    <div class="input-hint">Must match corporate domains (@apu.edu.my / @mail.apu.edu.my)</div>
                    <span id="regEmailError" class="validation-warning" style="display:none;">Invalid Email format. Please provide a verified APU address.</span>
                </div>
                <div class="form-group">
                    <label>Security Access Key (Password)</label>
                    <asp:TextBox ID="regPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Min 6 characters, 1 uppercase, 1 digit"></asp:TextBox>
                    <div class="input-hint">Requires ≥ 6 characters, 1 uppercase letter, and 1 number.</div>
                    <span id="regPassError" class="validation-warning" style="display:none;">Password string parameters do not fulfill syntax rule criteria.</span>
                </div>
                
                <asp:Button ID="regSubmitBtn" runat="server" Text="Commit Record" OnClick="BtnSubmit_Click" CssClass="btn btn-primary" style="width: 100%;" />

                <p style="margin-top:16px; text-align:center; font-size: 0.9rem;"><a onclick="toggleAuthForms(false)" style="color: var(--primary-accent); cursor:pointer;">Back to Portal Login</a></p>
            </div>

        </div>
    </div>
    
</asp:Content>