<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DataViz_Academy.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #2c3e50;
            padding: 15px 40px;
        }

        .logo {
            color: white;
            font-size: 22px;
            font-weight: bold;
        }   

        .nav-links {
            list-style: none;
            display: flex;
        }   

        .nav-links li {
            margin-left: 25px;
        }   

        .nav-links a {
            text-decoration: none;
            color: darkblue;
            font-size: 25px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #1abc9c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome Guest</h1>
            <br />
            <br />
            <ul class="nav-links">
                <li><a href="Home.aspx">Manage Profile</a></li>
                <li><a href="Resources.aspx">Log Out</a></li>
                <li><a href="Forum.aspx">Login</a></li>
                <li><a href="Assessment.aspx">Register</a></li>
            </ul>
            <br />
        </div>
    </form>
</body>
</html>
