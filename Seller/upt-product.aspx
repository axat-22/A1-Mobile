<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master" CodeBehind="upt-product.aspx.cs" Inherits="A1Mobile.Seller.upt_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>A1Mobile | Product</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Product Update</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Product </li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <section class="content">
      <div class="row justify-content-center">
    <div class="col-md-8">

                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Product Update</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                    </div>

                    <div class="card-body">
                        <!-- Product Name -->
                        <div class="form-group">
                            <label for="inputName">Product Name</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProdname" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Name"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtProdname" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Product Model -->
                        <div class="form-group">
                            <label for="inputModel">Product Model</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProdmodel" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Model"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtProdmodel" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Product RAM -->
                        <div class="form-group">
                            <label for="inputRam">Product RAM</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtprodram" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product RAM"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtprodram" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Product Storage -->
                        <div class="form-group">
                            <label for="inputStorage">Product Storage</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtprodstorage" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Storage"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtprodstorage" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Product Image -->
                        <div class="form-group">
                            <label for="inputImage">Product Image</label>
                            <asp:FileUpload ID="img" runat="server" />
                        </div>

                        <!-- Product Price -->
                        <div class="form-group">
                            <label for="inputPrice">Product Price</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtprodprice" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Price"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtprodprice" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Product Description -->
                        <div class="form-group">
                            <label for="inputDescription">Product Description</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtproddescription" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Description"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtproddescription" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Product Quantity -->
                        <div class="form-group">
                            <label for="inputQuantity">Product Quantity</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtquantity" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Quantity"></asp:RequiredFieldValidator>
                            <asp:HiddenField ID="hdid" runat="server" />
                            <asp:TextBox ID="txtquantity" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group">
                            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Update" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" class="btn btn-secondary" Text="Back" OnClick="Button2_Click" />
                        </div>
                    </div>
                    <!-- /.card-body -->

                </div>
                <!-- /.card -->
            </div>
            <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->

</asp:Content>
