<%@ Page Title="Resources" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="DataViz_Academy.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="resourcesView" class="app-view active-view">
        <h1>External Documentation Links</h1>
        <p class="view-subtitle">Curated blueprints and standard web guidelines for visualization libraries.</p>
        
        <div class="resource-grid">
            <%-- The Repeater handles the loop structurally and cleanly --%>
            <asp:Repeater ID="rptResources" runat="server">
                <ItemTemplate>
                    <div class="resource-card">
                        <div class="resource-badge">
                            <%# Eval("Badge") %>
                        </div>
                        <div class="resource-content">
                            <strong><%# Eval("Title") %></strong>
                            <p><%# Eval("Description") %></p>
                        </div>
                        <a href='<%# Eval("Url") %>' target="_blank" class="btn btn-outline resource-btn">
                            Explore Site &rarr;
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
