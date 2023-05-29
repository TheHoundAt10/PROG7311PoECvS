using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CvSPROG7311PoE
{
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFarmers();
                BindProducts();
            }
        }

        protected void BindFarmers()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"]?.ConnectionString;
            if (connectionString != null)
            {
                string query = "SELECT FarmerID, FarmerName FROM Farmers";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        ddlFarmers.DataSource = rdr;
                        ddlFarmers.DataTextField = "FarmerName";
                        ddlFarmers.DataValueField = "FarmerID";
                        ddlFarmers.DataBind();
                        ddlFarmers.Items.Insert(0, new ListItem("All Farmers", ""));
                    }
                }
            }
        }

        protected void BindProducts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"]?.ConnectionString;
            if (connectionString != null)
            {
                string query = "SELECT ProductName, Category, Quantity, DateAdded FROM Products";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        gvProducts.DataSource = rdr;
                        gvProducts.DataBind();
                    }
                }
            }
        }

        protected void ddlFarmers_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedFilter = ddlFilter.SelectedValue;
            dateFilter.Style["display"] = selectedFilter == "date" ? "block" : "none";
            categoryFilter.Style["display"] = selectedFilter == "category" ? "block" : "none";
        }

        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            string farmerID = ddlFarmers.SelectedValue;
            string filter = ddlFilter.SelectedValue;

            string query = "SELECT ProductName, Category, Quantity, DateAdded FROM Products WHERE 1=1";

            if (!string.IsNullOrEmpty(farmerID))
            {
                query += " AND FarmerID = @FarmerID";
            }

            if (filter == "date")
            {
                DateTime startDate;
                DateTime endDate;
                if (DateTime.TryParse(txtStartDate.Value, out startDate) && DateTime.TryParse(txtEndDate.Value, out endDate))
                {
                    query += " AND DateAdded BETWEEN @StartDate AND @EndDate";
                }
            }
            else if (filter == "category")
            {
                string category = ddlCategory.SelectedValue;
                query += " AND Category = @Category";
            }

            string connectionString = ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"]?.ConnectionString;
            if (connectionString != null)
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (!string.IsNullOrEmpty(farmerID))
                        {
                            cmd.Parameters.AddWithValue("@FarmerID", farmerID);
                        }

                        if (filter == "date")
                        {
                            DateTime startDate;
                            DateTime endDate;
                            if (DateTime.TryParse(txtStartDate.Value, out startDate) && DateTime.TryParse(txtEndDate.Value, out endDate))
                            {
                                cmd.Parameters.AddWithValue("@StartDate", startDate);
                                cmd.Parameters.AddWithValue("@EndDate", endDate);
                            }
                        }
                        else if (filter == "category")
                        {
                            string category = ddlCategory.SelectedValue;
                            cmd.Parameters.AddWithValue("@Category", category);
                        }

                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        gvProducts.DataSource = rdr;
                        gvProducts.DataBind();
                    }
                }
            }
        }
    }
}