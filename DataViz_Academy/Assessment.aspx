<%@ Page Title="Interactive Course Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assessment.aspx.cs" Inherits="DataViz_Academy.Assessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Matrix Grid Layout Configurations */
        .catalog-grid-matrix {
            display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 24px; margin-top: 20px;
        }
        .course-matrix-card {
            background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05); transition: transform 0.2s, box-shadow 0.2s;
            display: flex; flex-direction: column; justify-content: space-between;
        }
        .course-matrix-card:hover { transform: translateY(-4px); box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05); }
        .course-card-banner { height: 120px; padding: 20px; color: #ffffff; display: flex; flex-direction: column; justify-content: space-between; }
        .course-card-body { padding: 20px; flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between; }
        
        /* Interactive Choice Card Radio Elements */
        .quiz-choice-label {
            display: block; background: #ffffff; border: 1px solid #cbd5e1; border-radius: 6px;
            padding: 12px 16px; margin-bottom: 10px; font-size: 0.9rem; cursor: pointer; transition: all 0.2s ease;
        }
        .quiz-choice-label:hover { border-color: #6366f1; background: #f8fafc; }
        .quiz-choice-label input { margin-right: 10px; }
        
        /* Interactive Inline Feedback Banners */
        .feedback-box { display: none; padding: 12px 16px; border-radius: 6px; margin-top: 16px; font-size: 0.875rem; font-weight: 500; animation: fadeIn 0.2s ease; }
        .feedback-box.wrong { display: block; background: #fef2f2; border: 1px solid #fee2e2; color: #b91c1c; }
        .feedback-box.right { display: block; background: #f0fdf4; border: 1px solid #dcfce7; color: #15803d; }

        /* General Lock Shield Overlay Style Rules */
        .evaluation-gate-lock-mask {
            display: none; position: absolute; top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(4px); z-index: 100;
            flex-direction: column; align-items: center; justify-content: center; text-align: center;
            padding: 24px; border-radius: 8px; border: 1px solid #e2e8f0;
        }
        .evaluation-gate-lock-mask.active { display: flex; }
        .evaluation-gate-lock-mask.hidden { display: none !important; }
    </style>

    <div id="coursesView" class="app-view active-view" style="position: relative;">
        
        <%-- AUTHENTICATION GATE LOCK SHIELD OVERLAY --%>
        <div id="quizUiLockShield" class="evaluation-gate-lock-mask">
            <h3 style="margin-bottom: 8px; font-size: 1.25rem; font-weight: 700; color: #1a202c;">🔒 Authentication Signature Required</h3>
            <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 20px; max-width: 340px; line-height: 1.5;">
                Interactive sandbox checkpoints and certificate badge accrual tracks are locked for guest users. Please access an account parameters profile to enroll.
            </p>
            <button type="button" class="btn btn-primary" onclick="window.location.href='Auth.aspx';">Navigate to Login Portal</button>
        </div>

        <%-- SECTION 1: SYSTEM COURSE CATALOG MATRIX TRACK (Displayed first upon login) --%>
        <div id="courseCatalogSection">
            <h1>Interactive Course Modules</h1>
            <p class="view-subtitle">Select and enroll in technical curriculum disciplines to run sandbox evaluations and earn dashboard validation badges.</p>
            
            <div class="catalog-grid-matrix">
                <div class="course-matrix-card">
                    <div class="course-card-banner" style="background: linear-gradient(135deg, #f59e0b, #d97706);">
                        <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background: rgba(255,255,255,0.2); padding: 2px 6px; border-radius: 4px; align-self: flex-start;">Data Visualization</span>
                        <h2 style="font-size: 1.35rem; font-weight: 700; margin: 0;">Power BI Analytics</h2>
                    </div>
                    <div class="course-card-body">
                        <p style="color: #4a5568; font-size: 0.875rem; line-height: 1.5; margin-bottom: 16px;">Master core star-schemas, high-performance DAX aggregation metrics, and relational dashboard publishing workflows.</p>
                        <button type="button" class="btn btn-primary" style="width: 100%;" onclick="enrollInCourse('Power BI')">Enroll & Open Workspace</button>
                    </div>
                </div>

                <div class="course-matrix-card">
                    <div class="course-card-banner" style="background: linear-gradient(135deg, #3b82f6, #1d4ed8);">
                        <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background: rgba(255,255,255,0.2); padding: 2px 6px; border-radius: 4px; align-self: flex-start;">Data Engineering</span>
                        <h2 style="font-size: 1.35rem; font-weight: 700; margin: 0;">Python Data Basics</h2>
                    </div>
                    <div class="course-card-body">
                        <p style="color: #4a5568; font-size: 0.875rem; line-height: 1.5; margin-bottom: 16px;">Manipulate analytical array vectors through Pandas dataframes, structure loops, and execute exploratory scripts.</p>
                        <button type="button" class="btn btn-primary" style="width: 100%;" onclick="enrollInCourse('Python')">Enroll & Open Workspace</button>
                    </div>
                </div>

                <div class="course-matrix-card">
                    <div class="course-card-banner" style="background: linear-gradient(135deg, #ef4444, #b91c1c);">
                        <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background: rgba(255,255,255,0.2); padding: 2px 6px; border-radius: 4px; align-self: flex-start;">Software Systems</span>
                        <h2 style="font-size: 1.35rem; font-weight: 700; margin: 0;">Java Architecture</h2>
                    </div>
                    <div class="course-card-body">
                        <p style="color: #4a5568; font-size: 0.875rem; line-height: 1.5; margin-bottom: 16px;">Construct object-oriented engineering structures, manage typed data matrices, and map memory handling paths.</p>
                        <button type="button" class="btn btn-primary" style="width: 100%;" onclick="enrollInCourse('Java')">Enroll & Open Workspace</button>
                    </div>
                </div>

                <div class="course-matrix-card">
                    <div class="course-card-banner" style="background: linear-gradient(135deg, #10b981, #047857);">
                        <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background: rgba(255,255,255,0.2); padding: 2px 6px; border-radius: 4px; align-self: flex-start;">Database Engineering</span>
                        <h2 style="font-size: 1.35rem; font-weight: 700; margin: 0;">SQL Structured Querying</h2>
                    </div>
                    <div class="course-card-body">
                        <p style="color: #4a5568; font-size: 0.875rem; line-height: 1.5; margin-bottom: 16px;">Build scalable multi-tier relational joins, index keys, partition sets, and parse structured schema sets.</p>
                        <button type="button" class="btn btn-primary" style="width: 100%;" onclick="enrollInCourse('SQL')">Enroll & Open Workspace</button>
                    </div>
                </div>

                <div class="course-matrix-card">
                    <div class="course-card-banner" style="background: linear-gradient(135deg, #6b7280, #374151);">
                        <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background: rgba(255,255,255,0.2); padding: 2px 6px; border-radius: 4px; align-self: flex-start;">Business Intelligence</span>
                        <h2 style="font-size: 1.35rem; font-weight: 700; margin: 0;">Advanced Excel Hub</h2>
                    </div>
                    <div class="course-card-body">
                        <p style="color: #4a5568; font-size: 0.875rem; line-height: 1.5; margin-bottom: 16px;">Deploy logical matrix formulas, cross-reference data lookup metrics, and build interactive pivot arrays.</p>
                        <button type="button" class="btn btn-primary" style="width: 100%;" onclick="enrollInCourse('Advanced Excel')">Enroll & Open Workspace</button>
                    </div>
                </div>
            </div>
        </div>

        <%-- SECTION 2: LIVE WORKSPACE PANE (Hidden until an active enrollment click registers) --%>
        <div id="courseWorkspaceSection" style="display: none; grid-template-columns: 2fr 1fr; gap: 24px; margin-top: 10px;">
            
            <%-- LEFT SIDE: READING CURRICULUM TEXT COLUMN --%>
            <div class="card reading-pane" style="padding: 24px; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px;">
                <h2 id="uiActiveCourseTitle" style="color: #6366f1; font-size: 0.9rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 4px;">CURRENT COURSE UNIT</h2>
                <h1 id="uiChapterHeading" style="margin: 0 0 20px 0; font-size: 1.75rem; color: #1a202c; font-weight: 700;">Loading Chapter Header...</h1>
                <hr style="border:0; border-top: 1px solid #edf2f7; margin-bottom: 20px;" />
                <div id="uiChapterBody" style="line-height: 1.6; color: #2d3748;"></div>
            </div>
            
            <%-- RIGHT SIDE: EVALUATION CHECKPOINT PROMPT & INLINE RESULT BOXES --%>
            <div>
                <div class="card" style="padding: 20px; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; min-height: 320px; display: flex; flex-direction: column; justify-content: space-between;">
                    <div>
                        <h5 id="uiQuizProgress" style="font-size: 0.8rem; color: #718096; margin-bottom: 6px; text-transform: uppercase; font-weight: 600; letter-spacing: 0.05em;">Progress Tracker</h5>
                        <p id="uiQuizQuestion" style="font-size: 1rem; font-weight: 600; color: #1a202c; margin-bottom: 16px; line-height: 1.4;">Loading Question Prompt...</p>
                        
                        <%-- Radio Input Injection Point --%>
                        <div id="uiQuizChoicesContainer"></div>
                        
                        <%-- INLINE FEEDBACK BANNER OVERRIDES (Replaces old popups) --%>
                        <div id="uiFeedbackBanner" class="feedback-box"></div>
                    </div>
                    
                    <div style="margin-top: 20px;">
                        <button type="button" id="btnSubmitQuizStep" class="btn btn-primary" style="width: 100%;" onclick="evaluateUiQuizStep()">Submit Verification</button>
                    </div>
                </div>
                
                <button type="button" class="btn btn-outline" style="width: 100%; margin-top: 12px;" onclick="exitWorkspaceToCatalog()">← Rescind & Leave Workspace</button>
            </div>
        </div>

    </div>

    <%-- MULTI-COURSE END-TO-END DATA STRUCTURING ARCHITECTURE SCRIPT --%>
    <script type="text/javascript">
        // Global master curriculum database containing 3 full quiz/chapter pairs for each of the 5 matrix entities
        var universalCurriculum = {
            "Power BI": [
                {
                    heading: "DAX Evaluation Context Operations",
                    content: "<h3>Chapter 1: Calculate Filter Topologies</h3><p>Power BI evaluates measures using Row Context and Filter Context. The <code>CALCULATE()</code> statement serves as the core pipeline modifier, intercepting ambient query dimensions and layering new logical constraints across related entities before computation structures initialize.</p>",
                    progress: "Power BI Checkpoint (1/3)",
                    question: "What primary task does the CALCULATE function perform inside a DAX expression engine?",
                    choices: ["It forces an incremental calculation sweep over flat sequential text sheets.", "It intercepts, overrides, and alters the active evaluation Filter Context."],
                    correctIndex: 1
                },
                {
                    heading: "Star-Schema Optimization Patterns",
                    content: "<h3>Chapter 2: Fact vs Dimension Join Cardinality</h3><p>Structuring clean star-schemas minimizes memory foot-printing. Fact tables capture transactional quantitative logs, which link outward to specialized Dimension arrays using strict 1-to-many relationship structures to eliminate redundant cross-filtering overhead loops.</p>",
                    progress: "Power BI Checkpoint (2/3)",
                    question: "Which relational configuration pattern yields optimal query performance tracking inside Power BI dashboards?",
                    choices: ["A normalized Star-Schema with clear Fact and Dimension separations.", "A singular massive flat matrix sheet that clumps data parameters together."],
                    correctIndex: 0
                },
                {
                    heading: "DirectQuery Performance Latencies",
                    content: "<h3>Chapter 3: Connection String Threshold Routing</h3><p>DirectQuery routes analytics computations straight to source database servers. While it scales live tracking parameters cleanly, it bypasses the high-speed xVelocity storage engine, meaning performance becomes strictly throttled by source server processing limits.</p>",
                    progress: "Power BI Checkpoint (3/3)",
                    question: "Where do calculation operations occur when a report workspace uses DirectQuery configuration?",
                    choices: ["Directly on the hosting back-end source database server structure.", "Inside the client device's local internal operational RAM allocation track."],
                    correctIndex: 0
                }
            ],
            "Python": [
                {
                    heading: "Pandas Dataframe Manipulations",
                    content: "<h3>Chapter 1: Axis Index Segmentation</h3><p>Python parses tabular matrices using the Pandas library. Utilizing the <code>.loc[]</code> and <code>.iloc[]</code> methods allows data engineers to slice through records based on absolute matching parameter handles or base integer positional values along axis layout coordinates.</p>",
                    progress: "Python Checkpoint (1/3)",
                    question: "What distinguishing mechanism separates the .loc and .iloc attributes during indexing?",
                    choices: [".loc uses absolute label indices, while .iloc queries structural positional integers.", ".loc forces automatic numeric sorting patterns, while .iloc parses variable strings."],
                    correctIndex: 0
                },
                {
                    heading: "Vectorized Vector Optimization Operations",
                    content: "<h3>Chapter 2: Bypassing Standard Iteration Loops</h3><p>Relying on standard looping blocks like <code>for</code> statements slows down execution. Utilizing native vectorized matrix math allows calculations to run simultaneously on all rows via underlying C execution modules, increasing optimization parameters tenfold.</p>",
                    progress: "Python Checkpoint (2/3)",
                    question: "Why should a data analyst prioritize vectorized pandas structures over regular iteration blocks?",
                    choices: ["Vectorized workflows isolate data arrays in text files safely.", "They apply operations simultaneously to entire arrays, boosting computation speed."],
                    correctIndex: 1
                },
                {
                    heading: "Handling Missing Value Parameters",
                    content: "<h3>Chapter 3: Imputation vs Drop Policies</h3><p>Null value fields distort analytical results. Engineers can apply drop criteria commands or call the <code>.fillna()</code> matrix method to run mathematical statistical imputations, preserving layout shape without shifting data distribution curves.</p>",
                    progress: "Python Checkpoint (3/3)",
                    question: "What structural benefit does executing a statistical .fillna() imputation preserve?",
                    choices: ["It retains operational record counts without truncating dataset dimensions.", "It encrypts string fields to increase systemic validation protection."],
                    correctIndex: 0
                }
            ],
            "Java": [
                {
                    heading: "Object Oriented Memory Class Handlers",
                    content: "<h3>Chapter 1: Heap Allocation Frameworks</h3><p>Java allocates object instances dynamically inside system Heap memory parameters, while managing localized method references on individual execution Stacks. Understanding this memory tracking map prevents leaky pointer reference bugs.</p>",
                    progress: "Java Checkpoint (1/3)",
                    question: "Where are real object instances instantiated inside Java's execution environment?",
                    choices: ["Directly on the local stack trace window block.", "Within the system's dynamic Heap memory allocation framework."],
                    correctIndex: 1
                },
                {
                    heading: "Polymorphic Interface Implementations",
                    content: "<h3>Chapter 2: Abstract Method Architecture</h3><p>Interfaces establish behavioral contracts without hardcoding layout configurations. Subclasses implement these templates dynamically, which enables flexible class switching structures while minimizing hardcoded coupling errors.</p>",
                    progress: "Java Checkpoint (2/3)",
                    question: "What engineering advantage does polymorphic subclass interface execution provide?",
                    choices: ["It eliminates compilation runtime loops automatically.", "It decouples operational classes, allowing flexible component substitution configurations."],
                    correctIndex: 1
                },
                {
                    heading: "Garbage Collection Threshold Scans",
                    content: "<h3>Chapter 3: Automatic Memory Lifecycle Paths</h3><p>The Java Virtual Machine (JVM) actively scans reference chains to find unreferenced nodes. When it detects orphan object instances, it reclaims their heap space automatically via garbage collection routines, keeping memory footprints light.</p>",
                    progress: "Java Checkpoint (3/3)",
                    question: "How does Java handle memory allocations when an instantiated object drops out of active tracking?",
                    choices: ["The system reclaims heap memory space automatically via internal Garbage Collection.", "The runtime crashes immediately, demanding explicit pointer deletions."],
                    correctIndex: 0
                }
            ],
            "SQL": [
                {
                    heading: "Relational Index Execution Tuning",
                    content: "<h3>Chapter 1: Clustered vs Non-Clustered Indexes</h3><p>SQL engines determine layout row placement using Clustered Indexes. Because it arranges the actual table rows based on key parameters, a database table can support only one clustered index layout track.</p>",
                    progress: "SQL Checkpoint (1/3)",
                    question: "Why can a relational table handle only one singular Clustered Index path?",
                    choices: ["It dictates the actual physical sorting and arrangement of table rows on disk storage.", "It restricts external keys from performing join actions simultaneously."],
                    correctIndex: 0
                },
                {
                    heading: "Subquery Execution Isolation Tiers",
                    content: "<h3>Chapter 2: Correlated Subquery Operations</h3><p>Correlated subqueries refer to column targets inside outer main blocks. Because the inner loop must evaluate repeatedly for every row processed by the outer query, it can significantly slow down database execution on large tables.</p>",
                    progress: "SQL Checkpoint (2/3)",
                    question: "What performance trade-off occurs when deploying a Correlated Subquery loop?",
                    choices: ["Execution speeds drop because the inner query must process repeatedly for every row.", "The query runs instantly by splitting keys into temporary database rows."],
                    correctIndex: 0
                },
                {
                    heading: "ACID Transaction Verification Rules",
                    content: "<h3>Chapter 3: Isolation State Parameters</h3><p>ACID attributes protect database integrity. The Isolation metric determines exactly when concurrent database operations become visible to other threads, preventing data conflicts during overlapping update cycles.</p>",
                    progress: "SQL Checkpoint (3/3)",
                    question: "Which ACID attribute makes sure concurrent active transactions do not overwrite or corrupt each other?",
                    choices: ["Durability Parameters.", "Isolation Parameters."],
                    correctIndex: 1
                }
            ],
            "Advanced Excel": [
                {
                    heading: "Array Evaluation Lookup Vectors",
                    content: "<h3>Chapter 1: XLOOKUP Vector Searching</h3><p>The <code>XLOOKUP()</code> engine searches across source lookup arrays and extracts matching elements from a separate return range, eliminating the rigid left-to-right indexing limits of older lookup methods.</p>",
                    progress: "Excel Checkpoint (1/3)",
                    question: "What primary layout advantage does XLOOKUP hold over classic VLOOKUP configurations?",
                    choices: ["It returns matching values regardless of which column position the return array sits in.", "It requires source columns to be sorted in strict ascending numeric formats."],
                    correctIndex: 0
                },
                {
                    heading: "Dynamic Array Spill Matrices",
                    content: "<h3>Chapter 2: The Spill Range Operator</h3><p>Modern Excel engines evaluate formulas across entire cell matrices simultaneously. When formulas return multiple values, they flow naturally into adjacent open slots via the dynamic array Spill tracking pathway.</p>",
                    progress: "Excel Checkpoint (2/3)",
                    question: "What behavior occurs when a modern array formula returns multiple database coordinate results?",
                    choices: ["The layout overflows into surrounding cells through the dynamic array Spill behavior.", "Excel truncates all parameters, displaying a hard syntax validation alert error."],
                    correctIndex: 0
                },
                {
                    heading: "Pivot Cache Optimization Frameworks",
                    content: "<h3>Chapter 3: Internal Memory Allocation Pools</h3><p>When you generate a Pivot Table, Excel structures an underlying memory buffer called the PivotCache. This index structure holds a copy of your data in memory, allowing you to quickly filter and slice records without slow recalculation loops.</p>",
                    progress: "Excel Checkpoint (3/3)",
                    question: "What structural object does Excel query when you slice, rearrange, or modify Pivot Table groups?",
                    choices: ["An optimized internal memory buffer structure named the PivotCache.", "An external live web network query script track."],
                    correctIndex: 0
                }
            ]
        };

        // Execution tracking states
        var activeCourseKey = "";
        var activeStepIndex = 0;

        // 1. Enrollment routing mechanism: loads the target course and hides the catalog grid
        function enrollInCourse(courseName) {
            var isLoggedIn = localStorage.getItem('userLoggedIn');
            if (isLoggedIn !== 'true') {
                toggleQuizLockUi(true);
                return;
            }

            activeCourseKey = courseName;
            activeStepIndex = 0;

            // Swap interface view panel visibilities
            document.getElementById('courseCatalogSection').style.display = 'none';
            document.getElementById('courseWorkspaceSection').style.display = 'grid';

            // Set track name indicator
            document.getElementById('uiActiveCourseTitle').innerText = "CURRENT COURSE: " + courseName;

            renderActiveStep();
        }

        // 2. Render engine: maps structural text parameters onto layout cells instantly
        function renderActiveStep() {
            var currentCourseArray = universalCurriculum[activeCourseKey];

            // Reset old input selections and hide inline alert boxes
            var feedbackBanner = document.getElementById('uiFeedbackBanner');
            feedbackBanner.className = "feedback-box";
            feedbackBanner.innerText = "";

            if (activeStepIndex >= currentCourseArray.length) {
                // Course completion state: register badge item token inside browser memory
                registerEarnedBadge(activeCourseKey);

                document.getElementById('uiChapterHeading').innerText = "🎉 Course Specialization Complete!";
                document.getElementById('uiChapterBody').innerHTML = `
                    <div style="text-align:center; padding: 20px 0;">
                        <h3 style="color:#10b981; margin-bottom:12px;">Competency Signatures Verified</h3>
                        <p style="color:#4a5568;">Your technical data analytics account has successfully finalized all checkpoint parameters for <strong>${activeCourseKey}</strong>.</p>
                    </div>`;

                document.getElementById('uiQuizProgress').innerText = "CURRICULUM ARCHIVED";
                document.getElementById('uiQuizQuestion').innerText = "System Badge Issued!";
                document.getElementById('uiQuizChoicesContainer').innerHTML = `
                    <div style="text-align:center; padding: 12px 0;">
                        <span style="font-size:3rem; display:block; margin-bottom:8px;">🏆</span>
                        <p style="font-size:0.85rem; color:var(--text-muted); margin-bottom:16px;">The certification badge is now bound to your account profile metrics.</p>
                    </div>`;

                document.getElementById('btnSubmitQuizStep').innerText = "View Earned Badge in Dashboard";
                document.getElementById('btnSubmitQuizStep').onclick = function () {
                    window.location.href = 'Profile.aspx';
                };
                return;
            }

            // Normal progression parsing step
            var activeStepData = currentCourseArray[activeStepIndex];
            document.getElementById('uiChapterHeading').innerText = activeStepData.heading;
            document.getElementById('uiChapterBody').innerHTML = activeStepData.content;
            document.getElementById('uiQuizProgress').innerText = activeStepData.progress;
            document.getElementById('uiQuizQuestion').innerText = activeStepData.question;

            var choicesHtml = "";
            for (var i = 0; i < activeStepData.choices.length; i++) {
                choicesHtml += `
                    <label class="quiz-choice-label">
                        <input type="radio" name="courseQuizOption" value="${i}">
                        ${activeStepData.choices[i]}
                    </label>
                `;
            }
            document.getElementById('uiQuizChoicesContainer').innerHTML = choicesHtml;

            // Restore proper button click targets
            var submitBtn = document.getElementById('btnSubmitQuizStep');
            submitBtn.innerText = "Submit Verification";
            submitBtn.onclick = evaluateUiQuizStep;
        }

        // 3. Evaluation logic: applies inline green/red box alerts based on selection choice
        function evaluateUiQuizStep() {
            var selectedRadio = document.querySelector('input[name="courseQuizOption"]:checked');
            var feedbackBanner = document.getElementById('uiFeedbackBanner');

            if (!selectedRadio) {
                feedbackBanner.className = "feedback-box wrong";
                feedbackBanner.innerText = "⚠️ Missing selection parameter! Choose an answer card before submitting.";
                return;
            }

            var selectedIndex = parseInt(selectedRadio.value);
            var correctIndex = universalCurriculum[activeCourseKey][activeStepIndex].correctIndex;

            if (selectedIndex === correctIndex) {
                // Right choice path configuration: trigger solid emerald green state
                feedbackBanner.className = "feedback-box right";
                feedbackBanner.innerText = "✨ Correct verification parameter! Advancing layout frame on cue...";

                // Pause briefly to let user view the green box success state, then load next question
                setTimeout(function () {
                    activeStepIndex++;
                    renderActiveStep();
                }, 1100);

            } else {
                // Wrong choice path configuration: trigger solid crimson red state below choices
                feedbackBanner.className = "feedback-box wrong";
                feedbackBanner.innerText = "❌ Input deviation error detected! Re-read the chapter documentation and retry.";
            }
        }

        // 4. Persistence layer: appends newly earned credentials into a comma-delimited string token list
        function registerEarnedBadge(courseName) {
            var activeBadges = localStorage.getItem('collectedBadges') || "";
            var badgeList = activeBadges ? activeBadges.split(',') : [];

            if (!badgeList.includes(courseName)) {
                badgeList.push(courseName);
                localStorage.setItem('collectedBadges', badgeList.join(','));
            }
        }

        function exitWorkspaceToCatalog() {
            document.getElementById('courseCatalogSection').style.display = 'block';
            document.getElementById('courseWorkspaceSection').style.display = 'none';
            activeCourseKey = "";
            activeStepIndex = 0;
        }

        function toggleQuizLockUi(shouldLock) {
            var lockShield = document.getElementById('quizUiLockShield');
            if (!lockShield) return;
            if (shouldLock) { lockShield.classList.add('active'); lockShield.classList.remove('hidden'); }
            else { lockShield.classList.remove('active'); lockShield.classList.add('hidden'); }
        }

        // Initial launch event mapping
        window.addEventListener('DOMContentLoaded', function () {
            var isLoggedIn = localStorage.getItem('userLoggedIn');
            if (isLoggedIn === 'true') { toggleQuizLockUi(false); }
            else { toggleQuizLockUi(true); }
        });
    </script>

</asp:Content>