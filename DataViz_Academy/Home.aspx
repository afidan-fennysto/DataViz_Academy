<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DataViz_Academy.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="homeView" class="app-view active-view">
            <div class="hero">
                <h2>Master data representation cleanly.</h2>
                <p>An interactive, sandbox learning tool designed to transform numbers into production-grade visual interfaces.</p>
                <asp:HyperLink ID="lnkGetStarted" runat="server" NavigateUrl="~/Assessment.aspx" CssClass="btn btn-primary">
                Get Started Learning
                </asp:HyperLink>
            </div>
            <h3 style="margin-bottom: 16px;">Core Features</h3>
            <div class="grid-3">
                <div class="card">
                    <h4>Guided Modules</h4>
                    <p style="color: var(--text-muted); margin-top: 8px; font-size: 0.95rem;">Step-by-step documentation paired with localized assessment forms.</p>
                </div>
                <div class="card">
                    <h4>Upvote Forum Channels</h4>
                    <p style="color: var(--text-muted); margin-top: 8px; font-size: 0.95rem;">Share chart layout snapshots, query metrics, and upvote insights.</p>
                </div>
                <div class="card">
                    <h4>Gamified Badging</h4>
                    <p style="color: var(--text-muted); margin-top: 8px; font-size: 0.95rem;">Verify system competence parameters. Earn verification credentials.</p>
                </div>
            </div>
      </div>

</asp:Content>
