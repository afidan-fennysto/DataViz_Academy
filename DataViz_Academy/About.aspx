<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="DataViz_Academy.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .about-hero-card {
            background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 28px; margin-bottom: 32px; box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .dev-grid-matrix {
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); 
            gap: 20px; 
            margin-top: 16px;
        }
        .dev-portfolio-card {
            background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 24px; text-align: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05); transition: transform 0.2s, box-shadow 0.2s;
            display: flex; flex-direction: column; justify-content: space-between; min-height: 360px;
        }
        .dev-portfolio-card:hover { transform: translateY(-4px); box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05); }
        .dev-badge-icon {
            width: 50px; height: 50px; background: #f1f5f9; color: #475569; font-weight: 700; font-size: 0.9rem;
            border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px auto; border: 1px solid #e2e8f0;
        }
    </style>

    <div id="aboutView" class="app-view active-view">
        
        <h1>About Us</h1>
        <p class="view-subtitle">Project framework, system scope parameters, and development team milestones.</p>
        
        <div class="about-hero-card">
            <h3 style="margin: 0 0 8px 0; color: #1a202c; font-size: 1.25rem; font-weight: 700;">Why We Created DataViz Academy</h3>
            <p style="color: #4a5568; line-height: 1.7; font-size: 0.975rem; margin: 0; text-align: justify;">
                Modern business intelligence demands accurate, high-performance data structures. We designed <strong>DataViz Academy</strong> as an interactive, sandbox learning tool to bridge the gap between raw numeric databases and professional, production-grade visual interfaces. By combining asynchronous single-page layout structures with front-end validation rules, our goal is to lower the barriers associated with data engineering modeling—providing students with an immediate, responsive playground to master core visualization paradigms, pass technical milestones, and earn verifiable competence credentials.
            </p>
        </div>

        <h2 style="font-size: 1.5rem; font-weight: 700; color: #1a202c; margin-bottom: 4px;">Meet the Developers</h2>
        <p style="color: #718096; font-size: 0.9rem; margin: 0 0 20px 0;">Select any card to navigate directly to our unique standalone portfolio websites.</p>

        <div class="dev-grid-matrix">
            
            <div class="dev-portfolio-card">
                <div>
                    <div class="dev-badge-icon" style="background: #eef2ff; color: #4f46e5;">UI</div>
                    <h3 style="margin: 0 0 4px 0; font-size: 1.2rem; color: #1a202c;">Zetty</h3>
                    <span style="display: block; font-size: 0.75rem; font-weight: 700; color: #4f46e5; background: #eef2ff; padding: 4px 8px; border-radius: 4px; text-transform: uppercase; letter-spacing: 0.05em; min-height: 32px; display: flex; align-items: center; justify-content: center;">Project Manager & Lead Documenter</span>
                    <p style="font-size: 0.85rem; color: #4a5568; line-height: 1.5; margin: 16px 0 0 0; text-align: center;">
                        Oversees project schedules, audience requirements elicitation, and structural documentation quality checks.
                    </p>
                </div>
                <asp:Button ID="btnZetty" runat="server" Text="Explore Website &rarr;" CssClass="btn btn-primary" style="width: 100%; margin-top: 20px;" OnClick="BtnZetty_Click" />
            </div>

            <div class="dev-portfolio-card">
                <div>
                    <div class="dev-badge-icon" style="background: #fdf2f8; color: #db2777;">UX</div>
                    <h3 style="margin: 0 0 4px 0; font-size: 1.2rem; color: #1a202c;">Raif</h3>
                    <span style="display: block; font-size: 0.75rem; font-weight: 700; color: #db2777; background: #fdf2f8; padding: 4px 8px; border-radius: 4px; text-transform: uppercase; letter-spacing: 0.05em; min-height: 32px; display: flex; align-items: center; justify-content: center;">UI/UX Designer & Prototyper</span>
                    <p style="font-size: 0.85rem; color: #4a5568; line-height: 1.5; margin: 16px 0 0 0; text-align: center;">
                        Spearheads front-end layout styling, interactive component wireframing, and platform user experience blueprints.
                    </p>
                </div>
                <asp:Button ID="btnRaif" runat="server" Text="Explore Website &rarr;" CssClass="btn btn-primary" style="width: 100%; margin-top: 20px;" OnClick="BtnRaif_Click" />
            </div>

            <div class="dev-portfolio-card">
                <div>
                    <div class="dev-badge-icon" style="background: #ecfdf5; color: #059669;">DB</div>
                    <h3 style="margin: 0 0 4px 0; font-size: 1.2rem; color: #1a202c;">Alif</h3>
                    <span style="display: block; font-size: 0.75rem; font-weight: 700; color: #059669; background: #ecfdf5; padding: 4px 8px; border-radius: 4px; text-transform: uppercase; letter-spacing: 0.05em; min-height: 32px; display: flex; align-items: center; justify-content: center;">Database Architect</span>
                    <p style="font-size: 0.85rem; color: #4a5568; line-height: 1.5; margin: 16px 0 0 0; text-align: center;">
                        Manages schema structuring, analytical relational query maps, and CRUD state persistence layers.
                    </p>
                </div>
                <asp:Button ID="btnAlif" runat="server" Text="Explore Website &rarr;" CssClass="btn btn-primary" style="width: 100%; margin-top: 20px;" OnClick="BtnAlif_Click" />
            </div>

            <div class="dev-portfolio-card">
                <div>
                    <div class="dev-badge-icon" style="background: #fef2f2; color: #dc2626;">FE</div>
                    <h3 style="margin: 0 0 4px 0; font-size: 1.2rem; color: #1a202c;">Aleeya</h3>
                    <span style="display: block; font-size: 0.75rem; font-weight: 700; color: #dc2626; background: #fef2f2; padding: 4px 8px; border-radius: 4px; text-transform: uppercase; letter-spacing: 0.05em; min-height: 32px; display: flex; align-items: center; justify-content: center;">Client-Side Engineer</span>
                    <p style="font-size: 0.85rem; color: #4a5568; line-height: 1.5; margin: 16px 0 0 0; text-align: center;">
                        Expert in asynchronous view rendering, real-time validation scripting, and browser event listeners.
                    </p>
                </div>
                <asp:Button ID="btnAleeya" runat="server" Text="Explore Website &rarr;" CssClass="btn btn-primary" style="width: 100%; margin-top: 20px;" OnClick="BtnAleeya_Click" />
            </div>

            <div class="dev-portfolio-card">
                <div>
                    <div class="dev-badge-icon" style="background: #fffbeb; color: #d97706;">SEC</div>
                    <h3 style="margin: 0 0 4px 0; font-size: 1.2rem; color: #1a202c;">Afi</h3>
                    <span style="display: block; font-size: 0.75rem; font-weight: 700; color: #d97706; background: #fffbeb; padding: 4px 8px; border-radius: 4px; text-transform: uppercase; letter-spacing: 0.05em; min-height: 32px; display: flex; align-items: center; justify-content: center;">Security & Auth Analyst</span>
                    <p style="font-size: 0.85rem; color: #4a5568; line-height: 1.5; margin: 16px 0 0 0; text-align: center;">
                        Focuses on user authentication state monitoring, session clearing gates, and role privilege verification.
                    </p>
                </div>
                <asp:Button ID="btnAfi" runat="server" Text="Explore Website &rarr;" CssClass="btn btn-primary" style="width: 100%; margin-top: 20px;" OnClick="BtnAfi_Click" />
            </div>

        </div>

    </div>

</asp:Content>