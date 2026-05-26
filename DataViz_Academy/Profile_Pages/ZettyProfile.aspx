<%@ Page Title="Zetty Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ZettyProfile.aspx.cs" Inherits="DataViz_Academy.ZettyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        :root {
            --navy: #0A192F;
            --slate: #4A5568;
            --light-blue: #F0F4F8;
            --border-line: #E2E8F0;
            --text-dark: #1A202C;
            --light-shadow: 0 5px 15px rgba(0,0,0,0.08);
            --pfp-frame-color: #64748b; 
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--text-dark);
            background-color: #ffffff;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            -webkit-font-smoothing: antialiased;
        }

        .master-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 24px 60px 24px;
            display: block;
        }

        .pnl-nav-header {
            display: block;
            margin-bottom: 30px;
        }

        .btn-back-nav {
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--slate);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: color 0.2s ease;
        }

        .btn-back-nav:hover {
            color: var(--navy);
        }

        .pnl-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 40px;
            border-bottom: 1px solid var(--border-line);
            flex-wrap: wrap;
            gap: 24px;
            width: 100%;
        }

        .pnl-profile-info {
            flex: 1;
            min-width: 250px;
        }

        .lbl-main-title {
            display: block;
            font-size: 2.6rem;
            color: var(--navy);
            letter-spacing: -1px;
            font-weight: 800;
            margin: 0;
        }

        .lbl-main-subtitle {
            display: block;
            font-size: 1.15rem;
            color: var(--slate);
            margin: 6px 0 20px 0;
            font-weight: 400;
        }

        .pnl-links-container {
            display: block;
        }

        .lnk-item {
            display: inline-block;
            margin-right: 20px;
            color: var(--navy);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: color 0.2s ease;
        }

        .lnk-item:hover {
            color: var(--slate);
        }

        .img-profile-pic {
            width: 140px;
            height: 140px;
            object-fit: cover;
            border-radius: 8px; 
            box-shadow: var(--light-shadow); 
            border: 4px solid var(--pfp-frame-color); 
            transition: transform 0.3s ease;
        }

        .img-profile-pic:hover {
            transform: translateY(-3px); 
        }

        .pnl-section {
            display: block;
            padding: 40px 0;
            border-bottom: 1px solid var(--border-line);
        }

        .lbl-section-title {
            display: block;
            font-size: 1.1rem;
            color: var(--navy);
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 25px;
            font-weight: 700;
        }

        .lbl-group-title {
            display: block;
            font-size: 0.85rem;
            color: var(--slate);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 20px 0 12px 0;
            font-weight: 600;
        }

        .pnl-card {
            display: block;
            background: #ffffff;
            padding: 10px 0;
            margin-bottom: 25px;
        }

        .pnl-card-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            flex-wrap: wrap;
            gap: 10px;
            width: 100%;
        }

        .lbl-card-title {
            font-weight: 700;
            font-size: 1.2rem;
            color: var(--navy);
        }

        .lbl-card-subtitle {
            display: block;
            color: var(--slate);
            font-weight: 500;
            font-size: 0.95rem;
            margin: 4px 0 12px 0;
        }

        .lbl-badge {
            color: var(--navy);
            font-size: 0.85rem;
            font-weight: 600;
        }

        .lbl-summary-text {
            display: block;
            font-size: 1.05rem;
            color: var(--slate);
        }

        .bullet-list-override {
            margin: 0;
            padding-left: 18px;
        }

        .bullet-list-override li {
            margin-bottom: 8px;
            color: var(--slate);
            font-size: 0.98rem;
        }

        .pnl-filter-nav {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .filter-btn {
            background: var(--light-blue);
            border: none;
            padding: 8px 18px;
            cursor: pointer;
            font-weight: 500;
            font-size: 0.85rem;
            border-radius: 20px;
            text-decoration: none;
            color: var(--navy);
            transition: all 0.2s ease;
            display: inline-block;
        }

        .filter-btn.active, .filter-btn:hover {
            background-color: var(--navy);
            color: #ffffff;
        }

        .pnl-skills-group {
            display: block;
            margin-bottom: 10px;
        }

        .lbl-skill-tag {
            display: inline-block;
            background: #ffffff;
            border: 1px solid var(--border-line);
            color: var(--navy);
            padding: 6px 14px;
            margin: 4px;
            border-radius: 6px;
            font-size: 0.88rem;
            font-weight: 500;
        }
    </style>

        <asp:Panel ID="pnlMasterContainer" runat="server" CssClass="master-container">
            
            <asp:Panel ID="pnlHeader" runat="server" CssClass="pnl-header">
                <asp:Panel ID="pnlProfileInfo" runat="server" CssClass="pnl-profile-info">
                    <asp:Label ID="lblMainTitle" runat="server" CssClass="lbl-main-title" Text="Zetty Adleena" />
                    <asp:Label ID="lblMainSubtitle" runat="server" CssClass="lbl-main-subtitle" Text="Data Analytics Student" />
                    <asp:Panel ID="pnlLinksContainer" runat="server" CssClass="pnl-links-container">
                        <asp:HyperLink ID="lnkEmail" runat="server" NavigateUrl="mailto:zettyadleena@outlook.com" CssClass="lnk-item" Text="Email" />
                        <asp:HyperLink ID="lnkLinkedIn" runat="server" NavigateUrl="https://linkedin.com/in/zetty-adleena-zul-azrin" Target="_blank" CssClass="lnk-item" Text="LinkedIn" />
                    </asp:Panel>
                </asp:Panel>
                <asp:Image ID="imgProfile" runat="server" ImageUrl="~/Assets/Zetty.jpeg" AlternateText="Zetty Adleena Portfolio Photo" CssClass="img-profile-pic" />
            </asp:Panel>

            <asp:Panel ID="pnlSummarySection" runat="server" CssClass="pnl-section">
                <asp:Label ID="lblSummaryTitle" runat="server" CssClass="lbl-section-title" Text="Professional Summary" />
                <asp:Label ID="lblSummaryText" runat="server" CssClass="lbl-summary-text">
                    Highly organized Computer Science (Data Analytics) student with a verified engineering technical foundation. 
                    Awarded <strong>'Best Student'</strong> at the Diploma level, I excel at bridging technical frameworks with analytical systems 
                    to optimize operations, automate pipelines, and turn complex data streams into structural business insights.
                </asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlSkillsSection" runat="server" CssClass="pnl-section">
                <asp:Label ID="lblSkillsTitle" runat="server" CssClass="lbl-section-title" Text="Skills & Competencies" />
                <asp:Panel ID="pnlFilterNav" runat="server" CssClass="pnl-filter-nav">
                    <asp:LinkButton ID="btnAll" runat="server" CssClass="filter-btn active" CommandArgument="All" OnClick="btnFilter_Click" Text="All Skills" />
                    <asp:LinkButton ID="btnTech" runat="server" CssClass="filter-btn" CommandArgument="Tech" OnClick="btnFilter_Click" Text="Data & Architecture" />
                    <asp:LinkButton ID="btnProj" runat="server" CssClass="filter-btn" CommandArgument="Proj" OnClick="btnFilter_Click" Text="Project Governance" />
                    <asp:LinkButton ID="btnLang" runat="server" CssClass="filter-btn" CommandArgument="Lang" OnClick="btnFilter_Click" Text="Languages" />
                </asp:Panel>

                <asp:Panel ID="pnlTechnical" runat="server" CssClass="pnl-skills-group">
                    <asp:Label ID="lblTechTitle" runat="server" CssClass="lbl-group-title" Text="Data Engineering & Core Tech" />
                    <asp:Label ID="tagSql" runat="server" CssClass="lbl-skill-tag" Text="SQL (MySQL)" />
                    <asp:Label ID="tagPbi" runat="server" CssClass="lbl-skill-tag" Text="Power BI (DAX / Modeling)" />
                    <asp:Label ID="tagExcel" runat="server" CssClass="lbl-skill-tag" Text="Advanced Excel (Logic Automation)" />
                    <asp:Panel ID="pnlProgLanguages" runat="server" Style="display:inline-block;">
                        <asp:Label ID="tagPython" runat="server" CssClass="lbl-skill-tag" Text="Python" />
                        <asp:Label ID="tagJava" runat="server" CssClass="lbl-skill-tag" Text="Java" />
                        <asp:Label ID="tagCpp" runat="server" CssClass="lbl-skill-tag" Text="C++" />
                    </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlProject" runat="server" CssClass="pnl-skills-group">
                    <asp:Label ID="lblProjTitle" runat="server" CssClass="lbl-group-title" Text="Project Governance & Frameworks" />
                    <asp:Label ID="tagSdlc" runat="server" CssClass="lbl-skill-tag" Text="SDLC (Agile / Scrum)" />
                    <asp:Label ID="tagStakeholder" runat="server" CssClass="lbl-skill-tag" Text="Stakeholder Management" />
                    <asp:Label ID="tagMapping" runat="server" CssClass="lbl-skill-tag" Text="Process Mapping" />
                    <asp:Label ID="tagEmcee" runat="server" CssClass="lbl-skill-tag" Text="Executive Communication & Emceeing" />
                </asp:Panel>

                <asp:Panel ID="pnlLanguages" runat="server" CssClass="pnl-skills-group">
                    <asp:Label ID="lblLangTitle" runat="server" CssClass="lbl-group-title" Text="Global Communication" />
                    <asp:Label ID="tagEng" runat="server" CssClass="lbl-skill-tag" Text="English (Professional)" />
                    <asp:Label ID="tagMalay" runat="server" CssClass="lbl-skill-tag" Text="Malay (Native)" />
                    <asp:Label ID="tagGer" runat="server" CssClass="lbl-skill-tag" Text="Basic German (Deutsch)" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlExperienceSection" runat="server" CssClass="pnl-section">
                <asp:Label ID="lblExperienceTitle" runat="server" CssClass="lbl-section-title" Text="Professional Experience" />
                
                <asp:Panel ID="pnlJob1" runat="server" CssClass="pnl-card">
                    <asp:Panel ID="pnlJob1Header" runat="server" CssClass="pnl-card-header">
                        <asp:Label ID="lblJob1Title" runat="server" CssClass="lbl-card-title" Text="Project Management Office (PMO) Intern" />
                        <asp:Label ID="lblJob1Badge" runat="server" CssClass="lbl-badge" Text="Jan 2025 – May 2025" />
                    </asp:Panel>
                    <asp:Label ID="lblJob1Subtitle" runat="server" CssClass="lbl-card-subtitle" Text="AeroDarat Services (Malaysia Aviation Group)" />
                    <asp:BulletedList ID="bltAeroDarat" runat="server" BulletStyle="Disc" CssClass="bullet-list-override" />
                </asp:Panel>

                <asp:Panel ID="pnlJob2" runat="server" CssClass="pnl-card">
                    <asp:Panel ID="pnlJob2Header" runat="server" CssClass="pnl-card-header">
                        <asp:Label ID="lblJob2Title" runat="server" CssClass="lbl-card-title" Text="Freelance Mathematics Tutor" />
                        <asp:Label ID="lblJob2Badge" runat="server" CssClass="lbl-badge" Text="Aug 2025 – Present" />
                    </asp:Panel>
                    <asp:Label ID="lblJob2Subtitle" runat="server" CssClass="lbl-card-subtitle" Text="House of Mind Excellence (HOME)" />
                    <asp:BulletedList ID="bltHome" runat="server" BulletStyle="Disc" CssClass="bullet-list-override" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlEducationSection" runat="server" CssClass="pnl-section">
                <asp:Label ID="lblEducationTitle" runat="server" CssClass="lbl-section-title" Text="Academic Credentials" />
                
                <asp:Panel ID="pnlEdu1" runat="server" CssClass="pnl-card">
                    <asp:Panel ID="pnlEdu1Header" runat="server" CssClass="pnl-card-header">
                        <asp:Label ID="lblEdu1Title" runat="server" CssClass="lbl-card-title" Text="B.Sc. (Hons) in Computer Science (Data Analytics)" />
                        <asp:Label ID="lblEdu1Badge" runat="server" CssClass="lbl-badge" Text="Expected Sept 2027" />
                    </asp:Panel>
                    <asp:Label ID="lblEdu1Subtitle" runat="server" CssClass="lbl-card-subtitle" Text="Asia Pacific University of Technology & Innovation (APU)" />
                    <asp:Label ID="lblEdu1Details" runat="server" CssClass="lbl-summary-text" Text="&lt;strong&gt;CGPA: 3.12&lt;/strong&gt; | Fast-track entry pathway secured via distinguished academic credit transfer performance." />
                </asp:Panel>

                <asp:Panel ID="pnlEdu2" runat="server" CssClass="pnl-card">
                    <asp:Panel ID="pnlEdu2Header" runat="server" CssClass="pnl-card-header">
                        <asp:Label ID="lblEdu2Title" runat="server" CssClass="lbl-card-title" Text="Diploma in Engineering Technology (Electronics & IT)" />
                        <asp:Label ID="lblEdu2Badge" runat="server" CssClass="lbl-badge" Text="Graduated Nov 2025" />
                    </asp:Panel>
                    <asp:Label ID="lblEdu2Subtitle" runat="server" CssClass="lbl-card-subtitle" Text="German-Malaysian Institute (GMI)" />
                    <asp:Label ID="lblEdu2Details" runat="server" CssClass="lbl-summary-text" Text="&lt;strong&gt;CGPA: 3.90&lt;/strong&gt; | &lt;em&gt;Departmental Best Student Award&lt;/em&gt; | Ranked as Top Academic Achiever in Electrical Engineering department cohort." />
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>

    <script type="text/javascript">
        function navigateToAboutPage() {
            // Synchronizes cleanly with your platform routing standards
            window.location.href = "../About.aspx";
        }
    </script>


</asp:Content>