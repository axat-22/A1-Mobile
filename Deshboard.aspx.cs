using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1Mobile.Buyer
{
    public partial class Deshboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter sa = new SqlDataAdapter("select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id", conn);
            DataSet dt = new DataSet();
            conn.Open();
            sa.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            conn.Close();

        }

 

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string query = "select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id where productname like @productname +'%'";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            adapter.SelectCommand.Parameters.AddWithValue("@productname", txtsearch.Text.Trim());
            conn.Open();
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            conn.Close();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string query = "select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id where productname like @productname +'%'";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            adapter.SelectCommand.Parameters.AddWithValue("@productname", txtsearch.Text.Trim());
            conn.Open();
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            conn.Close();
        }
    }
}
        