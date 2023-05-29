using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CvSPROG7311PoE
{
    public partial class FarmerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductTable();
            }
        }

        private void BindProductTable()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Colby van Staden\\Desktop\\Varsity\\3rd Year\\Semester 1\\PROG7311\\CvSPROG7311PoE\\CvSPROG7311PoE\\App_Data\\FarmCentral.mdf\";Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            string query = "SELECT [ProductName], [Category], [DateAdded] FROM [Product]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Iterate through the rows and generate the HTML for each row
                    foreach (DataRow row in dataTable.Rows)
                    {
                        string productName = row["ProductName"].ToString();
                        string category = row["Category"].ToString();
                        string dateAdded = ((DateTime)row["DateAdded"]).ToString("yyyy-MM-dd");

                        // Create new table row and cells
                        HtmlTableRow tableRow = new HtmlTableRow();
                        HtmlTableCell cellProductName = new HtmlTableCell();
                        HtmlTableCell cellCategory = new HtmlTableCell();
                        HtmlTableCell cellDateAdded = new HtmlTableCell();

                        // Set cell values
                        cellProductName.InnerText = productName;
                        cellCategory.InnerText = category;
                        cellDateAdded.InnerText = dateAdded;

                        // Add cells to the table row
                        tableRow.Cells.Add(cellProductName);
                        tableRow.Cells.Add(cellCategory);
                        tableRow.Cells.Add(cellDateAdded);

                        // Add the table row to the table body
                        tblProducts.Rows.Add(tableRow);
                    }
                }
            }
        }
    }
}