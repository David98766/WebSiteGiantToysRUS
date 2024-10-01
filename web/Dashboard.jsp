<%-- 
    Document   : Dashboard
    Created on : 29 Nov 2023, 12:54:23
    Author     : I586662
--%>

<%@page import="dao.dBActions"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="655190702950cf2d2f023beb" data-wf-site="655190702950cf2d2f023be7">
<head>
  <meta charset="utf-8">
  <title>David&#x27;s Groovy Site</title>
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-groovy-site-5ed305.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body">
    
    <% user User = (user)session.getAttribute("UserSession");
       dBActions dbaction = new dBActions();
    %>
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
          <a href="CustomerQueryServlet?action=queryShow" method="get"  class="link-block w-inline-block">
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
  <div class="w-layout-blockcontainer container w-container">
    <h1 class="heading">Welcome Back, <%=User.getfName()%></h1>
    <div class="div-block-49">
      <div class="sales-container">
        <div class="div-block-50">
          <div class="text-block-39"><br><br>Total <br>Orders<br>Not Delivered<br></div>
          <div class="div-block-53"></div>
        </div>
   <div class="div-block-56" style="margin-bottom: -5px; display: flex; justify-content: center;">
    <h4>Total Orders: <%= dbaction.getOrdersNotDleivered() %></h4>
</div>


      </div>
      <div class="inventory-container">
        <div class="div-block-51">
          <div class="text-block-41"><br>Top 5<br>Sellers</div>
          <div class="div-block-55"></div>
        </div>
        <div class="div-block-57">
          <a href="dBActionsServlet?top5Seller=5Sellers" class="button-3 w-button">Generate Report</a>
        </div>
      </div>
      <div class="query-holder">
        <div class="div-block-71">
            <div class="text-block-41"><br>Total<br>Sales<br>Report</div>
          <div class="div-block-72"></div>
        </div>
        <div class="div-block-73">
          <a href="dBActionsServlet?TotalSales=Sales" class="button-4 w-button">Generate Report</a>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655190702950cf2d2f023be7" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
