

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
    public partial class profile : System.Web.UI.Page
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
                Response.Redirect("frmLogin.aspx");
                hdid.Value = "";

            }



            if (Session["username"].ToString() != "")
            {
                lbl.Text = Session["username"].ToString();
            }
            else
            {
                lbl.Text = "";
            }


            SqlDataAdapter sa = new SqlDataAdapter("SELECT * FROM tbl_registration WHERE id = @id", conn);
            sa.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(hdid.Value)); // Use session value for dynamic user ID
            DataTable dt = new DataTable();
            conn.Open();
            sa.Fill(dt);
            conn.Close();

            // Check if profile photo exists, otherwise set a default image
            string profilePhoto = dt.Rows[0]["profilephoto"].ToString();
            Img.ImageUrl = !string.IsNullOrEmpty(profilePhoto) ? profilePhoto : "~/default-profile.jpg";

            //if (dt.Rows.Count > 0)
            //{
            //    Img.ImageUrl = dt.Rows[0]["profilephoto"].ToString();
            //}
            //else
            //{
            //    Img.ImageUrl = "~/Images/default-user.png"; // ya koi placeholder image
            //}



            SqlDataAdapter adapter = new SqlDataAdapter("Select * from tbl_address where registrationid = " + hdid.Value, conn);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            ListView1.DataSource = dataTable;
            ListView1.DataBind();     
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int index = 0;
            switch (e.CommandName)
            {
                case "del":

                    index = Convert.ToInt32(e.CommandArgument);

                    SqlCommand sda = new SqlCommand("delete From tbl_address where id = " + Convert.ToString(index), conn);

                    conn.Open();

                    sda.ExecuteNonQuery();

                    conn.Close();

                    break;
            }
        }
    }
}