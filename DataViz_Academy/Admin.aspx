<%@ Page Title="Admin Control Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DataViz_Academy.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="adminView" class="app-view active-view">
        <h1>Admin Control Panel</h1>
        <p class="view-subtitle">Configure modules.</p>
        
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
                </div>
                <asp:Button ID="wizardbtn" runat="server" CSSClass="btn btn-primary" Text="Launch Dynamic Course Wizard" OnClick="InitiateCourseWizard_Click" />
            </div>
                
         <div class="admin-table-container">
    
            <asp:GridView ID="gvAdminCourses" runat="server" AutoGenerateColumns="False" CssClass="admin-table" GridLines="None" Width="100%">
            <Columns>
                <asp:BoundField DataField="ModuleID" HeaderText="Module ID" />
            
                <asp:BoundField DataField="Title" HeaderText="Module Title" />
           
                <asp:BoundField DataField="Description" HeaderText="Module Description" />
            
                <asp:BoundField DataField="Category" HeaderText="Category" />

                <asp:BoundField DataField="ContentURL" HeaderText="Content URL" />
            
                <asp:TemplateField HeaderText="System Actions">

                <ItemTemplate>
                    <asp:Button ID="btnDeleteCourse" runat="server" Text="Delete Module" CssClass="btn btn-outline" style="color:var(--danger); border-color:var(--danger); padding:4px 8px; font-size:0.8rem; margin:0; width:auto;" 
                        OnClick="DeleteCourse_Click" CommandArgument='<%# Eval("ModuleID") %>' OnClientClick="return confirm('Are you sure you want to delete this curriculum node?');" />
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
            
            <div id="courseWizardModal" class="modal-backdrop" style="display: none;">
                <div class="modal-card">
                    <h3 id="wizardTitle">Course Deployment Matrix Engine</h3>
                    <p class="view-subtitle" style="margin-bottom:20px;">Populate operational parameter variables to manifest system curriculum schemas.</p>
                    
                    <div id="wizardStepMeta">
                        <div class="form-group">
                            <label>Module Key</label>
                            <input type="text" id="wizModuleId" class="form-control" placeholder="e.g. sql-basics">
                        </div>
                        <div class="form-group">
                            <label>Module Title</label>
                            <input type="text" id="wizModuleTitle" class="form-control" placeholder="e.g. Master Structural Query Interface Syntax">
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <input type="text" id="wizCategory" class="form-control" placeholder="e.g. Database Systems Architecture">
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" id="wizContentDesc" class="form-control" placeholder="e.g. A very simple module">
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" id="wizContentURL" class="form-control" placeholder="e.g. A very simple module">
                        </div>
                        <button type="button" class="btn btn-primary" style="margin-top:16px;" onclick="advanceWizardToQuestions()">Configure Chapters & Validations &rarr;</button>
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
                            <button type="button" class="btn btn-outline" onclick="regressWizardToMeta()">&larr; Back to Meta</button>
                            <button type="button" class="btn btn-primary" style="background-color: var(--success);" onclick="commitWizardCourseObject()">Deploy Dynamic Curriculum Node</button>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>

</asp:Content>