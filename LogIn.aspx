<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="CvSPROG7311PoE.Log_In" %>

<!DOCTYPE html>

<html>
<head>
    <title>Farm Central</title>
    <style>
        body {
            background-image: url(Images/loginImg.jpg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #002B5B;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0.3, 0.3, 0.3, 0.3);
            margin-top: 150px;
        }
        
        h1 {
            text-align: center;
            color: #F9F5EB;
            cursor: default;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #F9F5EB;
            font-weight: bold;
        }
        
        input[type="text"],
        input[type="password"] {
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
            background-color: #EA5455;
            border: none;
            border-radius: 4px;
            color: white;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        
        .btn:hover {
            background-color: #B22727;
        }

        .error-message {
            color: #FF0000;
            font-weight: bold;
            text-align: center;
        }
    </style>
   
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form runat="server">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="txtUsername" name="txtUsername" required />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="txtPassword" name="txtPassword" required />
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
        </form>
        <span id="lblErrorMessage" class="error-message" runat="server"></span>
    </div>
</body>
</html>