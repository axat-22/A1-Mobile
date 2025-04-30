    <%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Buyer/index.Master" CodeBehind="profile.aspx.cs" Inherits="A1Mobile.Buyer.profile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="wrapper">
        <!-- Navbar -->
        <!-- Right navbar links -->
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                     <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Profile</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Buyer Profile</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">

                            <!-- Profile Image -->
                            <div class="card card-primary card-outline">
                                <div class="card-body box-profile">



                                    <div class="text-center">

                                        <asp:Image ID="Img" runat="server" class="profile-user-img img-fluid img-circle" />



                                    </div>
                                    <asp:HiddenField ID="hdid" runat="server" />
                                    <h3 class="profile-username text-center"></h3>

                                    <p class="text-muted text-center">
                                        <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                                    </p>

                                    <a href="Profile-upt.aspx?a1"+("id")+>Edit</a>

                                    <ul class="list-group list-group-unbordered mb-3">
                                        <li class="list-group-item">
                                            <%--<a class="nav-link active"href="Address.aspx" data-toggle="tab"> Add Address </a>--%>
                                            <a href="Address.aspx">Add Address</a>


                                             

                                        </li>
                                    </ul>

                                    <%--    <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>--%>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->

                            <!-- About Me Box -->
                         <div class="card card-primary">
                                <%--<div class="card-header">
                <h3 class="card-title">About Me</h3>
              </div>--%>
                                <!-- /.card-header -->
                                <%--        <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> Education</strong>

                <p class="text-muted">
                  B.S. in Computer Science from the University of Tennessee at Knoxville
                </p>

                <hr>

                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>

                <p class="text-muted">Malibu, California</p>

                <hr>

                <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>

                <p class="text-muted">
                  <span class="tag tag-danger">UI Design</span>
                  <span class="tag tag-success">Coding</span>
                  <span class="tag tag-info">Javascript</span>
                  <span class="tag tag-warning">PHP</span>
                  <span class="tag tag-primary">Node.js</span>
                </p>

                <hr>

                <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>

                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
              </div>--%>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>



                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-header p-2">
                                    <ul class="nav nav-pills">
                                        <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Address</a></li>

                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="active tab-pane" id="activity">
                                            <!-- Post -->

                                            <asp:ListView ID="ListView1" OnItemCommand="ListView1_ItemCommand" runat="server">
                                                <ItemTemplate>
                                                    <div class="post">
                                                        <div class="user-block">
                                                            <span class="">
                                                                <b>Address Type : 
                          <a><%#Eval("Addresstype") %>.</a>
                                                                </b>
                                                            </span>
                                                        </div>
                                                        <!-- /.user-block -->
                                                        <p>
                                                            <%-- <%#Eval("RegistrationId") %>--%>
                                                            <%#Eval("Addressline1") %>,
                             <%#Eval("Addressline2") %>,
                             <%#Eval("Landmark") %>,
                             <%#Eval("Pincode") %>,
                             <%#Eval("City") %>,
                             <%#Eval("state") %>,
                             <%#Eval("Country") %>
                                                        </p>




                                                        <a href='<%# "upt-address.aspx?q0="+Eval("ID") %>'
                                                            title="Edit" id="Edit">Edit
                                                        </a>


                                                        <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="del"
                                                            CommandArgument='<%# Eval("ID") %>' />








                                                    </div>

                                                </ItemTemplate>
                                            </asp:ListView>


                                            <!-- /.tab-pane -->

                                            <%--  <div class="form-group row">
                   <div class="offset-sm-2 col-sm-10">
                  <button type="submit" class="btn btn-danger">Submit</button>--%>
                                        </div>
                                    </div>
                                    <!-- /.tab-content -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>
    </div>




</asp:Content>



