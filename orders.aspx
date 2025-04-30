<%@ Page Language="C#" AutoEventWireup="true" Masterpagefile="~/Buyer/index.Master" CodeBehind="orders.aspx.cs" Inherits="A1Mobile.Buyer.payment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>  


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                
  
    





    <!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>A1 Mobile | Order </title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>My Order</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Order</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2">
                
                  <tbody>
                   <asp:GridView ID="grd" DataKeyNames="sellerregid,ID,prodid"   Cssclass="table table-bordered table-hover" AutoGenerateColumns="False"  runat="server">
      <Columns>
         
          <asp:TemplateField HeaderText="Product Name" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("productname")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Seller Name" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("sellername")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Order Date" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("orddate")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("quantity")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("price")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Total Price" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("totalprice")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Order Status" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("OrderStatus")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>

          <asp:TemplateField HeaderText="Payment Status" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("paymentstatus")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
          <asp:TemplateField HeaderText="Payment Type" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
            <%# Eval("pyttype")%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>

          <asp:TemplateField HeaderText="Payment" ItemStyle-Width="100">
            <ItemTemplate>

                <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="print" CommandArgument='<%# Eval("ID") %>'
  CausesValidation="false" Visible='<%# Eval("OrderStatus").ToString() == "Pending" && Eval("paymentstatus").ToString() == ""  ? true : false %>'> Payment
  </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Invoice" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
       <a href="invoice.aspx"> Invoice</a>

            <%--<%# Eval("pyttype")%>--%>
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
    <ItemStyle HorizontalAlign="Left"></ItemStyle>
</asp:TemplateField>
                    
      </Columns>


  </asp:GridView>
  <asp:HiddenField ID="hdid" runat="server" />


                  </tbody>
                 <%-- <tfoot>
                  <tr>
                    <th>Rendering engine</th>
                    <th>Browser</th>
                    <th>Platform(s)</th>
                    <th>Engine version</th>
                    <th>CSS grade</th>
                  </tr>
                  </tfoot>--%>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

        
            <!-- /.card -->
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
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
</body>
</html>









    </asp:Content>