//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Xml.Linq;

//namespace A1Mobile.Seller
//{
//    public partial class profile : System.Web.UI.Page
//    {
//      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["userid"].ToString() != "")
//            {
//                hdid.Value = Session["userid"].ToString();
//            }
//            else
//            {
//                Response.Redirect("login.aspx");
//                hdid.Value = "";

//            }


//            if (Session["username"].ToString() != "")
//            {
//                lbl.Text = Session["username"].ToString();
//            }
//            else
//            {  
//                lbl.Text = "";
//            }

//            bindgrid();

//            SqlDataAdapter sa = new SqlDataAdapter("select * from tbl_registration where id='1' ", conn);

//            DataTable dt = new DataTable();
//            conn.Open();
//            sa.Fill(dt);
//            conn.Close();

//            Img.ImageUrl = dt.Rows[0]["profilephoto"].ToString();


//        }


//        private void bindgrid()
//        {
//            SqlDataAdapter adapter = new SqlDataAdapter("Select * from tbl_address where registrationid = " + hdid.Value, conn);
//            DataTable dataTable = new DataTable();
//            adapter.Fill(dataTable);
//            ListView1.DataSource = dataTable;
//            ListView1.DataBind();

//        }

//        protected void btn_Click(object sender, EventArgs e)
//        {
//            Response.Redirect("Address.aspx");

//        }

//        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
//        {
//            int index = 0;
//            switch (e.CommandName)
//            {
//                case "del":

//                    index = Convert.ToInt32(e.CommandArgument);

//                    SqlCommand sda = new SqlCommand("delete From tbl_address where id = " + Convert.ToString(index), conn);

//                    conn.Open();

//                    int RevVal = sda.ExecuteNonQuery();

//                    conn.Close();

//                    if (RevVal > 0)
//                    {
//                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alert", "<script>alert('Address Deleted');</script>", false);
//                    }
//                    bindgrid();


//                    break;
//            }
//        }

//        protected void btn_Click1(object sender, EventArgs e)
//        {
//            Response.Redirect("Profile-upt.aspx");
//        }
//    }

// }



using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace A1Mobile.Seller
{
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null && Session["userid"].ToString() != "")
            {
                hdid.Value = Session["userid"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            if (Session["username"] != null && Session["username"].ToString() != "")
            {
                lbl.Text = Session["username"].ToString();
            }
            else
            {
                lbl.Text = "Guest";
            }

            bindgrid();

            // Use the dynamic userid from session
            SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
            sa.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value)); // Use session value for dynamic user ID
            DataTable dt = new DataTable();
            conn.Open();
            sa.Fill(dt);
            conn.Close();

            // Check if profile photo exists, otherwise set a default image
            string profilePhoto = dt.Rows[0]["profilephoto"].ToString();
            Img.ImageUrl = !string.IsNullOrEmpty(profilePhoto) ? profilePhoto : "~/default-profile.jpg";
        }

        private void bindgrid()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM tbl_address WHERE registrationid = @registrationid", conn);
            adapter.SelectCommand.Parameters.AddWithValue("@registrationid", hdid.Value); // Use parameterized query
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            ListView1.DataSource = dataTable;
            ListView1.DataBind();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Address.aspx");
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int index = 0;
            switch (e.CommandName)
            {
                case "del":
                    index = Convert.ToInt32(e.CommandArgument);

                    // Use parameterized query for deletion
                    SqlCommand sda = new SqlCommand("DELETE FROM tbl_address WHERE id = @id", conn);
                    sda.Parameters.AddWithValue("@id", index);

                    conn.Open();
                    int RevVal = sda.ExecuteNonQuery();
                    conn.Close();

                    if (RevVal > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alert", "<script>alert('Address Deleted');</script>", false);
                    }
                    bindgrid();
                    break;
            }
        }

        protected void btn_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Profile-upt.aspx");
        }
    }
}
