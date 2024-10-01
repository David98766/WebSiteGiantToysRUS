<%-- 
    Document   : SignUp.jsp
    Created on : 30 Oct 2023, 15:46:50
    Author     : I586662
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link href="css/LoginStyle.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <title>Hello, world!</title>
</head>
<body>
    <%String passwordNotMatch = (String) request.getAttribute("incorrectPassword");%>
<section class="vh-100 bg-image"
  style="background-image: url('images/backgroundImage.jpg');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>
             <form action="UserStorageServlet" method="post">
    <div style="display: flex; justify-content: center; align-items: center; height: 200px;">
        <img src="images/Logo5.png" alt="Centered Image" style="max-height: 200px; max-width: 100%; object-fit: contain;">
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-outline mb-4">
                <input type="text" id="firstNameInput" name="firstNameInput" class="form-control form-control-lg" />
                <label class="form-label" for="firstNameInput">First Name</label>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-outline mb-4">
                <input type="text" id="lastNameInput" name="lastNameInput" class="form-control form-control-lg" />
                <label class="form-label" for="lastNameInput">Last Name</label>
            </div>
        </div>
    </div>
    <div class="form-outline mb-4">
        <input type="email" id="emailInput" name="emailInput" class="form-control form-control-lg" />
        <label class="form-label" for="emailInput">Email</label>
    </div>
    <div class="form-outline mb-4">
        <input type="tel" id="phoneInput" name="phoneInput" class="form-control form-control-lg" />
        <label class="form-label" for="phoneInput">Phone Number</label>
    </div>
    <div class="form-outline mb-4">
        <input type="password" id="passwordInput" name="passwordInput" class="form-control form-control-lg" />
        <label class="form-label" for="passwordInput">Password</label>
    </div>
                    <%
    if (passwordNotMatch != null){
    %>
  
    <div class="form-outline mb-4">
        <input type="password" id="confirmPasswordInput" name="confirmPasswordInput" class="form-control form-control-lg" />
        <label class="form-label" for="confirmPasswordInput"><%=passwordNotMatch%></label>
    </div>
      <% } else { %>
       <div class="form-outline mb-4">
        <input type="password" id="confirmPasswordInput" name="confirmPasswordInput" class="form-control form-control-lg" />
        <label class="form-label" for="confirmPasswordInput">Confirm Password</label>
    </div>
    <% } %>

    <div class="d-flex justify-content-center mb-5">
        <div class="form-check">
            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" />
            <label class="form-check-label" for="form2Example3g">
                I agree to all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
            </label>
        </div>
    </div>
 
    <div class="d-flex justify-content-center">
        <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
    </div>
    <p class="text-center text-muted mt-5 mb-0">Already have an account? <a href="Login.jsp" class="fw-bold text-body"><u>Login here</u></a></p>
</form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>