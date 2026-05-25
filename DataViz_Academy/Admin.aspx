<%@ Page Title="Admin Control Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DataViz_Academy.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="adminView" class="app-view active-view">
        <h1>Admin Control Panel</h1>
        <p class="view-subtitle">[CRITICAL TRANSACTION DOMAIN] Configure multi-chapter curriculum nodes.</p>
        
        <%-- ACCESS VIOLATION BLOCK: Managed securely on the backend --%>
        <asp:Panel ID="pnlAdminGateLocked" runat="server" CssClass="admin-alert-gate" Visible="false">
            <h3>Access Privilege Violation</h3>
            <p style="margin-top: 8px; font-size: 0.95rem;">Please shift authorization tiers to Master Admin to pass this validator checkpoint.</p>
        </asp:Panel>
        
        <%-- AUTHORIZED UNLOCKED CONTAINER BLOCK --%>
        <asp:Panel ID="pnlAdminGateUnlocked" runat="server" Visible="false">
            <div class="card">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; flex-wrap: wrap; gap: 12px;">
                    <h3>Active Course Directory Repo</h3>
                    <%-- Note: If you want to use the course creation wizard form later, keep your custom button click or change to asp button --%>
                    <button type="button" class="btn btn-primary" onclick="initiateCourseWizard()">Launch Dynamic Course Wizard</button>
                </div>
                
                <div class="admin-table-container">
                    <%-- DYNAMIC GRID CONTAINER: Swapped out old plain html table body --%>
                    <asp:GridView ID="gvAdminCourses" runat="server" AutoGenerateColumns="False" CssClass="admin-table" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="CourseID" HeaderText="Content ID" />
                            <asp:BoundField DataField="Title" HeaderText="Resource Title" />
                            <asp:BoundField DataField="Domain" HeaderText="Topic Domain" />
                            <asp:BoundField DataField="ReadingLength" HeaderText="Reading Length" />
                            <asp:TemplateField HeaderText="System Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnDeleteCourse" runat="server" Text="Delete Node" CssClass="btn btn-outline" style="color:var(--danger); border-color:var(--danger); padding:4px 8px; font-size:0.8rem; margin:0; width:auto;" 
                                        OnClick="DeleteCourse_Click" CommandArgument='<%# Eval("CourseID") %>' OnClientClick="return confirm('Are you sure you want to delete this curriculum node?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align:center; padding:20px; color:var(--text-muted);">
                                No active course resources found inside the repository tracking database index.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            
            <%-- KEEPING WIZARD MODAL WORKSPACE STRUCTURE INTACCT --%>
            <div id="courseWizardModal" class="modal-backdrop" style="display: none;">
                <div class="modal-card">
                    <h3 id="wizardTitle">Course Deployment Matrix Engine</h3>
                    <p class="view-subtitle" style="margin-bottom:20px;">Populate operational parameter variables to manifest system curriculum schemas.</p>
                    
                    <div id="wizardStepMeta">
                        <div class="form-group">
                            <label>Content ID Key</label>
                            <input type="text" id="wizCourseId" class="form-control" placeholder="e.g. sql-basics">
                        </div>
                        <div class="form-group">
                            <label>Resource Node Title</label>
                            <input type="text" id="wizCourseTitle" class="form-control" placeholder="e.g. Master Structural Query Interface Syntax">
                        </div>
                        <div class="form-group">
                            <label>Topic Domain Category</label>
                            <input type="text" id="wizCourseDomain" class="form-control" placeholder="e.g. Database Systems Architecture">
                        </div>
                        <div class="form-group">
                            <label>Estimated Reading Scale Allocation</label>
                            <input type="text" id="wizCourseLength" class="form-control" placeholder="e.g. 45 Min Reading">
                        </div>
                        <button class="btn btn-primary" style="margin-top:16px;" onclick="advanceWizardToQuestions()">Configure Chapters & Validations &rarr;</button>
                    </div>

                    <div id="wizardStepQuestions" style="display: none;">
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap:16px;">
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
        </asp:Panel>
    </div>

</asp:Content>