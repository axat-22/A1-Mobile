<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master" EnableEventValidation="false" CodeBehind="Profile-upt.aspx.cs" Inherits="A1Mobile.Seller.Profile_upt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="wrapper" >
        <div class="content-wrapper" style="min-height: 720.2px;" >
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-6">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Seller Profile</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>

            <div class="tab-pane" id="settings">
                <!-- Instead of <form class="form-horizontal">, use div -->
                <div class="form-horizontal">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Seller Profile Edit</h3>
                                        </div>

                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>FirstName</label>
                                                <asp:TextBox ID="txtfirstname" class="form-control" placeholder="FirstName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Addressline1" Display="Dynamic" ForeColor="Red" ControlToValidate="txtfirstname"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <label>MiddelName</label>
                                                <asp:TextBox ID="txtmiddelname" class="form-control" placeholder="MiddelName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Your Addressline2" Display="Dynamic" ForeColor="Red" ControlToValidate="txtmiddelname"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <label>Image</label>
                                                <asp:FileUpload ID="img" class="form-control" runat="server" />
                                            </div>

                                            <div class="form-group">
                                                <label>LastName</label>
                                                <asp:TextBox ID="txtlastname" class="form-control" placeholder="LastName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Your Landmark" Display="Dynamic" ForeColor="Red" ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <label>Phone No</label>
                                                <asp:TextBox ID="txtphone" class="form-control" ReadOnly="true" placeholder="Phone No" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Your Pincode" Display="Dynamic" ForeColor="Red" ControlToValidate="txtphone"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <label>Email</label>
                                                <asp:TextBox ID="txtemail" class="form-control" ReadOnly="true" placeholder="Email" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="valid" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Your Pincode" Display="Dynamic" ForeColor="Red" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group row">
                                                <div class="offset-sm-4 col-sm-10">
                                                    <asp:HiddenField ID="hdid" runat="server" />
                                                    <asp:Button ID="btn" ValidationGroup="valid" class="btn btn-primary" OnClick="btn_Click" runat="server" Text="Save" />
                                                    <asp:Button ID="btn1" runat="server" Text="Back" class="btn btn-primary" OnClick="btn1_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>




