<%@ Page Title="Interactive Assessment Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assessment.aspx.cs" Inherits="DataViz_Academy.Assessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="app-view active-view">
        <h1>Interactive Course Modules</h1>
        <p class="view-subtitle">Select an enterprise visualization track below to initialize your interactive learning sandbox.</p>

        <div id="courseCatalog" class="grid-matrix">
            </div>

        <div id="courseWorkspace" class="workspace-split-pane" style="display: none; grid-template-columns: 1fr 1fr; gap: 24px; margin-top: 20px;">
            
            <div class="card" style="padding: 24px; background: #ffffff; border: 1px solid var(--border-color); border-radius: 8px;">
                <div id="courseReadingMaterial" class="markdown-body">
                    </div>
                <button type="button" class="btn btn-secondary" style="margin-top: 24px;" onclick="closeCourseWorkspace()">&larr; Return to Catalog</button>
            </div>

            <div class="card" style="padding: 24px; background: #ffffff; border: 1px solid var(--border-color); border-radius: 8px; display: flex; flex-direction: column; justify-content: space-between;">
                <div id="courseAssessmentPane">
                    </div>
            </div>

        </div>
    </div>

</asp:Content>