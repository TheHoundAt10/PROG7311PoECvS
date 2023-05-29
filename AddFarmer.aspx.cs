using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace CvSPROG7311PoE
{
    public partial class AddFarmer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddFarmer_Click(object sender, EventArgs e)
        {
            string farmerName = txtFarmerName.Value;
            string farmerUserName = txtFarmerUserName.Value;
            string password = txtPassword.Value;
            string reenteredPassword = txtRePassword.Value;
            string contactNumber = txtContactNumber.Value;

            // Check if passwords match
            if (password != reenteredPassword)
            {
                lblErrorMessage.Text = "Passwords do not match.";
                lblErrorMessage.Visible = true;
                return;
            }

            // Insert the new farmer into the database
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Colby van Staden\Desktop\Varsity\3rd Year\Semester 1\PROG7311\CvSPROG7311PoE\CvSPROG7311PoE\App_Data\FarmCentral.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            string insertQuery = "INSERT INTO [dbo].[Farmer] ([FullName], [ContactNumber], [PasswordID]) VALUES (@FullName, @ContactNumber, @PasswordID)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    try
                    {
                        connection.Open();
                        // Insert into Password table
                        string passwordInsertQuery = "INSERT INTO [dbo].[Password] ([Username], [Password]) VALUES (@Username, @Password)";
                        using (SqlCommand passwordCommand = new SqlCommand(passwordInsertQuery, connection))
                        {
                            passwordCommand.Parameters.AddWithValue("@Username", farmerUserName);
                            passwordCommand.Parameters.AddWithValue("@Password", password);
                            passwordCommand.ExecuteNonQuery();
                        }

                        // Retrieve the generated PasswordID
                        string passwordIDQuery = "SELECT IDENT_CURRENT('[dbo].[Password]') AS [PasswordID]";
                        using (SqlCommand passwordIDCommand = new SqlCommand(passwordIDQuery, connection))
                        {
                            int passwordID = Convert.ToInt32(passwordIDCommand.ExecuteScalar());

                            // Insert into Farmer table
                            command.Parameters.AddWithValue("@FullName", farmerName);
                            command.Parameters.AddWithValue("@ContactNumber", contactNumber);
                            command.Parameters.AddWithValue("@PasswordID", passwordID);
                            command.ExecuteNonQuery();
                        }

                        lblSuccessMessage.Text = "Farmer added successfully!";
                        lblSuccessMessage.Visible = true;

                        // Clear form fields after successful submission
                        txtFarmerName.Value = string.Empty;
                        txtFarmerUserName.Value = string.Empty;
                        txtPassword.Value = string.Empty;
                        txtRePassword.Value = string.Empty;
                        txtContactNumber.Value = string.Empty;
                    }
                    catch (Exception ex)
                    {
                        lblErrorMessage.Text = "Error occurred while adding the farmer. Please try again.";
                        lblErrorMessage.Visible = true;
                    }
                }
            }
        }
    }
}