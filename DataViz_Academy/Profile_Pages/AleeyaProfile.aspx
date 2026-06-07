<%@ Page Title="Aleeya Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AleeyaProfile.aspx.cs" Inherits="DataViz_Academy.AleeyaProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: #fafafa;
            color: #1e2a3a;
            line-height: 1.5;
            padding: 2rem 1rem;
        }

        .page {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            padding: 2rem 1.8rem;
            transition: box-shadow 0.3s ease, transform 0.2s ease;
        }

        .page:hover {
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.1);
        }

        section {
            margin-bottom: 2rem;
            border-bottom: 1px solid #e6edf2;
            padding-bottom: 1.8rem;
            transition: border-color 0.2s, background 0.2s;
            border-radius: 12px;
            padding-left: 0.2rem;
            padding-right: 0.2rem;
        }

        section:hover {
            border-bottom-color: #cbdde9;
            background: #fefefe;
        }

        section:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        h1 {
            font-size: 2rem;
            font-weight: 700;
            letter-spacing: -0.3px;
            color: #0a2942;
            margin-bottom: 0.3rem;
            transition: color 0.2s;
        }

        h1:hover {
            color: #1e5a7d;
        }

        .subhead {
            font-size: 1rem;
            font-weight: 500;
            color: #2c6e9e;
            margin-bottom: 0.8rem;
            transition: transform 0.2s, color 0.2s;
            display: inline-block;
        }

        .subhead:hover {
            color: #ff8c42;
            transform: translateX(3px);
        }

        .contact {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            font-size: 0.85rem;
            color: #3e5a6c;
            margin: 0.8rem 0 0.2rem;
            border-top: 1px solid #e2e8f0;
            padding-top: 1rem;
        }

        .contact span, .contact a {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            color: #2c6e9e;
            text-decoration: none;
            transition: all 0.2s ease;
            padding: 0.2rem 0.3rem;
            border-radius: 20px;
        }

        .contact a:hover {
            color: #ff8c42;
            transform: translateY(-2px);
            text-decoration: underline;
            background: rgba(44, 110, 158, 0.05);
        }

        .contact span:hover {
            color: #1a4f73;
            transform: translateY(-1px);
            cursor: default;
            background: rgba(0,0,0,0.02);
        }

        h2 {
            font-size: 1.4rem;
            font-weight: 600;
            color: #0f3b5c;
            margin-bottom: 1rem;
            letter-spacing: -0.2px;
            border-left: 3px solid #2c7da0;
            padding-left: 12px;
            transition: border-left-color 0.2s, transform 0.2s;
        }

        section:hover h2 {
            border-left-color: #ff8c42;
            transform: translateX(3px);
        }

        .profile-text {
            font-size: 0.95rem;
            color: #2c3f4f;
            margin-bottom: 0.5rem;
            transition: color 0.2s;
        }

        .edu-item {
            margin-bottom: 1.2rem;
            padding: 0.3rem 0.3rem;
            border-radius: 14px;
            transition: all 0.2s ease;
        }

        .edu-item:hover {
            background: #f8fafd;
            transform: translateX(5px);
            padding-left: 0.6rem;
        }

        .edu-title {
            font-weight: 700;
            font-size: 1rem;
            color: #1e4a6b;
            transition: color 0.2s;
        }

        .edu-item:hover .edu-title {
            color: #2c7da0;
        }

        .edu-date {
            font-size: 0.8rem;
            color: #5f7d9c;
            margin: 0.2rem 0 0.25rem;
        }

        .grid-simple {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
            margin: 0.5rem 0 0;
        }

        .tag {
            background: #eff3f8;
            padding: 0.2rem 0.8rem;
            border-radius: 30px;
            font-size: 0.75rem;
            font-weight: 500;
            color: #1e5a7d;
            transition: all 0.2s ease;
            cursor: default;
        }

        .tag:hover {
            background: #2c6e9e;
            color: white;
            transform: scale(1.02);
            box-shadow: 0 2px 6px rgba(44, 110, 158, 0.2);
        }

        .project {
            margin-bottom: 1.2rem;
            padding: 0.5rem 0.5rem;
            border-radius: 16px;
            transition: all 0.2s ease;
        }

        .project:hover {
            background: #f9fbfe;
            transform: translateX(6px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .project-name {
            font-weight: 700;
            font-size: 1rem;
            color: #1e4a6b;
            margin-bottom: 0.2rem;
            transition: color 0.2s;
        }

        .project:hover .project-name {
            color: #2c7da0;
        }

        .project-desc {
            font-size: 0.88rem;
            color: #2d4a66;
            margin-left: 0;
        }

        .tech {
            font-size: 0.75rem;
            color: #5f7d9c;
            margin-top: 0.2rem;
            transition: color 0.2s;
        }

        .project:hover .tech {
            color: #2c6e9e;
        }

        .cert-item {
            margin-bottom: 0.7rem;
            font-size: 0.9rem;
            padding: 0.3rem 0.5rem;
            border-radius: 12px;
            transition: all 0.2s ease;
        }

        .cert-item:hover {
            background: #f8fafc;
            transform: translateX(4px);
        }

        hr {
            margin: 0.5rem 0;
            border: 0;
            height: 1px;
            background: #e2e8f0;
            transition: background 0.2s;
        }

        hr:hover {
            background: #cbd5e0;
        }

        .footer {
            text-align: center;
            font-size: 0.7rem;
            color: #8aa0b5;
            margin-top: 1.5rem;
            padding-top: 0.8rem;
            border-top: 1px solid #eef2f7;
            transition: color 0.2s;
        }

        .footer:hover {
            color: #5f7d9c;
        }

        /* skill category containers hover */
        .skill-cat {
            transition: all 0.2s;
            padding: 0.3rem;
            border-radius: 16px;
        }

        .skill-cat:hover {
            background: #fafcff;
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            .page {
                padding: 1.3rem;
            }
            h1 {
                font-size: 1.6rem;
            }
            h2 {
                font-size: 1.2rem;
            }
        }
    </style>

<div class="page">
    <!-- header -->
    <div>
        <h1>NUR ALEEYA ADRIANA BINTI SUHAIMI</h1>
        <div class="subhead">Data Analytics Student · MARA Scholar</div>
        <div class="contact">
            <span> +6014-234 6465</span>
            <span> <a href="mailto:aleeyaadshmi@gmail.com">aleeyaadshmi@gmail.com</a></span>
            <span> <a href="mailto:TP085296@mail.apu.edu.my">TP085296@mail.apu.edu.my</a></span>
            <span> Kuala Lumpur, Malaysia</span>
        </div>
    </div>

    <!-- Profile -->
    <section>
        <h2>Profile</h2>
        <div class="profile-text">
            Computer Science undergraduate specializing in <strong>Data Analytics</strong> with strong foundations in programming, data analysis, and visualization. 
            Proficient in Python, C/C++, and SQL. MARA Scholar recipient, demonstrating strong academic performance and commitment to excellence. 
            Actively involved in leadership and co-curricular activities with well-developed teamwork, communication, and critical thinking skills.
        </div>
        <div class="grid-simple" style="margin-top: 10px;">
            <span class="tag"> Data Analytics</span>
            <span class="tag"> MARA Scholar</span>
            <span class="tag"> First Class Honours (Foundation)</span>
        </div>
    </section>


    <!-- Certifications -->
    <section>
        <h2>Certifications & Training</h2>
        <div class="cert-item"> <strong>CCNA: Introduction to Networks</strong> – networking concepts & infrastructure</div>
        <div class="cert-item"> <strong>5G Pioneers Programme</strong> – next-gen connectivity & emerging tech</div>
        <div class="cert-item"> <strong>Red Hat System Administration I (RH124 – RHA)</strong> – Linux system administration basics</div>
    </section>

    <!-- Projects -->
    <section>
        <h2>Projects</h2>
        <div class="project">
            <div class="project-name"> Data Mining & Statistical Modelling</div>
            <div class="project-desc">Extracted insights from structured datasets using Python, SAS Viya, and regression models. Applied data mining techniques for predictive analysis.</div>
            <div class="tech">Python · SAS Viya · Statistical Modelling</div>
        </div>
        <div class="project">
            <div class="project-name"> Relational Database Systems (MySQL/PostgreSQL)</div>
            <div class="project-desc">Designed and queried relational databases to manage and analyse structured data efficiently.</div>
            <div class="tech">MySQL · PostgreSQL · SQL</div>
        </div>
        <div class="project">
            <div class="project-name"> Data Visualisation Dashboards</div>
            <div class="project-desc">Created interactive dashboards with Power BI & SAS Viya to communicate data-driven insights.</div>
            <div class="tech">Power BI · Excel · SAS Viya</div>
        </div>
        <div class="project">
            <div class="project-name"> AI-Powered Fitness Chatbot</div>
            <div class="project-desc">Developed an intelligent chatbot using Python & NLP to generate personalised workout recommendations and respond to user queries.</div>
            <div class="tech">Python · API Integration · NLP</div>
        </div>
        <div class="profile-text" style="font-size: 0.85rem; margin-top: 8px;"> Independently explore real-world datasets to enhance analytical thinking & technical proficiency.</div>
    </section>

    <!-- Technical Skills -->
    <section>
        <h2>Technical Skills</h2>
        <div style="display: flex; flex-wrap: wrap; gap: 1rem; justify-content: space-between;">
            <div class="skill-cat" style="min-width: 140px;">
                <strong> Programming</strong>
                <div class="grid-simple" style="margin-top: 5px;">
                    <span class="tag">C++</span> <span class="tag">Python</span> <span class="tag">Java</span> <span class="tag">SQL</span> <span class="tag">HTML</span>
                </div>
            </div>
            <div class="skill-cat" style="min-width: 140px;">
                <strong> Data & BI</strong>
                <div class="grid-simple" style="margin-top: 5px;">
                    <span class="tag">SAS Viya</span> <span class="tag">Power BI</span> <span class="tag">PostgreSQL</span> <span class="tag">MySQL</span>
                </div>
            </div>
            <div class="skill-cat" style="min-width: 140px;">
                <strong> Tools & OS</strong>
                <div class="grid-simple" style="margin-top: 5px;">
                    <span class="tag">VS Code</span> <span class="tag">Visual Studio</span> <span class="tag">Linux</span> <span class="tag">Cisco basics</span>
                </div>
            </div>
        </div>
        <div style="margin-top: 12px;">
            <strong> Microsoft Office:</strong> Word, Excel, PowerPoint, Power BI
        </div>
    </section>


    <!-- footer -->
    <div class="footer">
        Nur Aleeya Adriana · DataWiz Portfolio · Based in Kuala Lumpur
    </div>
</div>

</asp:Content>