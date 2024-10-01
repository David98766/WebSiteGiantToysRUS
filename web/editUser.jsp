<%-- 
    Document   : editUser
    Created on : 29 Nov 2023, 12:55:11
    Author     : I586662
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="65524de94f43626c24b847d4" data-wf-site="655190702950cf2d2f023be7">
<head>
  <meta charset="utf-8">
  <title>Edit Users</title>
  <meta content="Edit Users" property="og:title">
  <meta content="Edit Users" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-groovy-site-5ed305.webflow.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body-2">
   <% user User = (user)session.getAttribute("UserSession"); %>
    <%  ArrayList<user> Users = (ArrayList) request.getAttribute("UserList"); %>
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
  <div class="w-layout-blockcontainer container-3 w-container">
    <h1 class="heading-2">Welcome Back, <%=User.getfName()%></h1>
    <div class="div-block-85">
      <div>
        <h3 class="heading-3">Manage Users</h3>
      </div>
      <div>
          <a href="dBActionsServlet?CreateUser=UserToCreate" class="button-6 w-button">Add User</a>
      </div>
    </div>
    <form action="/search" class="search-2 w-form"><label for="search" class="field-label">Search User</label><input type="search" class="w-input" maxlength="256" name="query" placeholder="Search…" id="search" required=""><input type="submit" value="Search" class="search-button w-button"></form>
    <div class="div-block-6">
      <div class="div-block-7"></div>
      <div class="text-block-6">   User                                                                        </div>
      <div class="div-block-8"></div>
      <div class="text-block-7">  User Role           </div>
      <div class="div-block-9"></div>
      <div class="text-block-8">     Actions</div>
    </div>
    <div class="totall-users">Total Users: <%=Users.size()%> </div>
    <div class="w-layout-blockcontainer container-4 w-container">
        <%
        for (user storedUser : Users){
        if (!storedUser.isUserDisable()){
        %>
      <div class="user-card">
        <div class="div-block-86">
          <div class="text-block-55"><%=storedUser.getfName()%> <%=storedUser.getlName()%></div>
        </div>
        <div>
            <%
            if (storedUser.isIsLoggedIN()){
            %>
          <div class="text-block-56">Logged In</div>
          <% } else { %>
          <div class="text-block-56">Logged Out</div>
          <% } %>
        </div>
        <div>
            <%
            if (storedUser.isIsManager()){
            %>
          <div class="text-block-57">Manager</div>
          <% } else { %>
          <div class="text-block-57">User</div>
          <% } %>
        </div>
        <a href="dBActionsServlet?editUser=<%=storedUser.getUserID()%>" class="user-update-icon w-inline-block"></a>
        <div href="dBActionsServlet?editUser=<%=storedUser.getUserID()%>" class="user-update">Update User</div>
        <a href="CRUDServlet?DiableUser=<%=storedUser.getUserID()%>" class="remove-icon w-inline-block"></a>
        <div href="CRUDServlet?DiableUser=<%=storedUser.getUserID()%>" class="remove-user-word">Remove User</div>
      </div>
      <%
          } else if (storedUser.isUserDisable()) {
         
      %>
         <div class="user-card">
        <div class="div-block-86">
          <div class="text-block-55" style="color: red;"><%=storedUser.getfName()%> <%=storedUser.getlName()%></div>
        </div>
        <div>
            <%
            if (storedUser.isIsLoggedIN()){
            %>
          <div class="text-block-56" style="color: green;"> Logged In</div>
          <% } else { %>
          <div class="text-block-56" style="color: red;">Logged Out</div>
          <% } %>
        </div>
        <div>
            <%
            if (storedUser.isIsManager()){
            %>
          <div class="text-block-57" style="color: red;">Manager</div>
          <% } else { %>
          <div class="text-block-57" style="color: red;">User</div>
          <% } %>
        </div>
        <a href="CRUDServlet?userEnable=<%=storedUser.getUserID()%>" class="user-update-icon w-inline-block"></a>
        <div href="CRUDServlet?userEnable=<%=storedUser.getUserID()%>" class="user-update">Enable User</div>
     
      </div>
      <% }} %>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=655190702950cf2d2f023be7" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
