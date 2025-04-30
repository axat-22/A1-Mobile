<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderstatus.aspx.cs" MasterPageFile="~/Buyer/index.Master" Inherits="A1Mobile.Buyer.orderstatus" %>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Seller Address</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </section>
            <!-- /.container-fluid -->

            <div class="tab-pane" id="settings">
                <form class="form-horizontal">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <!-- left column -->
                                <div class="col-md-6">
                                    <!-- general form elements -->
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Buyer Address</h3>
                                        </div>
                                        <!-- /.card-header -->

                                        <!-- form start -->
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="d-sm-flex align-items-center">
                                                    <h5 class="card-title flex-grow-1 mb-0">Order Status</h5>
                                                    <div class="flex-shrink-0 mt-2 mt-sm-0">
                                                        <a href="javasccript:void(0;)" class="btn btn-soft-info btn-sm mt-2 mt-sm-0"><i class="ri-map-pin-line align-middle me-1"></i>Change Address</a>
                                                        <a href="javasccript:void(0;)" class="btn btn-soft-danger btn-sm mt-2 mt-sm-0"><i class="mdi mdi-archive-remove-outline align-middle me-1"></i>Cancel Order</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="profile-timeline">
                                                    <div class="accordion accordion-flush" id="accordionFlushExample">
                                                        <div class="accordion-item border-0">
                                                            <div class="accordion-header" id="headingOne">
                                                                <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0 avatar-xs">
                                                                            <div class="avatar-title bg-success rounded-circle">
                                                                                <i class="ri-shopping-bag-line"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h6 class="fs-14 mb-0">Order Placed - <span class="fw-normal">Wed, 15 Dec 2021</span></h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body ms-2 ps-5 pt-0">
                                                                    <h6 class="mb-1">An order has been placed.</h6>
                                                                    <p class="text-muted">Wed, 15 Dec 2021 - 05:34PM</p>

                                                                    <h6 class="mb-1">Seller has processed your order.</h6>
                                                                    <p class="text-muted mb-0">Thu, 16 Dec 2021 - 5:48AM</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="accordion-item border-0">
                                                            <div class="accordion-header" id="headingTwo">
                                                                <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0 avatar-xs">
                                                                            <div class="avatar-title bg-success rounded-circle">
                                                                                <i class="mdi mdi-gift-outline"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h6 class="fs-14 mb-1">Packed - <span class="fw-normal">Thu, 16 Dec 2021</span></h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body ms-2 ps-5 pt-0">
                                                                    <h6 class="mb-1">Your Item has been picked up by courier partner</h6>
                                                                    <p class="text-muted mb-0">Fri, 17 Dec 2021 - 9:45AM</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="accordion-item border-0">
                                                            <div class="accordion-header" id="headingThree">
                                                                <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0 avatar-xs">
                                                                            <div class="avatar-title bg-success rounded-circle">
                                                                                <i class="ri-truck-line"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h6 class="fs-14 mb-1">Shipping - <span class="fw-normal">Thu, 16 Dec 2021</span></h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body ms-2 ps-5 pt-0">
                                                                    <h6 class="fs-14">RQK Logistics - MFDS1400457854</h6>
                                                                    <h6 class="mb-1">Your item has been shipped.</h6>
                                                                    <p class="text-muted mb-0">Sat, 18 Dec 2021 - 4.54PM</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="accordion-item border-0">
                                                            <div class="accordion-header" id="headingFour">
                                                                <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseFour" aria-expanded="false">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0 avatar-xs">
                                                                            <div class="avatar-title bg-light text-success rounded-circle">
                                                                                <i class="ri-takeaway-fill"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h6 class="fs-14 mb-0">Out For Delivery</h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="accordion-item border-0">
                                                            <div class="accordion-header" id="headingFive">
                                                                <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseFile" aria-expanded="false">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0 avatar-xs">
                                                                            <div class="avatar-title bg-light text-success rounded-circle">
                                                                                <i class="mdi mdi-package-variant"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h6 class="fs-14 mb-0">Delivered</h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end accordion-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>


                </form>
            </div>
        </div>
    </div>


</asp:Content>--%>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <h3 class="text-center mb-4">Order Tracking Status</h3>
            </div>
        </section>

        <section class="content">
            <div class="container d-flex justify-content-center">
                <div class="card shadow p-4" style="width: 100%; max-width: 600px;">
                    <div class="card-body text-center">

                        <i class="fas fa-shipping-fast fa-3x text-primary mb-3"></i>
                        <h4 class="mb-4">Your order is on the way!</h4>

                        <p><strong>Order Date:</strong> <asp:Label ID="lblOrderDate" runat="server" CssClass="text-dark" /></p>
                        <p><strong>Estimated Delivery:</strong> <asp:Label ID="lblDeliveryDate" runat="server" CssClass="text-success" /></p>

                        <hr />
                        <p class="text-muted">We'll notify you when your item is out for delivery.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<!-- Optional FontAwesome for icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

</asp:Content>





<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    </asp:Content>--%>