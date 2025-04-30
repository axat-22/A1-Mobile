<%@ Page Language="C#" AutoEventWireup="true" Masterpagefile="~/Buyer/index.Master" CodeBehind="Deshboard.aspx.cs" Inherits="A1Mobile.Buyer.Deshboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>  


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="wrapper">
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Mobile</h1>
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
        <div class="card-body pb-0">
          <div class="row">
        
 <%-- <div class="row">
               <div class="col-md-8 offset-md-2">
                   <form action="simple-results.html">
                       <div class="input-group">
                           <input type="search" class="form-control form-control-lg" placeholder="Type your keywords here">
                           <div class="input-group-append">
                               <button type="submit" class="btn btn-lg btn-default">
                                   <i class="fa fa-search"></i>
                               </button>

                           </div>
                       </div>
                   </form>
               </div>
           </div>--%>
          
              <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox><asp:Button ID="txtsearch" runat="server" Text="Search" Onclick="btnsearch_Click" />
               
             
               
          
            
    </div>
  </div>
          
                        <asp:DataList ID="DataList1" runat="server"   RepeatDirection="Horizontal" RepeatColumns="3">
    <ItemTemplate>

        <div class="col-lg-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
              <div class="card bg-light d-flex flex-fill">

                <div class="card-header text-muted border-bottom-0">
                 <%# Eval("productname") %> 
                      <h2 class="lead"><b><%# Eval("Prodmodel") %> </b></h2>
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                    

                        
                      

                      <p class="text-muted text-sm"> </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                          <li class ="small" >RAM: <%# Eval("prodram") %> </li>
                        <li class="small">STORAGE: <%# Eval("prodstorage") %> </li>
                        <li class="small"> PRICE :  <%# Eval("prodprice") %></li>
                      </ul>

                       <%--   <li class="small"> STOCK :  <%# Eval("quantity") %></li>
                        <asp:Label ID="lbl" runat="server" Text="Label"></asp:Label>--%>
                    </div>
                    <div class="col-5 text-center">
                    <asp:Image ID="Image2" runat="server"  ImageUrl='<%# Eval("prodimage") %>'
                        Height="80px" Width="100px" />
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                   
                                <a href='<%# "mobile.aspx?q0="+Eval("ID") %>'
title="Buy" class="btn btn-sm btn-primary" id="Edit"> Buy Now
                                </a>
                  </div>
                </div>
              </div>
            </div>


        
                
    
       

            

   
        
    </ItemTemplate>
</asp:DataList>

        


          </div>
        
        </section>
        </div>
     
      </div>

    </asp:Content>