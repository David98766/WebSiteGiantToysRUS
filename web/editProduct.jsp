<%-- 
    Document   : editProduct
    Created on : 29 Nov 2023, 12:56:18
    Author     : I586662
--%>

<%@page import="java.util.Base64"%>
<%@page import="model.user"%>
<%@page import="Utilities.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="655256135b1f8d45b8767e88" data-wf-site="655190702950cf2d2f023be7">
<head>
  <meta charset="utf-8">
  <title>Product View</title>
  <meta content="Product View" property="og:title">
  <meta content="Product View" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-groovy-site-5ed305.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body-3">
       <%
            // Retrieve the product list from the request
            ArrayList<product> Products = (ArrayList) request.getAttribute("productList");
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
      <div>
        <h3 class="heading-5">Manage Products</h3>
      </div>
      <div>
    <a href="dBActionsServlet?CreateProd=ProductCreate" class="button-7 w-button">Add Product</a>
</div>
    </div>

    <div class="div-block-87">
      <div class="div-block-89"></div>
      <div class="text-block-59">Product Details                                        </div>
      <div class="div-block-19"></div>
      <div class="text-block-58">  Inventory         </div>
      <div class="div-block-17"></div>
      <div class="text-block-16">Price</div>
    </div>
    <div class="w-layout-blockcontainer product-container w-container">
      <div class="text-block-61">Total Products: <%=Products.size()%></div>
      <div class="product-contain">
          <div class="products-container" style="max-height: 400px; overflow-y: auto;">
          <%
          for (product storeProduct : Products){
          
              if (!storeProduct.isIsDeleted()){
          %>
        <div>
          <div class="product-card">
            <div class="div-block-11"><img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(storeProduct.getImage())%>" loading="lazy" alt="" class="product-image"></div>
            <div class="div-block-16">
              <div class="product-name"><%=storeProduct.getProductName()%>(<%=storeProduct.getProductCategory()%>)</div>
            </div>
            <div class="div-block-15">
              <div class="amount-of-product">Amount of Product in Stock: <%=storeProduct.getProductInventory()%></div>
            </div>
            <div class="div-block-21">
              <div class="product-price">€<%=Formatter.formatDouble(storeProduct.getProductPrice())%></div>
            </div>
          </div>
          <div class="div-block-90">
            <div class="div-block-13">
              <a href="#" class="update-product w-inline-block"></a>
            </div>
            <div class="div-block-22">
              <a href="dBActionsServlet?updateAction=<%=storeProduct.getProductID()%>" class="update-porduct w-inline-block">
                <div class="text-block-17"> Update Product </div>
              </a>
            </div>
            <div class="div-block-14">
              <a href="#" class="remove-icon-product w-inline-block"></a>
            </div>
                 
            <div class="div-block-23">
              <a href="CRUDServlet?method=<%=storeProduct.getProductID()%>" class="remove-product w-inline-block">
                <div class="text-block-18">Remove Product</div>
              </a>
            </div>
          </div>
        </div>
        <%
            } else if (storeProduct.isIsDeleted()){
        %>
     <div class="product-card">
  <div class="div-block-11">
    <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(storeProduct.getImage())%>" loading="lazy" alt="" class="product-image">
  </div>
  <div class="div-block-16">
    <div class="product-name" style="color: red;">
      <%=storeProduct.getProductName()%> (<%=storeProduct.getProductCategory()%>)
    </div>
  </div>
  <div class="div-block-15">
    <div class="amount-of-product" style="color: red;">Amount of Product in Stock: <%=storeProduct.getProductInventory()%></div>
  </div>
  <div class="div-block-21">
    <div class="product-price" style="color: red;">€<%=Formatter.formatDouble(storeProduct.getProductPrice())%></div>
  </div>
</div>
        <div class="div-block-90">
            <div class="div-block-13">
              <a href="#" class="update-product w-inline-block"></a>
            </div>
            <div class="div-block-22">
              <a href="CRUDServlet?Activate=<%=storeProduct.getProductID()%>" class="update-porduct w-inline-block">
                <div class="text-block-17"> Activate Product </div>
              </a>
            </div>
         
          </div>

            <% } } %>
            
          </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655190702950cf2d2f023be7" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>