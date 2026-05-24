<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="DataViz_Academy.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="resourcesView" class="app-view active-view">
            <h1>External Documentation Links</h1>
            <p class="view-subtitle">Curated blueprints and standard web guidelines for visualization libraries.</p>
            
            <div class="resource-grid">
                <div class="resource-card">
                    <div class="resource-badge">JavaScript</div>
                    <div class="resource-content">
                        <strong>D3.js Graph Gallery</strong>
                        <p>Vanilla JavaScript framework blueprints and clean layout calculations.</p>
                    </div>
                    <a href="https://d3-graph-gallery.com/" target="_blank" class="btn btn-outline resource-btn">Explore Site &rarr;</a>
                </div>

                <div class="resource-card">
                    <div class="resource-badge">Data Science</div>
                    <div class="resource-content">
                        <strong>From Data to Viz</strong>
                        <p>An interactive decision tree linking precise dataset formats to layouts.</p>
                    </div>
                    <a href="https://www.data-to-viz.com/" target="_blank" class="btn btn-outline resource-btn">Explore Site &rarr;</a>
                </div>

                <div class="resource-card">
                    <div class="resource-badge">Python</div>
                    <div class="resource-content">
                        <strong>Python Graph Gallery</strong>
                        <p>Clean structural mapping guides useful for parsing multidimensional inputs.</p>
                    </div>
                    <a href="https://python-graph-gallery.com/" target="_blank" class="btn btn-outline resource-btn">Explore Site &rarr;</a>
                </div>

                <div class="resource-card">
                    <div class="resource-badge">Power BI</div>
                    <div class="resource-content">
                        <strong>Microsoft Power BI Documentation</strong>
                        <p>Official enterprise architecture guidelines for modeling DAX expressions and star schemas.</p>
                    </div>
                    <a href="https://learn.microsoft.com/en-us/power-bi/" target="_blank" class="btn btn-outline resource-btn">Explore Site &rarr;</a>
                </div>

                <div class="resource-card">
                    <div class="resource-badge">Tableau</div>
                    <div class="resource-content">
                        <strong>Tableau Knowledge Base</strong>
                        <p>Comprehensive dashboard formatting blueprints, Level of Detail (LOD) calculations, and optimization strategies.</p>
                    </div>
                    <a href="https://www.tableau.com/developer" target="_blank" class="btn btn-outline resource-btn">Explore Site &rarr;</a>
                </div>
            </div>
        </div>

</asp:Content>
