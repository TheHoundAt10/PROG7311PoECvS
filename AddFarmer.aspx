<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFarmer.aspx.cs" Inherits="CvSPROG7311PoE.AddFarmer" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Farmer</title>
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
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #EA5455;
            font-weight: bold;
        }
        
        input[type="text"],
        input[type="password"], 
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
    <form id="formAddFarmer" runat="server">
        <div class="navbar">
            <span class="brand">Farm Central</span>
            <a href="EmployeeHome.aspx">Home</a>
            <a href="#">Add Farmer</a>
            <a href="ViewProducts.aspx">View Products</a>
        </div>

        <div class="container">
            <h1>Add Farmer</h1>
            <div class="form-group">
                <label for="txtFarmerName">Farmer Name</label>
                <input type="text" id="txtFarmerName" name="txtFarmerName" runat="server" required />
            </div>
            <div class="form-group">
                <label for="txtContactNumber">Contact Number</label>
                <input type="text" id="txtContactNumber" name="txtContactNumber" runat="server" required />
            </div>
            <div class="form-group">
                <label for="txtFarmerUserName">Farmer Username</label>
                <input type="text" id="txtFarmerUserName" name="txtFarmerUserName" runat="server" required />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <input type="password" id="txtPassword" name="txtPassword" runat="server" required />
            </div>
            <div class="form-group">
                <label for="txtRePassword">Re-Enter Password</label>
                <input type="password" id="txtRePassword" name="txtRePassword" runat="server" required />
            </div>
            <asp:Label ID="lblErrorMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblSuccessMessage" runat="server" Visible="false" ForeColor="Green"></asp:Label>
            <asp:Button ID="btnAddFarmer" runat="server" Text="Add Farmer" OnClick="btnAddFarmer_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>