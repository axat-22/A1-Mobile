//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Configuration;


//namespace A1Mobile.Seller
//{
//    public partial class Dashboard : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                if (Session["userid"] != null && Session["userid"].ToString() != "")
//                {
//                    hfSellerId.Value = Session["userid"].ToString();
//                }
//                else
//                {
//                    Response.Redirect("login.aspx");
//                }



//                GetSellerDashboardData();
//            }
//        }

//        private void GetSellerDashboardData()
//        {
//            try
//            {
//                conn.Open();

//                // 1. Total Products Sold
//                SqlCommand soldCommand = new SqlCommand("SELECT SUM(soldItems) FROM tbl_product WHERE sellerId = @SellerId", conn);
//                soldCommand.Parameters.AddWithValue("@SellerIH", Session["SellerId"]);
//                var totalSold = soldCommand.ExecuteScalar();
//                lblTotalSold.Text = totalSold != DBNull.Value ? totalSold.ToString() : "0";

//                // 2. Remaining Products
//                SqlCommand remainingCommand = new SqlCommand("SELECT SUM(quantity) FROM tbl_product WHERE sellerId = @SellerId", conn);
//                remainingCommand.Parameters.AddWithValue("@SellerId", Session["SellerId"]);
//                var remaining = remainingCommand.ExecuteScalar();
//                lblRemaining.Text = remaining != DBNull.Value ? remaining.ToString() : "0";

//                // 3. Total Earnings (Total Revenue)
//                SqlCommand earningsCommand = new SqlCommand("SELECT SUM(prodprice * soldItems) FROM tbl_product WHERE sellerId = @SellerId", conn);
//                earningsCommand.Parameters.AddWithValue("@SellerId", Session["SellerId"]);
//                var totalEarnings = earningsCommand.ExecuteScalar();
//                lblTotalEarnings.Text = totalEarnings != DBNull.Value ? "₹" + totalEarnings.ToString() : "₹0.00";

//                conn.Close();
//            }
//            catch (Exception ex)
//            {
//                // Handle exception
//                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
//            }
//        }
//    }
//}



//using System;
//using System.Data.SqlClient;
//using System.Data;
//using System.Web;
//using System.Web.UI;
//using System.Configuration;

//namespace A1Mobile.Seller
//{
//    public partial class Dashboard : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                if (Session["userid"] != null)
//                {
//                    GetSellerDashboardData();
//                }
//                else
//                {
//                    Response.Redirect("login.aspx");
//                }
//            }
//        }

//        private void GetSellerDashboardData()
//        {
//            try
//            {
//                conn.Open();

//                // Total Products Sold
//                SqlCommand soldCommand = new SqlCommand("SELECT SUM(soldItems) FROM tbl_product WHERE sellerId = @SellerId", conn);
//                soldCommand.Parameters.AddWithValue("@SellerId", Session["userid"]);
//                var totalSold = soldCommand.ExecuteScalar();
//                lblTotalSold.Text = totalSold != DBNull.Value ? totalSold.ToString() : "0";

//                // Remaining Products
//                SqlCommand remainingCommand = new SqlCommand("SELECT SUM(quantity) FROM tbl_product WHERE sellerId = @SellerId", conn);
//                remainingCommand.Parameters.AddWithValue("@SellerId", Session["userid"]);
//                var remaining = remainingCommand.ExecuteScalar();
//                lblRemaining.Text = remaining != DBNull.Value ? remaining.ToString() : "0";

//                // Total Earnings (Total Revenue)
//                SqlCommand earningsCommand = new SqlCommand("SELECT SUM(prodprice * soldItems) FROM tbl_product WHERE sellerId = @SellerId", conn);
//                earningsCommand.Parameters.AddWithValue("@SellerId", Session["userid"]);
//                var totalEarnings = earningsCommand.ExecuteScalar();
//                lblTotalEarnings.Text = totalEarnings != DBNull.Value ? "₹" + totalEarnings.ToString() : "₹0.00";

//                conn.Close();
//            }
//            catch (Exception ex)
//            {
//                // Handle exception
//                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
//            }
//        }
//    }
//}



//using System;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web;
//using System.Web.UI;

//namespace A1Mobile.Seller
//{
//    public partial class Dashboard : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            // Debugging ke liye session value print karte hain
//            if (Session["userid"] != null)
//            {
//                int sellerId = Convert.ToInt32(Session["userid"]);
//                Response.Write("<script>alert('SellerId: " + sellerId + "');</script>");
//                if (!IsPostBack)
//                {
//                    LoadDashboardData(sellerId);
//                }
//            }
//            else
//            {
//                Response.Write("<script>alert('Session value not found');</script>");
//            }
//        }



//        private void LoadDashboardData(int sellerId)
//        {
//            try
//            {
//                conn.Open();

//                // Total Products Sold Query
//                SqlCommand cmdSold = new SqlCommand("SELECT COUNT(*) FROM tbl_orders WHERE SellerId = @SellerId AND OrderStatus = 'Completed'", conn);
//                cmdSold.Parameters.AddWithValue("@SellerId", sellerId);
//                int totalSold = Convert.ToInt32(cmdSold.ExecuteScalar());

//                // Remaining Products Query
//                SqlCommand cmdRemaining = new SqlCommand("SELECT COUNT(*) FROM tbl_products WHERE SellerId = @SellerId AND IsSold = 0", conn);
//                cmdRemaining.Parameters.AddWithValue("@SellerId", sellerId);
//                int remaining = Convert.ToInt32(cmdRemaining.ExecuteScalar());

//                // Total Earnings Query
//                SqlCommand cmdEarnings = new SqlCommand("SELECT SUM(OrderAmount) FROM tbl_orders WHERE SellerId = @SellerId AND OrderStatus = 'Completed'", conn);
//                cmdEarnings.Parameters.AddWithValue("@SellerId", sellerId);
//                decimal totalEarnings = Convert.ToDecimal(cmdEarnings.ExecuteScalar());

//                // Labels ko data set karna
//                lblTotalSold.Text = totalSold.ToString();
//                lblRemaining.Text = remaining.ToString();
//                lblTotalEarnings.Text = "₹" + totalEarnings.ToString("F2");

//                conn.Close();
//            }
//            catch (Exception ex)
//            {
//                conn.Close();
//                // Agar koi error aata hai toh
//                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
//            }




//            try
//            {
//                conn.Open();
//                // SQL commands here
//            }
//            catch (Exception ex)
//            {
//                Response.Write("<script>alert('SQL Error: " + ex.Message + "');</script>");
//            }
//            finally
//            {
//                conn.Close();
//            }


//            Response.Write("Total Sold: " + lblTotalSold + "<br>");
//            Response.Write("Remaining Products: " + lblRemaining + "<br>");
//            Response.Write("Total Earnings: ₹" + lblTotalEarnings + "<br>");


//        }



//    }
//}

using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace A1Mobile.Seller
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    LoadSellerData();
                    LoadTotalEarnings();
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private void LoadSellerData()
        {
            try
            {
                string sellerId = Session["userid"].ToString();

                SqlCommand cmd = new SqlCommand(@"
                    SELECT 
                        SUM(CAST(quantity AS INT)) - SUM(CAST(Solditem AS INT)) AS RemainingProducts,
                        ISNULL(SUM(CAST(Solditem AS int)), 0) AS TotalSold
                    FROM tbl_product
                    WHERE Sellerid = @SellerId ", conn);

                cmd.Parameters.AddWithValue("@SellerId", sellerId);







                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }


                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblRemaining.Text = reader["RemainingProducts"] != DBNull.Value ? reader["RemainingProducts"].ToString() : "0";
                    lblTotalSold.Text = reader["TotalSold"] != DBNull.Value ? reader["TotalSold"].ToString() : "0";

                }

                conn.Close();
            }
            catch (Exception ex)
            {
                // Error handle karo
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


        private void LoadTotalEarnings()
        {
            try
            {
                string sellerId = Session["userid"].ToString();

                SqlCommand cmd = new SqlCommand(@"
            SELECT 
                ISNULL(SUM(totalprice * quantity), 0) AS TotalEarnings
            FROM tbl_order
            WHERE sellerregid = @SellerId
           ", conn);

                cmd.Parameters.AddWithValue("@SellerId", sellerId);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                decimal totalEarnings = Convert.ToDecimal(cmd.ExecuteScalar());

                conn.Close();

                lblTotalEarnings.Text = totalEarnings.ToString("0.00"); // 2 decimal me dikhega
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

    }
}









