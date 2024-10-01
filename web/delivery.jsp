<%-- 
    Document   : delivery.jsp
    Created on : 29 Oct 2023, 01:54:41
    Author     : I586662
--%>

<%@page import="model.SessionManager"%>
<%@page import="model.Session"%>
<%@page import="dao.dBActions"%>
<%@page import="model.shoppingCart"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Oct 28 2023 18:31:07 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="653d5357bdd0b1ea6ca4374f" data-wf-site="653d5357bdd0b1ea6ca43697">
<head>
  <meta charset="utf-8">
  <title>ToyStore — Webflow Ecommerce HTML website template</title>
  <meta content="ToyStore — Webflow Ecommerce HTML website template" property="og:title">
  <meta content="ToyStore — Webflow Ecommerce HTML website template" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/davids-top-notch-site-b78824.webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic","Varela Round:400"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body>
    <% user User = (user)session.getAttribute("UserSession"); %>
    
    <%shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");
 
      SessionManager currentSession = (SessionManager)session.getAttribute("sessionManager");
      currentSession.setLastVisitedPage("Delivery");
        
    %>
  <div class="preloader">
    <div class="loading-icon"><img src="images/preloader.gif" alt="" class="preloader-icon"></div>
  </div>
  <div class="page-wrapper">
    <div data-collapse="medium" data-animation="default" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="nav-bar w-nav">
      <div class="nav-top">
        <div class="wrapper nav-top-wrapper">
          <div class="nav-top-info">
            <div class="nav-top-text">Call Us: +1 213 974-5898</div>
            <div class="w-hidden-tiny">Email: <a href="#" class="link-white">toystore@template.com</a>
            </div>
          </div>
          <div class="nav-top-social">
            <a href="https://elasticthemes.com" target="_blank" class="social-link w-inline-block"><img src="images/twitter-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="social-link w-inline-block"><img src="images/facebook-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="social-link w-inline-block"><img src="images/instagram-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="social-link w-inline-block"><img src="images/pinterest-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="social-link w-inline-block"><img src="images/youtube-icon.svg" alt=""></a>
          </div>
        </div>
      </div>
      <div class="nav-main">
        <div class="wrapper nav-bar-wrapper">
          <a href="ProductHomeServlet?action=HomeShow" aria-current="page" class="brand w-nav-brand w--current">
                 <img src="images/Logo5.png" alt="ToyStore Logo" width="150" height="72">
        </a>
          <div class="navigation">
            <nav role="navigation" class="nav-menu w-nav-menu">
              <a href="ProductHomeServlet?action=CatalogShow" class="nav-link w-nav-link">Catalog</a>
              <a href="delivery.jsp" aria-current="page" class="nav-link w-nav-link w--current">Delivery</a>
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
            <div class="menu-button w-nav-button">
              <div class="w-icon-nav-menu"></div>
            </div>
            <div data-node-type="commerce-cart-wrapper" data-open-product="" data-wf-cart-type="modal" data-wf-cart-query="" data-wf-page-link-href-prefix="" class="w-commerce-commercecartwrapper">
                    <a href="Cart.jsp" data-node-type="commerce-cart-open-link" class="w-commerce-commercecartopenlink cart-button w-inline-block" role="button" aria-haspopup="dialog" aria-label="Open cart">
                <div class="w-inline-block">Cart</div><img src="images/cart-icon.svg" alt="" class="cart-icon">
                <%
                   if (checkBasket != null){
                %>
                <div class="w-commerce-commercecartopenlinkcount item-count"><%=checkBasket.cartQuantity()%></div>
                <%
                    } else if (checkBasket == null) {
                %>
                <div class="w-commerce-commercecartopenlinkcount item-count">0</div>
                <% } %>
              </a>
           
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section no-padding-vertical">
      <div class="wrapper side-paddings">
        <div class="breadcrumbs">
          <a href="ProductHomeServlet?action=HomeShow" class="link-grey">Home</a><img src="images/arrow-right-mini-icon.svg" alt="" class="breadcrumbs-arrow">
          <div>Delivery</div>
        </div>
      </div>
    </div>
    <div class="section no-padding-top">
      <div class="wrapper side-paddings">
        <div class="delivery">
          <div class="delivery-info w-richtext">
            <h2>Delivery Info</h2>
            <h3>"Swift and Reliable Delivery"</h3>
            <p> at Your Doorstep" at Giant Toys R US, we understand the excitement of receiving your order. That's why we've made our delivery process as seamless and efficient as possible. When you shop with us, you're not just ordering products; you're inviting a world of convenience and quality into your life. Here's what you can expect from our delivery service:</p>
            <p> 🚚 Lightning-Fast Shipping: We're committed to getting your order to you as quickly as possible. Our dedicated team works tirelessly to ensure your items are on their way to your doorstep in no time.</p>
            <p>🌎 Nationwide Reach: We deliver across the nation, so no matter where you are, we'll find you. From bustling cities to cozy towns, we've got you covered.</p>
            <p>📦 Carefully Packaged: Your items are precious to us. We take extra care to pack them securely, so they arrive in pristine condition.</p>
            <p>Experience the joy of effortless shopping with [Your Company Name]. From the moment you place your order to the instant your package arrives, we're with you every step of the way. Your satisfaction is our top priority.</p>
            <h3>What Do We Promise</h3>
               <ul role="list">
                   <li>If product is more than a week late you get it for free.</li>
              <li>A 1 year warranty on all our products if you are not 100% happy </li>
              <li>We promise to do our best to respond to any questions you have</li>
              <li>Top Quality materials in the making of our products</li>
            </ul>
            
            <h4>Terms and Conditions</h4>
          
            <ul role="list">
              <li>Shipping Options We offer the following shipping options for your convenience:
Standard Shipping: Estimated delivery within 5-7 business days.
Express Shipping: Estimated delivery within 2-3 business days.
International Shipping: Available for select countries; delivery times vary.</li>
              <li>Shipping Costs Shipping costs are calculated based on the shipping option selected, the destination, and the total weight of your order. You can view the shipping cost during the checkout process before confirming your order.</li>
              <li>International Shipping For international orders, please be aware that additional customs fees, taxes, or duties may apply upon arrival in your country. These fees are the responsibility of the recipient.</li>
              <li>Order Changes or Cancellations If you need to make changes to your order or cancel it, please contact our customer support team as soon as possible. We will do our best to accommodate your request.</li>
            </ul>
 
          </div>
          <div class="question">
            <h5 class="question-heading">Can&#x27;t Find the Answer to Your Question?</h5>
            <a href="contact.jsp" class="button small w-button">Contact Us</a>
          </div>
        </div>
      </div>
    </div>
    <div class="section no-padding-top">
      <div class="wrapper side-paddings">
        <div data-w-id="e89551e9-b5ae-51a6-c418-02c90497790c" class="subscribe">
          <div class="subscribe-info">
            <div class="subscribe-icon"><img src="images/paperplane-icon-white.svg" alt=""></div>
            <h4>Subscribe to our newsletter<br>&amp; get <span class="text-green">10% discount!</span></h4>
          </div>
          <div class="subscribe-form-wrapper w-form">
            <form id="wf-form-Subscribe-Form" name="wf-form-Subscribe-Form" data-name="Subscribe Form" method="get" class="subscribe-form" data-wf-page-id="653d5357bdd0b1ea6ca4374f" data-wf-element-id="e89551e9-b5ae-51a6-c418-02c904977917"><input type="email" class="input subscribe-input w-input" maxlength="256" name="email-2" data-name="Email 2" placeholder="Enter your email address" id="email-2" required=""><input type="submit" value="Subscribe" data-wait="Please wait..." class="button w-button"></form>
            <div class="form-success w-form-done">
              <div>Thank you! Your submission has been received!</div>
            </div>
            <div class="form-error w-form-fail">
              <div>Oops! Something went wrong while submitting the form.</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section no-padding-top">
      <div class="wrapper">
        <div class="intro">
          <div class="title">@ElasticThemes</div>
          <h2 class="no-margin-bottom">We&#x27;re on Instagram!</h2>
        </div>
        <div data-w-id="6e1d3527-5090-7380-17f7-30bf0f5a58b4" class="instagram">
          <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block"><img src="images/instagram-01.jpg" alt="" class="full-width"></a>
          <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block"><img src="images/instagram-02.jpg" alt="" class="full-width"></a>
          <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block"><img src="images/instagram-03.jpg" alt="" class="full-width"></a>
          <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block"><img src="images/instagram-04.jpg" alt="" class="full-width"></a>
          <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block"><img src="images/instagram-05.jpg" alt="" class="full-width"></a>
          <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block"><img src="images/instagram-06.jpg" alt="" class="full-width"></a>
        </div>
        <a href="https://instagram.com" target="_blank" class="button w-button">See More Photos</a>
      </div>
    </div>
    <div class="section color no-padding-vertical">
      <div class="wrapper text-white">
        <div class="footer">
          <div class="footer-left">
            <a href="ProductHomeServlet?action=HomeShow" class="footer-brand w-nav-brand">
              <div>ToyStore</div>
            </a>
          </div>
          <div class="footer-nav">
            <a href="ProductHomeServlet?action=HomeShow" class="footer-link">Home</a>
            <a href="ProductHomeServlet?action=CatalogShow" class="footer-link">Catalog</a>
            <a href="delivery.jsp" aria-current="page" class="footer-link w--current">Delivery</a>
            <a href="about.jsp" class="footer-link">About</a>
            <a href="contacts.jsp" class="footer-link">Contacts</a>
          </div>
          <div class="footer-social">
            <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block"><img src="images/twitter-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block"><img src="images/facebook-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block"><img src="images/instagram-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block"><img src="images/pinterest-icon-white.svg" alt=""></a>
            <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block"><img src="images/youtube-icon.svg" alt=""></a>
          </div>
          <div class="footer-bottom">
            <div class="footer-bottom-left">
              <div>Created with love by <a href="https://elasticthemes.com" target="_blank" class="link-white">Elastic Themes</a>
              </div>
            </div>
            <div class="footer-bottom-right">
              <div>Powered by <a href="https://webflow.com/" target="_blank" class="link-white">Webflow</a>
              </div>
              <div class="footer-bottom-divider"></div>
              <a href="template/style-guide.html" class="link-white">Style Guide</a>
              <div class="footer-bottom-divider"></div>
              <a href="template/licensing.html" class="link-white">Licensing</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=653d5357bdd0b1ea6ca43697" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
