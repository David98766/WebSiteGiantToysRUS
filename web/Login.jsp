<%-- 
    Document   : Login
    Created on : 30 Oct 2023, 15:41:54
    Author     : I586662
--%>

<%@page import="model.shoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V18</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<style>
		.form-left {
			display: flex;
			align-items: center;
			justify-content: center;
			background-color: #f7f7f7; /* Change the background color to #f7f7f7 */
			height: 150px;
		}
		.form-left img {
			width: 300px;
			height: 150px;
		}
	</style>
</head>
<body style="background-color: #666666;">
       <%
        
            String errorLogin = (String) request.getAttribute("incorrectLogin");
            String errotNotLoggedIn = (String) request.getAttribute("ForceLogIn");
            shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");
        
        %>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="LoginServlet" method="post" class="login100-form validate-form">
					<span id="loginElement" class="login100-form-title p-b-43">
						Welcome Back To!!
					</span>
                                     
					<div class="form-left">
						<img src="images/Logo6.png" alt="form image">
					</div>
                                    <%
                                      if (errotNotLoggedIn != null && checkBasket != null){
                                      
                                    %>
                                            <p style="margin-right: 10px;"><%= errotNotLoggedIn %></p>
                                             
                                             <% } %>
					<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email">
						<span class="focus-input100"></span>
						<span class="label-input100">Email</span>
                                                
					</div>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pass">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>
                                                                    <% 
                                                  if (errorLogin != null) {
                                              %>
                                              <p><%= errorLogin%></p>
                                              <%
                                                  }
                                              %>
					<div class="flex-sb-m w-full p-t-3 p-b-32">
                                        <div class="contact100-form-checkbox">
                                             <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" value="on">
                                             <label class="label-checkbox100" for="ckb1">
                                                   Remember me
                                            </label>
                                        </div>
						<div>
							<a href="#" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
					<div class="text-center p-t-46 p-b-20">
						<a href="SignUp.jsp">
							<span class="txt2">
								Not a Member? Create an Account
							</span>
						</a>
					</div>
				</form>
				<div class="login100-more" style="background-image: url('images/StuffedAnimal.jpg');">
				</div>
			</div>
		</div>
	</div>
        <script>
             var loginElement = document.getElementById('loginElement');
            
             if (loginElement) {
            loginElement.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        }
        </script>
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main1.js"></script>
</body>
</html>
