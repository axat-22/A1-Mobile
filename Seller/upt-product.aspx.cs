using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace A1Mobile.Seller
{
    public partial class upt_product : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    SqlDataAdapter sa = new SqlDataAdapter("Select * from tbl_product where id=" + Request.QueryString["id"].ToString() + "", conn);
                    DataTable dt = new DataTable();
                    conn.Open();
                    sa.Fill(dt);
                    conn.Close();
                    txtProdname.Text = dt.Rows[0]["Prodname"].ToString();
                    txtProdmodel.Text = dt.Rows[0]["Prodmodel"].ToString();
                    txtprodram.Text = dt.Rows[0]["prodram"].ToString();
                    txtprodstorage.Text = dt.Rows[0]["prodstorage"].ToString();
                    txtprodprice.Text = dt.Rows[0]["prodprice"].ToString();
                    txtproddescription.Text = dt.Rows[0]["Proddescription"].ToString();
                    txtquantity.Text = dt.Rows[0]["quantity"].ToString();



                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand sqlCommand = new SqlCommand("update tbl_product set Prodname='"+txtProdname.Text+"',Prodmodel='"+txtProdmodel.Text+ "'" +
                ",prodram='"+txtprodram.Text+"',prodstorage='"+txtprodstorage.Text+"',prodprice='"+txtprodprice.Text+"'" +
                ",proddescription='"+txtproddescription.Text+"',quantity='"+txtquantity.Text+"' where id=" + Request.QueryString["id"].ToString() + "", conn);
            conn.Open();
            sqlCommand.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("product-list.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("product-list.aspx");
        }
    }
}