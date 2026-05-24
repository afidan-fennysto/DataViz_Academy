<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DataViz_Academy.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="dashboardView" class="app-view active-view">
            <h1 id="dashViewMainTitle">User Dashboard</h1>
            <p id="dashViewSubtitle" class="view-subtitle">Monitor authorization parameters, complete paths, and structural credentials.</p>
            
            <div id="dashboardLockedState">
                <div class="card" style="text-align: center; padding: 40px 20px;">
                    <p style="color: var(--text-muted); margin-bottom: 16px;">Authentication verification is missing. Log in to track credentials.</p>
                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Auth.aspx" CssClass="btn btn-primary">
                    Navigate to Login
                    </asp:HyperLink>
                </div>
            </div>
            
            <div id="dashboardActiveState" style="display: none;">
                <div class="dash-layout-grid">
                    <div>
                        <div class="card profile-hero-card" id="profileCardWrapper">
                            <div style="display: flex; align-items: center; gap: 20px;">
                                <div class="dash-avatar-frame" id="dashAvatarDisplay">U</div>
                                <div>
                                    <h2 id="dashAccountName" style="font-size: 1.75rem; font-weight: 700;">User Name</h2>
                                    <p id="dashAccountEmail" style="color: var(--text-muted); font-size: 0.9rem;">user@mail.apu.edu.my</p>
                                </div>
                            </div>
                        </div>

                        <div class="stat-grid" id="dashStatCountersGrid">
                            <div class="stat-card"><div class="stat-number" id="dashCoursesDone">0</div><div class="stat-label">Passed Questions</div></div>
                            <div class="stat-card"><div class="stat-number" id="dashPostCount">0</div><div class="stat-label">Community Contributions</div></div>
                        </div>

                        <div class="card" id="userBadgesDashboardPanel">
                            <h3>Earned System Badges</h3>
                            <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 16px;">Complete module checkpoints to anchor status badges.</p>
                            <div class="badge-container" id="badgesGridDisplayContainer"></div>
                        </div>

                        <div class="card" id="adminAnalyticsDashboardPanel" style="display: none;">
                            <h3 style="color: var(--text-main); margin-bottom: 4px;">Student Activity & Engagement Tracker</h3>
                            <p style="color: var(--text-muted); font-size: 0.85rem; margin-bottom: 16px;">Systemic administrative view of registered student learning checkpoints and completed paths.</p>
                            <div class="admin-table-container">
                                <table class="admin-table">
                                    <thead>
                                        <tr>
                                            <th>Student Handle</th>
                                            <th>Email Address</th>
                                            <th>Active Interactions</th>
                                            <th>Passed Items</th>
                                        </tr>
                                    </thead>
                                    <tbody id="adminStudentActivityTableBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="card customization-panel">
                            <h3>Customize Your Workspace</h3>
                            <p style="color: var(--text-muted); font-size: 0.85rem; margin-bottom: 20px;">Personalize your profile aesthetics and layout configurations dynamically.</p>
                            
                            <div class="form-group">
                                <label>Modify Display Name</label>
                                <input type="text" id="editProfileNameInput" class="form-control" placeholder="Update your name">
                            </div>
                            
                            <div class="form-group">
                                <label>Upload Profile Image</label>
                                <input type="file" id="editProfileAvatarFile" class="form-control" accept="image/*">
                            </div>

                            <div class="form-group">
                                <label>Card Accent Theme Color</label>
                                <div class="color-picker-group">
                                    <button class="color-swatch default-swatch" onclick="updateDashboardAccent('#6366f1')"></button>
                                    <button class="color-swatch emerald-swatch" onclick="updateDashboardAccent('#10b981')"></button>
                                    <button class="color-swatch amber-swatch" onclick="updateDashboardAccent('#f59e0b')"></button>
                                    <button class="color-swatch rose-swatch" onclick="updateDashboardAccent('#f43f5e')"></button>
                                </div>
                            </div>

                            <button class="btn btn-primary" style="width: 100%; margin-top: 8px;" onclick="saveDashboardCustomizations()">Commit Workspace Changes</button>
                            <div id="customizationFeedback" class="inline-feedback success" style="display: none; font-size: 0.85rem; padding: 8px 12px;">Workspace updated!</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>