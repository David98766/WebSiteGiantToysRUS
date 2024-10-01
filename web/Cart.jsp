<%-- 
    Document   : Cart
    Created on : 20 Nov 2023, 16:40:19
    Author     : I586662
--%>

<%@page import="java.util.Base64"%>
<%@page import="model.SessionManager"%>
<%@page import="dao.dBActions"%>
<%@page import="model.Session"%>
<%@page import="Utilities.Formatter"%>
<%@page import="model.LineItem"%>
<%@page import="model.user"%>
<%@page import="model.shoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="655b805c532a604095b4806d" data-wf-site="655b805b532a604095b48069">
<head>
  <meta charset="utf-8">
  <title>David&#x27;s Fabulous Site</title>
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-fabulous-site-23657e.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body">

    <% user User = (user)session.getAttribute("UserSession"); %>
    
    <%shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");
    
      SessionManager currentSession = (SessionManager)session.getAttribute("sessionManager");
      currentSession.setLastVisitedPage("Cart");
 
    %>
  <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar w-nav">
    <div class="container-2 w-container">
      <nav role="navigation" class="nav-menu w-nav-menu">
        <a href="ProductHomeServlet?action=HomeShow" class="brand w-nav-brand"><img src="images/Logo6_1.png" loading="lazy" sizes="100vw" srcset="images/Logo6_1.png 500w, images/Logo6_1.png 800w, images/Logo6_1.png 852w" alt="" class="image"></a>
        <a href="ProductHomeServlet?action=CatalogShow" class="nav-link w-nav-link">Catalog</a>
        <a href="delivery.jsp" class="nav-link w-nav-link">Delivery</a>
        <a href="about.jsp" class="nav-link w-nav-link">About</a>
        <a href="contact.jsp" class="nav-link w-nav-link">Contacts</a>
          <% if (User != null){  %>
              
              <a href="#" class="nav-link w-nav-link">Welcome Back <%=User.getfName()%></a>
               <a href="LogoutServlet" class="nav-link w-nav-link">Logout</a>
           
                <% } else if (User == null){ %>
              <a href="Login.jsp" class="nav-link w-nav-link">login</a>
              <a href="SignUp.jsp" class="nav-link w-nav-link">Sign Up</a>
                    <%} %>
        
      </nav>
      <div class="w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
                    
    
  <h2 class="heading">Your Cart</h2>
  <div class="w-layout-blockcontainer container w-container">
    
     <%
                  if (checkBasket != null){
                  for (LineItem item: checkBasket.getCartItems()){
                  
               %>
    <div class="productholder">
      <div class="div-block"><img src="data:image/jpeg;base64,<%=item.get64BaseEncoding()%>" loading="lazy" alt=""></div>
      <div class="div-block-3">
        <div class="div-block-5">
          <div class="text-block"><%=item.getProductName()%></div>
        </div>
        <div class="div-block-4">
          <div>€<%=Formatter.formatDouble(item.getItemTotalPrice())%></div>
        </div>
        <div class="div-block-2">
          <a href="BasketServlet?productNo=<%=item.getProductId()%>" class="link">Remove</a>
        </div>
      </div>
      <div class="div-block-6">
        <h4 class="heading-2"><br><%=item.getProductCategory()%></h4>
      </div>

<form name="UpdatedBasketForm" action="BasketServlet" method="get" data-node-type="commerce-add-to-cart-form" class="w-commerce-updated-add-to-cart-form add-to-cart-update">
    <div class="updated-form-container">
        <div class="updated-input-container">
            <input type="number" pattern="^[0-9]+$" inputmode="numeric" id="quantity-updated" name="Quantity" min="1" class="w-commerce-updated-addtocart-quantity input updated-quantity-input" value="<%=item.getItemQuantity()%>">
        </div>
        <div class="updated-button-container">
            <input type="hidden" name="productUpdate" value="<%=item.getProductId()%>">
            <button type="submit" class="updated-update-button">Update Quantity</button>
        </div>
    </div>
</form>
    </div>
      <% } %>
      <% } %>
      
   
  </div>
      <%
      if (checkBasket == null || checkBasket.cartQuantity() == 0){
      %>
      <div>
    <div class="text-block-2">Subtotal:0.00</div>
  </div>
      <%} else { %>
  <div>
    <div class="text-block-2">Subtotal:€<%=Formatter.formatDouble(checkBasket.cartTotalPrice())%></div>
  </div>
    <%checkBasket.setCartPrice(checkBasket.cartTotalPrice());%>
  <a href="checkout.jsp" class="button w-button">Proceed to Checkout</a>
  <% } %>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655b805b532a604095b48069" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
