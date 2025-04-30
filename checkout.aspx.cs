using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace A1Mobile.Buyer

{
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null && Session["userid"].ToString() != "")
                {
                    HiddenField1.Value = Session["userid"].ToString();
                    SqlDataAdapter adapter = new SqlDataAdapter("Select * from tbl_address where registrationid = " + HiddenField1.Value, conn);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    grdaddress.DataSource = dataTable;
                    grdaddress.DataBind();
                }
            }
            listview();
        }

        private void listview()
        {
            hdprodid.Value = Request.QueryString["ID"];

            SqlDataAdapter sa = new SqlDataAdapter("select t.*,q.productname from tbl_product t inner join mst_product q on t.Prodname = q.id where  t.ID = '" + hdprodid.Value + "'", conn);

            DataTable dt = new DataTable();
            conn.Open();
            sa.Fill(dt);
            conn.Close();

            if (dt.Rows.Count > 0)
            {
                hdsoldquantity.Value = dt.Rows[0]["Solditem"].ToString();
                hdsellerid.Value = dt.Rows[0]["Sellerid"].ToString();
                hdquantity.Value = dt.Rows[0]["quantity"].ToString();
                lbproductname.Text = dt.Rows[0]["productname"].ToString();
                lbprodmodel.Text = dt.Rows[0]["Prodmodel"].ToString();
                lbprodprice.Text = dt.Rows[0]["prodprice"].ToString();
                Img.ImageUrl = dt.Rows[0]["prodimage"].ToString();
            }
            else
            {
                lblremarks.Text = "Product not found.";
            }
        }

        protected void txtquantity_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtquantity.Text) <= Convert.ToInt32(hdquantity.Value))
            {
                txttotalprice.Text = Convert.ToString(Convert.ToInt32(lbprodprice.Text) * Convert.ToInt32(txtquantity.Text));
            }
            else
            {
                lblremarks.Text = "Quantity Not Available";
            }
        }

        protected void btnbuy_Click(object sender, EventArgs e)
        {
            string selectedAddressId = "";

            // ✅ Step 1: Get selected address from GridView
            foreach (GridViewRow row in grdaddress.Rows)
            {
                CheckBox check = row.FindControl("CheckBox1") as CheckBox;
                HiddenField hdfield = row.FindControl("hdaddressId") as HiddenField;

                if (check != null && check.Checked && hdfield != null)
                {
                    selectedAddressId = hdfield.Value;
                    break;
                }
            }

            // ✅ Step 2: Validate address
            if (string.IsNullOrEmpty(selectedAddressId))
            {
                lblremarks.Text = "⚠️ Please select an address before placing the order.";
                lblremarks.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // ✅ Step 3: Insert into tbl_order
                SqlCommand cmd = new SqlCommand(@"INSERT INTO tbl_order 
(prodid, buyerregid, sellerregid, orddate, quantity, price, totalprice, buyeraddressid, OrderStatus) 
VALUES 
(@prodid, @buyerregid, @sellerregid, @orddate, @quantity, @price, @totalprice, @buyeraddressid, 'Pending'); 
SELECT SCOPE_IDENTITY();", conn);

                cmd.Parameters.AddWithValue("@prodid", hdprodid.Value);
                cmd.Parameters.AddWithValue("@buyerregid", HiddenField1.Value);
                cmd.Parameters.AddWithValue("@sellerregid", hdsellerid.Value);
                cmd.Parameters.AddWithValue("@orddate", DateTime.Now);
                cmd.Parameters.AddWithValue("@quantity", txtquantity.Text);
                cmd.Parameters.AddWithValue("@price", lbprodprice.Text);
                cmd.Parameters.AddWithValue("@totalprice", txttotalprice.Text);
                cmd.Parameters.AddWithValue("@buyeraddressid", selectedAddressId);

                conn.Open();
                int orderId = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();

                // ✅ Step 4: Insert into tbl_payment
                SqlCommand paymentCmd = new SqlCommand("INSERT INTO tbl_payment (orderid, Amount, pyttype) VALUES (@orderid, @amount, 'COD')", conn);
                paymentCmd.Parameters.AddWithValue("@orderid", orderId);
                paymentCmd.Parameters.AddWithValue("@amount", txttotalprice.Text);

                conn.Open();
                paymentCmd.ExecuteNonQuery();
                conn.Close();

                // ✅ Step 5: Update Solditem in tbl_product
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tbl_product WHERE ID = @prodid", conn);
                da.SelectCommand.Parameters.AddWithValue("@prodid", hdprodid.Value);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    int existingSoldItem = dt.Rows[0]["Solditem"] != DBNull.Value ? Convert.ToInt32(dt.Rows[0]["Solditem"]) : 0;
                    int solditem = Convert.ToInt32(txtquantity.Text) + existingSoldItem;
                    SqlCommand updateSold = new SqlCommand("UPDATE tbl_product SET Solditem = @solditem WHERE ID = @prodid", conn);
                    updateSold.Parameters.AddWithValue("@solditem", solditem);
                    updateSold.Parameters.AddWithValue("@prodid", hdprodid.Value);

                    conn.Open();
                    updateSold.ExecuteNonQuery();
                    conn.Close();
                }

                // ✅ Step 6: Update total quantity in quantity table
                SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM quantity WHERE prodid = @prodid", conn);
                ad.SelectCommand.Parameters.AddWithValue("@prodid", hdprodid.Value);
                DataTable dat = new DataTable();
                ad.Fill(dat);

                if (dat.Rows.Count > 0)
                {
                    int existingTotalQty = dat.Rows[0]["totalquantity"] != DBNull.Value ? Convert.ToInt32(dat.Rows[0]["totalquantity"]) : 0;
                    int remainingQty = existingTotalQty - Convert.ToInt32(txtquantity.Text);
                    SqlCommand updateQty = new SqlCommand("UPDATE quantity SET totalquantity = @total WHERE prodid = @prodid", conn);
                    updateQty.Parameters.AddWithValue("@total", remainingQty);
                    updateQty.Parameters.AddWithValue("@prodid", hdprodid.Value);

                    conn.Open();
                    updateQty.ExecuteNonQuery();
                    conn.Close();
                }

                lblremarks.Text = "🎉 Order placed successfully!";
                lblremarks.ForeColor = System.Drawing.Color.Green;

                // ✅ Step 7: Get buyer and seller phone
                string buyerPhone = "", sellerPhone = "";

                SqlCommand getBuyerPhone = new SqlCommand("SELECT phone FROM tbl_registration WHERE ID = @id", conn);
                getBuyerPhone.Parameters.AddWithValue("@id", HiddenField1.Value);
                conn.Open();
                object buyerPhoneObj = getBuyerPhone.ExecuteScalar();
                conn.Close();
                if (buyerPhoneObj != DBNull.Value)
                    buyerPhone = buyerPhoneObj.ToString();

                SqlCommand getSellerPhone = new SqlCommand("SELECT phone FROM tbl_registration WHERE ID = @id", conn);
                getSellerPhone.Parameters.AddWithValue("@id", hdsellerid.Value);
                conn.Open();
                object sellerPhoneObj = getSellerPhone.ExecuteScalar();
                conn.Close();
                if (sellerPhoneObj != DBNull.Value)
                    sellerPhone = sellerPhoneObj.ToString();

                // ✅ Step 8: Send SMS using Twilio
                SendSMS(buyerPhone, "Your order has been placed successfully. Order ID: " + orderId);
                SendSMS(sellerPhone, "A new order has been placed by a buyer. Order ID: " + orderId);
            }
            catch (Exception ex)
            {
                lblremarks.Text = "❌ Error: " + ex.Message;
                lblremarks.ForeColor = System.Drawing.Color.Red;
            }
        }


        // Fast2SMS API integration method to send SMS
        private void SendSMS(string phoneNumber, string message)
        {
         
            try
            {
                string accountSid = "AC4ed6c20eaffe39ac3f50b81d8856403c";     // 🔑 Replace with actual SID
                string authToken = "9d9d25c47033ebc363003ae134808b51";       // 🔐 Replace with actual Auth Token
                string twilioPhone = "+12319075750";               // ☎️ Replace with Twilio phone number

                TwilioClient.Init(accountSid, authToken);

                string formattedPhone = phoneNumber.StartsWith("+91") ? phoneNumber : "+91" + phoneNumber;

                var msg = MessageResource.Create(
                    body: message,
                    from: new PhoneNumber(twilioPhone),
                    to: new PhoneNumber(formattedPhone)
                );

                Debug.WriteLine("✅ Twilio SMS sent successfully. SID: " + msg.Sid);
            }
            catch (Exception ex)
            {
                Debug.WriteLine("❌ Twilio SMS Error: " + ex.Message);
            }
        }

    }

}

