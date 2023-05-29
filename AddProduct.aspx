<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="CvSPROG7311PoE.AddProduct" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
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
    <form id="form1" runat="server">
        <div class="navbar">
            <span class="brand">Farm Central</span>
            <a href="FarmerHome.aspx">Home</a>
            <a href="#">Add Product</a>
        </div>
        
        <div class="container">
            <h1>Add Product</h1>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            <div class="form-group">
                <label for="txtFarmerName">Farmer Name</label>
                <input type="text" id="txtFarmerName" name="txtFarmerName" runat="server" required />
            </div>
            <div class="form-group">
                <label for="txtProductName">Product Name</label>
                <input type="text" id="txtProductName" name="txtProductName" runat="server" required />
            </div>
            <div class="form-group">
                <label for="ddlProductCategory">Product Category</label>
                <select id="ddlProductCategory" name="ddlProductCategory" runat="server" required>
                    <option value="">Select Product Category</option>
                    <option value="Fruit">Fruit</option>
                    <option value="Vegetable">Vegetable</option>
                    <option value="Dairy">Dairy</option>
                    <option value="Meat">Meat</option>
                    <option value="Livestock">Livestock</option>
                    <option value="Grains">Grains</option>
                    <option value="Livestock Produce">Livestock Produce</option>
                    <option value="Game">Game</option>
                    <option value="Alfalfa">Alfalfa</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="txtDateAdded">Date Added</label>
                <input type="date" id="txtDateAdded" name="txtDateAdded" runat="server" required />
            </div>
            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="btn" />
            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
