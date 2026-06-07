INSERT INTO [User] (Username, Email, PasswordHash, Role) VALUES 
--admin2
--afi123
 --zetty123
('admin2', 'admin2@apu.edu.my', '1c142b2601f28fed0fd49b6ded47ca73644f199017ae1cfafb152d1d07c06c59', 'Admin'),
('afi', 'afi@mail.apu.edu.my', '61159954a20b0804473cb109033379203673c683b544d6735db9d6d5eb7f7b24', 'Member'),
('zetty', 'zetty@mail.apu.edu.my', '6f38efcd8b725c8148b5ffb0f59063548edb4b6ba3e4c4493397945d8b80b7b1', 'Member');

-- 2. SEEDING LEARNING MODULES
INSERT INTO Module (Title, Description, Category, ContentURL) VALUES 
('Power BI Fundamentals', 'Introduction to data ingestion, modeling, and building interactive dashboards.', 'Power BI', 'https://datavizacademy.edu/modules/pbi-101'),
('Advanced Python Visualization', 'Mastering Seaborn, Matplotlib, and Plotly for complex data distributions.', 'Python', 'https://datavizacademy.edu/modules/py-viz'),
('Tableau Dashboard Design', 'Structuring professional storytelling dashboards and actions in Tableau.', 'Tableau', 'https://datavizacademy.edu/modules/tableau-pro');

-- 3. SEEDING ASSESSMENTS (1:1 with Modules)
INSERT INTO Assessment (ModuleID, QuestionData, PassingScore) VALUES 
(1, '{"quiz_title":"Power BI Basics","questions":[{"q":"What does DAX stand for?","options":["Data Analysis Expressions","Digital Asset Exchange"],"correct":0}]}', 80),
(2, '{"quiz_title":"Python Plotting","questions":[{"q":"Which library is built on top of Matplotlib?","options":["Seaborn","NumPy"],"correct":0}]}', 80);

-- 4. SEEDING USER PROGRESS LOGS
INSERT INTO UserProgress (UserID, ModuleID, Score, CompletionStatus, ProgressionPercentage) VALUES 
(2, 1, 85.00, 'Completed', 100),
(3, 1, NULL, 'In Progress', 40);

-- 5. SEEDING PORTFOLIO SHOWCASE (Visualizations)
INSERT INTO Visualization (UserID, Title, ToolUse, ImageURL, Modified) VALUES 
(2, 'APU Student Talent Trajectory Dashboard', 'Power BI', 'https://datavizacademy.edu/gallery/talent-map.png', GETDATE()),
(3, 'Global Climate Change Trends 2026', 'Python', 'https://datavizacademy.edu/gallery/climate-line.png', GETDATE());

-- 6. SEEDING COMMUNITY FORUM POSTS
INSERT INTO ForumPost (UserID, Topic, Content, Timestamp) VALUES 
(2, 'Stuck on SAS Viya Data Preprocessing', 'How do I optimize data cleaning pipelines in SAS Viya before training a predictive model?', GETDATE()),
(1, 'Welcome to DataViz Academy Forum!', 'Please use this asynchronous space to discuss course material and share your visualization portfolios.', GETDATE());

-- Associates specific badges automatically to your 3 seeded modules
INSERT INTO Badge (BadgeName, Description, IconURL, ModuleID) VALUES 
('Power BI Pioneer', 'Awarded for completing the Power BI Fundamentals track.', '~/Images/Badges/pbi_champion.png', 1),
('Python Snake Charmer', 'Awarded for mastering complex Python scripts and visualization.', '~/Images/Badges/python_expert.png', 2),
('Tableau Storyteller', 'Awarded for completing advanced Tableau structural workflows.', '~/Images/Badges/tableau_master.png', 3);