using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace CvSPROG7311PoE
{
    public partial class Log_In : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = Request.Form["txtUsername"];
            string password = Request.Form["txtPassword"];

            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Colby van Staden\\Desktop\\Varsity\\3rd Year\\Semester 1\\PROG7311\\CvSPROG7311PoE\\CvSPROG7311PoE\\App_Data\\FarmCentral.mdf\";Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";

            int passwordID = 0;

            // Check if the username and password match in the Password table
            string passwordQuery = "SELECT PasswordID FROM [Password] WHERE Username = @Username AND [Password] = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(passwordQuery, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();

                    var result = command.ExecuteScalar();
                    if (result != null && int.TryParse(result.ToString(), out passwordID))
                    {
                        // Valid username and password, check the type of user
                        string userTypeQuery = "SELECT 'Employee' FROM [Employee] WHERE PasswordID = @PasswordID " +
                                               "UNION ALL " +
                                               "SELECT 'Farmer' FROM [Farmer] WHERE PasswordID = @PasswordID";

                        using (SqlCommand userTypeCommand = new SqlCommand(userTypeQuery, connection))
                        {
                            userTypeCommand.Parameters.AddWithValue("@PasswordID", passwordID);

                            var userType = userTypeCommand.ExecuteScalar();
                            if (userType != null)
                            {
                                string userTypeValue = userType.ToString();

                                if (userTypeValue.Equals("Employee", StringComparison.OrdinalIgnoreCase))
                                {
                                    // User is an employee
                                    Response.Redirect("~/EmployeeHome.aspx");
                                    return;
                                }
                                else if (userTypeValue.Equals("Farmer", StringComparison.OrdinalIgnoreCase))
                                {
                                    // User is a farmer
                                    Response.Redirect("~/FarmerHome.aspx");
                                    return;
                                }
                            }
                        }
                    }
                }
            }

            // Invalid username or password, display an error message
            lblErrorMessage.InnerText = "Invalid username or password";
        }
    }
}
