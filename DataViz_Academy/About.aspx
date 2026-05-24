<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="DataViz_Academy.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="aboutView" class="app-view active-view">
            <h1>About the Initiative</h1>
            <p class="view-subtitle">Project framework, system scope parameters, and development team milestones.</p>
            
            <div class="card">
                <h3>System Objective</h3>
                <p style="margin-top: 8px; line-height: 1.6; color: var(--text-muted);">This sandbox lowers barriers associated with technical implementation modeling. By combining asynchronous single-page layout structures with modern CSS web standards, it provides an immediate baseline for testing application state mutations, data handling operations, and responsive viewing frameworks.</p>
            </div>

            <h2 style="margin: 32px 0 16px 0; font-size: 1.75rem;">Meet the Developers</h2>
            <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 20px; margin-top: -12px;">Select any card to navigate directly to their unique standalone portfolio websites.</p>
            <div class="developer-grid">
                <div class="dev-card" onclick="navigateToDeveloperWeb('zetty.html')" style="cursor: pointer;">
                    <div class="dev-avatar">UI</div>
                    <div class="dev-info">
                        <h3>Zetty</h3>
                        <p class="dev-role">Project Manager & Lead Documenter</p>
                        <p class="dev-bio">Oversees project schedules, audience requirements elicitation, and structural documentation quality checks.</p>
                        <button class="btn btn-primary dev-btn">Explore Website &rarr;</button>
                    </div>
                </div>
                <div class="dev-card" onclick="navigateToDeveloperWeb('alif.html')" style="cursor: pointer;">
                    <div class="dev-avatar">DB</div>
                    <div class="dev-info">
                        <h3>Alif</h3>
                        <p class="dev-role">Database Architect</p>
                        <p class="dev-bio">Manages schema structuring, analytical relational query maps, and CRUD state persistence layers.</p>
                        <button class="btn btn-primary dev-btn">Explore Website &rarr;</button>
                    </div>
                </div>
                <div class="dev-card" onclick="navigateToDeveloperWeb('aleeya.html')" style="cursor: pointer;">
                    <div class="dev-avatar">FE</div>
                    <div class="dev-info">
                        <h3>Aleeya</h3>
                        <p class="dev-role">Client-Side Engineer</p>
                        <p class="dev-bio">Expert in asynchronous view rendering, real-time validation scripting, and browser event listeners.</p>
                        <button class="btn btn-primary dev-btn">Explore Website &rarr;</button>
                    </div>
                </div>
                <div class="dev-card" onclick="navigateToDeveloperWeb('afi.html')" style="cursor: pointer;">
                    <div class="dev-avatar">SEC</div>
                    <div class="dev-info">
                        <h3>Afi</h3>
                        <p class="dev-role">Security & Auth Analyst</p>
                        <p class="dev-bio">Focuses on user authentication state monitoring, session clearing gates, and role privilege verification.</p>
                        <button class="btn btn-primary dev-btn">Explore Website &rarr;</button>
                    </div>
                </div>
                <div class="dev-card" onclick="navigateToDeveloperWeb('raif.html')" style="cursor: pointer;">
                    <div class="dev-avatar">FS</div>
                    <div class="dev-info">
                        <h3>Raif</h3>
                        <p class="dev-role">Full-Stack Integrator</p>
                        <p class="dev-bio">Coordinates system asset binding, layout performance testing, and client-backend state synchronization.</p>
                        <button class="btn btn-primary dev-btn">Explore Website &rarr;</button>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
