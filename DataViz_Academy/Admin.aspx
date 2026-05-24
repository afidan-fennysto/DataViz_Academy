<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DataViz_Academy.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="adminView" class="app-view active-view">
            <h1>Admin Control Panel</h1>
            <p class="view-subtitle">[CRITICAL TRANSACTION DOMAIN] Configure multi-chapter curriculum nodes.</p>
            <div id="adminGateLocked" class="admin-alert-gate"><h3>Access Privilege Violation</h3><p style="margin-top: 8px; font-size: 0.95rem;">Please shift authorization tiers to Master Admin to pass this validator checkpoint.</p></div>
            
            <div id="adminGateUnlocked" style="display: none;">
                <div class="card">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; flex-wrap: wrap; gap: 12px;">
                        <h3>Active Course Directory Repo</h3>
                        <button class="btn btn-primary" onclick="initiateCourseWizard()">Launch Dynamic Course Wizard</button>
                    </div>
                    <div class="admin-table-container">
                        <table class="admin-table">
                            <thead><tr><th>Content ID</th><th>Resource Title</th><th>Topic Domain</th><th>Reading Length</th><th>System Actions</th></tr></thead>
                            <tbody id="adminResourceTableBody"></tbody>
                        </table>
                    </div>
                </div>

                <div class="card" id="adminWizardContainer" style="display: none; border-top: 4px solid var(--primary-accent);">
                    <div id="wizardStep1">
                        <h3 style="margin-bottom: 4px;">Course Wizard: Step 1 (Core Meta Data)</h3>
                        <p style="color:var(--text-muted); font-size:0.85rem; margin-bottom:20px;">Declare parent structural fields before generating child chapter configurations.</p>
                        <div class="form-group">
                            <label>Course Title Mapping</label>
                            <input type="text" id="wizTitle" class="form-control" placeholder="e.g. Advanced Neural Visualization Matrix">
                        </div>
                        <div class="form-group">
                            <label>Topic Domain Group</label>
                            <input type="text" id="wizDomain" class="form-control" placeholder="e.g. Deep Learning Analytics">
                        </div>
                        <div class="form-group">
                            <label>Reading Length Metric</label>
                            <input type="text" id="wizLength" class="form-control" placeholder="e.g. 45 Min Reading">
                        </div>
                        <div style="display: flex; justify-content: flex-end; gap: 10px; margin-top:20px;">
                            <button class="btn btn-outline" onclick="cancelWizard()">Cancel Wizard</button>
                            <button class="btn btn-primary" onclick="advanceWizardToChapters()">Next: Configure Chapters & Questions &rarr;</button>
                        </div>
                    </div>

                    <div id="wizardStep2" style="display: none;">
                        <h3 style="margin-bottom: 4px;">Course Wizard: Step 2 (Curriculum & Evaluation Architecture)</h3>
                        <p style="color:var(--text-muted); font-size:0.85rem; margin-bottom:20px;">Define structural bounds for sub-chapters and build evaluation questions instantly.</p>
                        
                        <div class="grid-3" style="margin-bottom: 20px;">
                            <div class="form-group">
                                <label>Number of Chapters</label>
                                <input type="number" id="wizChapterCount" class="form-control" value="1" min="1" max="5" onchange="generateWizardFormMatrix()">
                            </div>
                            <div class="form-group">
                                <label>Questions Per Chapter</label>
                                <input type="number" id="wizQuestionsPerChapter" class="form-control" value="1" min="1" max="3" onchange="generateWizardFormMatrix()">
                            </div>
                            <div class="form-group">
                                <label>Default Evaluation Type</label>
                                <select id="wizQuestionType" class="form-control">
                                    <option value="boolean">Binary Choice Checkpoint (True/False)</option>
                                    <option value="mcq">Standard Technical Multiple Choice (A/B)</option>
                                </select>
                            </div>
                        </div>

                        <div id="wizardDynamicInputsContainer" style="margin-top: 16px;"></div>

                        <div style="display: flex; justify-content: space-between; gap: 10px; margin-top:30px; border-top: 1px solid var(--border-color); padding-top: 20px;">
                            <button class="btn btn-outline" onclick="regressWizardToMeta()">&larr; Back to Meta</button>
                            <button class="btn btn-primary" style="background-color: var(--success);" onclick="commitWizardCourseObject()">Deploy Dynamic Curriculum Node</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>

</asp:Content>