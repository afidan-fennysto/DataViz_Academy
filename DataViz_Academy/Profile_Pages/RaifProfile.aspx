<%@ Page Title="Raif Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RaifProfile.aspx.cs" Inherits="DataViz_Academy.RaifProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
            scroll-behavior: smooth;
        }

        body {
            background: #f5f7fa;
            color: #333;
        }

        /* PLATFORM INTEGRATION HUB HEADER BAR */
        .platform-header-bar {
            background-color: #1e293b;
            color: white;
            padding: 14px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #334155;
        }
        .platform-brand {
            font-weight: bold;
            color: #818cf8;
            font-size: 1.1rem;
        }
        .platform-back-link {
            color: #94a3b8;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: color 0.2s;
        }
        .platform-back-link:hover {
            color: white;
        }

        /* INTER-SECTION NAVIGATION ROUTING */
        nav {
            position: sticky;
            top: 0;
            background: #2c3e50;
            padding: 15px;
            text-align: center;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: 0.3s;
        }

        nav a:hover {
            color: #f1c40f;
        }

        /* HERO JUMBOTRON LAYOUT */
        header {
            height: 75vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #1f2c3a, #3b5998);
            color: white;
            text-align: center;
            padding: 20px;
        }

        .avatar-placeholder {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            margin-bottom: 20px;
            border: 4px solid white;
            background-color: #6366f1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }

        header h1 {
            font-size: 36px;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }

        header p {
            font-size: 18px;
            opacity: 0.9;
        }

        section {
            padding: 80px 10%;
        }

        h2 {
            text-align: center;
            margin-bottom: 40px;
            font-size: 32px;
            color: #2c3e50;
        }

        /* ACADEMIC TIMELINE CARDS */
        .education-card {
            background: white;
            padding: 24px;
            margin: 15px 0;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-left: 4px solid #3498db;
            transition: 0.3s;
        }

        .education-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .education-card h3 {
            color: #2c3e50;
            font-size: 1.3rem;
            margin-bottom: 4px;
        }

        /* HOBBIES GRID CONFIGURATIONS */
        .hobby-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .hobby {
            background: white;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: 0.3s;
        }

        .hobby:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .hobby h3 {
            margin-bottom: 10px;
            color: #3498db;
        }

        /* SKILLS STACK ACCENTS */
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            max-width: 800px;
            margin: 0 auto;
        }

        .skill-tag {
            background: white;
            padding: 12px 20px;
            border-radius: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            font-weight: bold;
            transition: 0.3s;
            cursor: pointer;
            color: #475569;
            border: 1px solid #e2e8f0;
        }

        .skill-tag:hover {
            background: #3498db;
            color: white;
            border-color: #3498db;
            transform: translateY(-3px);
        }

        /* CONTACT SECTION LAYOUT */
        .contact-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            max-width: 900px;
            margin: 0 auto;
        }

        .contact-info {
            flex: 1;
            min-width: 280px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .contact-info h3 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 1.4rem;
        }

        .info-item {
            margin-bottom: 15px;
            font-size: 1rem;
            color: #475569;
            line-height: 1.6;
        }

        .info-item strong {
            color: #1e293b;
        }

        .info-item a {
            color: #3498db;
            text-decoration: none;
            transition: 0.2s;
        }

        .info-item a:hover {
            text-decoration: underline;
        }

        .contact-form {
            flex: 1;
            min-width: 280px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #cbd5e1;
            background: #f8fafc;
        }

        .btn-submit {
            background: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            transition: 0.3s;
            width: 100%;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background: #2980b9;
            transform: scale(1.02);
        }

        .social {
            text-align: center;
            margin-top: 30px;
            width: 100%;
        }

        .social a {
            margin: 0 12px;
            font-size: 0.95rem;
            text-decoration: none;
            color: #475569;
            font-weight: 600;
            transition: 0.3s;
        }

        .social a:hover {
            color: #3498db;
        }

        footer {
            background: #2c3e50;
            color: #94a3b8;
            text-align: center;
            padding: 24px;
            font-size: 0.9rem;
        }

        /* SCROLL ANIMATION INITIAL STATE BOUNDS */
        .hidden {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease-out;
        }

        .show {
            opacity: 1;
            transform: translateY(0);
        }

        @media(max-width: 700px) {
            header h1 { font-size: 28px; }
            section { padding: 60px 5%; }
            .contact-wrapper { flex-direction: column; }
        }
    </style>

        <nav>
            <a href="#about">About</a>
            <a href="#education">Education</a>
            <a href="#hobbies">Hobbies</a>
            <a href="#skills">Skills</a>
            <a href="#contact">Contact</a>
        </nav>

        <header id="about">
            <div class="avatar-placeholder" style="width: 200px; height: 200px; border-radius: 50%; overflow: hidden; display: flex; align-items: center; justify-content: center;">
                <asp:Image ID="imgDeveloper" runat="server" ImageUrl="~/Assets/Raif.jpeg" AlternateText="Developer Profile" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;" />
            </div>
            <h1>Raif Izudin Bin Rasulluddin</h1>
            <p>Computer Science Student | Future Data Analyst</p>
        </header>

        <section id="education" class="hidden">
            <h2>Educational Background</h2>
            <div class="education-card">
                <h3>Bachelor in Computer Science</h3>
                <p style="color: #64748b; font-weight: 500;">Asia Pacific University (APU)</p>
                <p style="font-size: 0.85rem; color: #94a3b8; margin-top: 4px;">2025 – Present</p>
            </div>
            <div class="education-card">
                <h3>Foundation in Computing</h3>
                <p style="color: #64748b; font-weight: 500;">Asia Pacific University (APU)</p>
                <p style="font-size: 0.85rem; color: #94a3b8; margin-top: 4px;">2024 – 2025</p>
            </div>
            <div class="education-card">
                <h3>Secondary School</h3>
                <p style="color: #64748b; font-weight: 500;">SMK Seri Hartamas</p>
                <p style="font-size: 0.85rem; color: #94a3b8; margin-top: 4px;">2019 – 2023</p>
            </div>
        </section>

        <section id="hobbies" class="hidden">
            <h2>Hobbies & Interests</h2>
            <div class="hobby-container">
                <div class="hobby">
                    <h3>Programming</h3>
                    <p style="font-size: 0.9rem; color: #475569; line-height: 1.5;">Building programs and learning new languages.</p>
                </div>
                <div class="hobby">
                    <h3>Data Analysis</h3>
                    <p style="font-size: 0.9rem; color: #475569; line-height: 1.5;">Exploring datasets and discovering insights.</p>
                </div>
                <div class="hobby">
                    <h3>Sports</h3>
                    <p style="font-size: 0.9rem; color: #475569; line-height: 1.5;">Playing sports keeps me active and disciplined.</p>
                </div>
            </div>
        </section>

        <section id="skills" class="hidden">
            <h2>Skills</h2>
            <div class="skills-container">
                <span class="skill-tag">Python</span>
                <span class="skill-tag">Java</span>
                <span class="skill-tag">C Programming</span>
                <span class="skill-tag">SQL</span>
                <span class="skill-tag">HTML</span>
                <span class="skill-tag">CSS</span>
                <span class="skill-tag">Networking</span>
                <span class="skill-tag">Cisco Packet Tracer</span>
                <span class="skill-tag">SAS Studio</span>
            </div>
        </section>

        <section id="contact" class="hidden">
            <h2>Contact Me</h2>
            <div class="contact-wrapper">
                <div class="contact-info">
                    <h3>Get in Touch</h3>
                    <div class="info-item">
                        <strong>Name:</strong><br />
                        Raif Izudin Bin Rasulluddin
                    </div>
                    <div class="info-item">
                        <strong>Phone:</strong><br />
                        <a href="tel:0162223496">016-222 3496</a>
                    </div>
                    <div class="info-item">
                        <strong>Email:</strong><br />
                        <a href="mailto:raifizudin@gmail.com">raifizudin@gmail.com</a>
                    </div>
                </div>

                <div class="contact-form">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name" Required="true"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Your Email" Required="true"></asp:TextBox>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Your Message"></asp:TextBox>
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="BtnSubmit_Click" />
                </div>
            </div>
            
            <div class="social">
                <p style="color: #64748b; font-size: 0.9rem; margin-bottom: 10px;">Connect with me</p>
                <a href="https://www.linkedin.com/in/raif-izudin-bin-rasulluddin-b0b154351" target="_blank">LinkedIn</a>
                <a href="#">GitHub</a>
                <a href="#">Instagram</a>
            </div>
        </section>

        <footer>
            <p>© 2026 Raif Izudin | Personal Website Hub</p>
        </footer>

    <script>
        const observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("show");
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll(".hidden").forEach(el => {
            observer.observe(el);
        });
    </script>

</asp:Content>