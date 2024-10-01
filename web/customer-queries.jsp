<%-- 
    Document   : customer-queries
    Created on : 29 Nov 2023, 12:57:46
    Author     : I586662
--%>

<%@page import="model.user"%>
<%@page import="model.CustomerQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="655284593c3a2fd2dac3ec95" data-wf-site="655190702950cf2d2f023be7">
<head>
  <meta charset="utf-8">
  <title>Customer Queries</title>
  <meta content="Customer Queries" property="og:title">
  <meta content="Customer Queries" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-groovy-site-5ed305.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body-4">
    <%  ArrayList<CustomerQuery> queryList = (ArrayList) request.getAttribute("QueryList"); %>
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

        <div class="div-block-93">
          <div class="div-block-92"></div>
          <a href="LogoutServlet" class="link-block-9 w-inline-block">
            <div class="text-block-65">Logout</div>
          </a>
        </div>
      </nav>
      <div class="menu-button w-nav-button">
        <div class="icon w-icon-nav-menu"></div>
      </div>
    </div>
  </div>
  <div class="w-layout-blockcontainer container-7 w-container">
    <h1 class="heading-6">Welcome Back, <%=User.getfName()%></h1>
    <div class="heading-query">
      <div class="div-block-24"></div>
      <div>
        <div class="text-block-20">Customer Name</div>
      </div>
      <div class="div-block-25"></div>
      <div>
        <div class="text-block-21">Customer Query</div>
      </div>
      <div class="div-block-26"></div>
      <div class="div-block-27">
        <div class="text-block-62">Action</div>
      </div>
    </div>
    <div class="w-layout-blockcontainer container-8 w-container">
      <div class="text-block-19">Total Queries: <%=queryList.size()%></div>
      <%
      for (CustomerQuery query : queryList){
      %>
      <div class="query-card">
        <div class="div-block-29">
          <div class="text-block-24"><%=query.getFullName()%></div>
          <div>
            <div class="text-block-22"><%=query.getUserEmail()%></div>
          </div>
          <a href="#" class="link-block-7 w-inline-block"></a>
          <a href="dBActionsServlet?Retrieve=<%=query.getQueryID()%>" class="link-block-8 w-inline-block">
            <div class="text-block-23">View Query in Full</div>
          </a>
        </div>
      </div>
    </div>
      <% } %>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655190702950cf2d2f023be7" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
