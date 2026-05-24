<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assessment.aspx.cs" Inherits="DataViz_Academy.Assessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="coursesView" class="app-view active-view">
            <h1>Course Modules</h1>
            <p class="view-subtitle">Interactive conceptual text linked directly with sandbox assessment criteria.</p>
            
            <div id="courseCatalog" class="course-grid">
                </div>
            
            <div id="courseWorkspace" class="course-viewer" style="display: none;">
                <div class="card reading-pane" id="courseReadingMaterial"></div>
                <div>
                    <div class="card" id="courseAssessmentPane"></div>
                    <button class="btn btn-outline" style="width: 100%;" onclick="closeCourseWorkspace()">Return to Catalog</button>
                </div>
            </div>
        </div>

</asp:Content>
