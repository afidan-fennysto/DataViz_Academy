<%@ Page Title="Zetty Adleena | Executive Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ZettyProfile.aspx.cs" Inherits="DataViz_Academy.ZettyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="profile-container" style="max-width: 800px; margin: 2rem auto; padding: 3.5rem; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 16px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
        
        <div style="display: flex; align-items: center; gap: 2rem; margin-bottom: 2rem; flex-wrap: wrap;">
            <div style="width: 90px; height: 90px; background: #6366f1; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 2rem; font-weight: 700; box-shadow: 0 4px 10px rgba(99,102,241,0.2);">
                ZA
            </div>
            <div>
                <h2 style="font-size: 2.2rem; font-weight: 800; color: #1a202c; letter-spacing: -0.5px; margin:0;">Zetty Adleena binti Zul Azrin</h2>
                <p style="color: #718096; font-size: 1.05rem; margin: 4px 0 0 0;">Project Manager & Lead Documenter</p>
            </div>
        </div>

        <div style="display: flex; gap: 10px; margin-bottom: 2rem; flex-wrap: wrap;">
            <span style="background: #f1f5f9; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; border: 1px solid #e2e8f0; color: #4f46e5; font-weight:600;">Data Analytics Specialism</span>
            <span style="background: #f1f5f9; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; border: 1px solid #e2e8f0; color: #4f46e5; font-weight:600;">ENTJ-A Strategic Operations</span>
            <span style="background: #f1f5f9; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; border: 1px solid #e2e8f0; color: #4f46e5; font-weight:600;">BSc (Hons) Student</span>
        </div>

        <div style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 8px;">Assignment Focus Area</h3>
            <p style="color: #4a5568; font-size: 1rem; text-align: justify; line-height: 1.7; margin:0;">
                Oversees the systemic "Proposal Report" and "Final Report" project submission structure. Formulates the overarching platform Mission Statement, foundational Project Plan, and time-critical Milestone Project Schedule. Conducts advanced "Audience Modelling" within the Requirement Specification phases to accurately classify and characterize target data analytics user personas and guest student authorization bounds.
            </p>
        </div>

        <div style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 12px;">Core Expert Toolsets</h3>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem;">
                <div style="background: #f8fafc; padding: 1.25rem; border-radius: 8px; border: 1px solid #e2e8f0;">
                    <strong style="color: #4f46e5; font-size: 0.95rem; display: block; margin-bottom: 6px;">Technical Frameworks</strong>
                    <p style="font-size: 0.85rem; color: #64748b; line-height: 1.5; margin:0;">Advanced Excel Modeling, Power BI Architecture, SQL Database Querying, SAS Studio, and Programmatic Data Structures.</p>
                </div>
                <div style="background: #f8fafc; padding: 1.25rem; border-radius: 8px; border: 1px solid #e2e8f0;">
                    <strong style="color: #4f46e5; font-size: 0.95rem; display: block; margin-bottom: 6px;">Management & Strategy</strong>
                    <p style="font-size: 0.85rem; color: #64748b; line-height: 1.5; margin:0;">Milestone Gantt-Scheduling, Technical Report Architecture, Operations Scoping, and Project Lifecycle Quality Audits.</p>
                </div>
            </div>
        </div>

        <div style="margin-top: 2rem; border-top: 1px solid #edf2f7; padding-top: 1.5rem;">
            <h3 style="font-size: 1.1rem; text-transform: uppercase; letter-spacing: 0.5px; color: #1a202c; margin-bottom: 12px;">Academic Background</h3>
            <ul style="list-style-type: none; font-size: 0.95rem; color: #4a5568; line-height: 1.8; padding: 0; margin:0;">
                <li style="margin-bottom: 0.75rem; padding-left: 1.5rem; position: relative;">
                    <span style="position: absolute; left: 0; color: #4f46e5; font-weight: bold;">&bull;</span>
                    <strong>Department Best Student Award</strong> — German-Malaysian Institute (Diploma in Electronics & IT, CGPA 3.90).
                </li>
                <li style="padding-left: 1.5rem; position: relative;">
                    <span style="position: absolute; left: 0; color: #4f46e5; font-weight: bold;">&bull;</span>
                    <strong>BSc (Honours) in Data Analytics Student</strong> — Asia Pacific University (Current CGPA 3.12).
                </li>
            </ul>
        </div>
    </div>
    
    <div style="text-align: center; margin-top: 20px;">
        <button type="button" class="btn btn-outline" onclick="window.location.href='About.aspx';">← Return to About Us</button>
    </div>

</asp:Content>