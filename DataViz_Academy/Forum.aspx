<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="DataViz_Academy.Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="forumView" class="app-view active-view">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; flex-wrap: wrap; gap: 12px;">
                <div>
                    <h1>Community Hub Forum</h1>
                    <p class="view-subtitle">Upvote technical threads, discuss algorithms, and upload data visualization imagery.</p>
                </div>
                <button id="forumTriggerBtn" class="btn btn-primary" onclick="openForumModal()" style="display: none;">+ Create New Discussion Thread</button>
            </div>

            <div class="forum-layout">
                <div>
                    <div id="forumLockedNotice" class="card" style="display: none;">
                        <p style="text-align: center; color: var(--text-muted);">Guest access is read-only. Please log in to publish a community thread.</p>
                    </div>
                    <div id="forumPostContainer"></div>
                </div>
                <div>
                    <div class="card">
                        <h4 style="margin-bottom: 8px;">Community Guidelines</h4>
                        <p style="font-size: 0.9rem; color: var(--text-muted); line-height: 1.4;">1. Label your axes before publishing links.<br>2. Restrain raw primary saturation tiers.<br>3. Keep queries constructive.</p>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
