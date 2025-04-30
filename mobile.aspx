<%@ Page Language="C#" AutoEventWireup="true" Masterpagefile="~/Buyer/index.Master" CodeBehind="mobile.aspx.cs" Inherits="A1Mobile.Buyer.mobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>  


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> A1 Mobile     </title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <style>
  .product-image {
    width: 100%;
    max-width: 400px;
    height: auto;
    display: block;
    margin: auto;
    border-radius: 10px;
    object-fit: contain;
  }
</style>


</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Mobile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Mobile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-sm-6">
              <h3 class="d-inline-block d-sm-none"> </h3>
              <div class="col-12"   >
                
               <asp:Image ID="Img" runat="server" CssClass="product-image" />
              </div>


             
            </div>
            <div class="col-12 col-sm-6">
              <h3 class="my-3"> <asp:Label ID="lbproductname" runat="server" Text=""></asp:Label>    <asp:Label ID="lbprodmodel" runat="server" Text=""></asp:Label> (<asp:Label ID="prodstorage" runat="server" Text=""></asp:Label>)  (<asp:Label ID="prodram" runat="server" Text="">RAM </asp:Label>)</h3>
            <h2> Price <span>&#8377;</span><asp:Label ID="lbprodprice" runat="server" Text=""></asp:Label> </h2>

              <hr>
              <h4> Ram</h4>
              <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-default text-center active">
                    <asp:Label ID="lbprodram" runat="server" Text=""></asp:Label> 
                                   
                  <br>
                  
                </label>
                
              </div>

              <h4 class="mt-3">  Storage</h4>
              <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-default text-center">
                      <asp:Label ID="lbprodstorage" runat="server" Text=""></asp:Label> 
                  <input type="radio" name="color_option" id="color_option_b1" autocomplete="off">
                  
                  
                  <br>
                  
                </label>
                      </div>


                    
                                      <br>
<div class="_2cM9lP col-6-12 "><div class="_3a9CI2">Highlights</div>
    <div class="_2418kt"><ul><li class="_21Ahn-"><asp:Label ID="lblram" runat="server" Text=""></asp:Label>  |  <asp:Label ID="lblstorage" runat="server" Text=""></asp:Label></li>
    <li class="_21Ahn-">  <asp:Label ID="lblproddisplay" runat="server" Text=""></asp:Label></li>
    <li class="_21Ahn-"><asp:Label ID="lblprodcamara" runat="server" Text=""></asp:Label></li>
    <li class="_21Ahn-"><asp:Label ID="lblprodbattery" runat="server" Text=""></asp:Label></li>
    <li class="_21Ahn-"><asp:Label ID="lblprocessor" runat="server" Text=""></asp:Label></li>
</ul></div></div>              

               <div class="mt-4">
                   <asp:Button ID="btnbuy" CssClass="btn btn-primary btn-lg btn-flat" OnClick="btnbuy_Click" ValidationGroup="valid"  runat="server" Text="Buy Now" />

  
  <div class="btn btn-default btn-lg btn-flat">
    <a href="Deshboard.aspx"> Back </a> 
  </div>
</div>

              <div class="mt-4">
                <div class="btn btn-lg btn-flat">
           
                                                   
                <asp:HiddenField ID="hdprodid" runat="server" />
                

                <div class="btn-lg btn-flat">
               
                     <asp:Label ID="lbquantity" Visible="false" runat="server" Text=""></asp:Label>
                  
                </div>

                     
                  </div>


                             <div class="tab-content p-3" id="nav-tabContent">
             <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> 
<asp:Label ID="lblproddescription" runat="server" Text=""></asp:Label>
         </div>
       </div>
                



                                      


            </div>
          </div>
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
          
              </div>
            </nav>
         
          </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
</div>
          </div>
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
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<script>
  $(document).ready(function() {
    $('.product-image-thumb').on('click', function () {
      var $image_element = $(this).find('img')
      $('.product-image').prop('src', $image_element.attr('src'))
      $('.product-image-thumb.active').removeClass('active')
      $(this).addClass('active')
    })
  })
</script>
</body>
</html>
    
 </asp:Content>
