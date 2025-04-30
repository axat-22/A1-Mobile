using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace A1Mobile.Buyer
{

    public partial class forgotpass : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            SqlDataAdapter ad = new SqlDataAdapter("Select * from tbl_registration where  Email='" + txtemail.Text + "' ", conn);
            DataTable dt = new DataTable();
            conn.Open();
            ad.Fill(dt);
            conn.Close();
            if (dt.Rows.Count.ToString() == "1")
            {
                if (pass.Text == conpass.Text)
                {
                    SqlCommand cmd = new SqlCommand("update tbl_registration set Passwrod  ='" + pass.Text + "' ", conn);
                    DataTable td = new DataTable();
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            else
            {
                Response.Write("invalid user");
            }
        }
    }
}