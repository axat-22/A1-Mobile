<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Buyer/index.Master" CodeBehind="checkout.aspx.cs" Inherits="A1Mobile.Buyer.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1></h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Checkout</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card card-solid">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-6">
                            <h3 class="d-inline-block d-sm-none">LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>
                            <div class="col-12">
                                <asp:Image ID="Img" runat="server" CssClass="img-fluid product-image" />
                            </div>
                            <div class="col-12">
                                <asp:Label ID="lbproductname" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-12">
                                <asp:Label ID="lbprodmodel" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-12">
                                Price : <span>&#8377;</span>
                                <asp:Label ID="lbprodprice" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-12">
                                <asp:TextBox ID="txtquantity" class="bg-gray py-2 px-3 mt-4" OnTextChanged="txtquantity_TextChanged" AutoPostBack="true" runat="server" Width="214px">


                                </asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Quantity" Display="Dynamic" ForeColor="Red" ControlToValidate="txtquantity"></asp:RequiredFieldValidator>

                                <%--  <asp:Label ID="lbl" runat="server" Text=""></asp:Label>--%>
                            </div>
                            <div class="col-12">
                                <asp:TextBox ID="txttotalprice" class="bg-gray py-2 px-3 mt-4" ReadOnly="true" ValidationGroup="valid" runat="server" Width="214px"></asp:TextBox>

                            </div>
                            <div class="col-12">
                                <div class="mt-4">

                                    <asp:Button ID="btnbuy" CssClass="btn btn-primary btn-lg btn-flat" ValidationGroup="valid"
                                        runat="server" Text="Buy Now" OnClick="btnbuy_Click" />


                                    <asp:HiddenField ID="hdnaddressID" runat="server" />
                                    <asp:HiddenField ID="hdprodid" runat="server" />
                                    <asp:HiddenField ID="hdsellerid" runat="server" />
                                    <asp:HiddenField ID="hdquantity" runat="server" />
                                    <asp:HiddenField ID="hdsoldquantity" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" />

                                </div>



                            </div>
                            <div class="col-12">
                                <asp:Label ID="lblremarks" runat="server" Text=""></asp:Label>
                            </div>



                        </div>
                        <div class="col-12 col-sm-6">

                            <h3 class="my-3">Select Address</h3>

                            <%--   <asp:GridView ID="grdaddress" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                        SortExpression="Loc_Name">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="false"
                                                CommandName="sel"
                                                CommandArgument='<%# Eval("ID") %>' />
                                            <asp:HiddenField ID="hdaddressId" runat="server" Value='<%#Eval("ID") %>' />

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address Type" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                        SortExpression="Loc_Name">
                                        <ItemTemplate>
                                            <%# Eval("Addresstype")%>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                        SortExpression="Loc_Name">
                                        <ItemTemplate>
                                            <%--        <%#Eval("RegistrationId") %>--%>
                            <%--             <%#Eval("Addressline1") %>
                                            <%#Eval("Addressline2") %>
                                            <%#Eval("Landmark") %>
                                            <%#Eval("Pincode") %>
                                            <%#Eval("City") %>
                                            <%#Eval("state") %>
                                            <%#Eval("Country") %>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>--%>--%>
                            <asp:GridView ID="grdaddress" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                            <asp:HiddenField ID="hdaddressId" runat="server" Value='<%#Eval("ID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Addresstype" HeaderText="Address Type" />
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <%# Eval("Addressline1") %>, <%# Eval("Addressline2") %>, <%# Eval("Landmark") %>,
                <%# Eval("City") %> - <%# Eval("Pincode") %>, <%# Eval("State") %>, <%# Eval("Country") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>


                        </div>

                    </div>

                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


    <!-- Site wrapper -->


</asp:Content>
