
<%@page import="java.util.Base64"%>
<%@page import="model.SessionManager"%>
<%@page import="model.Session"%>
<%@page import="dao.dBActions"%>
<%@page import="model.FireSale"%>
<%@page import="model.reducedToClearSale"%>
<%@page import="model.NoSale"%>
<%@page import="model.shoppingCart"%>
<%@page import="model.user"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Oct 28 2023 18:31:07 GMT+0000 (Coordinated Universal Time)  -->

<%@page import="Utilities.Formatter"%>
<%@page import="model.product" %>
<%@page import="servlets.ProductHomeServlet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>


<html data-wf-page="653d5357bdd0b1ea6ca4374a" data-wf-site="653d5357bdd0b1ea6ca43697">
    <head>
        <meta charset="utf-8">
        <title>ToyStore ? Webflow Ecommerce HTML website template</title>
        <meta content="ToyStore ? Webflow Ecommerce HTML website template" property="og:title">
        <meta content="ToyStore ? Webflow Ecommerce HTML website template" property="twitter:title">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta content="Webflow" name="generator">
        <link href="css/normalize.css" rel="stylesheet" type="text/css">
        <link href="css/webflow.css" rel="stylesheet" type="text/css">
        <link href="css/davids-top-notch-site-b78824.webflow.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
         <script type="text/javascript" src="js/Custom.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
        <script type="text/javascript">WebFont.load({google: {families: ["Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic", "Varela Round:400"]}});</script>
        <script type="text/javascript">!function (o, c) {
          var n = c.documentElement, t = " w-mod-";
          n.className += t + "js", ("ontouchstart"in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
      }(window, document);</script>
        <link href="images/favicon.png" rel="shortcut icon" type="image/x-icon">
        <link href="images/webclip.png" rel="apple-touch-icon">
    </head>
    
    <body onload="init()">
            <% user User = (user)session.getAttribute("UserSession"); %>
            
        <%
            // Retrieve the product list from the request
            ArrayList<product> Products = (ArrayList) request.getAttribute("productList");
          
            SessionManager currentSession = (SessionManager)session.getAttribute("sessionManager");
            currentSession.setLastVisitedPage("Catalog");
 
            
        %>    
        
        <%shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");%>


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
                                <a href="ProductHomeServlet?action=CatalogShow" aria-current="page" class="nav-link w-nav-link w--current">Catalog</a>
                                <a href="delivery.jsp" class="nav-link w-nav-link">Delivery</a>
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
                        <div>Catalog</div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="wrapper">
                    <div class="shop-header">

                        <div class="shop-header-line">
                            <div class="shop-header-color green w-hidden-small w-hidden-tiny"></div>
                        </div>
                    </div>


                    <div class="shop-categories-wrapper">
                        <h3 id="targetElement" class="no-margin w-hidden-small w-hidden-tiny" style="text-align: left;">All Toys</h3>
                    </div>
                    
                    <div class="w-dyn-list">
                        <div role="list" class="shop-categories w-dyn-items">
                            <div role="listitem" class="w-dyn-item">
                                <a href="ProductHomeServlet?action=CatalogShow" class="shop-category-link"></a>
                            </div>
                        </div>

                    </div>
                    <div class="shop-header-line">
                        <div class="shop-header-color green w-hidden-small w-hidden-tiny"></div>
                    </div>

                </div>
    <form id="autofillform" name="autofillform" action="autocomplete" class="search-2 w-form">
    <td><strong>Search Product:</strong></td>
    <input type="text" size="40" id="complete-field" onkeyup="doCompletion()">
 
</form>

                <div  class="full-width w-dyn-list">
                    <div role="list" class="products w-dyn-items">
                        
                   
             <% for (product currentProduct : Products) {
                   
                            %>
                        <% if (!currentProduct.isIsDeleted()) { %>
                      
                        <div id="Horizontal call" data-w-id="a677a252-157c-7121-064d-fe101c861b40" style="opacity:1" role="listitem" class="product-card-wrapper w-dyn-item">
                            <a id="LinkToProductStore" href="SingleProductServlet?productID=<%=currentProduct.getProductID()%>" class="product-card w-inline-block">
                       
                             <div class="product-card-image-wrapper">
                          <div class="product-card-image-wrapper"><img id="productImageStore" src="data:image/jpeg;base64,<%=currentProduct.getBase64EncodedImage()%>" alt=""></div>
                             </div>
                             

                                <h6 id="ProductNameStore" class="product-card-heading"><%=currentProduct.getProductName()%></h6>
                              
                                 <h6 id="ReductionOfTheProduct" class="product-card-heading"><%=currentProduct.getDiscountDescritption()%></h6>
                                <div id="ProductPriceStore" class="product-card-price">
                                   
                                   €<%=Formatter.formatDouble(currentProduct.getCost())%>
                               
                                
                               </div>
                            </a>
                        </div>
                        <% } }  %>
                       
                   
                         
                    <!-- Debugging information -->
                  

                    </div>

                </div>
            </div>

            <div class="section no-padding-vertical">
                <div class="wrapper side-paddings">
                    <div data-w-id="e89551e9-b5ae-51a6-c418-02c90497790c" class="subscribe">
                        <div class="subscribe-info">
                            <div class="subscribe-icon"><img src="images/paperplane-icon-white.svg" alt=""></div>
                            <h4>Subscribe to our newsletter<br>&amp; get <span class="text-green">10% discount</span></h4>
                        </div>
                        <div class="subscribe-form-wrapper w-form">
                            <form id="wf-form-Subscribe-Form" name="wf-form-Subscribe-Form" data-name="Subscribe Form" method="get" class="subscribe-form" data-wf-page-id="653d5357bdd0b1ea6ca4374a" data-wf-element-id="e89551e9-b5ae-51a6-c418-02c904977917"><input type="email" class="input subscribe-input w-input" maxlength="256" name="email-2" data-name="Email 2" placeholder="Enter your email address" id="email-2" required=""><input type="submit" value="Subscribe" data-wait="Please wait..." class="button w-button"></form>
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
            <div class="section">
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
                            <a href="hoem.jsp" class="footer-brand w-nav-brand">
                                <div>ToyStore</div>
                            </a>
                        </div>
                        <div class="footer-nav">
                            <a href="ProductHomeServlet?action=HomeShow" class="footer-link">Home</a>
                            <a href="ProductHomeServlet?action=CatalogShow" aria-current="page" class="footer-link w--current">Catalog</a>
                            <a href="delivery.jsp" class="footer-link">Delivery</a>
                            <a href="about.jsp" class="footer-link">About</a>
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
                            <script>
        // Get a reference to the target element
        var targetElement = document.getElementById('targetElement');

        // Scroll to the target element when the page is loaded
        if (targetElement) {
            targetElement.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        }
         
        $("textarea").keyup(function(event){
            if(event.keyCode == 13){
                $("#autofillform").submit();
            }
        });
    
    </script>

            <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=653d5357bdd0b1ea6ca43697" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="js/webflow.js" type="text/javascript"></script>
    </body>
</html>
