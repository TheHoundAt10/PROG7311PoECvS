<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerHome.aspx.cs" Inherits="CvSPROG7311PoE.FarmerHome" %>

<!DOCTYPE html>
<html>
<head>
    <title>Farmer Home</title>
    <style>
        body {
            background-color: #F9F5EB;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .container {
            max-width: 800px;
            margin: 150px auto 0;
            padding: 20px;
            background-color: #E4DCCF;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            margin-top: 30px;
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
        
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        
        th,
        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }
        
        th {
            background-color: #EA5455;
            color: white;
        }
        
        tbody tr:hover {
            background-color: #F9F5EB;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <span class="brand">Farm Central</span>
        <a href="#">Home</a>
        <a href="AddProduct.aspx">Add Product</a>
    </div>
    
    <div class="container">
        <h1>Current Products</h1>
        
        <table id="tblProducts" runat="server">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Date Added</th>
                </tr>
            </thead>
            <tbody>
                <!-- Rows will be added dynamically using JavaScript -->
            </tbody>
        </table>
    </div>
    <script src="Scripts/jquery-3.6.0.min.js"></script> <!-- Include jQuery library -->
    <script src="Scripts/FarmerHome.js"></script> <!-- Include custom JavaScript file -->
</body>
</html>
