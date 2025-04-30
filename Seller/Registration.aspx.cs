using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.ComponentModel.DataAnnotations;
using System.EnterpriseServices;
using System.Security.Cryptography;
using System.Text;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;


namespace A1Mobile.Seller
{
    public partial class Registration : System.Web.UI.Page
    {

    //    // sqlconnection
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    //    protected void Page_Load(object sender, EventArgs e)
    //    {

    //    }

    //    protected void Btn_Click(object sender, EventArgs e)
    //    {

    //        SqlCommand sqlCommand = new SqlCommand("select * from tbl_registration   where  Phone='" + txtphno.Text + "' and  Email='"+ txtemail.Text+"' ", conn);
    //        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
    //        DataTable dt = new DataTable();
    //        sqlDataAdapter.Fill(dt);
    //        conn.Open();

    //        if (dt.Rows.Count > 0 )
    //        {
    //            Lb.Text = "This Phone Is Already Exist";
    //            Lb2.Text = "This Email is Alredy Exist";
    //        }

    //        else
    //        {
    //            // ins registration 
    //            string Fstname = txtfstname.Text;
    //            string Midname = txtmidname.Text;
    //            string lstname = txtlstname.Text;
    //            string phone = txtphno.Text;
    //            string email = txtemail.Text;
    //            string pass = txtpass.Text;
    //            string registrationtype = "Seller";
    //            DateTime Createddate = DateTime.Now;
    //            string query = string.Format("insert into tbl_registration (FirstName,MiddleName,LastName" +
    //                ",Phone,Email,Passwrod,Registrationtype,Createddate)values('" + Fstname + "','" + Midname + "','" + lstname + "','" + phone + "','" + email
    //                 + "','" + pass + "','" + registrationtype + "','" + Createddate + "')");
    //            SqlCommand cmd = new SqlCommand(query, conn);
    //            DataSet ds = new DataSet();
    //            cmd.ExecuteNonQuery();
    //            conn.Close();
    //            ClientScript.RegisterClientScriptBlock(this.GetType(), "A", "swal('Registration Successful,')", true);
    //        }

    //        abc();


    //    }
    //    private void abc()
    //    {
    //        //Response.Redirect("login.aspx");

    //        txtFstname.Text = "";
    //        txtmidname.Text = "";
    //        txtlstname.Text = "";
    //        txtphno.Text = "";
    //        txtemail.Text = "";
    //        txtpass.Text = "";
    //    }
    //}

       
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            protected void Page_Load(object sender, EventArgs e)
            {
            }

            // Send OTP
            protected void btnSendOTP_Click(object sender, EventArgs e)
            {
                string otp = new Random().Next(100000, 999999).ToString();
                Session["otp"] = otp;  // Save OTP in session

                string phone = "+91" + txtphno.Text.Trim(); // Add +91 to phone number

                // Twilio credentials
                string accountSid = "AC4ed6c20eaffe39ac3f50b81d8856403c";
                string authToken = "9d9d25c47033ebc363003ae134808b51";
                string twilioNumber = "+12319075750"; // e.g. +1415xxxxxxx

                try
                {
                    TwilioClient.Init(accountSid, authToken);

                    var message = MessageResource.Create(
                        body: $"Your OTP for registration is: {otp}",
                        from: new PhoneNumber(twilioNumber),
                        to: new PhoneNumber(phone)
                    );

                    lblOTPStatus.Text = "OTP sent successfully!";
                    lblOTPStatus.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblOTPStatus.Text = "Error sending OTP: " + ex.Message;
                    lblOTPStatus.ForeColor = System.Drawing.Color.Red;
                }
            }

            // Verify OTP
            protected void btnVerifyOTP_Click(object sender, EventArgs e)
            {
                string enteredOTP = txtOTP.Text.Trim();  // Get OTP entered by user

                if (Session["otp"] != null && enteredOTP == Session["otp"].ToString())
                {
                    lblOTPStatus.Text = "OTP verified successfully!";
                    lblOTPStatus.ForeColor = System.Drawing.Color.Green;
                    Session["otpVerified"] = true;
                }
                else
                {
                    lblOTPStatus.Text = "Invalid OTP!";
                    lblOTPStatus.ForeColor = System.Drawing.Color.Red;
                    Session["otpVerified"] = false;
                }
            }

            // Register user
            protected void btn_Click(object sender, EventArgs e)
            {
                if (Session["otpVerified"] == null || !(bool)Session["otpVerified"])
                {
                    lb.Text = "Please verify OTP before registering!";
                    return;
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    string phone = "+91" + txtphno.Text.Trim();  // Add +91 to phone number

                    // Check if phone or email already exists
                    SqlCommand checkCmd = new SqlCommand("SELECT * FROM tbl_registration WHERE phone = @phone OR email = @email", conn);
                    checkCmd.Parameters.AddWithValue("@phone", phone);
                    checkCmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());

                    SqlDataAdapter sda = new SqlDataAdapter(checkCmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    conn.Open();

                    if (dt.Rows.Count > 0)
                    {
                        lb.Text = "This phone or email already exists.";
                    }
                    else
                    {
                        string fstname = txtfstname.Text.Trim();
                        string midname = txtmidname.Text.Trim();
                        string lstname = txtlstname.Text.Trim();
                        string email = txtemail.Text.Trim();
                        string pass = txtpass.Text;

                        // Hash password
                        //using (SHA256 sha256 = SHA256.Create())
                        //{
                        //    byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(pass));
                        //    pass = BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                        //}

                        string registrationType = "buyer";
                        DateTime createdDate = DateTime.Now;

                        string query = @"INSERT INTO tbl_registration 
                                 (firstname, middlename, lastname, phone, email, passwrod, registrationtype, createddate)
                                 VALUES 
                                 (@firstname, @middlename, @lastname, @phone, @email, @password, @registrationtype, @createddate)";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@firstname", fstname);
                        cmd.Parameters.AddWithValue("@middlename", midname);
                        cmd.Parameters.AddWithValue("@lastname", lstname);
                        cmd.Parameters.AddWithValue("@phone", phone);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@password", pass);
                        cmd.Parameters.AddWithValue("@registrationtype", registrationType);
                        cmd.Parameters.AddWithValue("@createddate", createdDate);

                        cmd.ExecuteNonQuery();

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "a", "alert('Record submitted successfully!')", true);
                        Response.Redirect("login.aspx");
                    }

                    conn.Close();
                }
            }
        }
    }