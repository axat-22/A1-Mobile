using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using A1Mobile.Seller;
using System.Collections;
using System.Xml.Linq;
using System.Net.NetworkInformation;

namespace A1Mobile
{
    public partial class product_list : System.Web.UI.Page
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



            bindgrid();

        }

        private void bindgrid()
        {

            if (txtsearch.Text == "")
            {
                SqlDataAdapter ad = new SqlDataAdapter("select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id  where t.Sellerid = " + hdid.Value, conn);

                conn.Open();

                DataTable dt = new DataTable();
                ad.Fill(dt);
                grd.DataSource = dt;
                grd.DataBind
                    ();
                conn.Close();
            }
            else
            {
                string query = "select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id where productname like @productname +'%'";


                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                adapter.SelectCommand.Parameters.AddWithValue("@productname", txtsearch.Text.Trim());
                conn.Open();
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                grd.DataSource = dt;
                grd.DataBind();
                conn.Close();

            }

        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = 0;

            switch (e.CommandName)
            {
                case "del":
                    index = Convert.ToInt32(e.CommandArgument);

                    SqlCommand sda = new SqlCommand("delete From tbl_product where id = " + Convert.ToString(index), conn);

                    conn.Open();

                    sda.ExecuteNonQuery();

                    int RevVal = sda.ExecuteNonQuery();

                    conn.Close();

                    if (RevVal > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alert", "<script>alert('Product Deleted');</script>", false);
                    }

                    bindgrid();

                    break;
            }






            //SqlDataAdapter da = new SqlDataAdapter("select * from quantity where prodid = '"+hdquantity.Value+"' ", conn);
            //DataTable dt = new DataTable();
            //conn.Open(); 
            //da.Fill(dt);
            //conn.Close();
                

            //if (dt.Rows.Count > 0)
            //{
            //    int qnty;
            //    qnty = Convert.ToInt32(hdquantity.Value) - Convert.ToInt32(dt.Rows[0]["totalquantity"].ToString());

            //    SqlCommand cm = new SqlCommand("update quantity set totalquantity ='" + qnty+"' where prodid =" + hdquantity.Value, conn);
            //    conn.Open();
            //    cm.ExecuteNonQuery();
            //    conn.Close();
            //}

            //else
            //{

            //    SqlCommand comm = new SqlCommand("insert into quantity(prodid,totalquantity) values ('"+hdquantity.Value+"')", conn);

            //    conn.Open();
            //    comm.ExecuteNonQuery();
            //    conn.Close(); 
            //}
        }
            
        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("product.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            bindgrid();
            //  string query = "Select * from tbl_product where Prodname like @Prodname + '%'";
        }

        //protected void txtsearch_TextChanged(object sender, EventArgs e)
        //{
        //    string query = "Select * from tbl_product where Prodname like @Prodname + '%'";
        //    SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
        //    adapter.SelectCommand.Parameters.AddWithValue("@Prodname", txtsearch.Text.Trim());
        //    conn.Open();
        //    DataTable dt = new DataTable();
        //    adapter.Fill(dt);
        //    grd.DataSource = dt;
        //    grd.DataBind();
        //    conn.Close();
        //}

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("product.aspx");
        }

        protected void btnupt_Click(object sender, EventArgs e)
        {
          //  Response.Redirect(@"upt-product.aspx?id=" + ((LinkButton)sender).Text);
        }
    }
}
