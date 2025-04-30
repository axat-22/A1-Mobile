<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master" CodeBehind="product.aspx.cs" Inherits="A1Mobile.Seller.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hold-transition sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper" style="display: flex; flex-direction: column; min-height: 100vh;">
         
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="flex: 1;">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Product Add</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Product</h3>
                                </div>
                                <div class="card-body">
                                    <!-- All your form fields (same as before) -->
                                    
                                    <div class="form-group">
                                        <label for="inputName">Product Name</label>
                                        <asp:DropDownList CssClass="form-control" ID="drp" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product Model</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProdmodel" ValidationGroup="valid" Display="Dynamic" ForeColor="Red" class="form-control" ErrorMessage="Enter Your Product Model" />
                                        <asp:TextBox ID="txtProdmodel" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product Ram</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" class="form-control" ValidationGroup="valid" ControlToValidate="txtprodram" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Ram" />
                                        <asp:TextBox ID="txtprodram" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product Storage</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" class="form-control" ValidationGroup="valid" ControlToValidate="txtprodstorage" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Storage" />
                                        <asp:TextBox ID="txtprodstorage" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product image</label>
                                        <asp:FileUpload ID="img" CssClass="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product Price</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" class="form-control" ValidationGroup="valid" ControlToValidate="txtprodprice" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Price" />
                                        <asp:TextBox ID="txtprodprice" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product Display</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" class="form-control" ValidationGroup="valid" ControlToValidate="txtproddisplay" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Display" />
                                        <asp:TextBox ID="txtproddisplay" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product Camara</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" class="form-control" ValidationGroup="valid" ControlToValidate="txtprodcamara" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Camara" />
                                        <asp:TextBox ID="txtprodcamara" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product battery</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" class="form-control" ValidationGroup="valid" ControlToValidate="txtprodbattery" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Battery" />
                                        <asp:TextBox ID="txtprodbattery" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product processor</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="valid" class="form-control" ControlToValidate="txtprodprocessor" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product processor" />
                                        <asp:TextBox ID="txtprodprocessor" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product description</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="valid" class="form-control" ControlToValidate="txtproddescription" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product description" />
                                        <asp:TextBox ID="txtproddescription" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Product quantity</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="valid" class="form-control" ControlToValidate="txtquantity" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Your Product Quantity" />
                                        <asp:HiddenField ID="hdid" runat="server" />
                                        <asp:TextBox ID="txtquantity" class="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" ValidationGroup="valid" OnClick="Btn_Click" Text="Submit" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
    </style>
</asp:Content>
