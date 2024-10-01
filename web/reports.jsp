<%-- 
    Document   : reports
    Created on : 29 Nov 2023, 12:57:03
    Author     : I586662
--%>

<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="6552a24701c93f42c7dd3252" data-wf-site="655190702950cf2d2f023be7">
<head>
  <meta charset="utf-8">
  <title>Reports</title>
  <meta content="Reports" property="og:title">
  <meta content="Reports" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-groovy-site-5ed305.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body-5">
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
          <a href="reports.jsp" class="link-block-2 w-inline-block">
            <div class="text-block-54">Logout</div>
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
  <div class="w-layout-blockcontainer container-9 w-container">
    <h1 class="heading-7">Welcome Back, <%=User.getfName()%></h1>
    <div class="report-container">
      <div class="report-card-1">
        <div class="sales-card-1">
          <div class="div-block-35">
            <div class="text-block-30"><br> <br>Daily<br>  Sales</div>
            <div class="div-block-34"></div>
          </div>
          <a href="#" class="daily-sales-button w-button">Generate Report</a>
        </div>
        <div class="general-card-1">
          <div class="div-block-38">
            <div class="text-block-34"> <br><br>Top 5<br>  Sellers</div>
            <div class="div-block-41"></div>
          </div>
          <a href="#" class="top-5-sellers w-button">Generate Report</a>
        </div>
        <div class="inventory-card-1">
          <div class="div-block-45">
            <div class="text-block-37"><br><br>Total <br>  Stock</div>
            <div class="div-block-46"></div>
          </div>
          <a href="#" class="inventory-report-1 w-button">Generate Report</a>
        </div>
      </div>
      <div class="report-card-3">
        <div class="sales-card-2">
          <div class="div-block-36">
            <div class="text-block-30"><br> <br> Monthly<br>  Sales<br>‍</div>
            <div class="div-block-34"></div>
          </div>
          <a href="#" class="monthly-sales-button w-button">Generate Report</a>
        </div>
        <div class="general-card-3">
          <div class="div-block-39">
            <div class="text-block-63"><br><br>Bottom 5<br>  Sellers</div>
            <div class="div-block-41"></div>
          </div>
          <a href="#" class="general-report-2 w-button">Generate Report</a>
        </div>
        <div class="inventory-card-2">
          <div class="div-block-44">
            <div class="text-block-38"><br><br>Products<br>Less than 5</div>
            <div class="div-block-47"></div>
          </div>
          <a href="#" class="inventory-report-2 w-button">Generate Report</a>
        </div>
      </div>
      <div class="report-card-3">
        <div class="sales-card-3">
          <div class="div-block-37">
            <div class="text-block-30"><br> <br>Total<br> Orders<br></div>
            <div class="div-block-34"></div>
          </div>
          <a href="#" class="total-orders-button w-button">Generate Report</a>
        </div>
        <div class="general-card-3">
          <div class="div-block-40">
            <div class="text-block-35"><br>Average<br>Transaction<br>Value<br></div>
            <div class="div-block-42"></div>
          </div>
          <a href="#" class="general-report-3 w-button">Generate Report</a>
        </div>
        <div class="inventory-card-3">
          <div class="div-block-43">
            <div class="text-block-64"><br><br>Individual<br>Stock Report</div>
            <div class="div-block-48"></div>
          </div>
          <a href="#" class="inventory-report-3 w-button">Generate Report</a>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655190702950cf2d2f023be7" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
