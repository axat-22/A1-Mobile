using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.NetworkInformation;
using System.Web.DynamicData;
using System.Xml.Linq;

namespace A1Mobile.Buyer
{
    public partial class mobile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["q0"] != null && Request.QueryString["q0"] != string.Empty)
                    hdprodid.Value = Request.QueryString["q0"];
                {




                    SqlDataAdapter sa = new SqlDataAdapter("select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id where  t.ID =  ' " + hdprodid.Value + "'",conn);

                    DataTable dt = new DataTable();
                    conn.Open();
                    sa.Fill(dt);
                    conn.Close();

                    lbproductname.Text = dt.Rows[0]["productname"].ToString();
                    lbprodmodel.Text = dt.Rows[0]["Prodmodel"].ToString();
                    lbprodmodel.Text = dt.Rows[0]["Prodmodel"].ToString();
                    lbprodram.Text = dt.Rows[0]["prodram"].ToString();
                    prodram.Text = dt.Rows[0]["prodram"].ToString();
                    prodstorage.Text = dt.Rows[0]["prodstorage"].ToString();
                    lbprodstorage.Text = dt.Rows[0]["prodstorage"].ToString();
                    lbprodprice.Text = dt.Rows[0]["prodprice"].ToString();
                    lblram.Text = dt.Rows[0]["prodram"].ToString();
                    lblstorage.Text = dt.Rows[0]["prodstorage"].ToString();
                    lblproddisplay.Text = dt.Rows[0]["proddisplay"].ToString();
                    lblprodcamara.Text = dt.Rows[0]["prodcamara"].ToString();
                    lblprodbattery.Text = dt.Rows[0]["prodbattery"].ToString();
                    lblprocessor.Text = dt.Rows[0]["prodprocessor"].ToString();
                    lbquantity.Text = dt.Rows[0]["quantity"].ToString();
                    lblproddescription.Text = dt.Rows[0]["proddescription"].ToString();
                    Img.ImageUrl = dt.Rows[0]["prodimage"].ToString();




                }
            }
        }

        protected void btnbuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx?ID=" + hdprodid.Value);
        }
    }
}
   
