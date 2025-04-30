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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_registration WHERE Email = @Email AND Passwrod = @Password AND Registrationtype = 'Seller'", conn);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);
            cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            da.Fill(ds, "tbl_registration");

            if (ds.Tables["tbl_registration"].Rows.Count > 0)
            {
                Session["username"] = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
                Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                // Login failed: either email/password wrong OR not a seller
                Response.Write("<script>alert('Invalid login or not authorized as Seller');</script>");
            }

            conn.Close();
        }





        ////    SqlConnection con = new SqlConnection(cs);   
        //    SqlCommand cmd = new SqlCommand("select * from tbl_registration   where  Email='" + txtemail.Text + "'and Passwrod='" + txtpassword.Text + "'"  "'and Registrationtype'" + txt+   conn);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();

        //    if (conn.State != ConnectionState.Closed)
        //    {
        //        conn.Close();
        //        conn.Open();
        //    }
        //    da.Fill(ds,"tbl_registration");

        //    if (ds.Tables["tbl_registration"].Rows.Count > 0)
        //    {
        //        Session["username"] = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
        //        Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
        //        Response.Redirect("Dashboard.aspx");
        //    }
        //    else
        //    {
        //        Response.Write("Invalid user");
        //    }
    }
}
