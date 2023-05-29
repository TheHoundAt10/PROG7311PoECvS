<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeHome.aspx.cs" Inherits="CvSPROG7311PoE.EmployeeHome" %>

<!DOCTYPE html>
<html>
<head>
    <title>Farm Central</title>
    <style>
        body {
            background-color: #F9F5EB;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin: 150px auto 0;
            padding: 20px;
            background-color: #E4DCCF;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            margin-top: 110px;
        }
        
        .navbar {
            background-color: #002B5B;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .navbar a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
            position: relative;
            transition: transform 0.3s;
            cursor: pointer;
        }
        
        .navbar a:hover {
            transform: scale(1.1);
        }
        
        .navbar .brand {
            font-size: 25px;
            font-weight: bold;
            margin-right: 20px;
            color: antiquewhite;
            cursor: default;
        }
        
        .navbar a:not(:last-child)::after {
            content: "";
            position: inherit;
            top: 50%;
            right: -5px;
            transform: translateY(-50%);
            height: 70%;
            width: 1px;
            background-color: white;
        }
        
        h1 {
            text-align: center;
            color: #EA5455;
            cursor: default;
        }
        
        .welcome {
            text-align: center;
            color: #EA5455;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .welcome1 {
            text-align: center;
            color: #EA5455;
            font-size: 15px;
            margin-bottom: 20px;
        }
        
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #002B5B;
            border: none;
            border-radius: 4px;
            color: white;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        
        .btn:hover {
            background-color: #495579;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <span class="brand">Farm Central</span>
        <a href="#">Home</a>
        <a href="AddFarmer.aspx">Add Farmer</a>
        <a href="ViewProducts.aspx">View Products</a>
    </div>
    
    <div class="container">
        <h1>Welcome to Farm Central</h1>
        <p class="welcome">Employee active</p>
        <p class="welcome1">Begin using the platform and manage your farmers and their products.</p>
    </div>
</body>
</html>
