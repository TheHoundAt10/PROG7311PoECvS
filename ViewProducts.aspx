<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="CvSPROG7311PoE.ViewProducts" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
    <style>
        /* Styles for the navbar */
        .navbar {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-right: 10px;
        }

        /* Styles for the container */
        .container {
            margin: 20px auto;
            width: 80%;
        }

        /* Styles for the table */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Styles for the filter options */
        .form-group {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <a href="#">Home</a>
            <a href="#">Add Farmer</a>
            <a href="#">View Products</a>
        </div>

        <div class="container">
            <h1>View Products</h1>

            <div class="form-group">
                <label for="ddlFarmers">Select Farmer:</label>
                <asp:DropDownList ID="ddlFarmers" runat="server" OnSelectedIndexChanged="ddlFarmers_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="All Farmers" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlFilter">Filter By:</label>
                <asp:DropDownList ID="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="No Filter" Value=""></asp:ListItem>
                    <asp:ListItem Text="Date Range" Value="date"></asp:ListItem>
                    <asp:ListItem Text="Product Category" Value="category"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div id="dateFilter" runat="server" style="display: none;">
                <div class="form-group">
                    <label for="txtStartDate">Start Date:</label>
                    <input type="date" id="txtStartDate" name="txtStartDate" runat="server">
                </div>
                <div class="form-group">
                    <label for="txtEndDate">End Date:</label>
                    <input type="date" id="txtEndDate" name="txtEndDate" runat="server">
                </div>
            </div>

            <div id="categoryFilter" runat="server" style="display: none;">
                <div class="form-group">
                    <label for="ddlCategory">Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server">
                        <asp:ListItem Text="Category 1" Value="Category 1"></asp:ListItem>
                        <asp:ListItem Text="Category 2" Value="Category 2"></asp:ListItem>
                        <asp:ListItem Text="Category 3" Value="Category 3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Button ID="btnApplyFilter" runat="server" Text="Apply Filter" OnClick="btnApplyFilter_Click" />

            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CssClass="gridview" HeaderStyle-CssClass="gridview-header" RowStyle-CssClass="gridview-row">
                <HeaderStyle CssClass="gridview-header" BackColor="#f2f2f2" />
                <RowStyle CssClass="gridview-row" BorderColor="#ddd" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="25%" />
                    <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-Width="25%" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-Width="25%" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="DateAdded" HeaderText="Date Added" ItemStyle-Width="25%" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script>
        function applyFilter() {
            var filter = document.getElementById("ddlFilter").value;

            if (filter === "date") {
                document.getElementById("dateFilter").style.display = "block";
                document.getElementById("categoryFilter").style.display = "none";
            } else if (filter === "category") {
                document.getElementById("dateFilter").style.display = "none";
                document.getElementById("categoryFilter").style.display = "block";
            } else {
                document.getElementById("dateFilter").style.display = "none";
                document.getElementById("categoryFilter").style.display = "none";
            }
        }
    </script>
</body>
</html>
