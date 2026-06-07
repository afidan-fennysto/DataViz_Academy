<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DataViz_Academy.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="dashboardView" class="app-view active-view">
            <h1 id="dashViewMainTitle">User Dashboard</h1>
            <p id="dashViewSubtitle" class="view-subtitle">Monitor authorization parameters, complete paths, and structural credentials.</p>
            
            <asp:Panel ID="pnlDashboardLockedState" runat="server" Visible="false">
            <div class="card" style="text-align: center; padding: 40px 20px;">
                <p style="color: var(--text-muted); margin-bottom: 16px;">Authentication verification is missing. Log in to track credentials.</p>
                <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Auth.aspx" CssClass="btn btn-primary">Navigate to Login</asp:HyperLink>
            </div>
            </asp:Panel>
            
            <%-- ACTIVE STATE: Controlled via backend Visible property --%>
        <asp:Panel ID="pnlDashboardActiveState" runat="server" Visible="true">
            <div class="dash-layout-grid" style="display: grid; grid-template-columns: 2fr 1fr; gap: 24px;">
                
                <%-- LEFT COLUMN: Profile info & stats --%>
                <div>
                    <div class="card profile-hero-card" id="profileCardWrapper" style="background:#ffffff; border:1px solid #e2e8f0; padding:20px; border-radius:8px;">
                        <div style="display: flex; align-items: center; gap: 20px;">
                            
                            <%-- DYNAMIC AVATAR --%>
                            <div class="dash-avatar-frame" id="dashAvatarDisplay" style="background: #6366f1; color: white; width: 55px; height: 55px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 1.6rem; overflow: hidden;">
                                <asp:Literal ID="litAvatarTarget" runat="server">Z</asp:Literal>
                            </div>
                            <div>
                                <h2 style="font-size: 1.75rem; font-weight: 700; margin:0; color:#1a202c;">
                                    <asp:Label ID="lblDashAccountName" runat="server" Text="Zetty Adleena"></asp:Label>
                                </h2>
                                <p style="color: var(--text-muted); font-size: 0.9rem; margin:2px 0 0 0;">
                                    <asp:Label ID="lblDashAccountEmail" runat="server" Text="zetty@mail.apu.edu.my"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>

                    <%-- STAT COUNTERS --%>
                    <div class="stat-grid" id="dashStatCountersGrid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin: 16px 0;">
                        <div class="card stat-card" style="text-align: center; padding: 16px; background:#ffffff; border:1px solid #e2e8f0; border-radius:8px;">
                            <div class="stat-number" style="font-size: 2rem; font-weight: bold; color: #6366f1;">
                                <asp:Label ID="lblPassedQuestions" runat="server" Text="0"></asp:Label>
                            </div>
                            <div class="stat-label" style="font-size: 0.85rem; color: var(--text-muted); margin-top:4px;">Completed Checkpoints</div>
                        </div>
                        <div class="card stat-card" style="text-align: center; padding: 16px; background:#ffffff; border:1px solid #e2e8f0; border-radius:8px;">
                            <div class="stat-number" style="font-size: 2rem; font-weight: bold; color: #10b981;">
                                <asp:Label ID="lblBadgeCountDisplay" runat="server" Text="0"></asp:Label>
                            </div>
                            <div class="stat-label" style="font-size: 0.85rem; color: var(--text-muted); margin-top:4px;">Collected System Badges</div>
                        </div>
                    </div>

                    <%-- EARNED BADGES GRID VIEW --%>
                    <div class="card" id="userBadgesDashboardPanel" style="background:#ffffff; border:1px solid #e2e8f0; padding:20px; border-radius:8px;">
                        <h3 style="margin:0 0 4px 0; font-size:1.2rem; color:#1a202c;">Earned System Badges</h3>
                        <p style="color: var(--text-muted); font-size: 0.85rem; margin: 0 0 20px 0;">Complete interactive checkpoint modules to clear entry metrics and capture dynamic badges.</p>
                        
                        <asp:GridView ID="gvBadges" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%-- Renders item using the original grid alignment layout styles --%>
                                        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(130px, 1fr)); gap: 16px; width:100%;">
                                            <div style="background:#f8fafc; border:1px solid #e2e8f0; border-radius:6px; padding:16px; text-align:center; box-shadow:0 1px 2px rgba(0,0,0,0.02);">
                                                <div style="font-size:2.2rem; margin-bottom:6px;">🏅</div>
                                                <strong style="display:block; font-size:0.85rem; color:#1a202c; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><%# Eval("BadgeName") %></strong>
                                                <span style='display:inline-block; font-size:0.7rem; font-weight:700; color:#ffffff; background:<%# Eval("ColorAccent") %>; padding:2px 6px; border-radius:4px; margin-top:6px; text-transform:uppercase;'>Verified</span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="text-align:center; padding: 24px; border: 2px dashed #e2e8f0; border-radius:6px;">
                                    <p style="color:var(--text-muted); font-size:0.9rem; margin:0;">No technical status badges collected yet. Complete validation tracks inside the Course Workspace to unlock components.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>

                <%-- RIGHT SIDEBAR: SETTINGS INTERACTIVE WORKSPACE PANEL --%>
                <div>
                    <div class="card customization-panel" style="background:#ffffff; border:1px solid #e2e8f0; padding:20px; border-radius:8px;">
                        <h3 style="margin:0 0 6px 0; font-size:1.15rem;">Customize Your Workspace</h3>
                        <p style="color: var(--text-muted); font-size: 0.85rem; margin-bottom: 20px;">Personalize layout parameters and profile data settings dynamically.</p>
                        
                        <%-- DISPLAY NAME INPUT --%>
                        <div class="form-group" style="margin-bottom: 12px;">
                            <label style="display:block; margin-bottom:4px; font-weight:600; font-size:0.85rem;">Modify Display Name</label>
                            <asp:TextBox ID="txtEditProfileName" runat="server" CssClass="form-control" placeholder="Update account name" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #cbd5e1; font-size:0.9rem; box-sizing:border-box;"></asp:TextBox>
    
                            <asp:RequiredFieldValidator ID="rfvProfileName" runat="server" ControlToValidate="txtEditProfileName" 
                                ErrorMessage="Profile name cannot be left blank!" ForeColor="#f43f5e" Display="Dynamic" style="display:block; margin-top:4px; font-size:0.8rem;"></asp:RequiredFieldValidator>
                        </div>

                        <%-- EMAIL ADDRESS INPUT --%>
                        <div class="form-group" style="margin-bottom: 12px;">
                            <label style="display:block; margin-bottom:4px; font-weight:600; font-size:0.85rem;">Modify Email Address</label>
                            <asp:TextBox ID="txtEditProfileEmail" runat="server" CssClass="form-control" placeholder="Update system email" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #cbd5e1; font-size:0.9rem; box-sizing:border-box;"></asp:TextBox>
    
                            <asp:RequiredFieldValidator ID="rfvProfileEmail" runat="server" ControlToValidate="txtEditProfileEmail" 
                                ErrorMessage="Email address cannot be left blank!" ForeColor="#f43f5e" Display="Dynamic" style="display:block; margin-top:4px; font-size:0.8rem;"></asp:RequiredFieldValidator>
    
                            <asp:RegularExpressionValidator ID="revProfileEmail" runat="server" ControlToValidate="txtEditProfileEmail" 
                                ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                                ErrorMessage="Please enter a valid email standard interface route" ForeColor="#f43f5e" Display="Dynamic" style="display:block; margin-top:4px; font-size:0.8rem;"></asp:RegularExpressionValidator>
                        </div>

                        <%-- ACTION ACCELERATOR SUBMIT BUTTONS --%>
                        <asp:Button ID="btnCommitChanges" runat="server" Text="Commit Workspace Changes" CssClass="btn btn-primary" style="width: 100%; margin-bottom:8px;" OnClick="BtnCommitChanges_Click" />
                        <asp:Button ID="btnResetData" runat="server" Text="Reset Workspace Data" CssClass="btn btn-outline" style="width: 100%; font-size:0.85rem;" OnClick="BtnResetData_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>



</asp:Content>