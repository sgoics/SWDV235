<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="Project1.news" %>

<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" href="css/styles.css">
    <title>Road Trippin' Calculator</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="email_list.js"></script>
  </head>
  <body>

<nav class="navbar navbar-default navbar-inverse" style="margin-bottom:0;border-radius:0;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>    
      <a class="navbar-brand" href="calculator.html">
          <img class="logo" src="css/projlogo.png"/>
          <span>Road Trippin' Calculator</span>
        </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="calculator.html">Calculator</a></li>
          <li><a href="contact.html">Contact</a></li>
          <li><a href="news.html">Newsletter</a></li>
          <li><a href="faq.html">FAQs</a></li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  <main>
    <h1 style = "color: orangered">Please fill out the form below<br>to register for our newsletter.</h1>
    <form id="email_form" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that this field is required" CssClass="text-danger"></asp:ValidationSummary>
        <label for="email_address1">Email Address:</label>
        <asp:TextBox ID="visitor_email" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="visitor_email" CssClass="text-danger" >*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  CssClass="text-danger" ControlToValidate="visitor_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Must be valid email address</asp:RegularExpressionValidator>
        <br />
        <label for="email_address2">Re-enter Email Address:</label>
        <input type="text" id="email_address2" name="email_address2">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="visitor_email" CssClass="text-danger" >*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  CssClass="text-danger" ControlToValidate="visitor_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Must be valid email address</asp:RegularExpressionValidator>
        <br />
        <label for="visitor_fName">First Name</label>
        <asp:TextBox ID="visitor_fName" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="visitor_fName" CssClass="text-danger">*</asp:RequiredFieldValidator>
        <br />
        <label>&nbsp;</label>
         <asp:Button id="submitButton" Text="Join our List" runat="server" OnClick="submitButton_Click"/>
        <asp:Button id="resetButton" Text="Reset" runat="server" OnClick="resetButton_Click" CausesValidation="false"/>
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
    </form>
</main>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
