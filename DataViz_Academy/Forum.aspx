<%@ Page Title="Community Hub Forum" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="DataViz_Academy.Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .forum-header {
            display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; flex-wrap: wrap; gap: 12px;
        }
        .forum-grid {
            display: grid; grid-template-columns: 2fr 1fr; gap: 24px;
        }
        .forum-card {
            background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 20px; margin-bottom: 16px; box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        
        /* Interactive Vote Panel */
        .vote-panel {
            text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: flex-start; min-width: 40px;
        }
        .vote-btn {
            background: none; border: none; font-size: 1.2rem; cursor: pointer; color: #a0aec0; transition: transform 0.1s, color 0.2s;
        }
        .vote-btn:hover { transform: scale(1.2); }
        .vote-btn.upvoted { color: #3182ce; font-weight: bold; }
        .vote-btn.downvoted { color: #e53e3e; font-weight: bold; }
        .vote-count { font-weight: bold; margin: 4px 0; color: #2d3748; }
        
        /* Comment Feed UI */
        .comments-section { margin-top: 16px; padding-top: 16px; border-top: 1px solid #edf2f7; }
        .comment-feed { margin-bottom: 12px; }
        .comment-item { background: #f7fafc; padding: 12px; border-radius: 6px; border-left: 3px solid #cbd5e1; margin-bottom: 8px; }
        
        /* Interactive Comment Input Area */
        .comment-input-group { display: flex; gap: 8px; margin-top: 12px; }
        .comment-txt { 
            flex-grow: 1; padding: 8px 12px; border-radius: 6px; border: 1px solid #cbd5e1; font-size: 0.85rem; box-sizing: border-box; resize: none;
        }
        .comment-txt:focus { border-color: #3182ce; outline: none; }
        .comment-btn { padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; cursor: pointer; }

        /* Modal Layout Window Styling */
        .ui-modal {
            display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; 
            background-color: rgba(0,0,0,0.4); align-items: center; justify-content: center; backdrop-filter: blur(2px);
        }
        .ui-modal.active { display: flex; }
        .ui-modal-content { 
            background: #ffffff; padding: 24px; border-radius: 8px; width: 100%; max-width: 500px; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.1); border: 1px solid #e2e8f0;
        }
        .ui-form-group { margin-bottom: 16px; }
        .ui-form-group label { display: block; margin-bottom: 6px; font-weight: 600; font-size: 0.9rem; }
        .ui-input { 
            width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid #cbd5e1; font-size: 0.95rem; box-sizing: border-box;
        }
    </style>

    <div id="forumView" class="app-view active-view">
        
        <%-- FORUM UI HEADER PANEL --%>
        <div class="forum-header">
            <div>
                <h1>Community Hub Forum</h1>
                <p class="view-subtitle">Upvote technical threads, discuss algorithms, and upload data visualization imagery.</p>
            </div>
            <button type="button" id="forumTriggerBtn" class="btn btn-primary" onclick="handleCreatePostClick()">+ Create New Discussion Thread</button>
        </div>

        <%-- MAIN LAYOUT GRID FRAME --%>
        <div class="forum-grid">
            
            <%-- LEFT COLUMN: LIVE THREAD LIST LAYOUT ROWS --%>
            <div id="forumPostList">
                
                <div class="forum-card" style="display: flex; gap: 16px;">
                    <%-- Reddit-Style Upvote Interface Track --%>
                    <div class="vote-panel">
                        <button type="button" class="vote-btn" onclick="handleUiVote(this, 'up')">▲</button>
                        <span class="vote-count">40</span>
                        <button type="button" class="vote-btn" onclick="handleUiVote(this, 'down')">▼</button>
                    </div>
                    
                    <div style="flex-grow: 1;">
                        <span style="font-size: 0.8rem; color: #718096;">Posted by u/Zetty Adleena • 3 days ago</span>
                        <h3 style="margin: 4px 0 8px 0; color: #1a202c;">Color Palette Saturation Constraints</h3>
                        <p style="color: #4a5568; line-height: 1.5; margin-bottom: 12px;">Excessive reliance on raw primary saturation thresholds breaks accessible reading scales and user validation pathways.</p>
                        
                        <%-- Comments Section Wrapper Grid --%>
                        <div class="comments-section">
                            <h5 style="margin-bottom: 8px; color: #718096; font-size: 0.85rem;">DISCUSSION COMMENTS</h5>
                            
                            <%-- Nested Comment Stream Target Box --%>
                            <div class="comment-feed">
                                <div class="comment-item">
                                    <strong style="font-size: 0.85rem; color: #2d3748;">u/Alif</strong>
                                    <p style="margin: 2px 0 0 0; font-size: 0.85rem; color: #4a5568;">Agreed, high contrast balancing helps when checking multi-tiered star schemas.</p>
                                </div>
                            </div>

                            <%-- Interactive Direct Reply Box --%>
                            <div class="comment-input-group">
                                <textarea class="comment-txt" rows="1" placeholder="Add to the discussion..."></textarea>
                                <button type="button" class="btn btn-primary comment-btn" onclick="handleUiCommentSubmit(this)">Reply</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            
            <%-- RIGHT COLUMN: SIDEBAR GUIDELINES BOX --%>
            <div>
                <div class="forum-card">
                    <h4 style="margin-bottom: 12px; color: #1a202c;">Community Guidelines</h4>
                    <p style="font-size: 0.9rem; color: #4a5568; line-height: 1.6; margin: 0;">
                        1. Label your axes before publishing links.<br />
                        2. Restrain raw primary saturation tiers.<br />
                        3. Keep queries constructive.
                    </p>
                </div>
            </div>

        </div>
    </div>

    <%-- POPUP MODAL TEMPLATE DIALOG FRAME --%>
    <div id="createPostModal" class="ui-modal">
        <div class="ui-modal-content">
            <h3 style="margin-bottom: 16px; color: #1a202c;">Create New Thread</h3>
            
            <div class="ui-form-group">
                <label>Thread Title</label>
                <input type="text" id="modalTitleInput" class="ui-input" placeholder="What's your analytics discovery?" />
            </div>
            
            <div class="ui-form-group">
                <label>Content Description</label>
                <textarea id="modalContentInput" class="ui-input" rows="4" placeholder="Provide detailed parameters, metrics, or algorithmic notes..." style="font-family: inherit; resize: none;"></textarea>
            </div>
            
            <div class="ui-form-group">
                <label>Upload Visualization Imagery</label>
                <input type="file" id="modalImageInput" accept="image/*" style="display: block; font-size: 0.85rem;" />
            </div>
            
            <div style="display: flex; justify-content: flex-end; gap: 8px; margin-top: 24px;">
                <button type="button" class="btn btn-secondary" onclick="hideCreatePostModal()" style="padding: 8px 16px; border-radius: 6px;">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="submitUiPostMockup()" style="padding: 8px 16px; border-radius: 6px;">Publish Thread</button>
            </div>
        </div>
    </div>

    <%-- FRONT-END INTERACTIVE MOCKUP LOGIC ENGINE --%>
    <script type="text/javascript">
        // Helper function to check if the current user is a guest looking at the sidebar indicator
        function isUserGuest() {
            var isLoggedIn = localStorage.getItem('userLoggedIn');
            if (isLoggedIn === 'true') {
                return false; // They are logged in, so they are NOT a guest!
            }
            return true; // Lock actions if they haven't signed in yet
        }

        function handleCreatePostClick() {
            if (isUserGuest()) {
                alert('🔒 Guest access is read-only. Please log in to publish a community thread.');
                return;
            }
            document.getElementById('createPostModal').classList.add('active');
        }

        function showCreatePostModal() {
            handleCreatePostClick();
        }

        function hideCreatePostModal() {
            document.getElementById('createPostModal').classList.remove('active');
            document.getElementById('modalTitleInput').value = '';
            document.getElementById('modalContentInput').value = '';
            document.getElementById('modalImageInput').value = '';
        }

        /* FIXED UI Voting Routine Engine (Corrected Math Bug & Added Guest Block) */
        function handleUiVote(buttonElement, direction) {
            if (isUserGuest()) {
                alert('🔒 Guest access is read-only. Please log in to react or vote on threads.');
                return;
            }

            var votePanel = buttonElement.parentElement;
            var countSpan = votePanel.querySelector('.vote-count');

            // Base score parsing (always safe integer values)
            if (!votePanel.hasAttribute('data-base-votes')) {
                votePanel.setAttribute('data-base-votes', countSpan.innerText);
            }
            var baseVotes = parseInt(votePanel.getAttribute('data-base-votes'));

            var upBtn = votePanel.querySelectorAll('.vote-btn')[0];
            var downBtn = votePanel.querySelectorAll('.vote-btn')[1];

            if (direction === 'up') {
                if (upBtn.classList.contains('upvoted')) {
                    upBtn.classList.remove('upvoted');
                    countSpan.innerText = baseVotes;
                } else {
                    upBtn.classList.add('upvoted');
                    downBtn.classList.remove('downvoted');
                    countSpan.innerText = baseVotes + 1;
                }
            } else if (direction === 'down') {
                if (downBtn.classList.contains('downvoted')) {
                    downBtn.classList.remove('downvoted');
                    countSpan.innerText = baseVotes;
                } else {
                    downBtn.classList.add('downvoted');
                    upBtn.classList.remove('upvoted');
                    countSpan.innerText = baseVotes - 1;
                }
            }
        }

        /* Pure UI Comment Injection Routine (With Guest Block) */
        function handleUiCommentSubmit(buttonBtn) {
            if (isUserGuest()) {
                alert('🔒 Guest access is read-only. Please log in to participate in the comments.');
                return;
            }

            var inputGroup = buttonBtn.parentElement;
            var textInput = inputGroup.querySelector('.comment-txt');
            var commentText = textInput.value.trim();

            if (!commentText) {
                alert('Please type a comment response parameter before replying!');
                return;
            }

            var feedBox = inputGroup.parentElement.querySelector('.comment-feed');

            var commentHtml = `
                <div class="comment-item" style="animation: fadeIn 0.3s ease;">
                    <strong style="font-size: 0.85rem; color: #2d3748;">u/RegisteredStudent</strong>
                    <p style="margin: 2px 0 0 0; font-size: 0.85rem; color: #4a5568;">${commentText}</p>
                </div>
            `;

            feedBox.insertAdjacentHTML('beforeend', commentHtml);
            textInput.value = '';
        }

        /* Thread Deployment Routine */
        function submitUiPostMockup() {
            var title = document.getElementById('modalTitleInput').value;
            var content = document.getElementById('modalContentInput').value;
            var imageFile = document.getElementById('modalImageInput').files[0];

            if (!title || !content) {
                alert('Please fill out both the Title and Content spaces!');
                return;
            }

            var imageHtml = '';
            if (imageFile) {
                var imageUrl = URL.createObjectURL(imageFile);
                imageHtml = '<img src="' + imageUrl + '" style="max-width:100%; height:auto; border-radius:6px; margin-top:12px; display:block;" />';
            }

            var newPostCard = `
                <div class="forum-card" style="display: flex; gap: 16px; animation: fadeIn 0.4s ease;">
                    <div class="vote-panel">
                        <button type="button" class="vote-btn" onclick="handleUiVote(this, 'up')">▲</button>
                        <span class="vote-count">0</span>
                        <button type="button" class="vote-btn" onclick="handleUiVote(this, 'down')">▼</button>
                    </div>
                    <div style="flex-grow: 1;">
                        <span style="font-size: 0.8rem; color: #718096;">Posted by u/RegisteredStudent • Just now</span>
                        <h3 style="margin: 4px 0 8px 0; color: #1a202c;">${title}</h3>
                        <p style="color: #4a5568; line-height: 1.5; margin-bottom: 12px;">${content}</p>
                        ${imageHtml}
                        <div class="comments-section">
                            <h5 style="margin-bottom: 8px; color: #718096; font-size: 0.85rem;">DISCUSSION COMMENTS</h5>
                            <div class="comment-feed"></div>
                            <div class="comment-input-group">
                                <textarea class="comment-txt" rows="1" placeholder="Add to the discussion..."></textarea>
                                <button type="button" class="btn btn-primary comment-btn" onclick="handleUiCommentSubmit(this)">Reply</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            var container = document.getElementById('forumPostList');
            container.insertAdjacentHTML('afterbegin', newPostCard);
            hideCreatePostModal();
        }
    </script>

</asp:Content>