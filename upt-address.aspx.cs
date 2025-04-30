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

    public partial class upt_address : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["q0"] != null && Request.QueryString["q0"] != string.Empty)
                    hdid.Value = Request.QueryString["q0"].ToString();


                SqlDataAdapter sa = new SqlDataAdapter("Select * from tbl_address where id =" + Convert.ToString(hdid.Value), conn);

                DataTable dt = new DataTable();

                conn.Open();

                sa.Fill(dt);
                conn.Close();

              

                Radiobt.SelectedValue = dt.Rows[0]["Addresstype"].ToString();
                txtaddressline1.Text = dt.Rows[0]["addressline1"].ToString();
                txtaddressline2.Text = dt.Rows[0]["addressline2"].ToString();
                txtlandmark.Text = dt.Rows[0]["landmark"].ToString();
                txtpincode.Text = dt.Rows[0]["pincode"].ToString();
                txtdrpcity.SelectedValue = dt.Rows[0]["city"].ToString();
                drpstate.SelectedValue = dt.Rows[0]["state"].ToString();
                drpcountry.SelectedValue = dt.Rows[0]["country"].ToString();




            }

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("update tbl_address set  AddressType='" + Radiobt.SelectedValue + "',Addressline1='" + txtaddressline1.Text + "'" +
              ",Addressline2='" + txtaddressline2.Text + "' " +
              ",Landmark='" + txtlandmark.Text + "',Pincode='" + txtpincode.Text + "',City='" + txtdrpcity.SelectedValue + "'" +
              ",State='" + drpstate.SelectedValue + "', Country= '" + drpcountry.SelectedValue + "'where id = " + hdid.Value, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("profile.aspx");

        }
    }
}