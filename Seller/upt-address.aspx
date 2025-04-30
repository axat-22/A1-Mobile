<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master" CodeBehind="upt-address.aspx.cs"  EnableEventValidation="false"Inherits="A1Mobile.Seller.upt_address" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Navbar -->
        <!-- Right navbar links -->
        <!-- Content Wrapper. Contains page content -->
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
                <!-- /.container-fluid -->

                <div class="tab-pane" id="settings">
                    

                        <section class="content">
                            <div class="container-fluid">
                                <div class="row">
                                    <!-- left column -->
                                    <div class="col-md-6">
                                        <!-- general form elements -->
                                        <div class="card card-primary">
                                            <div class="card-header">
                                                <h3 class="card-title">Seller  Address</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <!-- form start -->
                                            <form>

                                                <div class="card-body">

                                                    <div class="form-group">
                                                        <label>AddressType</label>
                                                        <asp:RadioButtonList class="form-control" RepeatDirection="Horizontal" ID="Radiobt" runat="server">
                                                            <asp:ListItem Selected="True" Value="Residential">Residential</asp:ListItem>
                                                            <asp:ListItem Value="Official">Official</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                


                                                <div class="form-group">
                                                    <label>Addressline1</label>

                                                    <asp:TextBox ID="txtaddressline1" class="form-control" placeholder="Addressline1" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Addressline1" Display="Dynamic" ForeColor="Red" ControlToValidate="txtaddressline1"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="form-group">
                                                    <label>Addressline2</label>
                                                    <asp:TextBox ID="txtaddressline2" class="form-control" placeholder="Addressline2" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Your Addressline2" Display="Dynamic" ForeColor="Red" ControlToValidate="txtaddressline2"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="form-group">
                                                    <label>Landmark</label>
                                                    <asp:TextBox ID="txtlandmark" class="form-control" placeholder="Landmark" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Your Landmark" Display="Dynamic" ForeColor="Red" ControlToValidate="txtlandmark"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group">
                                                    <label>Pincode</label>
                                                    <asp:TextBox ID="txtpincode" class="form-control" placeholder="Pincode" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Your Pincode" Display="Dynamic" ForeColor="Red" ControlToValidate="txtpincode"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="form-group">
                                                    <label>City</label>
                                                    <asp:DropDownList ID="txtdrpcity" class="form-control" runat="server">
                                                        <asp:ListItem>City</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group">
                                                    <label>State</label>
                                                    <asp:DropDownList ID="drpstate" class="form-control" runat="server">
                                                        <asp:ListItem Selected="True">State</asp:ListItem>
                                                        <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                                        <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                                                        <asp:ListItem Value="Assam">Assam</asp:ListItem>
                                                        <asp:ListItem Value="Chhattisgarh">Chhattisgarh</asp:ListItem>
                                                        <asp:ListItem Value="Goa">Goa</asp:ListItem>
                                                        <asp:ListItem Value="Haryana">Haryana</asp:ListItem>
                                                        <asp:ListItem Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                                                        <asp:ListItem Value="Jharkhand">Jharkhand</asp:ListItem>
                                                        <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                                                        <asp:ListItem Value="Manipur">Manipur</asp:ListItem>
                                                        <asp:ListItem Value="Kerala">Kerala</asp:ListItem>
                                                        <asp:ListItem Value="Odisha">Odisha</asp:ListItem>
                                                        <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                                        <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                                                        <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                                                        <asp:ListItem Value="Meghalaya">Meghalaya</asp:ListItem>
                                                        <asp:ListItem Value="Telangana">Telangana</asp:ListItem>
                                                        <asp:ListItem Value="Mizoram">Mizoram</asp:ListItem>
                                                        <asp:ListItem Value="Sikkim">Sikkim</asp:ListItem>
                                                        <asp:ListItem Value="Tamil Nadu">Tamil Nadu</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <asp:DropDownList ID="drpcountry" class="form-control" runat="server">
                                                        <asp:ListItem>country</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>




                                                </div>

                                                <!-- /.card-body -->

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    
                </div>

            </section>

            <div class="form-group row">
                <div class="offset-sm-2 col-sm-10">
                    <asp:HiddenField ID="hdid" runat="server" />

                    <asp:Button ID="btn" ValidationGroup="valid" class="btn btn-primary" runat="server" Text="Update" OnClick="btn_Click" />

                    <a class="btn btn-primary" href="profile.aspx">Cancel</a>

                </div>
            </div>
        </div>

</asp:Content>
