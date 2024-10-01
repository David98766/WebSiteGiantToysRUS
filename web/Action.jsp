<%-- 
    Document   : Action
    Created on : 6 Jan 2024, 18:41:03
    Author     : I586662
--%>

<%@page import="Utilities.Formatter"%>
<%@page import="model.user"%>
<%@page import="model.CustomerQuery"%>
<%@page import="model.boardGame"%>
<%@page import="model.StuffedAnimal"%>
<%@page import="model.product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="6599a06cc3077f1f752fa84c" data-wf-site="6599a06cc3077f1f752fa843">
<head>
  <meta charset="utf-8">
  <title>David&#x27;s Wondrous Site</title>
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-wondrous-site-85fb8f.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    // Wait for the document to be ready
    $(document).ready(function () {
        // Attach a change event handler to the category select element
        $("#category").change(function () {
            // Get the selected category
            var selectedCategory = $(this).val();

            // Show or hide the additional fields based on the selected category
            if (selectedCategory === "Board Game") { // Adjust the condition based on your category values
                $(".additional-fields1").hide();
                $(".additional-fields").show();
            }
            if (selectedCategory === "Stuffed Animal") {
                $(".additional-fields1").show();
                $(".additional-fields").hide();
            }
        });
    });
</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body>
  <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar w-nav">
    <div class="w-container">
      <nav role="navigation" class="w-nav-menu">
        <a href="Dashboard.jsp" class="nav-link w-nav-link">Dashboard</a>
        <a href="ProductHomeServlet?action=EditProduct" class="nav-link-2 w-nav-link">Back</a>
        <a href="LogoutServlet" class="nav-link-3 w-nav-link">Logout</a>
      </nav>
        <%
        String ProductAction = (String)request.getAttribute("Action");
        StuffedAnimal updateProduct = (StuffedAnimal)request.getAttribute("Stuffed Animal");
        boardGame productUpdate = (boardGame)request.getAttribute("Board Game");
        CustomerQuery viewQuery = (CustomerQuery)request.getAttribute("Query");
        String CreateUser = (String)request.getAttribute("CreateUser");
        user updateUser = (user)request.getAttribute("UpdateUser");
     
        
        if (ProductAction != null && ProductAction.equals("ProductCreate")){
        %>
      <h2 class="heading">Adding a Product</h2>
      <div class="menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  <div class="w-form">
  <form id="product-form" name="product-form" data-name="Product Form" method="post" action="CRUDServlet?action=CreateProduct" enctype="multipart/form-data" data-wf-page-id="6599a06cc3077f1f752fa84c" data-wf-element-id="8934f1e0-0b0c-9e24-abfb-214cab5c680b">

 <label for="category">Category</label>
<select class="w-select" name="category" data-name="Category" id="category" required="">
    <option value="" selected disabled>Select a category</option>
    <option value="Stuffed Animal">Stuffed Animal</option>
    <option value="Board Game">Board Game</option>
</select>

    <label for="productImage">Product Image</label>
    <input type="file" name="file" id="productImage" accept="image/*">
 
    <label for="productName" style="margin-top: 10px;"> Product Name</label>
    <input class="w-input" maxlength="256" name="productName" data-name="ProductName" placeholder="" type="text" id="productName" required="">

    <label for="productDescription">Product Description</label>
    <textarea class="w-input" maxlength="256" name="productDescription" data-name="ProductDescription" placeholder="" id="productDescription" required=""></textarea>

  <label for="productPrice">Product Price</label>
<input class="w-input" name="productPrice" data-name="ProductPrice" placeholder="" type="number" id="productPrice" pattern="[0-9]+([,.][0-9]+)?" step="any" required="">

    <label for="productDimensions">Product Dimensions</label>
    <input class="w-input" name="productDimensions" data-name="ProductDimensions" placeholder="" type="text" id="productDimensions" required="">
     
    <label for="productDimensions">Amount of Product</label>
    <input class="w-input" name="productInventory" data-name="ProductDimensions" placeholder="" type="number" pattern="[0-9]+([,.][0-9]+)?" id="productInventory" required="">

    <!-- Additional fields -->
    <div class="additional-fields" style="display: none;">
        <label for="ageRange">Age Range</label>
        <input class="w-input" name="ageRange" data-name="AgeRange" placeholder="" type="text" id="ageRange">

        <label for="publisher">Publisher</label>
        <input class="w-input" name="publisher" data-name="Publisher" placeholder="" type="text" id="publisher">

        <label for="maxPlayers">Max Players</label>
        <input class="w-input" name="maxPlayers" data-name="MaxPlayers" placeholder="" type="text" id="maxPlayers">
    </div>
        <div class="additional-fields1" style="display: none;">
            
      <label for="containsPlasticRadio">Contains Plastic</label>
<input type="radio" id="containsPlasticRadio" name="containsPlastic" value="true"> Yes
<input type="radio" name="containsPlastic" value="false"> No

<label for="suitableForKidsRadio">Suitable for Kids</label>
<input type="radio" id="suitableForKidsRadio" name="suitability" value="true"> Yes
<input type="radio" name="suitability" value="false"> No

<!-- Add margin-top to create spacing -->
<label for="publisher" style="margin-top: 10px;">Stuffing Material</label>
<input class="w-input" name="StuffingMaterial" data-name="Publisher" placeholder="" type="text" id="publisher">
        </div>
<!-- Add margin-top to the submit button -->
<input type="submit" data-wait="Please wait..." class="submit-button w-button" value="Add Product" style="margin-top: 10px; text-align: center; padding: 10px 20px; display: inline-block; width: auto;">

</form>
      

    <div class="w-form-done">
      <div>Thank you! Your submission has been received!</div>
    </div>
    <div class="w-form-fail">
      <div>Oops! Something went wrong while submitting the form.</div>
    </div>
      <% } else if (updateProduct != null){ 
      
      %>
          <h2 class="heading">Updating <%=updateProduct.getProductName()%></h2>
      <div class="menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  <div class="w-form">
  <form id="product-form" name="product-form" data-name="Product Form" method="post" action="CRUDServlet?action=UpdateProduct" enctype="multipart/form-data" data-wf-page-id="6599a06cc3077f1f752fa84c" data-wf-element-id="8934f1e0-0b0c-9e24-abfb-214cab5c680b">
      
  <input type="hidden" name="ID" value="<%=updateProduct.getProductID()%>">
  <input type="hidden" name="Category" value="Stuffed Animal">

    <label for="productImage">Product Image</label>
    <input type="file" name="file" id="productImage" accept="image/*">
 
    <label for="productName" style="margin-top: 10px;"> Product Name</label>
    <input class="w-input" maxlength="256" name="productName" data-name="ProductName" placeholder="" type="text" id="productName" required="" value="<%=updateProduct.getProductName()%>">

<label for="productDescription">Product Description</label>
<textarea class="w-input" maxlength="256" name="productDescription" data-name="ProductDescription" placeholder="" id="productDescription" required=""><%= updateProduct.getProductDescription() %></textarea>

  <label for="productPrice">Product Price</label>
<input class="w-input" name="productPrice" data-name="ProductPrice" placeholder="" type="number" id="productPrice" pattern="[0-9]+([,.][0-9]+)?" step="any" required="" value="<%=updateProduct.getProductPrice()%>">

    <label for="productDimensions">Product Dimensions</label>
    <input class="w-input" name="productDimensions" data-name="ProductDimensions" placeholder="" type="text" id="productDimensions" required="" value="<%=updateProduct.getProductDimensions()%>">
     
    <label for="productDimensions">Amount of Product</label>
    <input class="w-input" name="productInventory" data-name="ProductDimensions" placeholder="" type="number" pattern="[0-9]+([,.][0-9]+)?" id="productInventory" required="" value="<%=updateProduct.getProductInventory()%>">

    <label for="category">Category</label>
    <select class="w-select" name="Discount" data-name="Category" id="category" required="">
    <option value="No Discount">No Discount</option>
    <option value="Reduced To Clear">Reduced to Clear ((<%=Formatter.formatDouble(updateProduct.getProductPrice() * 0.8)%>))</option>
    <option value="Fire Sale">Fire Sale (<%=Formatter.formatDouble(updateProduct.getProductPrice() * 0.7)%>)</option>
    </select>
    <!-- Additional fields -->
   
            
      <label for="containsPlasticRadio">Contains Plastic</label>
<input type="radio" id="containsPlasticRadio" name="containsPlastic" value="true"> Yes
<input type="radio" name="containsPlastic" value="false"> No

<label for="suitableForKidsRadio">Suitable for Kids</label>
<input type="radio" id="suitableForKidsRadio" name="suitability" value="true"> Yes
<input type="radio" name="suitability" value="false"> No

<!-- Add margin-top to create spacing -->
<label for="publisher" style="margin-top: 10px;">Stuffing Material</label>
<input class="w-input" name="StuffingMaterial" data-name="Publisher" placeholder="" type="text" id="publisher" value="<%=updateProduct.getStuffingMaterail()%>">
        </div>
<!-- Add margin-top to the submit button -->
<input type="submit" data-wait="Please wait..." class="submit-button w-button" value="Update Product" style="margin-top: 10px; text-align: center; padding: 10px 20px; display: inline-block; width: auto;">



</form>
      

    <div class="w-form-done">
      <div>Thank you! Your submission has been received!</div>
    </div>
    <div class="w-form-fail">
      <div>Oops! Something went wrong while submitting the form.</div>
    </div>
  </div>
  <% } else if (productUpdate != null){ 
        
%>
       <h2 class="heading">Updating Product</h2>
      <div class="menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  <div class="w-form">
  <form id="product-form" name="product-form" data-name="Product Form" method="post" action="CRUDServlet?action=UpdateProduct" enctype="multipart/form-data" data-wf-page-id="6599a06cc3077f1f752fa84c" data-wf-element-id="8934f1e0-0b0c-9e24-abfb-214cab5c680b">

  <input type="hidden" name="ID" value="<%=updateProduct.getProductID()%>">
  <input type="hidden" name="Category" value="Board Game">

    <label for="productImage">Product Image</label>
    <input type="file" name="file" id="productImage" accept="image/*">
 
    <label for="productName" style="margin-top: 10px;"> Product Name</label>
    <input class="w-input" maxlength="256" name="productName" data-name="ProductName" placeholder="" type="text" id="productName" required="" value="<%=productUpdate.getProductName()%>">

    <label for="productDescription">Product Description</label>
    <textarea class="w-input" maxlength="256" name="productDescription" data-name="ProductDescription" placeholder="" id="productDescription" required="" value="<%=productUpdate.getProductDescription()%>"></textarea>

  <label for="productPrice">Product Price</label>
<input class="w-input" name="productPrice" data-name="ProductPrice" placeholder="" type="number" id="productPrice" pattern="[0-9]+([,.][0-9]+)?" step="any" required="" value="<%=productUpdate.getProductPrice()%>">

    <label for="productDimensions">Product Dimensions</label>
    <input class="w-input" name="productDimensions" data-name="ProductDimensions" placeholder="" type="text" id="productDimensions" required="" value="<%=productUpdate.getProductDimensions()%>">
     
    <label for="productDimensions">Amount of Product</label>
    <input class="w-input" name="productInventory" data-name="ProductDimensions" placeholder="" type="number" pattern="[0-9]+([,.][0-9]+)?" id="productInventory" required="" value="<%=productUpdate.getProductInventory()%>">

    <label for="category">Category</label>
    <select class="w-select" name="Discount" data-name="Category" id="category" required="">
    <option value="No Discount">No Discount</option>
    <option value="Reduced To Clear">Reduced to Clear</option>
    <option value="Fire Sale">Fire Sale</option>
    </select>
    <!-- Additional fields -->
        <div class="additional-fields1" style="display: none;">
            
      <label for="containsPlasticRadio">Contains Plastic</label>
<input type="radio" id="containsPlasticRadio" name="containsPlastic" value="true"> Yes
<input type="radio" name="containsPlastic" value="false"> No

<label for="suitableForKidsRadio">Suitable for Kids</label>
<input type="radio" id="suitableForKidsRadio" name="suitability" value="true"> Yes
<input type="radio" name="suitability" value="false"> No

<!-- Add margin-top to create spacing -->
<label for="publisher" style="margin-top: 10px;">Stuffing Material</label>
<input class="w-input" name="StuffingMaterial" data-name="Publisher" placeholder="" type="text" id="publisher">
        </div>
<!-- Add margin-top to the submit button -->
<input type="submit" data-wait="Please wait..." class="submit-button w-button" value="Add Product" style="margin-top: 10px; text-align: center; padding: 10px 20px; display: inline-block; width: auto;">



</form>
      

    <div class="w-form-done">
      <div>Thank you! Your submission has been received!</div>
    </div>
    <div class="w-form-fail">
      <div>Oops! Something went wrong while submitting the form.</div>
    </div>
  </div>
        <% } else if (viewQuery != null){ %>
         
        <h2 class="heading">View Query</h2>
      <div class="menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
 
  <label for="GuestName" style="margin-top: 20px;">Full Name</label>
<input class="w-input" maxlength="256" name="GuestName" data-name="ProductName" placeholder="" type="text" id="productName" required="" value="<%=viewQuery.getFullName()%>">

<label for="Email" style="margin-top: 10px;">Customer Email</label>
<input class="w-input" maxlength="256" name="Email" data-name="ProductName" placeholder="" type="text" id="productName" required="" value="<%=viewQuery.getUserEmail()%>">

<label for="Query">Customer Message</label>
<textarea class="w-input" maxlength="256" name="Query" data-name="ProductDescription" placeholder="" id="productDescription" required="">
    <%=viewQuery.getQueryMessage()%>
</textarea>

        <% } else if (CreateUser != null){ %>
        
         <h2 class="heading">Add User</h2>
      <div class="menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  
   <div class="w-form">
  <form id="product-form" name="product-form" data-name="Product Form" method="get" action="CRUDServlet?action=CreateUser" data-wf-page-id="6599a06cc3077f1f752fa84c" data-wf-element-id="8934f1e0-0b0c-9e24-abfb-214cab5c680b">
    
        
        <label for="firstName" style="margin-top: 10px;">First Name</label>
        <input class="w-input" maxlength="256" name="firstName" data-name="FirstName" placeholder="" type="text" id="firstName" required="">

<label for="lastName">Last Name</label>
<input class="w-input" maxlength="256" name="lastName" data-name="LastName" placeholder="" type="text" id="lastName" required="">

<label for="email">Email</label>
<input class="w-input" maxlength="256" name="email" data-name="Email" placeholder="" type="email" id="email" required="" >

<label for="phoneNumber">Phone Number</label>
<input class="w-input" maxlength="256" name="phoneNumber" data-name="PhoneNumber" placeholder="" type="tel" id="phoneNumber" required="" >

<label for="password">Password</label>
<input class="w-input" name="password" data-name="Password" placeholder="" type="password" id="password" required="" >

<label for="isManager">Manager</label>
<div>
    <label><input type="radio" name="isManager" value="yes" required=""> Yes</label>
    <label><input type="radio" name="isManager" value="no" required=""> No</label>
</div>

<input type="submit" data-wait="Please wait..." class="submit-button w-button" value="Add User" style="margin-top: 10px; text-align: center; padding: 10px 20px; display: inline-block; width: auto;">

</form>
        <div class="w-form-done">
      <div>Thank you! Your submission has been received!</div>
    </div>
    <div class="w-form-fail">
      <div>Oops! Something went wrong while submitting the form.</div>
    </div>
  </div>

        <% } else if (updateUser != null) {%>
            <h2 class="heading">Edit User</h2>
      <div class="menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  
   <div class="w-form">
  <form id="user-form" name="User-form" data-name="Product Form" method="get" action="CRUDServlet?action=UpdateUser" data-wf-page-id="6599a06cc3077f1f752fa84c" data-wf-element-id="8934f1e0-0b0c-9e24-abfb-214cab5c680b">
     <input type="hidden" name="ID" value="<%=updateUser.getUserID()%>">
        
<label for="firstName" style="margin-top: 10px;">First Name</label>
<input class="w-input" maxlength="256" name="firstName" data-name="FirstName" placeholder="" type="text" id="firstName" required="" value="<%=updateUser.getfName()%>">

<label for="lastName">Last Name</label>
<input class="w-input" maxlength="256" name="lastName" data-name="LastName" placeholder="" type="text" id="lastName" required="" value="<%=updateUser.getlName()%>">

<label for="email">Email</label>
<input class="w-input" maxlength="256" name="email" data-name="Email" placeholder="" type="email" id="email" required="" value="<%=updateUser.getCEmail()%>">

<label for="phoneNumber">Phone Number</label>
<input class="w-input" maxlength="256" name="phoneNumber" data-name="PhoneNumber" placeholder="" type="tel" id="phoneNumber" required="" value="<%=updateUser.getcPhoneNumber()%>">

<label for="password">Password</label>
<input class="w-input" name="password" data-name="Password" placeholder="" type="password" id="password" required="" value="<%=updateUser.getcPassword()%>">

<label for="isManager">Manager</label>
<div>
    <label><input type="radio" name="isManager" value="yes" required=""> Yes</label>
    <label><input type="radio" name="isManager" value="no" required=""> No</label>
</div>

<input type="submit" data-wait="Please wait..." class="submit-button w-button" value="Add User" style="margin-top: 10px; text-align: center; padding: 10px 20px; display: inline-block; width: auto;">

</form>
        <div class="w-form-done">
      <div>Thank you! Your submission has been received!</div>
    </div>
    <div class="w-form-fail">
      <div>Oops! Something went wrong while submitting the form.</div>
    </div>
  </div>
  <% } %>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6599a06cc3077f1f752fa843" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>

