<%-- 
    Document   : home.jsp
    Created on : 29 Oct 2023, 01:50:46
    Author     : I586662
--%>
<%@page import="java.util.Base64"%>
<%@page import="model.SessionManager"%>
<%@page import="model.Session"%>
<%@page import="dao.dBActions"%>
<%@page import="model.FireSale"%>
<%@page import="model.reducedToClearSale"%>
<%@page import="model.NoSale"%>
<%@page import="Utilities.Formatter"%>
<%@page import="model.LineItem"%>
<%@page import="model.shoppingCart"%>
<%@page import="model.boardGame"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product"%>
<%@page import="model.user"%>
<%@page import="model.StuffedAnimal"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html data-wf-page="653d5357bdd0b1ea6ca43746" data-wf-site="653d5357bdd0b1ea6ca43697">
    
 <c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.locale)}">
    <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${loc}" />

<fmt:bundle basename="app">
<head>
  <meta charset="utf-8">
  <title>ToyStore — HTML website template</title>
  <meta content="Welcome to Giant Toys R US" name="description">
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
    <% String sessionId = session.getId();
       
       SessionManager sessionManager = SessionManager.getInstance();
       sessionManager.setSessionId(sessionId);
       sessionManager.setLastVisitedPage("Home");
       
       session.setAttribute("sessionManager", sessionManager);
 
    if (User != null){
    
    if (User.isIsManager()){
    response.sendRedirect("Dashboard.jsp");
        }
        }
        
    %>
    
    <% ArrayList<product> products = (ArrayList<product>)request.getAttribute("productList"); %>
    
    <%shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");%>
  <div class="preloader">
    <div class="loading-icon"><img src="images/preloader.gif" alt="" class="preloader-icon"></div>
  </div>
  <div class="page-wrapper">
    <div data-collapse="medium" data-animation="default" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="nav-bar w-nav">
      <div class="nav-top">
        <div class="wrapper nav-top-wrapper">
            
          <div class="nav-top-info">
            <div class="nav-top-text"><fmt:message key="CallUs"/></div>
            <div class="w-hidden-tiny"><fmt:message key="Email"/> <a href="#" class="link-white"><fmt:message key="EmailWritten"/></a>
                
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
              <a href="ProductHomeServlet?action=CatalogShow" class="nav-link w-nav-link"><fmt:message key="Link1"/></a>
              <a href="delivery.jsp" class="nav-link w-nav-link"><fmt:message key="Link2"/></a>
              <a href="about.jsp" class="nav-link w-nav-link"><fmt:message key="Link3"/></a>
              <a href="contact.jsp" class="nav-link w-nav-link"><fmt:message key="Link4"/></a>
              <% if (User != null){  %>
              
              <a href="#" class="nav-link w-nav-link"><fmt:message key="Name"/> <%=User.getfName()%></a>
               <a href="LogoutServlet" class="nav-link w-nav-link"><fmt:message key="Link6"/></a>
           
                <% } else if (User == null){ %>
              <a href="Login.jsp" class="nav-link w-nav-link"><fmt:message key="Link7"/></a>
              <a href="SignUp.jsp" class="nav-link w-nav-link"><fmt:message key="Link8"/></a>
                    <%} %>
   <fmt:message key="Link1" var="link1Text" />
   <c:if test="${link1Text eq 'Catalogue'}">
                        <c:url value="ProductHomeServlet?action=HomeShow" var="engURL">
   <c:param name="locale" value="en_US"/>
 </c:url>

 <a href="${engURL}">
     <img src="https://media.giphy.com/media/Mh9fsz5AolnDq/giphy.gif" height="50" width="50"/>
 </a>
</c:if>

        
        
 <c:if test="${link1Text eq 'Catalog'}">
<br/>
<br/>
                      <c:url value="ProductHomeServlet?action=HomeShow" var="frenchURL">
     <c:param name="locale" value="fr_FR"/>
  </c:url>
                      <a href="${frenchURL}"> 
       <img src="https://media.giphy.com/media/ErPDvrEYZYNOM/giphy.gif" height="50" width="50"/>
  </a>
                
        </c:if>           
               
            </nav>
            <div class="menu-button w-nav-button">
              <div class="w-icon-nav-menu"></div>
            </div>
            <div data-node-type="commerce-cart-wrapper" data-open-product="" data-wf-cart-type="modal" data-wf-cart-query="" data-wf-page-link-href-prefix="" class="w-commerce-commercecartwrapper">
              <a href="Cart.jsp" data-node-type="commerce-cart-open-link" class="w-commerce-commercecartopenlink cart-button w-inline-block" role="button" aria-haspopup="dialog" aria-label="Open cart">
                <div class="w-inline-block"><fmt:message key="Link9"/></div><img src="images/cart-icon.svg" alt="" class="cart-icon">
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
    <div class="section hero-section">
      <div class="wrapper text-white">
        <div style="-webkit-transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);opacity:0" class="hero-intro">
          <div class="title" ><fmt:message key="newTitle"/></div>
          <h1><fmt:message key="Welcome"/></h1>
          <a href="ProductHomeServlet?action=CatalogShow" class="button w-button">Open Catalog</a>
        </div>
      </div>
      <a href="#Scroll-Section" style="opacity:0;-webkit-transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(0.5, 0.5, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" class="scroll-mouse-link w-inline-block">
        <div class="mouse-icon">
          <div class="mouse-wheel-icon"></div>
        </div>
      </a>
    </div>
    <div id="Scroll-Section" class="section haze">
      <div class="wrapper">
        <div class="home-categories">
          <div data-w-id="79f09a57-05ab-ed81-c059-4d50244b2341" style="opacity:1" class="home-category-card"><img src="images/33903-2-plush-toy-transparent-image-min.png" sizes="(max-width: 479px) 59vw, (max-width: 767px) 176px, (max-width: 991px) 23vw, 220px" srcset="images/33903-2-plush-toy-transparent-image-min-p-500.png 500w, images/33903-2-plush-toy-transparent-image-min.png 1200w" alt="" class="home-category-image-1">
            <div class="home-category-info-1">
              <h3><fmt:message key="CategoryName1"/></h3>
              <a href="CategoryProductServlet?categoryID=Stuffed Animal" class="button small white w-button"><fmt:message key="GeneralButton"/></a>
            </div>
          </div>
          <div data-w-id="b498480a-a03d-afff-8227-912980ab2a0a" style="opacity:1" class="home-category-card red"><img src="images/33727-9-wooden-toy-transparent-image-min.png" sizes="(max-width: 479px) 60vw, (max-width: 767px) 176px, (max-width: 991px) 23vw, 220px" srcset="images/33727-9-wooden-toy-transparent-image-min-p-500.png 500w, images/33727-9-wooden-toy-transparent-image-min.png 1200w" alt="" class="home-category-image-2">
            <div class="home-category-info-2">
              <h3><fmt:message key="CategoryName2"/></h3>
              <a href="CategoryProductServlet?categoryID=Board Game" class="button small white w-button"><fmt:message key="GeneralButton"/></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section haze no-padding-top">
      <div class="wrapper">
        <div class="shop-header">
          <h3 class="no-margin"><fmt:message key="CategoryName1"/></h3>
          <a href="ProductHomeServlet?action=CatalogShow" class="link arrow-link"><fmt:message key="GeneralButton2"/></a>
          <div class="shop-header-line">
            <div class="shop-header-color"></div>
          </div>
        </div>
           <div class="full-width w-dyn-list">
          <div role="list" class="products w-dyn-items">
          
                 
                          <% for (product currentProduct: products){
                          // used instanceof but decorator was causing problems so using string value in prodcut class itself to identify the type
                                 if (currentProduct.getProductCategory().equals("Stuffed Animal") && !currentProduct.isIsDeleted()){
                           
                              
                          %>
                              <div data-w-id="a677a252-157c-7121-064d-fe101c861b40" style="opacity:1" role="listitem" class="product-card-wrapper w-dyn-item">
               <a href="SingleProductServlet?productID=<%=currentProduct.getProductID()%>" class="product-card w-inline-block">
               <div class="product-card-image-wrapper"><img src="data:image/jpeg;base64,<%=currentProduct.getBase64EncodedImage()%>" alt=""></div>
                 <h6 class="product-card-heading"><fmt:message key="<%=String.valueOf(currentProduct.getProductID())%>"/></h6>

                                 <h6 class="product-card-heading"><%=currentProduct.getDiscountDescritption()%></h6>
                                <div class="product-card-price">
                                   
                                   €<%=Formatter.formatDouble(currentProduct.getCost())%>
                               
                                
                                
               </div>
              </a>
            </div>
                <% } %>
                <% } %>
 

         
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
              
                  
                    </div>
    
                </div>
            </div>
        </section>
      </div>
    </div>
    <div class="section haze no-padding-top">
      <div class="wrapper">
        <div class="shop-header">
          <h3 class="no-margin"><fmt:message key="CategoryName2"/></h3>
          <a href="ProductHomeServlet?action=CatalogShow" class="link arrow-link"><fmt:message key="GeneralButton2"/></a>
          <div class="shop-header-line">
            <div class="shop-header-color"></div>
          </div>
        </div>
        <div class="full-width w-dyn-list">
          <div role="list" class="products w-dyn-items">
                     
                          <% for (product currentProduct: products){
                                 if (currentProduct.getProductCategory().equals("Board Game") && !currentProduct.isIsDeleted()){
                            
                          %>
            <div data-w-id="a677a252-157c-7121-064d-fe101c861b40" style="opacity:1" role="listitem" class="product-card-wrapper w-dyn-item">
                <a href="SingleProductServlet?productID=<%=currentProduct.getProductID()%>" class="product-card w-inline-block">
               <div class="product-card-image-wrapper"><img src="data:image/jpeg;base64,<%=currentProduct.getBase64EncodedImage()%>" alt=""></div>

               <h6 class="product-card-heading"><fmt:message key="<%=String.valueOf(currentProduct.getProductID())%>"/></h6>
                 <h6 class="product-card-heading"><%=currentProduct.getDiscountDescritption()%></h6>
                                <div class="product-card-price">
                                   
                                   €<%=Formatter.formatDouble(currentProduct.getCost())%>
                               
                                
                                     </div>
              </a>
            </div>
          <%
              }
              }
          %>
     
          </div>
            
       
        </div>
      </div>
    </div>
    <div class="section video-section">
      <div class="wrapper">
        <div data-w-id="3c65db2d-dfc4-c6e7-82f4-ccf13df0f1d5" style="opacity:0" class="intro wide no-margin">
          <div class="title white"><fmt:message key="TheShop"/></div>
          <h2 class="heading"><fmt:message key="Story"/></h2>
          <p><fmt:message key="Jargon"/></p>
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
    <div id="More-About" class="section">
      <div class="wrapper">
        <div class="intro">
          <div class="title"><fmt:message key="imagination"/></div>
          <h2><fmt:message key="Midleton"/></h2>
        </div>
        <div class="side-blocks mobile-reverse">
          <div class="side-block no-padding-left">
            <div class="side-info">
              <h2><fmt:message key="HandMade"/></h2>
              <div class="divider"></div>
              <p class="text-grey"><fmt:message key="Jargon2"/></p>
              <a href="contact.jsp" aria-current="page" class="button w-button w--current"><fmt:message key="question"/></a>
            </div>
          </div>
          <div class="side-block small-padding-side"><img class="side-image" src="images/StuffedAnimal.jpg" alt="" style="opacity:0" sizes="(max-width: 479px) 91vw, (max-width: 991px) 80vw, 46vw" data-w-id="eaff9f8d-69e6-9e6f-5d07-e920521f8531" srcset="images/StuffedAnimal.jpg, images/StuffedAnimal.jpg 1140w"></div>
        </div>
      </div>
    </div>
    <div class="section no-padding-vertical">
      <div class="wrapper side-paddings">
        <div data-w-id="e89551e9-b5ae-51a6-c418-02c90497790c" class="subscribe">
          <div class="subscribe-info">
            <div class="subscribe-icon"><img src="images/paperplane-icon-white.svg" alt=""></div>
            <h4><fmt:message key="newsLetter"/><br>&amp; get <span class="text-green"><fmt:message key="discount"/></span></h4>
          </div>
          <div class="subscribe-form-wrapper w-form">
            <form id="wf-form-Subscribe-Form" name="wf-form-Subscribe-Form" data-name="Subscribe Form" method="get" class="subscribe-form" data-wf-page-id="653d5357bdd0b1ea6ca43746" data-wf-element-id="e89551e9-b5ae-51a6-c418-02c904977917"><input type="email" class="input subscribe-input w-input" maxlength="256" name="email-2" data-name="Email 2" placeholder="Enter your email address" id="email-2" required=""><input type="submit" value="Subscribe" data-wait="Please wait..." class="button w-button"></form>
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
    <div class="section haze">
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
        <a href="https://instagram.com" target="_blank" class="button w-button"><fmt:message key="Photos"/></a>
      </div>
    </div>
    <div class="section color no-padding-vertical">
      <div class="wrapper text-white">
        <div class="footer">
          <div class="footer-left">
            <a href="ProductHomeServlet?action=HomeShow" aria-current="page" class="footer-brand w-nav-brand w--current">
              <div><fmt:message key="toystore"/></div>
            </a>
          </div>
          <div class="footer-nav">
            <a href="ProductHomeServlet?action=HomeShow" aria-current="page" class="footer-link w--current"><fmt:message key="Link10"/></a>
            <a href="ProductHomeServlet?action=CatalogShow" class="footer-link"><fmt:message key="Link1"/></a>
            <a href="delivery.jsp" class="footer-link"><fmt:message key="Link2"/></a>
            <a href="about.jsp" class="footer-link"><fmt:message key="Link3"/></a>
            <a href="contact.jsp" class="footer-link"><fmt:message key="Link4"/></a>
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
</fmt:bundle>
</html>