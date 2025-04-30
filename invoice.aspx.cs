//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Configuration;

//namespace A1Mobile.Buyer
//{
//    public partial class invoice : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            SqlDataAdapter sa = new SqlDataAdapter("select t.*,q.productname ,a.Addressline1,n.FirstName,s.FirstName from tbl_order t\r\ninner join mst_product q on t.prodid = q.id\r\ninner join tbl_address a on  t.buyeraddressid = a.ID\r\ninner join tbl_registration n on t.buyerregid = n.ID\r\ninner join tbl_registration s on t.sellerregid = s.ID", conn);

//            DataTable dt = new DataTable();
//            conn.Open();
//            sa.Fill(dt);
//            conn.Close();



//            lblsellername.Text = dt.Rows[0]["FirstName"].ToString();
//            lblbuyyername.Text = dt.Rows[0]["FirstName"].ToString();
//           // lbladdresstype.Text = dt.Rows[0][""].ToString();
//            lbladdress.Text = dt.Rows[0]["Addressline1"].ToString();
//            lbldate.Text = dt.Rows[0]["orddate"].ToString();
//            lblprodname.Text = dt.Rows[0]["productname"].ToString();
//            lblquantity.Text = dt.Rows[0]["quantity"].ToString();
//            lblprice.Text = dt.Rows[0]["price"].ToString();
//            lblamount.Text = dt.Rows[0]["price"].ToString();
//            lblam.Text = dt.Rows[0]["price"].ToString();


//        }

//        protected void btnGeneratePDF_Click(object sender, EventArgs e)
//        {

//        }
//    }
//}

//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Configuration;
//using iTextSharp.text;
//using iTextSharp.text.pdf;

//namespace A1Mobile.Buyer
//{
//    public partial class invoice : System.Web.UI.Page
//    {
//        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            SqlDataAdapter sa = new SqlDataAdapter("SELECT t.*, q.productname, a.Addressline1, n.FirstName, s.FirstName FROM tbl_order t INNER JOIN mst_product q ON t.prodid = q.id INNER JOIN tbl_address a ON t.buyeraddressid = a.ID INNER JOIN tbl_registration n ON t.buyerregid = n.ID INNER JOIN tbl_registration s ON t.sellerregid = s.ID", conn);

//            DataTable dt = new DataTable();
//            conn.Open();
//            sa.Fill(dt);
//            conn.Close();

//            lblsellername.Text = dt.Rows[0]["FirstName"].ToString();
//            lblbuyyername.Text = dt.Rows[0]["FirstName"].ToString();
//            lbladdress.Text = dt.Rows[0]["Addressline1"].ToString();
//            lbldate.Text = dt.Rows[0]["orddate"].ToString();
//            lblprodname.Text = dt.Rows[0]["productname"].ToString();
//            lblquantity.Text = dt.Rows[0]["quantity"].ToString();
//            lblprice.Text = dt.Rows[0]["price"].ToString();
//            lblamount.Text = dt.Rows[0]["price"].ToString();
//            lblam.Text = dt.Rows[0]["price"].ToString();
//        }

//        protected void btnGeneratePDF_Click(object sender, EventArgs e)
//        {
//            // Create a document object
//            Document doc = new Document(PageSize.A4);
//            System.IO.MemoryStream ms = new System.IO.MemoryStream();
//            PdfWriter writer = PdfWriter.GetInstance(doc, ms);
//            doc.Open();

//            // Add content to the PDF
//            doc.Add(new Paragraph("Invoice"));
//            doc.Add(new Paragraph("Seller Name: " + lblsellername.Text));
//            doc.Add(new Paragraph("Buyer Name: " + lblbuyyername.Text));
//            doc.Add(new Paragraph("Address: " + lbladdress.Text));
//            doc.Add(new Paragraph("Date: " + lbldate.Text));
//            doc.Add(new Paragraph("Product Name: " + lblprodname.Text));
//            doc.Add(new Paragraph("Quantity: " + lblquantity.Text));
//            doc.Add(new Paragraph("Price: " + lblprice.Text));
//            doc.Add(new Paragraph("Amount: " + lblamount.Text));

//            // Close the document
//            doc.Close();

//            // Send the PDF as a response
//            Response.ContentType = "application/pdf";
//            Response.AddHeader("Content-Disposition", "attachment;filename=Invoice.pdf");
//            Response.OutputStream.Write(ms.ToArray(), 0, ms.ToArray().Length);
//            Response.End();
//        }
//    }
//}


using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace A1Mobile.Buyer
{
    public partial class invoice : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter sa = new SqlDataAdapter("SELECT t.*, q.productname, a.Addressline1, n.FirstName, s.FirstName FROM tbl_order t INNER JOIN mst_product q ON t.prodid = q.id INNER JOIN tbl_address a ON t.buyeraddressid = a.ID INNER JOIN tbl_registration n ON t.buyerregid = n.ID INNER JOIN tbl_registration s ON t.sellerregid = s.ID", conn);

            DataTable dt = new DataTable();
            conn.Open();
            sa.Fill(dt);
            conn.Close();

            lblsellername.Text = dt.Rows[0]["FirstName"].ToString();
            lblbuyyername.Text = dt.Rows[0]["FirstName"].ToString();
            lbladdress.Text = dt.Rows[0]["Addressline1"].ToString();
            lbldate.Text = dt.Rows[0]["orddate"].ToString();
            lblprodname.Text = dt.Rows[0]["productname"].ToString();
            lblquantity.Text = dt.Rows[0]["quantity"].ToString();
            lblprice.Text = dt.Rows[0]["price"].ToString();
            lblamount.Text = dt.Rows[0]["price"].ToString();
            lblam.Text = dt.Rows[0]["price"].ToString();
        }

        protected void btnGeneratePDF_Click(object sender, EventArgs e)
        {
            // Create a document object with A4 page size
            Document doc = new Document(PageSize.A4);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            PdfWriter writer = PdfWriter.GetInstance(doc, ms);
            doc.Open();

            // Add a title and your business name
            Font titleFont = FontFactory.GetFont("Arial", 16, Font.BOLD);
            Font headingFont = FontFactory.GetFont("Arial", 12, Font.BOLD);
            Font normalFont = FontFactory.GetFont("Arial", 10);

            // Add logo or company name
            Paragraph title = new Paragraph("A1-Mobile", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            doc.Add(title);
            doc.Add(new Paragraph("\n")); // Add some space

            // Add the invoice title
            Paragraph invoiceTitle = new Paragraph("Invoice", headingFont);
            invoiceTitle.Alignment = Element.ALIGN_CENTER;
            doc.Add(invoiceTitle);
            doc.Add(new Paragraph("\n"));

            // Add invoice details
            doc.Add(new Paragraph("Date: " + lbldate.Text, normalFont));
            doc.Add(new Paragraph("Buyer Name: " + lblbuyyername.Text, normalFont));
            doc.Add(new Paragraph("Seller Name: " + lblsellername.Text, normalFont));
            doc.Add(new Paragraph("Address: " + lbladdress.Text, normalFont));
            doc.Add(new Paragraph("\n"));

            // Add table for product details
            PdfPTable table = new PdfPTable(4);
            table.WidthPercentage = 100;
            table.SetWidths(new float[] { 3, 2, 2, 2 });

            // Add headers to the table
            table.AddCell(new PdfPCell(new Phrase("Product Name", headingFont)) { HorizontalAlignment = Element.ALIGN_CENTER });
            table.AddCell(new PdfPCell(new Phrase("Quantity", headingFont)) { HorizontalAlignment = Element.ALIGN_CENTER });
            table.AddCell(new PdfPCell(new Phrase("Price", headingFont)) { HorizontalAlignment = Element.ALIGN_CENTER });
            table.AddCell(new PdfPCell(new Phrase("Amount", headingFont)) { HorizontalAlignment = Element.ALIGN_CENTER });

            // Add product details to the table
            table.AddCell(new PdfPCell(new Phrase(lblprodname.Text, normalFont)) { HorizontalAlignment = Element.ALIGN_CENTER });
            table.AddCell(new PdfPCell(new Phrase(lblquantity.Text, normalFont)) { HorizontalAlignment = Element.ALIGN_CENTER });
            table.AddCell(new PdfPCell(new Phrase(lblprice.Text, normalFont)) { HorizontalAlignment = Element.ALIGN_CENTER });
            table.AddCell(new PdfPCell(new Phrase(lblamount.Text, normalFont)) { HorizontalAlignment = Element.ALIGN_CENTER });

            doc.Add(table);
            doc.Add(new Paragraph("\n"));

            // Add total amount
            Paragraph total = new Paragraph("Total Amount: " + lblam.Text, headingFont);
            total.Alignment = Element.ALIGN_RIGHT;
            doc.Add(total);

            // Close the document
            doc.Close();

            // Send the PDF as a response
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment;filename=Invoice_A1Mobile.pdf");
            Response.OutputStream.Write(ms.ToArray(), 0, ms.ToArray().Length);
            Response.End();
        }
    }
}
