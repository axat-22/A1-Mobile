<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="A1Mobile.Seller.forgotpass" %>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AI Mobile Login Seller</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../css/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../css/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../css/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a class="h1"><b> Seller Resate Passwrod</b></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg"></p>

      <form id="form1" runat="server">
        <div class="input-group mb-3">
    <asp:TextBox ID="txtemail" runat="server" placeholder="Email"  CssClass="form-control" ></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>  
   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid emailid" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>             
            </div>
          </div>
        </div>

                <div class="input-group mb-3">
  <asp:TextBox ID="pass" runat="server" placeholder="Password"  CssClass="form-control" ></asp:TextBox>
        <div class="input-group-append">
          <div class="input-group-text">
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Your Password" ControlToValidate="pass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>             
          </div>
        </div>
      </div>

                <div class="input-group mb-3">
  <asp:TextBox ID="conpass" runat="server" placeholder="Conform Password"  CssClass="form-control" ></asp:TextBox>
        <div class="input-group-append">
          <div class="input-group-text">
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Your Password" ControlToValidate="conpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>             
          </div>
        </div>
      </div>




        <div class="row">
                     
          <!-- /.col -->
         
          <!-- /.col -->
             
        <asp:Button ID="Btn"  class="btn btn-primary btn-block" runat="server" Text="Submit" OnClick="Btn_Click" />
               <a href="login.aspx"> Back to login form</a>
         

        </div>
      </form>

      <!-- /.social-auth-links -->

    
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>
