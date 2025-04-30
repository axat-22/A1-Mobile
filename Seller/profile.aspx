<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master"  CodeBehind ="profile.aspx.cs" Inherits="A1Mobile.Seller.profile"   %>


 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

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
              <li class="breadcrumb-item active">Seller Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
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
                <h3 class="profile-username text-center"> </h3>

                <p class="text-muted text-center">  <asp:Label ID="lbl" runat="server" Text=""></asp:Label> </p>

<%--                 <a href="Profile-upt.aspx"> Edit</a>

                  <asp:Button ID="btn" runat="server" Text="Edit" OnClick="btn_Click1" />--%>
                              
                  
                  

 <%--     <a href='<%# "Profile-upt.aspx?a1="("ID") '>
         <i class="fas fa-pencil-alt"></i> 
      </a>--%>

                  <%--<a href="Profile-upt.aspx?a1"+("ID")+>Edit</a>--%>

                  <a href="Profile-upt.aspx?a1=<%= hdid.Value %>">Edit</a>



                  <%--<i class="fas fa-pencil-alt"></i>--%>

                <ul class="list-group list-group-unbordered mb-3">
                      <li class="list-group-item">

                          <a href="Address.aspx"> Address </a>
                <%--  <a class="nav-link active"href="Address.aspx" data-toggle="tab"> Address </a>--%>


                        


                       </li>
                </ul>         

               
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            
            <!-- /.card -->
          </div>
          <!-- /.col -->
        
             <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"> <a class="nav-link active" href="#activity" data-toggle="tab">Address</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="activity">
                    <!-- Post -->
                             
                        <asp:ListView ID="ListView1" OnItemCommand="ListView1_ItemCommand" runat="server" >
                            <ItemTemplate>
                        <div class="post">
                      <div class="user-block">
                        <span class="">
                            <b> Address Type : 
                          <a ><%#Eval("Addresstype") %>.</a>
                                </b>
                        </span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                              <%--<%#Eval("RegistrationId") %>--%>
                             <%#Eval("Addressline1") %>
                             <%#Eval("Addressline2") %>
                             <%#Eval("Landmark") %>
                             <%#Eval("Pincode") %>
                             <%#Eval("City") %>
                             <%#Eval("state") %>
                             <%#Eval("Country") %>
                      </p>

                      <%--<p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>--%>

<%--                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">--%>
      

      <a href='<%# "upt-address.aspx?q0="+Eval("ID") %>'>
         <i class="fas fa-pencil-alt"></i> 
      </a>

     
      <asp:linkbutton ID="btndelete" runat="server" class="fas fa-trash"  CommandName="del"   OnClientClick="return ConfirmDelete();"  
          CommandArgument='<%# Eval("ID") %>' />
          
 
                           

   
    <%--<asp:Button ID="btn" runat="server" CommandArgument="" CommandName="del" Text="Delete" />--%>
   

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
              </div><!-- /.card-body -->
           
            <!-- /.card -->
</div>
</div>            </div>
          </div>
          <!-- /.col -->
       
        <!-- /.row -->
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  
</div>
<!-- ./wrapper -->

      <script>

          function ConfirmDelete() {
              var x = confirm("Are you sure you want to delete Address?");
              if (x)
                  return true;
              else
                  return false;
          }

      </script>

</asp:Content> 


