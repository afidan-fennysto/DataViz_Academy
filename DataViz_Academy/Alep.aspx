<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Muhammad Alif Hafiz | Tech Portfolio</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* --- Modern Minimalist Theme --- */
        :root {
            --bg-dark: #0f172a;
            --bg-card: #1e293b;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --accent-glow: #38bdf8;
            --accent-hover: #0ea5e9;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            scroll-behavior: smooth;
        }

        body {
            background-color: var(--bg-dark);
            color: var(--text-main);
            line-height: 1.6;
            padding-bottom: 60px;
        }

        /* --- Navigation Navbar --- */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(15, 23, 42, 0.9);
            backdrop-filter: blur(10px);
            padding: 20px 10%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .navbar .logo {
            font-weight: 700;
            font-size: 1.2rem;
            color: var(--accent-glow);
        }

        .nav-links a {
            color: var(--text-main);
            text-decoration: none;
            margin-left: 25px;
            font-size: 0.95rem;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--accent-glow);
        }

        /* --- Layout Container --- */
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px;
        }

        section {
            padding: 100px 0 40px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .section-title {
            font-size: 2rem;
            margin-bottom: 40px;
            color: var(--accent-glow);
            position: relative;
            display: inline-block;
        }

        /* --- Hero Section --- */
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 85vh;
            gap: 40px;
        }

        .hero-text {
            flex: 1;
        }

        .hero-text h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .hero-text h2 {
            font-size: 1.5rem;
            color: var(--text-muted);
            margin-bottom: 20px;
            font-weight: 400;
        }

        .hero-text p {
            color: var(--text-muted);
            margin-bottom: 30px;
            font-size: 1.05rem;
        }

        /* Profile Image Container */
        .hero-img-container {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .profile-img {
            width: 320px;
            height: 320px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--accent-glow);
            box-shadow: 0 0 25px rgba(56, 189, 248, 0.2);
            transition: transform 0.4s ease;
        }

        .profile-img:hover {
            transform: scale(1.05);
        }

        /* --- Global Hover Buttons --- */
        .btn-hover {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 28px;
            background: transparent;
            color: var(--accent-glow);
            border: 2px solid var(--accent-glow);
            border-radius: 6px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 0 0 rgba(56, 189, 248, 0);
        }

        .btn-hover i {
            margin-right: 8px;
        }

        /* Hover Effect: Glow and Slide-up background fill */
        .btn-hover:hover {
            background: var(--accent-glow);
            color: var(--bg-dark);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(56, 189, 248, 0.3);
        }

        /* --- Social Links --- */
        .social-icons {
            display: flex;
            gap: 20px;
            margin-top: 25px;
        }

        .social-btn {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            border: 2px solid var(--text-muted);
            color: var(--text-muted);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .social-btn:hover {
            color: var(--accent-glow);
            border-color: var(--accent-glow);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(56, 189, 248, 0.2);
        }

        /* --- Academic Timeline --- */
        .grid-layout {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        .card {
            background: var(--bg-card);
            border-radius: 8px;
            padding: 25px;
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            border-color: var(--accent-glow);
        }

        .card h3 {
            font-size: 1.25rem;
            margin-bottom: 5px;
        }

        .card .subtitle {
            color: var(--accent-glow);
            font-size: 0.95rem;
            margin-bottom: 10px;
        }

        .card .date {
            font-size: 0.85rem;
            color: var(--text-muted);
            margin-bottom: 15px;
        }

        /* --- Skillset Tags --- */
        .skills-container {
            margin-bottom: 30px;
        }

        .skills-category-title {
            font-size: 1.1rem;
            margin: 20px 0 10px 0;
            color: var(--text-main);
            font-weight: 600;
        }

        .skills-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .skill-tag {
            background: rgba(56, 189, 248, 0.1);
            color: var(--accent-glow);
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            border: 1px solid rgba(56, 189, 248, 0.2);
            transition: all 0.3s ease;
        }

        .skill-tag:hover {
            background: var(--accent-glow);
            color: var(--bg-dark);
            transform: scale(1.05);
        }

        /* --- Filterable Projects Section --- */
        .filter-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 30px;
        }

        .filter-btn {
            background: transparent;
            color: var(--text-muted);
            border: 1px solid var(--text-muted);
            padding: 8px 18px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s ease;
        }

        .filter-btn.active, .filter-btn:hover {
            background: var(--accent-glow);
            border-color: var(--accent-glow);
            color: var(--bg-dark);
        }

        .project-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }

        .project-card {
            background: var(--bg-card);
            border-radius: 8px;
            padding: 25px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s ease;
        }

        .project-card:hover {
            transform: translateY(-5px);
            border-color: var(--accent-glow);
        }

        .project-tags {
            display: flex;
            gap: 8px;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .project-tag {
            font-size: 0.75rem;
            background: rgba(255, 255, 255, 0.05);
            padding: 4px 10px;
            border-radius: 4px;
            color: var(--text-muted);
        }

        /* --- Responsive Queries --- */
        @media (max-width: 768px) {
            .hero {
                flex-direction: column-reverse;
                text-align: center;
                padding-top: 120px;
            }
            .profile-img {
                width: 220px;
                height: 220px;
            }
            .navbar {
                padding: 15px 5%;
            }
            .nav-links {
                display: none; /* Can expand to toggle menu later */
            }
            .hero-text h1 {
                font-size: 2.2rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar">
            <div class="logo">M.A.H</div>
            <div class="nav-links">
                <a href="#about">About</a>
                <a href="#academics">Academics</a>
                <a href="#skills">Skills</a>
                <a href="#achievements">Achievements</a>
                <a href="#projects">Projects</a>
            </div>
        </nav>

        <div class="container">

            <section id="about" class="hero">
                <div class="hero-text">
                    <h2>Hello, I am</h2>
                    <h1>Muhammad Alif Hafiz</h1>
                    <h2>Computer Science Student & Data Analyst Specialization </h2>
                    <p>
                        Resourceful and dedicated Second Year Computer Science Student at Asia Pacific University. 
                        I possess a robust technical foundation spanning low-level programming architecture to full-stack development 
                        and advanced cloud and machine learning systems. I specialize in data cleaning, preprocessing, 
                        and system design to drive innovation and solve complex tech industry challenges.
                    </p>
                    
                    <a href="mailto:TP085318@mail.apu.edu.my" class="btn-hover">
                        <i class="fa-regular fa-envelope"></i> Let's Connect
                    </a>

                    <div class="social-icons">
                        <a href="https://www.linkedin.com/in/muhammad-alif-hafiz-mokhtar-b91539408/" target="_blank" class="social-btn" title="LinkedIn">
                            <i class="fa-brands fa-linkedin-in"></i>
                        </a>
                        <a href="https://github.com/Alep-png" target="_blank" class="social-btn" title="GitHub">
                            <i class="fa-brands fa-github"></i>
                        </a>
                        <a href="https://www.instagram.com/m4tchaaa4lyf3?igsh=MTdsb3pxOTFkeXlpdA%3D%3D&utm_source=qr" target="_blank" class="social-btn" title="Instagram">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                    </div>
                </div>
                
                <div class="hero-img-container">
                    <img src="gambal.JPEG" alt="Muhammad Alif Hafiz" class="profile-img" />
                </div>
            </section>


            <section id="academics">
                <h2 class="section-title">Academic Background</h2>
                <div class="grid-layout">
                    
                    <div class="card">
                        <h3>BSc (Hons) in Computer Science</h3>
                        <div class="subtitle">Specialism in Data Analytics</div>
                        <div class="date">Sep 2024 - Present | CGPA: 3.24</div>
                        <p>Asia Pacific University (APU), Bukit Jalil</p>
                    </div>

                    <div class="card">
                        <h3>Foundation in Engineering and Technology</h3>
                        <div class="subtitle">Pre-University Program</div>
                        <div class="date">Aug 2023 - Jun 2024 | CGPA: 3.69 </div>
                        <p>Kolej MARA Kuala Nerang, Kedah </p>
                    </div>

                    <div class="card">
                        <h3>Sijil Pelajaran Malaysia (SPM)</h3>
                        <div class="subtitle">Science Stream & Entrepreneurship</div>
                        <div class="date">Jan 2018 - Mar 2023 | 4A 5B 2C </div>
                        <p>Sekolah Menengah Usahawan Al-Amin Ulu Klang </p>
                    </div>

                </div>
            </section>


            <section id="skills">
                <h2 class="section-title">Technical Skillset</h2>
                
                <div class="skills-container">
                    <div class="skills-category-title">Programming Languages</div>
                    <div class="skills-grid">
                        <span class="skill-tag">Python</span>
                        <span class="skill-tag">Java</span>
                        <span class="skill-tag">C++</span>
                        <span class="skill-tag">C Language</span>
                        <span class="skill-tag">Assembly Language</span>
                        <span class="skill-tag">SQL</span>
                        <span class="skill-tag">HTML & CSS</span>
                    </div>

                    <div class="skills-category-title">Data Analytics & Platforms</div>
                    <div class="skills-grid">
                        <span class="skill-tag">SAS Viya</span>
                        <span class="skill-tag">SAS Studio</span>
                        <span class="skill-tag">R Studio</span>
                        <span class="skill-tag">Microsoft Excel</span>
                        <span class="skill-tag">Power BI</span>
                    </div>

                    <div class="skills-category-title">Systems & Infrastructure</div>
                    <div class="skills-grid">
                        <span class="skill-tag">Red Hat System Administration</span>
                        <span class="skill-tag">Ubuntu Linux Server</span>
                        <span class="skill-tag">Rocky Linux Server</span>
                        <span class="skill-tag">Cisco Packet Tracer</span>
                        <span class="skill-tag">ASP.NET / Fullstack Web Development</span>
                        <span class="skill-tag">Botpress AI Chatbots (KDD Framework)</span>
                    </div>
                </div>
            </section>


            <section id="achievements">
                <h2 class="section-title">Key Achievements</h2>
                <div class="grid-layout">
                    
                    <div class="card">
                        <h3>International Innovation Entrepreneurship (IIEC)</h3>
                        <div class="subtitle">Silver Award Winner</div>
                        <p>Showcased innovative systems thinking, cross-functional collaboration, technical skills, and structured problem-solving.</p>
                    </div>

                    <div class="card">
                        <h3>APU Brain Alphaton</h3>
                        <div class="subtitle">Competition Participant </div>
                        <p>Demonstrated immediate data problem-solving and rapid design execution using raw real-world data.</p>
                    </div>

                    <div class="card">
                        <h3>Club Leadership Roles</h3>
                        <div class="subtitle">ASWB & BAKSIS Executive </div>
                        <p>Appointed as Vice Secretary for ASWB and Documentation Executive for BAKSIS, spearheading formal university event proposals and multimedia workflow.</p>
                    </div>

                </div>
            </section>


            <section id="projects">
                <h2 class="section-title">Project Portfolio</h2>
                
                <div class="filter-container">
                    <button type="button" class="filter-btn active" onclick="filterProjects('all')">All Projects</button>
                    <button type="button" class="filter-btn" onclick="filterProjects('python')">Python & Data</button>
                    <button type="button" class="filter-btn" onclick="filterProjects('ccpp')">C / C++</button>
                    <button type="button" class="filter-btn" onclick="filterProjects('java')">Java</button>
                    <button type="button" class="filter-btn" onclick="filterProjects('asm')">Assembly (ASM)</button>
                </div>

                <div class="project-grid">
                    
                    <div class="project-card" data-tech="ccpp">
                        <div>
                            <h3>C Inventory Management System</h3>
                            <div class="project-tags">
                                <span class="project-tag">C Language</span>
                                <span class="project-tag">Data Structures</span>
                            </div>
                            <p>An optimized inventory tracking tool handling stock levels, data parsing, and storage manipulation using structural logic.</p>
                        </div>
                        <a href="https://github.com/Alep-png/C-Inventory-Management-System" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="ccpp">
                        <div>
                            <h3>C Razer Business Management System</h3>
                            <div class="project-tags">
                                <span class="project-tag">C Language</span>
                                <span class="project-tag">Business Logics</span>
                            </div>
                            <p>Custom software framework designed to simulate order workflows, transactional operations, and service logs.</p>
                        </div>
                        <a href="https://github.com/Alep-png/C-Razer-Business-System" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="ccpp">
                        <div>
                            <h3>C Merchandise Business System</h3>
                            <div class="project-tags">
                                <span class="project-tag">C Language</span>
                                <span class="project-tag">E-Commerce Flow</span>
                            </div>
                            <p>A transactional terminal system developed to manage inventory items, sales generation, and automated receipts.</p>
                        </div>
                        <a href="https://github.com/Alep-png/C-Merchandise-Business-system" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="ccpp">
                        <div>
                            <h3>Carbon Emission Calculator</h3>
                            <div class="project-tags">
                                <span class="project-tag">C Language</span>
                                <span class="project-tag">Algorithms</span>
                            </div>
                            <p>An algorithm-driven metrics tool built to intake resource consumption inputs and output calculated carbon footprint estimates.</p>
                        </div>
                        <a href="https://github.com/Alep-png/C-Carbon-Emission-Calculation" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="java">
                        <div>
                            <h3>Multi-Threaded Airport System</h3>
                            <div class="project-tags">
                                <span class="project-tag">Java</span>
                                <span class="project-tag">Concurrency</span>
                            </div>
                            <p>Advanced concurrent simulation project analyzing airport resources, thread safety, and deadlock prevention setups.</p>
                        </div>
                        <a href="https://github.com/Alep-png/Concurrent-Programming-Multi-Thread-Airport-System" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="python">
                        <div>
                            <h3>Python Data Analytics Repository</h3>
                            <div class="project-tags">
                                <span class="project-tag">Python</span>
                                <span class="project-tag">Data Cleansing</span>
                            </div>
                            <p>Central workspace housing scripts dedicated to advanced data structuring, cleaning operations, and analytics profiling models.</p>
                        </div>
                        <a href="https://github.com/Alep-png/Python" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="asm">
                        <div>
                            <h3>Assembly Payroll System</h3>
                            <div class="project-tags">
                                <span class="project-tag">Assembly</span>
                                <span class="project-tag">Low-Level</span>
                            </div>
                            <p>Low-level architecture module focused on memory register manipulation to process financial payroll calculations.</p>
                        </div>
                        <a href="https://github.com/Alep-png/Basic-Payroll-ASM-coding" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                    <div class="project-card" data-tech="asm">
                        <div>
                            <h3>ICS Geometric Shapes Rendering</h3>
                            <div class="project-tags">
                                <span class="project-tag">Assembly</span>
                                <span class="project-tag">Graphics</span>
                            </div>
                            <p>A bare-metal computer concept project implementing geometric rendering algorithms straight through hardware execution steps.</p>
                        </div>
                        <a href="https://github.com/Alep-png/ICS-Shapes-using-ASM" target="_blank" class="btn-hover" style="margin-top:15px; padding:8px 15px; font-size:0.85rem;">
                            <i class="fa-brands fa-github"></i> View Source
                        </a>
                    </div>

                </div>
            </section>

        </div>
    </form>

    <script type="text/javascript">
        function filterProjects(category) {
            // Update Active Class on Buttons
            var buttons = document.getElementsByClassName('filter-btn');
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove('active');
            }
            event.currentTarget.classList.add('active');

            // Filter Logic
            var cards = document.getElementsByClassName('project-card');
            for (var i = 0; i < cards.length; i++) {
                if (category === 'all') {
                    cards[i].style.display = 'flex';
                } else {
                    if (cards[i].getAttribute('data-tech') === category) {
                        cards[i].style.display = 'flex';
                    } else {
                        cards[i].style.display = 'none';
                    }
                }
            }
        }
    </script>
</body>
</html>