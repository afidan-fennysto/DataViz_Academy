/* ==========================================================================
   GLOBAL RUNTIME SYSTEM STATE MEMORY STORAGE
   ========================================================================== */
const AppState = {
    currentUser: { role: 'guest', name: 'Guest User', email: '', avatarB64: '', accentColor: '#6366f1' },
    stats: { questionsAnswered: 0, badges: {} },
    courses: [
        { id: 'bar', title: 'Categorical Layout Structures via Bar Graphs', domain: 'Core Basics', length: '25 Min Reading', color: 'linear-gradient(135deg, #3b82f6, #1d4ed8)' },
        { id: 'scatter', title: 'Bivariate Distributions via Scatterplots', domain: 'Intermediate Correlation', length: '30 Min Reading', color: 'linear-gradient(135deg, #10b981, #047857)' },
        { id: 'powerbi', title: 'Enterprise Modeling in Power BI Architecture', domain: 'Business Intelligence', length: '35 Min Reading', color: 'linear-gradient(135deg, #f59e0b, #b45309)' },
        { id: 'tableau', title: 'Advanced Dashboard Design & LOD Expressions', domain: 'Executive Visuals', length: '40 Min Reading', color: 'linear-gradient(135deg, #8b5cf6, #6d28d9)' }
    ],
    posts: [
        {
            id: 1,
            author: 'Zetty Adleena',
            title: 'Color Palette Saturation Constraints',
            body: 'Excessive reliance on raw primary saturation thresholds breaks accessible reading scales and user validation pathways.',
            upvotes: 42,
            downvotes: 2,
            votedState: null, // 'up' or 'down' or null
            imgData: '',
            replies: [
                { id: 101, author: 'Alif', body: 'Agreed, high contrast balancing helps when checking multi-tiered star schemas.' }
            ]
        }
    ],
    activeCourseId: null,
    courseProgress: { bar: 0, scatter: 0, powerbi: 0, tableau: 0 },

    studentDatabaseRecords: [
        { name: "Alif", email: "tp068421@mail.apu.edu.my", activeInteractions: "Scatterplots, Power BI Matrix", passedItems: 4 },
        { name: "Aleeya", email: "tp071239@mail.apu.edu.my", activeInteractions: "Bar Graphs, Advanced Tableau Workbook", passedItems: 3 },
        { name: "Afi", email: "tp069554@mail.apu.edu.my", activeInteractions: "Power BI Data Engineering Architecture", passedItems: 2 },
        { name: "Guest Student Alpha", email: "guest-alpha@mail.apu.edu.my", activeInteractions: "Bar Graphs Operational Scale", passedItems: 1 }
    ]
};

const CourseRepositoryData = {
    bar: {
        title: "Categorical Layout Structures via Bar Graphs",
        content: `
            <h3>Chapter 1: Discrete Scale Allocations</h3>
            <p>Bar graphs map absolute numerical weights cleanly onto independent categoric bins. Unlike continuous metrics, individual bar channels require clear, explicit visual gaps to communicate isolation parameters and prevent structural clutter.</p>
            <h3>Chapter 2: Baseline Calibration Requirements</h3>
            <p>Truncating the quantitative grid baseline away from an exact zero benchmark represents a catastrophic distortion error. Artificially amplifying column height fragments the physical ratio proportions, leading to deceptive tracking trends.</p>
        `,
        questions: [
            { text: "What error pattern occurs when a bar baseline is raised artificially above zero?", options: { a: "Performance scaling values accelerate.", b: "Visual data ratios become skewed and misleading." }, correct: "b" },
            { text: "Why are explicit gaps necessary between categorical bar channels?", options: { a: "To establish a distinct visual boundary separating independent discrete points.", b: "To let trend parameters change line curves dynamically." }, correct: "a" }
        ]
    },
    scatter: {
        title: "Bivariate Distributions via Scatterplots",
        content: `
            <h3>Chapter 1: Spatial Grid Clustering</h3>
            <p>Scatterplots project raw multi-dimensional coordinate vectors across a continuous cartesian plain. Mapped density clusters highlight spatial correlations, outliers, and cluster anomalies without aggregating metadata variables prematurely.</p>
            <h3>Chapter 2: Decoupling Trend Fluctuations</h3>
            <p>Overlaying high-precision linear regression models reveals directional paths. Analysts must calculate coordinate distribution variance metrics explicitly to prevent confounding items from fabricating false correlation artifacts.</p>
        `,
        questions: [
            { text: "What trend vector is declared when coordinates step upward from left to right?", options: { a: "Positive Correlation Path.", b: "Inverse Axis Alignment." }, correct: "a" },
            { text: "What primary analytics feature is highlighted by preserving non-aggregated data points on a scatter matrix?", options: { a: "Instant identification of spatial clusters and outlier anomalies.", b: "Automatic baseline standard normalization thresholds." }, correct: "a" }
        ]
    },
    powerbi: {
        title: "Enterprise Modeling in Power BI Architecture",
        content: `
            <h3>Chapter 1: Dimensional Star Schemas</h3>
            <p>Enterprise data engineering dictates isolating factual transactional data variables inside narrow tables, while joining context keys outwards to independent dimensional fields. This relational blueprint drastically improves DAX calculation cycles.</p>
            <h3>Chapter 2: Context Evaluation Filters</h3>
            <p>Understanding Row Context and Filter Context transformations defines complex calculation reliability. Modifying data pathways explicitly via CALCULATE commands overrules active visualization slicer variables dynamically.</p>
        `,
        questions: [
            { text: "Which schema layout structure is optimal inside Power BI architecture environments?", options: { a: "Star Schema models isolating facts from dimensions.", b: "Bi-directional complex snowflake network mesh patterns." }, correct: "a" },
            { text: "Which DAX programmatic function allows engineers to override default visualization filters?", options: { a: "The CALCULATE expression override directive.", b: "The RELATED filtering append loop statement." }, correct: "a" }
        ]
    },
    tableau: {
        title: "Advanced Dashboard Design & LOD Expressions",
        content: `
            <h3>Chapter 1: Scoping Level of Detail (LOD)</h3>
            <p>Tableau workbook filters alter visualization context rows natively. Level of Detail statements provide advanced control parameters, allowing mathematical equations to run independent of viewport structural shelves.</p>
            <h3>Chapter 2: FIXED vs INCLUDE Operations</h3>
            <p>A FIXED evaluation parameter runs calculation operations entirely detached from dimension fields active on shelves, computing values directly against targeted database keys before structural sorting steps complete.</p>
        `,
        questions: [
            { text: "Which LOD configuration performs operations completely decoupled from shelf selections?", options: { a: "FIXED calculations model.", b: "EXCLUDE processing directives." }, correct: "a" },
            { text: "At what layer are FIXED LOD queries evaluated within the core Tableau context order of execution hierarchy?", options: { a: "Before standard Dimension filters are parsed and executed.", b: "After localized conditional measure filters are applied." }, correct: "a" }
        ]
    }
};

/* ==========================================================================
   APP LIFE CYCLE INITIALIZATION
   ========================================================================== */
document.addEventListener('DOMContentLoaded', () => {
    // Client-side visual viewports are initialised natively without link trapping
    if (document.getElementById('courseCatalog')) {
        renderCourseCatalog();
    }
    if (document.getElementById('forumPostContainer')) {
        renderForumFeedStack();
    }
});

function toggleAuthForms(showRegister) {
    document.getElementById('loginCard').style.display = showRegister ? 'none' : 'block';
    document.getElementById('registerCard').style.display = showRegister ? 'block' : 'none';

    // FIX: Enable/disable required on hidden fields so browser validation doesn't choke
    const regFields = document.querySelectorAll('#registerCard input');
    regFields.forEach(f => showRegister ? f.setAttribute('required', 'required') : f.removeAttribute('required'));

    const loginFields = document.querySelectorAll('#loginCard input');
    loginFields.forEach(f => showRegister ? f.removeAttribute('required') : f.setAttribute('required', 'required'));

    const backendErrorMsg = document.getElementById('loginGlobalError');
    if (backendErrorMsg) backendErrorMsg.style.display = 'none';
}

function navigateToDeveloperWeb(webUrl) {
    window.location.href = webUrl;
}

/* ==========================================================================
   REGISTERED USER DASHBOARD SELF-EDIT CUSTOMIZATION LABELS
   ========================================================================== */
function initProfileDashboard() {
    // Read local data or fall back to defaults
    var savedName = localStorage.getItem('dashboardDisplayName') || "Zetty Adleena";
    var savedEmail = localStorage.getItem('dashboardDisplayEmail') || "zetty@mail.apu.edu.my";
    var savedAvatar = localStorage.getItem('dashboardAvatarImg') || "";
    var savedAccent = localStorage.getItem('themeAccent') || "#6366f1";

    // Apply texts & fields
    if (document.getElementById('dashAccountName')) document.getElementById('dashAccountName').innerText = savedName;
    if (document.getElementById('dashAccountEmail')) document.getElementById('dashAccountEmail').innerText = savedEmail;
    if (document.getElementById('editProfileNameInput')) document.getElementById('editProfileNameInput').value = savedName;
    if (document.getElementById('editProfileEmailInput')) document.getElementById('editProfileEmailInput').value = savedEmail;

    // Apply Accent theme
    applyDashboardAccentStyles(savedAccent);

    // Dynamic Avatar Rendering
    var avatarDisplay = document.getElementById('dashAvatarDisplay');
    if (avatarDisplay) {
        if (savedAvatar) {
            avatarDisplay.innerHTML = `<img src="${savedAvatar}" style="width:100%; height:100%; border-radius:50%; object-fit:cover;" />`;
        } else {
            avatarDisplay.innerHTML = "";
            avatarDisplay.innerText = savedName.charAt(0).toUpperCase();
        }
    }

    // Process Badges Grid
    var rawBadges = localStorage.getItem('collectedBadges') || "";
    var badgeList = rawBadges ? rawBadges.split(',') : [];

    if (document.getElementById('dashBadgeCountDisplay')) document.getElementById('dashBadgeCountDisplay').innerText = badgeList.length;
    if (document.getElementById('dashPassedQuestions')) document.getElementById('dashPassedQuestions').innerText = badgeList.length * 3;

    var badgeTargetBox = document.getElementById('badgesGridDisplayContainer');
    if (badgeTargetBox) {
        if (badgeList.length === 0) {
            badgeTargetBox.innerHTML = `
                <div style="grid-column: 1/-1; text-align:center; padding: 24px; border: 2px dashed #e2e8f0; border-radius:6px;">
                    <p style="color:var(--text-muted); font-size:0.9rem; margin:0;">No technical status badges collected yet. Complete validation tracks inside the Course Workspace to unlock components.</p>
                </div>`;
            return;
        }

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
                </div>`;
        });
        badgeTargetBox.innerHTML = badgesHtml;
    }
}

function updateDashboardAccent(hexColor) {
    localStorage.setItem('themeAccent', hexColor);
    applyDashboardAccentStyles(hexColor);
}

function applyDashboardAccentStyles(hexColor) {
    const wrapper = document.getElementById('profileCardWrapper');
    if (wrapper) wrapper.style.borderTop = `4px solid ${hexColor}`;
    const avatar = document.getElementById('dashAvatarDisplay');
    if (avatar) avatar.style.backgroundColor = hexColor;
}

function saveDashboardCustomizations() {
    var typedName = document.getElementById('editProfileNameInput').value.trim();
    var typedEmail = document.getElementById('editProfileEmailInput').value.trim();
    var fileInput = document.getElementById('editProfileAvatarFile');

    if (!typedName || !typedEmail) {
        alert("Profile customization fields cannot be left blank!");
        return;
    }

    localStorage.setItem('dashboardDisplayName', typedName);
    localStorage.setItem('dashboardDisplayEmail', typedEmail);

    if (fileInput && fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            localStorage.setItem('dashboardAvatarImg', e.target.result);
            window.location.reload();
        };
        reader.readAsDataURL(fileInput.files[0]);
    } else {
        window.location.reload();
    }
}

function resetWorkspaceData() {
    localStorage.removeItem('collectedBadges');
    localStorage.removeItem('dashboardDisplayName');
    localStorage.removeItem('dashboardDisplayEmail');
    localStorage.removeItem('dashboardAvatarImg');
    localStorage.removeItem('themeAccent');
    window.location.reload();
}

/* ==========================================================================
   COURSES DIRECTORY MATRIX
   ========================================================================== */
function renderCourseCatalog() {
    const catalog = document.getElementById('courseCatalog');
    if (!catalog) return;
    catalog.innerHTML = '';

    AppState.courses.forEach(course => {
        const defaultGrad = 'linear-gradient(135deg, #475569, #1e293b)';
        const bgStyle = course.color ? course.color : defaultGrad;
        const card = document.createElement('div');
        card.className = 'card course-card';
        card.style.overflow = 'hidden';
        card.style.padding = '0';

        card.innerHTML = `
            <div style="background: ${bgStyle}; padding: 24px 20px; color: white; position: relative;">
                <div style="font-size: 0.75rem; background: rgba(255,255,255,0.2); padding: 4px 8px; border-radius: 4px; display: inline-block; margin-bottom: 8px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">
                    ${course.domain}
                </div>
                <h3 style="color: white; margin-bottom: 0; font-size: 1.25rem; line-height: 1.4; text-shadow: 0 2px 4px rgba(0,0,0,0.15);">${course.title}</h3>
                <div style="position: absolute; bottom: -10px; right: -10px; font-size: 4.5rem; opacity: 0.12; font-weight: 900; pointer-events: none; user-select: none;">
                    ${course.id.substring(0, 3).toUpperCase()}
                </div>
            </div>
            <div style="padding: 20px; display: flex; flex-direction: column; justify-content: space-between; flex-grow: 1; min-height: 140px;">
                <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 16px; line-height:1.5;">
                    Explore design layouts, systematic pipeline integrations, and core standard rules mapped natively. Length: ${course.length}.
                </p>
                <button type="button" class="btn btn-primary" style="width: 100%;" onclick="launchCourse('${course.id}')">Launch Material</button>
            </div>
        `;
        catalog.appendChild(card);
    });
}

function launchCourse(courseId) {
    AppState.activeCourseId = courseId;
    const details = CourseRepositoryData[courseId];

    document.getElementById('courseCatalog').style.display = 'none';
    document.getElementById('courseWorkspace').style.display = 'grid';

    document.getElementById('courseReadingMaterial').innerHTML = `
        <h2>${details.title}</h2>
        <hr style="margin: 16px 0; border: none; border-top: 1px solid var(--border-color);">
        ${details.content}
    `;
    renderAssessmentQuizBlock(courseId);
}

function renderAssessmentQuizBlock(courseId) {
    const targetPane = document.getElementById('courseAssessmentPane');
    if (!targetPane) return;

    if (!AppState.courseProgress[courseId]) {
        AppState.courseProgress[courseId] = 0;
    }

    const currentIdx = AppState.courseProgress[courseId];
    const moduleData = CourseRepositoryData[courseId];

    if (currentIdx >= moduleData.questions.length) {
        AppState.stats.badges[courseId] = true;
        targetPane.innerHTML = `
            <h4>Evaluation Passed</h4>
            <div class="inline-feedback success">All chapter checks approved. Certificate badge locked to your workspace hub dashboard.</div>
        `;
        return;
    }

    const currentQ = moduleData.questions[currentIdx];

    targetPane.innerHTML = `
        <h4>Module Checkpoint (${currentIdx + 1}/${moduleData.questions.length})</h4>
        <p style="font-size:0.9rem; margin-bottom:12px; margin-top:6px; font-weight: 600; color: var(--text-main);">${currentQ.text}</p>
        <form onsubmit="handleEvaluateQuiz(event, '${courseId}', ${currentIdx})">
            <label class="quiz-option"><input type="radio" name="quizAns" value="a" required> ${currentQ.options.a}</label>
            <label class="quiz-option"><input type="radio" name="quizAns" value="b"> ${currentQ.options.b}</label>
            <button type="submit" class="btn btn-primary" style="width:100%; margin-top:12px;">Submit Verification</button>
            <div id="quizFeedbackBox" class="inline-feedback" style="display:none;"></div>
        </form>
    `;
}

function handleEvaluateQuiz(event, courseId, questionIndex) {
    event.preventDefault();
    const chosen = document.querySelector('input[name="quizAns"]:checked').value;
    const feedbackBox = document.getElementById('quizFeedbackBox');
    const targetQ = CourseRepositoryData[courseId].questions[questionIndex];

    feedbackBox.className = 'inline-feedback';

    if (chosen === targetQ.correct) {
        feedbackBox.textContent = "Correct validation parameter. Refreshing core stack view...";
        feedbackBox.classList.add('success');
        feedbackBox.style.display = 'block';

        AppState.stats.questionsAnswered++;
        AppState.courseProgress[courseId]++;

        event.target.querySelector('button[type="submit"]').disabled = true;
        setTimeout(() => renderAssessmentQuizBlock(courseId), 1200);
    } else {
        feedbackBox.textContent = "Incorrect tracking rule matrix mismatch. Review reading patterns.";
        feedbackBox.classList.add('error');
        feedbackBox.style.display = 'block';
    }
}

function closeCourseWorkspace() {
    document.getElementById('courseCatalog').style.display = 'grid';
    document.getElementById('courseWorkspace').style.display = 'none';
    AppState.activeCourseId = null;
}

/* ==========================================================================
   FORUM MODAL POPUP, UPVOTE/DOWNVOTE, AND REPLY MATRIX ACTIONS
   ========================================================================== */
function openForumModal() {
    document.getElementById('forumCreatorModal').classList.add('active');
}

function closeForumModal() {
    document.getElementById('forumCreatorModal').classList.remove('active');
}

function executeForumVote(postId, action) {
    const post = AppState.posts.find(p => p.id === postId);
    if (!post) return;

    if (action === 'up') {
        if (post.votedState === 'up') {
            post.upvotes--;
            post.votedState = null;
        } else {
            if (post.votedState === 'down') post.downvotes--;
            post.upvotes++;
            post.votedState = 'up';
        }
    } else if (action === 'down') {
        if (post.votedState === 'down') {
            post.downvotes--;
            post.votedState = null;
        } else {
            if (post.votedState === 'up') post.upvotes--;
            post.downvotes++;
            post.votedState = 'down';
        }
    }
    renderForumFeedStack();
}

function renderForumFeedStack() {
    const container = document.getElementById('forumPostContainer');
    if (!container) return;
    container.innerHTML = '';

    [...AppState.posts].sort((m, n) => (n.upvotes - n.downvotes) - (m.upvotes - m.downvotes)).forEach(post => {
        let mediaMarkup = post.imgData ? `<div class="uploaded-media-frame"><img src="${post.imgData}" alt="Attached Graphic"></div>` : '';

        let repliesMarkup = '';
        post.replies.forEach(rep => {
            repliesMarkup += `
                <div style="background: #f8fafc; border-left: 3px solid #cbd5e1; padding: 10px 14px; margin-top: 8px; border-radius: 0 6px 6px 0; font-size: 0.88rem;">
                    <div style="font-weight:700; color:var(--text-main); font-size:0.8rem; margin-bottom:2px;">u/${rep.author}</div>
                    <div style="color: #475569;">${rep.body}</div>
                </div>
            `;
        });

        const item = document.createElement('div');
        item.className = 'forum-post';
        item.innerHTML = `
            <div class="upvote-column" style="width:48px; min-width:48px;">
                <button type="button" class="vote-btn ${post.votedState === 'up' ? 'upvoted' : ''}" onclick="executeForumVote(${post.id}, 'up')">▲</button>
                <span class="vote-count" style="font-weight:700; font-size:0.95rem; margin:2px 0; display:block; text-align:center; color:${(post.upvotes - post.downvotes) >= 0 ? 'var(--primary-accent)' : 'var(--danger)'}">
                    ${post.upvotes - post.downvotes}
                </span>
                <button type="button" class="vote-btn ${post.votedState === 'down' ? 'downvoted' : ''}" onclick="executeForumVote(${post.id}, 'down')" style="margin-top:2px;">▼</button>
            </div>
            <div class="post-main" style="flex-grow:1;">
                <div class="post-header">Posted by u/${post.author} • Upvotes: ${post.upvotes} | Downvotes: ${post.downvotes}</div>
                <div class="post-title">${post.title}</div>
                <div class="post-content" style="margin-bottom:12px;">${post.body}</div>
                ${mediaMarkup}
                
                <div class="replies-wrapper" style="margin-top:16px; border-top: 1px dashed var(--border-color); padding-top:10px;">
                    <h5 style="margin-bottom:6px; color:var(--text-muted); font-size:0.8rem; text-transform:uppercase; letter-spacing:0.5px;">Discussion Comments (${post.replies.length})</h5>
                    ${repliesMarkup}
                </div>
            </div>
        `;
        container.appendChild(item);
    });
}

/* ==========================================================================
   MODAL WINDOW GENERAL TOGGLES
   ========================================================================== */
function closeModal(id) {
    document.getElementById(id).classList.remove('active');
}
