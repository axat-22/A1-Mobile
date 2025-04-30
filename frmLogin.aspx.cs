using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;

namespace A1Mobile.Buyer
{
    public partial class frmLogin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {

          //  string cs = "data source = .; database = A1Mobile; Integrated security = true";
          //  SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("select * from tbl_registration  where Email='" + txtemail.Text + "'and PASSWROD='" + txtpassword.Text + "'", conn);
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            if (conn.State != ConnectionState.Closed)
            {
                conn.Close();
                conn.Open();
            }
            da.Fill(ds, "tbl_registration" );


            if (ds.Tables["tbl_registration"].Rows.Count > 0)
            {
                Session["username"] = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
                Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
                Response.Redirect("Deshboard.aspx");

            }
            else
            {
              //  Response.Write("Invalid Password");

                lbl.Text = "Invalild Password";
            }
        }
    }
}