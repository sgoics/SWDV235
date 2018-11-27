<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Project1.contact" %>
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" href="css/styles.css">
    <title>Contact Us</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="contact.js"></script>
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
    <h1 style = "color:orangered">To contact us please fill out the form below.</h1>
      <form id="registration_form" runat="server">
 <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that this field is required" CssClass="text-danger"></asp:ValidationSummary>
        <label for="email">E-Mail:</label>&nbsp;
          <asp:TextBox ID="email" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>    
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" CssClass="text-danger" >*</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  CssClass="text-danger" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Must be valid email address</asp:RegularExpressionValidator>
          <br>
        <label for="phone">Mobile Phone:</label>
          <asp:TextBox ID="phone" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
          ControlToValidate="phone" CssClass="text-danger">*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  CssClass="text-danger" ControlToValidate="phone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Use this format: 999-999-9999</asp:RegularExpressionValidator>
            <br>
        <label for="country">Country:</label>
            <asp:DropDownList runat="server" ID="country">
                <asp:ListItem Text="Select an option" Value=""></asp:ListItem>
                <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
                <asp:ListItem Text="Canada" Value="Canada"></asp:ListItem>
                <asp:ListItem Text="Mexico" Value="Mexico"></asp:ListItem>      
            </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="country" CssClass="text-danger">*</asp:RequiredFieldValidator>
            <br>
        <label>Contact me by:</label>     
          <asp:RadioButtonList runat="server" ID="prefferedContact" TextAlign="Left">
                <asp:ListItem Text="text" Value="0"></asp:ListItem>
                <asp:ListItem Text="email" Value="1"></asp:ListItem>
                <asp:ListItem Text="phone" Value="2"></asp:ListItem>
                <asp:ListItem Text="none" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="prefferedContact" CssClass="text-danger">*</asp:RequiredFieldValidator>
        <br>
        <label>Terms of Service:</label>
            <asp:CheckBox ID="terms" runat="server"/>
            <br>
        <label for="comment">Comments:</label>
        <asp:TextBox id="comment" runat="server" TextMode="MultiLine"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="comment" CssClass="text-danger">*</asp:RequiredFieldValidator>
          <br>          
        <asp:Button id="submitButton" Text="Register" runat="server" OnClick="submitButton_Click"/>
          <asp:Button id="resetButton" Text="Reset" runat="server" OnClick="resetButton_Click" CausesValidation="false"/>
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

    <h2 id="registration_header">&nbsp;</h2>
    <table id="registration_info"></table>
          </form>
</main>
      </body>
</html>
