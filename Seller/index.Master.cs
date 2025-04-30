using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1Mobile.Seller
{
    public partial class index : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() != "")
            {
                lb.Text = Session["username"].ToString();
            }
            else
            {
                lb.Text = "";
            }
        }

      

       

        protected void Btn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();

            Response.Redirect("login.aspx");
        }
    }
}