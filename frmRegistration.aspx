<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistration.aspx.cs" Inherits="A1Mobile.Buyer.frmRegistration" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>a1 mobile | buyer registration page</title>

    <!-- google font: source sans pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=source+sans+pro:300,400,400i,700&display=fallback">
    <!-- font awesome -->
    <link rel="stylesheet" href="../css/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../css/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- theme style -->
    <link rel="stylesheet" href="../css/dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
    <div class="register-box">
        <div class="register-logo">
            <a><b>A1-Mobile Buyer</b></a>
        </div>

        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">register a new membership</p>

                <form method="post" runat="server">

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtfstname" runat="server" class="form-control" placeholder="firstname"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ErrorMessage="enter your firstname" ControlToValidate="txtfstname" Display="dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtmidname" runat="server" class="form-control" placeholder="middlename"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ErrorMessage="enter your middlename" ControlToValidate="txtmidname" Display="dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtlstname" runat="server" class="form-control" placeholder="lastname"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator3" runat="server" ErrorMessage="enter your lastname" ControlToValidate="txtlstname" Display="dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <%--    <div class="input-group mb-3">
          <asp:textbox id="txtphno" runat="server" class="form-control" placeholder="phone no" ></asp:textbox>
          <div class="input-group-append">
            <div class="input-group-text">
              <asp:requiredfieldvalidator id="requiredfieldvalidator4" runat="server" errormessage="enter your phone no" controltovalidate="txtphno" display="dynamic" forecolor="red"></asp:requiredfieldvalidator>
            </div>
          </div>
        </div>--%>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtphno" runat="server" class="form-control" placeholder="Phone no"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btnSendOTP" runat="server" Text="Send OTP" CssClass="btn btn-outline-secondary" OnClick="btnSendOTP_Click" />
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="Enter your phone number"
                        ControlToValidate="txtphno"
                        Display="Dynamic"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>

                    <!-- OTP Input and Verify Button -->
                    <div class="input-group mb-3" style="margin-top: 10px;">
                        <asp:TextBox ID="txtOTP" runat="server" class="form-control" placeholder="Enter OTP"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" CssClass="btn btn-success" OnClick="btnVerifyOTP_Click" />
                        </div>
                    </div>
                    <asp:Label ID="lblOTPStatus" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>



                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="email"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator5" runat="server" ErrorMessage="enter your email" ControlToValidate="txtemail" Display="dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regularexpressionvalidator1" runat="server" ErrorMessage="enter your valid email" ControlToValidate="txtemail" Display="dynamic" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtpass" runat="server" class="form-control" placeholder="password" TextMode="password"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator6" runat="server" ErrorMessage="enter your password" ControlToValidate="txtpass" Display="dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="col-4">
                        <asp:Label ID="lb" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lb1" runat="server" Text=""></asp:Label>
                        <asp:Button ID="btn" class="btn btn-primary btn-block" runat="server" Text="register" OnClick="btn_Click" />
                    </div>

                </form>
                <a href="frmlogin.aspx" class="text-center">i already have a membership</a>
            </div>
        </div>
    </div>

    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>



