using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;

namespace A1Mobile.Seller
{
    public partial class product : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

          
            if (!IsPostBack)
            {
                string com = "Select * from mst_product";
                SqlDataAdapter adpt = new SqlDataAdapter(com, conn);
                DataTable dt = new DataTable();
                adpt.Fill(dt);

                drp.DataSource = dt;
                drp.DataTextField = "productname";
                drp.DataValueField = "ID";
                drp.DataBind();

            }

            if (Session["userid"].ToString() != "")
            {
                hdid.Value = Session["userid"].ToString();
            }
           


        }


        protected void Btn_Click(object sender, EventArgs e)
        {
            //  string   Prodname =    txtProdname.Text;
            string Prodmodel = txtProdmodel.Text;
            string prodram = txtprodram.Text;
            string prodstorage = txtprodstorage.Text;
            string prodprice = txtprodprice.Text;
            string Prodescription = txtproddescription.Text;
            string quantity = txtquantity.Text;
            string proddisplay = txtproddisplay.Text;
            string prodcamara = txtproddisplay.Text;
            string prodbattery = txtprodbattery.Text;
            string prodprocessor =  txtprodprocessor.Text;
            DateTime Createddate = DateTime.Now;
            DateTime modifydate = DateTime.Now;
            string strname = img.FileName.ToString();
            string path = "\\Uploaded Images\\" + strname;
            img.SaveAs(Server.MapPath("~\\Uploaded Images\\" + strname));

                 string query = string.Format("insert into tbl_product (prodname,Prodmodel,prodram" +
                ",prodstorage,prodprice,proddescription,quantity,proddisplay,prodcamara,prodbattery,prodprocessor,Createddate,modifydate,prodimage,Sellerid) " +
                "values('" + drp.SelectedValue + "','" + Prodmodel + "','" + prodram + "','" + prodstorage + "','" + prodprice + "'," +
                "'" + Prodescription + "','" + quantity + "','"+proddisplay+"','"+prodcamara+"','"+prodbattery+"','"+prodprocessor+"','" + Createddate + "','" + modifydate + "','" + path + "'," + hdid.Value+" )");
            SqlCommand cmd = new SqlCommand(query, conn);
            DataSet ds = new DataSet();
            conn.Open();
            cmd.ExecuteNonQuery();

            conn.Close();


            
            SqlDataAdapter da = new SqlDataAdapter("select * from quantity where prodid = " + drp.SelectedValue, conn);
            DataTable dt = new DataTable();
            conn.Open();
            da.Fill(dt);
            conn.Close();


            if (dt.Rows.Count > 0)
            {
                int qnty;
                qnty = Convert.ToInt32(quantity) + Convert.ToInt32(dt.Rows[0]["totalquantity"].ToString());

                SqlCommand cm = new SqlCommand("update quantity set  totalquantity ='" + qnty+"' where prodid = " + drp.SelectedValue, conn);
                conn.Open();
                cm.ExecuteNonQuery();
                conn.Close();
            }
            else
            {

                SqlCommand comm = new SqlCommand("insert into quantity (prodid,totalquantity) values ('"+drp.SelectedValue+"','"+quantity+"')" ,conn);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();   
            }






            Response.Redirect("product-list.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          

        }
    }
}