-- 1. User Table (Authentication)
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL,
    PasswordHash NVARCHAR(MAX) NOT NULL,
    Role NVARCHAR(20) NOT NULL
);

-- 2. Module Table (Learning Content)
CREATE TABLE Module (
    ModuleID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Category NVARCHAR(50) NOT NULL,
    ContentURL NVARCHAR(2048) NOT NULL
);

-- 3. Assessment Table (1:1 with Module)
CREATE TABLE Assessment (
    AssessmentID INT IDENTITY(1,1) PRIMARY KEY,
    ModuleID INT NOT NULL UNIQUE,
    QuestionData NVARCHAR(MAX) NOT NULL,
    PassingScore INT NOT NULL,
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID)
);

-- 4. UserProgress Table (Tracks Student Success)
CREATE TABLE UserProgress (
    ProgressID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    ModuleID INT NOT NULL,
    Score DECIMAL(5,2) NULL,
    CompletionStatus NVARCHAR(20) NOT NULL,
    ProgressionPercentage INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID)
);

-- 5. Visualization Table (For CRUD Operations)
CREATE TABLE Visualization (
    VizID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    ToolUse NVARCHAR(50) NOT NULL,
    ImageURL NVARCHAR(2048) NULL,
    Modified DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

-- 6. ForumPost Table (Community Discussions)
CREATE TABLE ForumPost (
    PostID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Topic NVARCHAR(100) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    Timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
