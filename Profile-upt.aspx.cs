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

//namespace A1Mobile.Buyer
//{
//    public partial class Profile_upt : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            //if (!IsPostBack)
//            //{
//            //    if (Request.QueryString["a1"] != null && Request.QueryString["a1"] != string.Empty)
//            //        hdid.Value = Request.QueryString["a1"].ToString();


//            //    SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
//            //    sa.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value));

//            //    DataTable dt = new DataTable();
//            //    conn.Open();
//            //    sa.Fill(dt);
//            //    conn.Close();

//            //    // Populate fields with the retrieved data
//            //    if (dt.Rows.Count > 0)
//            //    {
//            //        txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
//            //        txtmiddelname.Text = dt.Rows[0]["MiddleName"].ToString();
//            //        txtlastname.Text = dt.Rows[0]["LastName"].ToString();
//            //        txtphone.Text = dt.Rows[0]["Phone"].ToString();
//            //        txtemail.Text = dt.Rows[0]["Email"].ToString();
//            //    }
//            //}

//            if (!string.IsNullOrEmpty(hdid.Value) && int.TryParse(hdid.Value, out int userId))
//            {
//                SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
//                sa.SelectCommand.Parameters.AddWithValue("@id", userId);

//                DataTable dt = new DataTable();
//                conn.Open();
//                sa.Fill(dt);
//                conn.Close();

//                // Continue with your logic (e.g., setting values to textboxes)
//                txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
//                txtmiddelname.Text = dt.Rows[0]["MiddleName"].ToString();
//                txtlastname.Text = dt.Rows[0]["LastName"].ToString();
//                txtphone.Text = dt.Rows[0]["Phone"].ToString();
//                txtemail.Text = dt.Rows[0]["Email"].ToString();
//            }
//            else
//            {
//                // Handle the case where the ID is invalid or empty
//                Response.Redirect("errorPage.aspx"); // Or show an error message
//            }

//        }

//        protected void btn_Click(object sender, EventArgs e)
//        {
//            string strname = img.FileName.ToString();
//            string path = "\\Uploaded Images\\" + strname;
//            img.SaveAs(Server.MapPath("~\\Uploaded Images\\" + strname));
//            SqlCommand cmd = new SqlCommand("update tbl_registration set FirstName='" + txtfirstname.Text + "',MiddleName='" + txtmiddelname.Text + "',profilephoto='" + path + "',LastName='" + txtlastname.Text + "'where id = 2" + hdid.Value, conn);
//            conn.Open();
//            cmd.ExecuteNonQuery();
//            conn.Close();
//            Response.Redirect("profile.aspx");
//        }
//    }
//}



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

//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Configuration;

//namespace A1Mobile.Buyer
//{
//    public partial class Profile_upt : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                // Check if QueryString 'a1' exists
//                if (!string.IsNullOrEmpty(Request.QueryString["a1"]))
//                {
//                    hdid.Value = Request.QueryString["a1"]; // Set hidden field with ID
//                    LoadUserData(); // Load user data from database
//                }
//                else
//                {
//                    Response.Write("No ID provided."); // ya redirect to error page
//                }
//            }
//        }

//        private void LoadUserData()
//        {
//            string con = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
//            using (SqlConnection conn = new SqlConnection(con))
//            {
//                conn.Open();
//                SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
//                sa.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value));
//                DataTable dt = new DataTable();
//                sa.Fill(dt);

//                if (dt.Rows.Count > 0)
//                {
//                    txtfirstname.Text = dt.Rows[0]["firstname"].ToString();
//                    txtmiddelname.Text = dt.Rows[0]["middlename"].ToString();
//                    txtlastname.Text = dt.Rows[0]["lastname"].ToString();
//                    txtphone.Text = dt.Rows[0]["phone"].ToString();
//                    txtemail.Text = dt.Rows[0]["email"].ToString();
//                    // yaha image ke liye bhi kar sakte ho
//                }
//            }
//        }


//           protected void btn_Click(object sender, EventArgs e)
//        {
//            string strname = img.FileName.ToString();
//            string path = "\\Uploaded Images\\" + strname;
//            img.SaveAs(Server.MapPath("~\\Uploaded Images\\" + strname));

//            SqlCommand cmd = new SqlCommand("update tbl_registration set FirstName=@FirstName, MiddleName=@MiddleName, profilephoto=@profilephoto, LastName=@LastName where id=@id", conn);

//            cmd.Parameters.AddWithValue("@FirstName", txtfirstname.Text);
//            cmd.Parameters.AddWithValue("@MiddleName", txtmiddelname.Text);
//            cmd.Parameters.AddWithValue("@profilephoto", path);
//            cmd.Parameters.AddWithValue("@LastName", txtlastname.Text);
//            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value));

//            conn.Open();
//            cmd.ExecuteNonQuery();
//            conn.Close();

//            Response.Redirect("profile.aspx");
//        }

//    }

//}



using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace A1Mobile.Buyer
{
    public partial class Profile_upt : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null) // Session se ID lena hai
                {
                    int userId = Convert.ToInt32(Session["userid"]);
                    hdid.Value = userId.ToString(); // Hidden field me ID set karo

                    SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
                    sa.SelectCommand.Parameters.AddWithValue("@id", userId);

                    DataTable dt = new DataTable();
                    conn.Open();
                    sa.Fill(dt);
                    conn.Close();

                    if (dt.Rows.Count > 0)
                    {
                        // Textboxes me data set karna
                        txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
                        txtmiddelname.Text = dt.Rows[0]["MiddleName"].ToString();
                        txtlastname.Text = dt.Rows[0]["LastName"].ToString();
                        txtphone.Text = dt.Rows[0]["Phone"].ToString();
                        txtemail.Text = dt.Rows[0]["Email"].ToString();
                    }
                    else
                    {
                        Response.Write("No user found with this ID.");
                        Response.End();
                    }
                }
                else
                {
                    // Agar Session me userid nahi hai to login page pe redirect karo
                    Response.Redirect("~/Login.aspx");
                }
            }
        }


        protected void btn_Click(object sender, EventArgs e)
        {
         
            string path = "";

            // Check if user uploaded new image
            if (img.HasFile)
            {
                string strname = img.FileName;
                path = "~/Uploaded Images/" + strname;
                img.SaveAs(Server.MapPath(path)); // Image save karna
            }
            else
            {
                // Agar image nahi upload hui to previous image ka path use kar sakte ho
                // Agar required ho to database me profile photo ke liye path lena padega
            }

            // Update query prepare karna
            string query = "UPDATE tbl_registration SET FirstName = @FirstName, MiddleName = @MiddleName, LastName = @LastName"
                         + (path != "" ? ", profilephoto = @ProfilePhoto" : "")
                         + " WHERE id = @id";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@FirstName", txtfirstname.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtmiddelname.Text);
            cmd.Parameters.AddWithValue("@LastName", txtlastname.Text);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value)); // Session se li hui ID

            if (path != "")
            {
                cmd.Parameters.AddWithValue("@ProfilePhoto", path); // Image path update karna
            }

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("profile.aspx"); // Update ke baad profile page pe redirect
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}


