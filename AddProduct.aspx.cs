using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace CvSPROG7311PoE
{
    public partial class AddProduct : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string farmerName = txtFarmerName.Value;
            string productName = txtProductName.Value;
            string category = ddlProductCategory.Value;
            DateTime dateAdded = DateTime.Parse(txtDateAdded.Value);

            // Get the farmer's ID based on the full name
            int farmerID = GetFarmerID(farmerName);

            if (farmerID != -1)
            {
                // Insert the new product into the database
                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Colby van Staden\\Desktop\\Varsity\\3rd Year\\Semester 1\\PROG7311\\CvSPROG7311PoE\\CvSPROG7311PoE\\App_Data\\FarmCentral.mdf\";Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
                string insertQuery = "INSERT INTO [dbo].[Product] ([ProductName], [Category], [FarmerID], [DateAdded]) VALUES (@ProductName, @Category, @FarmerID, @DateAdded)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@ProductName", productName);
                        command.Parameters.AddWithValue("@Category", category);
                        command.Parameters.AddWithValue("@FarmerID", farmerID);
                        command.Parameters.AddWithValue("@DateAdded", dateAdded);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Display success message
                lblSuccessMessage.Text = "Product added successfully!";
                lblSuccessMessage.Visible = true;
            }
            else
            {
                // Handle the situation when farmer ID is not found
                lblErrorMessage.Text = "Invalid farmer name. Please enter a valid farmer name.";
                lblErrorMessage.Visible = true;
            }
        }
        private int GetFarmerID(string farmerName)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Colby van Staden\\Desktop\\Varsity\\3rd Year\\Semester 1\\PROG7311\\CvSPROG7311PoE\\CvSPROG7311PoE\\App_Data\\FarmCentral.mdf\";Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            string query = "SELECT FarmerID FROM [dbo].[Farmer] WHERE FullName = @FarmerName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FarmerName", farmerName);

                    connection.Open();
                    var result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int farmerID))
                    {
                        return farmerID;
                    }
                }
            }

            // If the farmer's ID is not found, you can handle the situation accordingly
            // For simplicity, let's assume if the farmer's ID is not found, we return -1
            return -1;
        }
    }
}