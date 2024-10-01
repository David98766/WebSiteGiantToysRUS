<%-- 
    Document   : Action
    Created on : 6 Jan 2024, 18:41:03
    Author     : I586662
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Order"%>
<%@page import="Utilities.Formatter"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.Base64"%>
<%@page import="model.paymentDetails"%>
<%@page import="java.util.ArrayList"%>
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
  <link href="css/davids-groovy-site-5ed305.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/Custom.js"></script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body-3">
       <%
            // Retrieve the product list from the request
            ArrayList<paymentDetails> receiptData = (ArrayList) request.getAttribute("Total Sales");
            ArrayList<product> top5Sellers = (ArrayList) request.getAttribute("Top 5 Sellers");
            ArrayList<Order> ordersStillForDelivery = (ArrayList) request.getAttribute("Order Still for Delivery");
            ProductDAO pdao = new ProductDAO();
            double totalSaleAmount = 0.0;
        %>   
         <% user User = (user)session.getAttribute("UserSession"); %>
  <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar w-nav">
    <div class="container-2 w-container">
      <a href="#" class="brand w-nav-brand"></a>
      <div class="div-block-84"></div>
      <nav role="navigation" class="nav-menu w-nav-menu">
        <div class="div-block-75">
          <div class="div-block-74"></div>
          <a href="Dashboard.jsp" class="nav-link w-nav-link">Home</a>
        </div>
        <div class="div-block-77">
          <div class="div-block-76"></div>
          <a href="UserStorageServlet?action=UserShow" class="nav-link-3 w-nav-link">Manage Users</a>
        </div>
        <div class="div-block-79">
          <div class="div-block-78"></div>
          <a href="ProductHomeServlet?action=EditProduct" class="nav-link-2 w-nav-link">Product View</a>
        </div>
        <div class="div-block-81">
          <div class="div-block-80"></div>
          <a href="CustomerQueryServlet?action=queryShow" class="link-block w-inline-block">
            <div class="text-block-53">Customer Query</div>
          </a>
        </div>
 
         <div class="div-block-83">
          <div class="div-block-82"></div>
          <a href="LogoutServlet" class="link-block-2 w-inline-block">
            <div class="text-block-54">Logout</div>
          </a>
        </div>
      </nav>
      <div class="menu-button w-nav-button">
        <div class="icon w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  <div class="w-layout-blockcontainer container-5 w-container">
    <h1 class="heading-4">Welcome Back, <%=User.getfName()%></h1>
    <div class="w-layout-blockcontainer container-6 w-container">
        <% if (receiptData != null){ %>
      <div>
        <h3 class="heading-5">Manage Products</h3>
      </div>
    
    </div>

    <div class="div-block-87">
      <div class="div-block-89"></div>
      <div class="text-block-59">Product Name                                        </div>
      <div class="div-block-19"></div>
      <div class="text-block-58">  Quantity         </div>
      <div class="div-block-17"></div>
      <div class="text-block-16">Price</div>
    </div>
    <div class="w-layout-blockcontainer product-container w-container">
      <div class="text-block-61">Total Receipts: <%=receiptData.size()%></div>
      <div class="product-contain">
          <div class="products-container" style="max-height: 400px; overflow-y: auto;">
          <%
          for (paymentDetails receipt : receiptData){
          product Product = pdao.getProductByID(receipt.getItemID());
           
           totalSaleAmount += receipt.getItemPrice();
          %>
        <div>
          <div class="product-card">
            <div class="div-block-11"><img src="data:image/jpeg;base64,<%=Product.getBase64EncodedImage()%>" loading="lazy" alt="" class="product-image"></div>
            <div class="div-block-16">
              <div class="product-name"><%=receipt.getItemName()%></div>
            </div>
            <div class="div-block-15">
              <div class="amount-of-product">Quantity: <%=receipt.getItemQuantity()%></div>
            </div>
            <div class="div-block-21">
              <div class="product-price">€<%=Formatter.formatDouble(Product.getCost())%></div>
            </div>
          </div>
          
        </div>
   
            <%  } %>
<div style="text-align: right; margin-left: -40px;">
    <div class="text-block-2">Total Sales: €<%=Formatter.formatDouble(totalSaleAmount)%></div>
</div>

          </div>
      </div>
    </div>
  <% } else if (top5Sellers != null){ %>
   <div>
        <h3 class="heading-5">Top 5 Products</h3>
      </div>
    
    </div>

    <div class="div-block-87">
      <div class="div-block-89"></div>
      <div class="text-block-59">Product Name                                        </div>
      <div class="div-block-19"></div>
      <div class="text-block-58">  Quantity         </div>
      <div class="div-block-17"></div>
      <div class="text-block-16">Price</div>
    </div>
    <div class="w-layout-blockcontainer product-container w-container">
      <div class="text-block-61">Top Sellers: <%=top5Sellers.size()%></div>
      <div class="product-contain">
          <div class="products-container" style="max-height: 400px; overflow-y: auto;">
          <%
          for (product topSeller : top5Sellers){
          
          %>
        <div>
          <div class="product-card">
            <div class="div-block-11"><img src="data:image/jpeg;base64,<%=topSeller.getBase64EncodedImage()%>" loading="lazy" alt="" class="product-image"></div>
            <div class="div-block-16">
              <div class="product-name"><%=topSeller.getProductName()%></div>
            </div>
            <div class="div-block-15">
              <div class="amount-of-product">Amount of Product in Inventory: <%=topSeller.getProductInventory()%></div>
            </div>
            <div class="div-block-21">
              <div class="product-price">€<%=Formatter.formatDouble(topSeller.getCost())%></div>
            </div>
          </div>
          
        </div>
   
            <%  } } %>

  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655190702950cf2d2f023be7" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>

