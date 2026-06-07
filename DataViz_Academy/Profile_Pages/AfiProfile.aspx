<%@ Page Title="Afi Danial | Technical Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AfiProfile.aspx.cs" Inherits="DataViz_Academy.AfiProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="profile-container" style="max-width: 800px; margin: 2rem auto; padding: 3.5rem; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 16px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">

        <%-- HEADER BRIEF CONTROLLER CONTAINER --%>
        <asp:Panel ID="pnlProfileHeader" runat="server" style="display: flex; align-items: center; gap: 2rem; margin-bottom: 2rem; flex-wrap: wrap;">
            
            <%-- CIRCULAR PICTURE FRAME: Replaced old code with an explicit asset-mapped server control --%>
            <div id="dashAvatarDisplay" style="width: 90px; height: 90px; background: #d97706; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 10px rgba(217,119,6,0.2); overflow: hidden;">
                <asp:Image ID="imgProfilePhoto" runat="server" ImageUrl="~/Assets/Afi.png" Alt="Afi Danial" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;" />
            </div>
            
            <div>
                <h2 style="font-size: 2.2rem; font-weight: 800; color: #1a202c; letter-spacing: -0.5px; margin:0;">
                    <asp:Label ID="lblFullName" runat="server" Text="Muhammad Afi Danial Bin Mazrul Afendi" />
                </h2>
                <p style="color: #718096; font-size: 1.05rem; margin: 4px 0 0 0;">
                    <asp:Label ID="lblJobTitle" runat="server" Text="Data Analytics Intern Candidate & Systems Developer" />
                </p>
            </div>
        </asp:Panel>

        <%-- HIGH-IMPACT ATTRIBUTE BADGES TAG FRAMEWORK --%>
        <div style="display: flex; gap: 10px; margin-bottom: 2rem; flex-wrap: wrap;">
            <span style="background: #f1f5f9; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; border: 1px solid #e2e8f0; color: #d97706; font-weight:600;">Linux Systems Engineering</span>
            <span style="background: #f1f5f9; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; border: 1px solid #e2e8f0; color: #d97706; font-weight:600;">Data Pipeline Architecture</span>
            <span style="background: #f1f5f9; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; border: 1px solid #e2e8f0; color: #d97706; font-weight:600;">BSc (Hons) Student</span>
        </div>

        <%-- ASSIGNMENT FOCUS PARAGRAPH --%>
        <asp:Panel ID="pnlFocusArea" runat="server" style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 8px;">Assignment Focus Area</h3>
            <p style="color: #4a5568; font-size: 1rem; text-align: justify; line-height: 1.7; margin:0;">
                <asp:Label ID="lblFocusAreaText" runat="server" Text="Spearheads the end-to-end relational database implementation, query indexing, and application logical flows. Authors the foundational system CRUD controllers utilizing parameterized ADO.NET pipelines to prevent SQL injection vulnerabilities. Designs and structures dynamic interface engines such as the community forum list view matrices and user badge collection grids by binding live SQL data adapters directly to native server web controls." />
            </p>
        </asp:Panel>

        <%-- SPLIT TECHNICAL EXPERT SKILLS GRID ROW --%>
        <asp:Panel ID="pnlExpertToolsets" runat="server" style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 12px;">Core Expert Toolsets</h3>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem;">
                
                <div style="background: #f8fafc; padding: 1.25rem; border-radius: 8px; border: 1px solid #e2e8f0;">
                    <strong style="color: #d97706; font-size: 0.95rem; display: block; margin-bottom: 6px;">Core Stack & Analytics</strong>
                    <p style="font-size: 0.85rem; color: #64748b; line-height: 1.5; margin:0;">
                        <asp:Label ID="lblSkillsCore" runat="server" Text="Python scripting, MySQL querying, automated data mining, statistical modelling, and manual C++/C data structure implementations without standard library shortcuts." />
                    </p>
                </div>
                
                <div style="background: #f8fafc; padding: 1.25rem; border-radius: 8px; border: 1px solid #e2e8f0;">
                    <strong style="color: #d97706; font-size: 0.95rem; display: block; margin-bottom: 6px;">Infrastructure & Scripting</strong>
                    <p style="font-size: 0.85rem; color: #64748b; line-height: 1.5; margin:0;">
                        <asp:Label ID="lblSkillsInfrastructure" runat="server" Text="Linux CLI operating environments (Red Hat RH124), network interface configurations (CCNA), logic design via Lua/GDScript, and custom frontend web logic solutions." />
                    </p>
                </div>
                
            </div>
        </asp:Panel>

        <%-- PROFESSIONAL EXPERIENCE HIGHLIGHT SECTION --%>
        <asp:Panel ID="pnlAccomplishments" runat="server" style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 12px;">Professional Accomplishments</h3>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem;">
                
                <div style="background: #f8fafc; padding: 1.25rem; border-radius: 8px; border: 1px solid #e2e8f0;">
                    <strong style="color: #1a202c; font-size: 0.95rem; display: block; margin-bottom: 4px;">Molly Fantasy MyTown</strong>
                    <span style="font-size: 0.75rem; color: #94a3b8; display: block; margin-bottom: 6px;">Customer Experience Associate • 2025</span>
                    <p style="font-size: 0.85rem; color: #64748b; line-height: 1.5; margin:0;">
                        <asp:Label ID="lblExpMollyFantasy" runat="server" Text="Orchestrated large crowd management operations and client engagement under volatile service volumes, building real-world resource monitoring and timeline optimizations." />
                    </p>
                </div>
                
                <div style="background: #f8fafc; padding: 1.25rem; border-radius: 8px; border: 1px solid #e2e8f0;">
                    <strong style="color: #1a202c; font-size: 0.95rem; display: block; margin-bottom: 4px;">MRSM Arau Leadership</strong>
                    <span style="font-size: 0.75rem; color: #94a3b8; display: block; margin-bottom: 6px;">Computer Club Vice-President • 2020 – 2022</span>
                    <p style="font-size: 0.85rem; color: #64748b; line-height: 1.5; margin:0;">
                        <asp:Label ID="lblExpLeadership" runat="server" Text="Directed tech initiatives, coordinated multi-member club operations, and handled software launch scheduling boundaries over an active administrative tracking term." />
                    </p>
                </div>
                
            </div>
        </asp:Panel>

        <%-- ACADEMIC & EDUCATION SECTION --%>
        <asp:Panel ID="pnlAcademicBackground" runat="server" style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 12px;">Academic Background</h3>
            <ul style="list-style-type: none; font-size: 0.95rem; color: #4a5568; line-height: 1.8; padding: 0; margin:0;">
                
                <li style="margin-bottom: 0.75rem; padding-left: 1.5rem; position: relative;">
                    <span style="position: absolute; left: 0; color: #d97706; font-weight: bold;">&bull;</span>
                    <strong>BSc (Honours) in Data Analytics Student</strong> — Asia Pacific University (Core focus area benchmarks: Relational Schema Modeling & Automated Data Processing pipelines).
                </li>
                
                <li style="padding-left: 1.5rem; position: relative;">
                    <span style="position: absolute; left: 0; color: #d97706; font-weight: bold;">&bull;</span>
                    <strong>Active Committee Member & Structural Contributor</strong> — APU Game Development Club (Systems framework pipeline logic design & algorithmic integration flows).
                </li>
                
            </ul>
        </asp:Panel>
    </div>

</asp:Content>