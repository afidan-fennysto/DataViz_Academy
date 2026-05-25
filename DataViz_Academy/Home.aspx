<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DataViz_Academy.Home" %>

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
            <%-- The Repeater generates the core layout boxes cleanly --%>
            <asp:Repeater ID="rptFeatures" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <h4><%# Eval("Title") %></h4>
                        <p style="color: var(--text-muted); margin-top: 8px; font-size: 0.95rem;">
                            <%# Eval("Description") %>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
