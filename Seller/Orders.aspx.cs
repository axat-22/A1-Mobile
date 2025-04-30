using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;

namespace A1Mobile.Seller
{
    public partial class Orders : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"].ToString() != "")
            {
                hdid.Value = Session["userid"].ToString();

            }
            else
            {
                Response.Redirect("login.aspx");
                hdid.Value = "";

            }

          

            pay();
        }
        //private void pay()
        //{
        //    SqlDataAdapter ad = new SqlDataAdapter("select t.*,q.productname,p.paymentstatus,p.pyttype,isnull(r.FirstName,'') + ' ' " +
        //        "+ isnull(r.MiddleName,'') + ' ' + isnull(r.LastName,'') as BuyerName from tbl_order t " +
        //        "inner join mst_product q on t.prodid = q.id  inner join tbl_payment p on t.ID = p.orderid " +
        //        "inner join tbl_registration r on r.ID = t.buyerregid where t.sellerregid = " + hdid.Value + " order by t.orddate desc ", conn);






        //    conn.Open();

        //    DataTable dt = new DataTable();
        //    ad.Fill(dt);
        //    grd.DataSource = dt;
        //    grd.DataBind();
        //    conn.Close();
        //}

        private void pay()
        {
            // SQL query with DISTINCT added to remove duplicate rows
            string query = "SELECT DISTINCT t.*, " +
                           "q.productname, " +
                           "p.paymentstatus, " +
                           "p.pyttype, " +
                           "ISNULL(r.FirstName, '') + ' ' + ISNULL(r.MiddleName, '') + ' ' + ISNULL(r.LastName, '') AS BuyerName " +
                           "FROM tbl_order t " +
                           "INNER JOIN mst_product q ON t.prodid = q.id " +
                           "INNER JOIN tbl_payment p ON t.ID = p.orderid " +
                           "INNER JOIN tbl_registration r ON r.ID = t.buyerregid " +
                           "WHERE t.sellerregid = " + hdid.Value + " " +
                           "ORDER BY t.orddate DESC";

            // Debugging: print the query to console or output window
            System.Diagnostics.Debug.WriteLine(query); // Print to output for debugging

            SqlDataAdapter ad = new SqlDataAdapter(query, conn);

            // Open connection, fetch data, and bind it to GridView
            conn.Open();
            DataTable dt = new DataTable();
            ad.Fill(dt);
            grd.DataSource = dt;
            grd.DataBind();
            conn.Close();
        }




    }




}
