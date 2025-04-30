using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1Mobile.Buyer
{
    public partial class Address : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
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
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {

            string query = string.Format("insert into tbl_address(Registrationid,AddressType,Addressline1,Addressline2,Landmark,Pincode," +
                "City,State,Country,Createddate)values( '" + hdid.Value + "','" + Radiobt.SelectedValue + "'," +
                "'" + txtaddressline1.Text + "' ,'" + txtaddressline2.Text + "','" + txtlandmark.Text + "','" + txtpincode.Text + "', " +
                "'" + txtdrpcity.SelectedValue + "','" + drpstate.SelectedValue + "','" +
                drpcountry.SelectedValue + "','" + DateTime.Now.ToString() + "') ");
            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            ClientScript.RegisterClientScriptBlock(this.GetType(), "A", "alert('Record submited')", true);

            Response.Redirect("profile.aspx");
        }

        protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}