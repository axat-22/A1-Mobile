<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Buyer/index.Master" CodeBehind="invoice.aspx.cs" Inherits="A1Mobile.Buyer.invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3 | Invoice</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">


            <asp:Panel ID="pnlInvoice" runat="server">
                <!-- Copy your invoice HTML content here -->

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1>Invoice</h1>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active">Invoice</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <!-- /.container-fluid -->
                    </section>

                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <%--  <div class="callout callout-info">
              <h5><i class="fas fa-info"></i> Note:</h5>
              This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
            </div>--%>


                                    <!-- Main content -->
                                    <div class="invoice p-3 mb-3">
                                        <!-- title row -->
                                        <div class="row">
                                            <div class="col-12">
                                                <h4>
                                                    <i class="fas fa-globe"></i>A1 Mobile
                    <small class="float-right">
                        <asp:Label ID="lbldate" runat="server" Text=""></asp:Label></small>
                                                </h4>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- info row -->
                                        <div class="row invoice-info">
                                            <div class="col-sm-4 invoice-col">
                                                From
                  <address>
                      <strong>
                          <asp:Label ID="lblsellername" runat="server" Text=""></asp:Label>
                      </strong>
                  </address>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 invoice-col">
                                                To
                  <address>
                      <strong>
                          <asp:Label ID="lblbuyyername" runat="server" Text=""></asp:Label>
                          <asp:Label ID="lbladdresstype" runat="server" Text=""></asp:Label></strong><br>
                      <asp:Label ID="lbladdress" runat="server" Text=""></asp:Label><br>
                      <%--  795 Folsom Ave, Suite 600<br>
                    San Francisco, CA 94107<br>
                    Phone: (555) 539-1037<br>
                    Email: john.doe@example.com--%>
                  </address>
                                            </div>
                                            <!-- /.col -->
                                            <%--   <div class="col-sm-4 invoice-col">
                  <b>Invoice #007612</b><br>
                  <br>
                  <b>Order ID:</b> 4F3S8J<br>
                  <b>Payment Due:</b> 2/22/2014<br>
                  <b>Account:</b> 968-34567
                </div>--%>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->

                                        <!-- Table row -->
                                        <div class="row">
                                            <div class="col-12 table-responsive">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Qty</th>
                                                            <th>Product</th>

                                                            <th>Subtotal</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblquantity" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblprodname" runat="server" Text=""></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="lblprice" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>



                                                    </tbody>

                                                </table>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->

                                        <div class="row">
                                            <!-- accepted payments column -->
                                            <div class="col-6">
                                                <p class="lead">Payment Methods:</p>
                                                <%-- <img src="../../dist/img/credit/visa.png" alt="Visa">
                  <img src="../../dist/img/credit/mastercard.png" alt="Mastercard">
                  <img src="../../dist/img/credit/american-express.png" alt="American Express">
                  <img src="../../dist/img/credit/paypal2.png" alt="Paypal">--%>

                                                <%--  <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">--%>
                  
                  </p>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-6">
                                                <p class="lead">Amount </p>

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tr>
                                                            <th style="width: 50%">Subtotal:</th>
                                                            <td>
                                                                <asp:Label ID="lblamount" runat="server" Text=""></asp:Label></td>
                                                        </tr>

                                                        <tr>
                                                            <th>Total:</th>
                                                            <td>
                                                                <asp:Label ID="lblam" runat="server" Text=""></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->

                                        <!-- this row will not appear when printing -->
                                        <div class="row no-print">
                                            <div class="col-12">
                                                <%--   <a href="invoice-print.html" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a>
                  <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Submit
                    Payment
                  </button>--%>
                                                <%--<button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                                                    <i class="fas fa-download"></i>Generate PDF--%>

                      <asp:Button ID="btnGeneratePDF" runat="server" Text="Generate PDF" CssClass="btn btn-primary float-right" OnClick="btnGeneratePDF_Click" />


                                                <%--</button>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.invoice -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    </section>
                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->
            </asp:Panel>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>
    </body>
    </html>


</asp:Content>

