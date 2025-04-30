//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Net.NetworkInformation;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Configuration;

//namespace A1Mobile.Seller
//{
//    public partial class Profile_upt : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                if (Request.QueryString["a1"] != null && Request.QueryString["a1"] != string.Empty)
//                    hdid.Value = Request.QueryString["a1"].ToString();


//                //SqlDataAdapter sa = new SqlDataAdapter("Select * from tbl_registration where id = '3'" + Convert.ToString(hdid.Value), conn);

//                SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
//                sa.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value)); // Assuming hdid.Value is the ID to fetch

//                DataTable dt = new DataTable();
//                conn.Open();
//                sa.Fill(dt);
//                conn.Close();


//                txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
//                txtmiddelname.Text = dt.Rows[0]["MiddleName"].ToString();
//                txtlastname.Text = dt.Rows[0]["LastName"].ToString();
//                txtphone.Text = dt.Rows[0]["Phone"].ToString();
//                txtemail.Text = dt.Rows[0]["Email"].ToString();
//            }

//        }

//        protected void btn_Click(object sender, EventArgs e)
//        {
//            string strname = img.FileName.ToString();
//            string path = "\\Uploaded Images\\" + strname;
//            img.SaveAs(Server.MapPath("~\\Uploaded Images\\" + strname));
//            SqlCommand cmd = new SqlCommand("update tbl_registration set FirstName='" + txtfirstname.Text + "',MiddleName='" + txtmiddelname.Text + "',profilephoto='" + path + "',LastName='" + txtlastname.Text + "'where id = 3" + hdid.Value, conn);
//            conn.Open();
//            cmd.ExecuteNonQuery();
//            conn.Close();
//            Response.Redirect("profile.aspx");
//        }
//    }
//}

using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace A1Mobile.Seller
{
    public partial class Profile_upt : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["a1"] != null && Request.QueryString["a1"] != string.Empty)
                    hdid.Value = Request.QueryString["a1"].ToString();

                // Use parameterized query to avoid SQL injection
                SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
                sa.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value));

                DataTable dt = new DataTable();
                conn.Open();
                sa.Fill(dt);
                conn.Close();

                // Populate fields with the retrieved data
                if (dt.Rows.Count > 0)
                {
                    txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
                    txtmiddelname.Text = dt.Rows[0]["MiddleName"].ToString();
                    txtlastname.Text = dt.Rows[0]["LastName"].ToString();
                    txtphone.Text = dt.Rows[0]["Phone"].ToString();
                    txtemail.Text = dt.Rows[0]["Email"].ToString();
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            // Handling image upload
            string strname = img.FileName;
            string path = "~/Uploaded Images/" + strname;
            img.SaveAs(Server.MapPath(path));

            // Use parameterized query to update data
            string query = "UPDATE tbl_registration SET FirstName = @FirstName, MiddleName = @MiddleName, profilephoto = @ProfilePhoto, LastName = @LastName WHERE id = @id";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@FirstName", txtfirstname.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtmiddelname.Text);
            cmd.Parameters.AddWithValue("@ProfilePhoto", path);
            cmd.Parameters.AddWithValue("@LastName", txtlastname.Text);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value)); // Pass the correct ID

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            // Redirect to the profile page
            Response.Redirect("profile.aspx");
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}
