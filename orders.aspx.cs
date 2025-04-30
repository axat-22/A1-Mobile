using A1Mobile.Seller;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1Mobile.Buyer
{
    public partial class payment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
                
            if (Session["userid"].ToString() != "")
                {
                    hdid.Value = Session["userid"].ToString();
                pay();

            }
            else
                {
                    Response.Redirect("login.aspx");
                    hdid.Value = "";

                }

            
        }



        private void pay()
        {
            //  SqlDataAdapter ad = new SqlDataAdapter("select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id where  productname= 'Apple'", conn);

             string query = "select distinct t.*,q.productname,p.paymentstatus," +
                "isnull(r.FirstName, '') + ' ' + isnull(r.MiddleName, '') + ' ' + isnull(r.LastName, '') as sellername,p.pyttype from tbl_order t " +
                " inner join mst_product q on t.prodid = q.id" +
                " inner join tbl_payment p on t.ID = p.orderid" +
                " inner join tbl_registration r on r.ID = t.sellerregid where t.buyerregid = " + hdid.Value + " order by t.orddate desc";

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

        protected void linkbtn_Click(object sender, EventArgs e)
        {
         
        }
    }
}