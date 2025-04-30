<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master" CodeBehind="product-list.aspx.cs" Inherits="A1Mobile.product_list" %>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>




    <!-- Site wrapper -->
    <div class="wrapper">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <%--<h1>Pace</h1>--%>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Product-List</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Product-List</h3>
                        <asp:HiddenField ID="hdid" runat="server" />
                        <div class="card-tools">
                            <%--  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">--%>
                            <a href="product.aspx" class="auto-style2">Add Product</a>
                            <%--<i class="fas fa-minus"></i>--%>
                            <%--</button>--%>
                            <%--<button type="button" data-card-widget="remove" title="Remove">--%>

                            <asp:TextBox ID="txtsearch" runat="server" AutoPostBack="true"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />


                            <%--<i class="fas fa-times"></i>--%>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0">









                    <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" OnRowCommand="grd_RowCommand">

                        <Columns>



                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                            <asp:BoundField DataField="productname" HeaderText="Name" SortExpression="Prodname" />
                            <asp:BoundField DataField="Prodmodel" HeaderText="Model" SortExpression="Prodmodel" />
                            <asp:BoundField DataField="prodram" HeaderText="Ram" SortExpression="prodram" />
                            <asp:BoundField DataField="prodstorage" HeaderText="Storage" SortExpression="prodstorage" />


                            <asp:TemplateField ShowHeader="true" HeaderText="Image">
                                <ItemTemplate>

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prodimage") %>'
                                        Height="80px" Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="proddisplay" HeaderText="Display Size" SortExpression="prodstorage" />
                            <asp:BoundField DataField="prodcamara" HeaderText="Camara" SortExpression="prodstorage" />
                            <asp:BoundField DataField="prodbattery" HeaderText="battery" SortExpression="prodstorage" />
                            <asp:BoundField DataField="prodprocessor" HeaderText="Processor" SortExpression="prodstorage" />
                            <asp:BoundField DataField="prodprice" HeaderText="Price" SortExpression="prodprice" />
                            <asp:BoundField DataField="proddescription" HeaderText="Description" Visible="false" SortExpression="proddescription" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="Quantity" />



                          <%--  <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>

<%--                                                  <asp:LinkButton ID="btndelete"  runat="server"  CommandName="del" CommandArgument='<%# Eval("ID") %>'
CausesValidation="false" Visible='<%# Eval("Delete").ToString() == "Pending" && Eval("paymentstatus").ToString() == ""  ? true : false %>'> Payment
</asp:LinkButton>--%>

<%--                                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="del"CommandArgument='<%# Eval("ID") %>' 
                                        CausesValidation="false" Visible='<%# Eval("ordstatus").ToString() == "Pending" && Eval("paymentstatus").ToString() == ""  ? true : false %>'> --%>                             
                              <%--  </ItemTemplate>
                            </asp:TemplateField>--%>


                              <asp:TemplateField ShowHeader="False">
      <ItemTemplate>
          <asp:LinkButton ID="btndel" runat="server" Text="Delete" CommandName="del"
              CommandArgument='<%# Eval("ID") %>' />
      </ItemTemplate>
  </asp:TemplateField>



    
                             <asp:HyperLinkField DataNavigateUrlFields="ID" 
         DataNavigateUrlFormatString="upt-product.aspx?id={0}"
        DataTextField="ID" HeaderText="Update"  />

          
                            
                        </Columns>
                    </asp:GridView>
                    <asp:HiddenField ID="hdquantity" runat="server" />
                    <asp:HiddenField ID="hdprodname" runat="server" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                </div>
                <!-- /.card-body -->

                <!-- /.card -->

            </section>
            <!-- /.content -->
        </div>
    </div>
    <!-- /.content-wrapper -->






</asp:Content>

