<%-- 
    Document   : about.jsp
    Created on : 29 Oct 2023, 01:52:48
    Author     : I586662
--%>
<%@page import="model.SessionManager"%>
<%@page import="dao.dBActions"%>
<%@page import="model.Session"%>
<%@page import="model.shoppingCart"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Oct 28 2023 18:31:07 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="653d5357bdd0b1ea6ca43749" data-wf-site="653d5357bdd0b1ea6ca43697">
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
      currentSession.setLastVisitedPage("About");
    
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
              <a href="delivery.jsp" class="nav-link w-nav-link">Delivery</a>
              <a href="about.jsp" aria-current="page" class="nav-link w-nav-link w--current">About</a>
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
          <div>About</div>
        </div>
      </div>
    </div>
    <div class="section no-padding-bottom">
      <div class="title">All You Need is Fun!</div>
      <div class="wrapper side-paddings">
        <div class="intro no-margin">
          <h1>Introducing Giant Toys R US</h1>
          <p class="text-grey">Hand Crafting Imagination and board games </p>
          <a href="#More-About" class="link">More About Us</a>
        </div><img src="images/about-image.jpg" alt="" srcset="images/about-image-p-500.jpeg 500w, images/about-image-p-1080.jpeg 1080w, images/about-image-p-1600.jpeg 1600w, images/about-image-p-2000.jpeg 2000w, images/about-image.jpg 2340w" sizes="(max-width: 479px) 100vw, (max-width: 767px) 96vw, (max-width: 991px) 97vw, 93vw" class="about-image">
      </div>
    </div>
    <div id="More-About" class="section">
      <div class="wrapper">
        <div class="intro">
          <div class="title">Giant Toys RUs the best friend of imagination</div>
          <h2>Pop into our store in Middleton Cork and bring your Giant Friend to say hello</h2>
        </div>
        <div class="side-blocks mobile-reverse">
          <div class="side-block no-padding-left">
            <div class="side-info">
              <h2>Everything is About the Customer here at Giant Toys R US</h2>
              <div class="divider"></div>
              <p class="text-grey">Here at Giant Toys R Us we pride ourselves on our Giant designs and big hearts if you have any problems or any questions don't hesitate to ask</p>
              <a href="ProductHomeServlet?action=HomeShow" class="button w-button">Have a Question Click Here!</a>
            </div>
          </div>
          <div class="side-block small-padding-side"><img class="side-image" src="images/StuffedAnimal.jpg" alt="" style="opacity:0" sizes="(max-width: 479px) 100vw, (max-width: 767px) 80vw, (max-width: 991px) 81vw, 45vw" data-w-id="1d40fd6b-f79c-854a-e1e8-4d7756194794" srcset="images/StuffedAnimal.jpg 1080w, images/StuffedAnimal.jpg 1140w"></div>
        </div>
      </div>
    </div>
    <div id="More-About" class="section no-padding-top">
      <div class="wrapper">
        <div class="side-blocks">
          <div class="side-block small-padding-side"><img class="side-image" src="images/side-image-02.jpg" alt="" style="opacity:0" sizes="(max-width: 479px) 100vw, (max-width: 767px) 80vw, (max-width: 991px) 81vw, 45vw" data-w-id="a5115579-547a-d2ce-e9f0-b0424df35b66" srcset="images/side-image-02-p-500.jpeg 500w, images/side-image-02-p-1080.jpeg 1080w, images/side-image-02.jpg 1140w"></div>
          <div class="side-block no-padding-right">
            <div class="side-info">
              <h2>How Do we Make our Award Winning Giant Stuffed Animal Products</h2>
              <div class="divider"></div>
              <p class="text-grey">We source all the cotton from groups associated with fair trade we believe "fair pay for fair days work" then our stitchers who carefully craft them.</p>
              <a href="ProductHomeServlet?action=CatalogShow" class="link arrow-link">Explore Our Toys</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section video-section">
      <div class="wrapper">
        <div data-w-id="e90e70b8-09bc-8915-623f-6f05c93c2612" style="opacity:0" class="intro wide no-margin">
          <div class="title white">About The Shop</div>
          <h2 class="heading">Watch Our Story</h2>
          <p>There is no magic formula to write perfect ad copy. It is based on a number of factors, including ad placement, demographic, even the consumer’s mood.</p>
          <a href="#" class="play-button w-inline-block w-lightbox"><img src="images/play-icon-white.svg" alt="">
         <script type="application/json" class="w-json">{
  "items": [
    {
      "url": "https://www.youtube.com/watch?v=gnD282YCtzI",
      "originalUrl": "https://www.youtube.com/watch?v=gnD282YCtzI",
      "width": 940,
      "height": 528,
      "thumbnailUrl": "https://i.ytimg.com/vi/gnD282YCtzI/hqdefault.jpg",
      "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2FgnD282YCtzI%3Ffeature%3Doembed&url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DgnD282YCtzI&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2FgnD282YCtzI%2Fhqdefault.jpg&key=96f1f04c5f4143bcb0f2e68c87d65feb&type=text%2Fhtml&schema=youtube\" width=\"940\" height=\"528\" scrolling=\"no\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen=\"true\"></iframe>",
      "type": "video"
    }
  ],
  "group": ""
}</script>
          </a>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="wrapper side-paddings">
        <div data-w-id="e89551e9-b5ae-51a6-c418-02c90497790c" class="subscribe">
          <div class="subscribe-info">
            <div class="subscribe-icon"><img src="images/paperplane-icon-white.svg" alt=""></div>
            <h4>Subscribe to our newsletter<br>&amp; get <span class="text-green">10% discount!</span></h4>
          </div>
          <div class="subscribe-form-wrapper w-form">
            <form id="wf-form-Subscribe-Form" name="wf-form-Subscribe-Form" data-name="Subscribe Form" method="get" class="subscribe-form" data-wf-page-id="653d5357bdd0b1ea6ca43749" data-wf-element-id="e89551e9-b5ae-51a6-c418-02c904977917"><input type="email" class="input subscribe-input w-input" maxlength="256" name="email-2" data-name="Email 2" placeholder="Enter your email address" id="email-2" required=""><input type="submit" value="Subscribe" data-wait="Please wait..." class="button w-button"></form>
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
            <a href="delivery.jsp" class="footer-link">Delivery</a>
            <a href="about.jsp" aria-current="page" class="footer-link w--current">About</a>
            <a href="contact.jsp" class="footer-link">Contacts</a>
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
