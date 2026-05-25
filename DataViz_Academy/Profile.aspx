<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DataViz_Academy.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="dashboardView" class="app-view active-view">
            <h1 id="dashViewMainTitle">User Dashboard</h1>
            <p id="dashViewSubtitle" class="view-subtitle">Monitor authorization parameters, complete paths, and structural credentials.</p>
            
            <div id="dashboardLockedState" style="display: none;">
                <div class="card" style="text-align: center; padding: 40px 20px;">
                    <p style="color: var(--text-muted); margin-bottom: 16px;">Authentication verification is missing. Log in to track credentials.</p>
                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Auth.aspx" CssClass="btn btn-primary">Navigate to Login</asp:HyperLink>
                </div>
            </div>
            
            <div id="dashboardActiveState" style="display: block;">
                <div class="dash-layout-grid" style="display: grid; grid-template-columns: 2fr 1fr; gap: 24px;">
                    <div>
                        <div class="card profile-hero-card" id="profileCardWrapper" style="background:#ffffff; border:1px solid #e2e8f0; padding:20px; border-radius:8px;">
                            <div style="display: flex; align-items: center; gap: 20px;">
                                <%-- DYNAMIC AVATAR TARGET CONTAINER FRAME --%>
                                <div class="dash-avatar-frame" id="dashAvatarDisplay" style="background: #6366f1; color: white; width: 55px; height: 55px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 1.6rem; overflow: hidden;">Z</div>
                                <div>
                                    <h2 id="dashAccountName" style="font-size: 1.75rem; font-weight: 700; margin:0; color:#1a202c;">Zetty Adleena</h2>
                                    <p id="dashAccountEmail" style="color: var(--text-muted); font-size: 0.9rem; margin:2px 0 0 0;">zetty@mail.apu.edu.my</p>
                                </div>
                            </div>
                        </div>

                        <%-- STAT COUNTERS --%>
                        <div class="stat-grid" id="dashStatCountersGrid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin: 16px 0;">
                            <div class="card stat-card" style="text-align: center; padding: 16px; background:#ffffff; border:1px solid #e2e8f0; border-radius:8px;">
                                <div class="stat-number" id="dashPassedQuestions" style="font-size: 2rem; font-weight: bold; color: #6366f1;">0</div>
                                <div class="stat-label" style="font-size: 0.85rem; color: var(--text-muted); margin-top:4px;">Completed Checkpoints</div>
                            </div>
                            <div class="card stat-card" style="text-align: center; padding: 16px; background:#ffffff; border:1px solid #e2e8f0; border-radius:8px;">
                                <div class="stat-number" id="dashBadgeCountDisplay" style="font-size: 2rem; font-weight: bold; color: #10b981;">0</div>
                                <div class="stat-label" style="font-size: 0.85rem; color: var(--text-muted); margin-top:4px;">Collected System Badges</div>
                            </div>
                        </div>

                        <%-- EARNED BADGES PANEL ROW GRID --%>
                        <div class="card" id="userBadgesDashboardPanel" style="background:#ffffff; border:1px solid #e2e8f0; padding:20px; border-radius:8px;">
                            <h3 style="margin:0 0 4px 0; font-size:1.2rem; color:#1a202c;">Earned System Badges</h3>
                            <p style="color: var(--text-muted); font-size: 0.85rem; margin: 0 0 20px 0;">Complete interactive checkpoint modules to clear entry metrics and capture dynamic badges.</p>
                            
                            <%-- TARGET BADGE MOUNT WRAPPER GRID --%>
                            <div class="badge-container" id="badgesGridDisplayContainer" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(130px, 1fr)); gap: 16px;">
                            </div>
                        </div>
                    </div>

                    <%-- RIGHT SIDEBAR: SETTINGS INTERACTIVE WORKSPACE PANEL --%>
                    <div>
                        <div class="card customization-panel" style="background:#ffffff; border:1px solid #e2e8f0; padding:20px; border-radius:8px;">
                            <h3 style="margin:0 0 6px 0; font-size:1.15rem;">Customize Your Workspace</h3>
                            <p style="color: var(--text-muted); font-size: 0.85rem; margin-bottom: 20px;">Personalize layout parameters and profile data settings dynamically.</p>
                            
                            <%-- MODIFIABLE DISP LAY VALUE TARGET INPUTS --%>
                            <div class="form-group" style="margin-bottom: 12px;">
                                <label style="display:block; margin-bottom:4px; font-weight:600; font-size:0.85rem;">Modify Display Name</label>
                                <input type="text" id="editProfileNameInput" class="form-control" placeholder="Update account name" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #cbd5e1; font-size:0.9rem; box-sizing:border-box;">
                            </div>

                            <div class="form-group" style="margin-bottom: 12px;">
                                <label style="display:block; margin-bottom:4px; font-weight:600; font-size:0.85rem;">Modify Email Address</label>
                                <input type="text" id="editProfileEmailInput" class="form-control" placeholder="Update system email" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #cbd5e1; font-size:0.9rem; box-sizing:border-box;">
                            </div>

                            <div class="form-group" style="margin-bottom: 16px;">
                                <label style="display:block; margin-bottom:4px; font-weight:600; font-size:0.85rem;">Upload Profile Image</label>
                                <input type="file" id="editProfileAvatarFile" accept="image/*" style="width: 100%; font-size:0.8rem; padding:4px 0;">
                            </div>

                            <div class="form-group" style="margin-bottom: 16px;">
                                <label style="display:block; margin-bottom:6px; font-weight:600; font-size:0.85rem;">Card Accent Theme Color</label>
                                <div class="color-picker-group" style="display: flex; gap: 8px;">
                                    <button type="button" class="color-swatch" style="background: #6366f1; width: 26px; height: 26px; border-radius: 50%; border: 2px solid #fff; box-shadow:0 0 0 1px #cbd5e1; cursor: pointer;" onclick="localStorage.setItem('themeAccent','#6366f1'); alert('Accent configuration synced!');"></button>
                                    <button type="button" class="color-swatch" style="background: #10b981; width: 26px; height: 26px; border-radius: 50%; border: 2px solid #fff; box-shadow:0 0 0 1px #cbd5e1; cursor: pointer;" onclick="localStorage.setItem('themeAccent','#10b981'); alert('Accent configuration synced!');"></button>
                                    <button type="button" class="color-swatch" style="background: #f59e0b; width: 26px; height: 26px; border-radius: 50%; border: 2px solid #fff; box-shadow:0 0 0 1px #cbd5e1; cursor: pointer;" onclick="localStorage.setItem('themeAccent','#f59e0b'); alert('Accent configuration synced!');"></button>
                                    <button type="button" class="color-swatch" style="background: #f43f5e; width: 26px; height: 26px; border-radius: 50%; border: 2px solid #fff; box-shadow:0 0 0 1px #cbd5e1; cursor: pointer;" onclick="localStorage.setItem('themeAccent','#f43f5e'); alert('Accent configuration synced!');"></button>
                                </div>
                            </div>

                            <button type="button" class="btn btn-primary" style="width: 100%; margin-bottom:8px;" onclick="saveDashboardCustomizations()">Commit Workspace Changes</button>
                            <button type="button" class="btn btn-outline" style="width: 100%; font-size:0.85rem;" onclick="localStorage.removeItem('collectedBadges'); localStorage.removeItem('dashboardDisplayName'); localStorage.removeItem('dashboardDisplayEmail'); localStorage.removeItem('dashboardAvatarImg'); window.location.reload();">Reset Workspace Data</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <%-- DASHBOARD POPULATION DESERIALIZER RUNNER ENGINE --%>
    <script type="text/javascript">
        window.addEventListener('DOMContentLoaded', function () {
            // 1. Deserialization Routine for local user identity keys
            var savedName = localStorage.getItem('dashboardDisplayName') || "Zetty Adleena";
            var savedEmail = localStorage.getItem('dashboardDisplayEmail') || "zetty@mail.apu.edu.my";
            var savedAvatar = localStorage.getItem('dashboardAvatarImg') || "";

            // Populate the DOM text tags and editing fields instantly
            document.getElementById('dashAccountName').innerText = savedName;
            document.getElementById('dashAccountEmail').innerText = savedEmail;
            document.getElementById('editProfileNameInput').value = savedName;
            document.getElementById('editProfileEmailInput').value = savedEmail;

            // Render Avatar element based on structural availability
            var avatarDisplay = document.getElementById('dashAvatarDisplay');
            if (savedAvatar) {
                avatarDisplay.innerHTML = `<img src="${savedAvatar}" style="width:100%; height:100%; border-radius:50%; object-fit:cover;" />`;
            } else {
                avatarDisplay.innerHTML = "";
                avatarDisplay.innerText = savedName.charAt(0).toUpperCase();
            }

            // 2. Read saved badge array strings out of storage
            var rawBadges = localStorage.getItem('collectedBadges') || "";
            var badgeList = rawBadges ? rawBadges.split(',') : [];

            // Update stats
            document.getElementById('dashBadgeCountDisplay').innerText = badgeList.length;
            document.getElementById('dashPassedQuestions').innerText = badgeList.length * 3;

            var badgeTargetBox = document.getElementById('badgesGridDisplayContainer');

            if (badgeList.length === 0) {
                badgeTargetBox.innerHTML = `
                    <div style="grid-column: 1/-1; text-align:center; padding: 24px; border: 2px dashed #e2e8f0; border-radius:6px;">
                        <p style="color:var(--text-muted); font-size:0.9rem; margin:0;">No technical status badges collected yet. Complete validation tracks inside the Course Workspace to unlock components.</p>
                    </div>`;
                return;
            }

            // Loop and append custom badge card items dynamically to show off collected items
            var badgesHtml = "";
            badgeList.forEach(function (badgeName) {
                var colorAccent = "#6366f1";
                if (badgeName === "Power BI") colorAccent = "#f59e0b";
                if (badgeName === "Python") colorAccent = "#3b82f6";
                if (badgeName === "Java") colorAccent = "#ef4444";
                if (badgeName === "SQL") colorAccent = "#10b981";
                if (badgeName === "Advanced Excel") colorAccent = "#6b7280";

                badgesHtml += `
                    <div style="background:#f8fafc; border:1px solid #e2e8f0; border-radius:6px; padding:16px; text-align:center; box-shadow:0 1px 2px rgba(0,0,0,0.02);">
                        <div style="font-size:2.2rem; margin-bottom:6px;">🏅</div>
                        <strong style="display:block; font-size:0.85rem; color:#1a202c; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${badgeName}</strong>
                        <span style="display:inline-block; font-size:0.7rem; font-weight:700; color:#ffffff; background:${colorAccent}; padding:2px 6px; border-radius:4px; margin-top:6px; text-transform:uppercase;">Verified</span>
                    </div>
                `;
            });

            badgeTargetBox.innerHTML = badgesHtml;
        });

        // 3. Execution function to parse and update profile parameters
        function saveDashboardCustomizations() {
            var typedName = document.getElementById('editProfileNameInput').value.trim();
            var typedEmail = document.getElementById('editProfileEmailInput').value.trim();
            var fileInput = document.getElementById('editProfileAvatarFile');

            if (!typedName || !typedEmail) {
                alert("Profile customization fields cannot be left blank!");
                return;
            }

            // Set text parameter records immediately
            localStorage.setItem('dashboardDisplayName', typedName);
            localStorage.setItem('dashboardDisplayEmail', typedEmail);

            // Read the image file track if populated
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    localStorage.setItem('dashboardAvatarImg', e.target.result);
                    window.location.reload(); // Force refresh to sync layout frames
                };
                reader.readAsDataURL(fileInput.files[0]);
            } else {
                window.location.reload();
            }
        }
    </script>

</asp:Content>