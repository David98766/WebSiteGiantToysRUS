<%@page import="Utilities.Formatter"%>
<%@page import="model.Order"%>
<%@page import="model.Payment"%>
<%@page import="model.LineItem"%>
<%@page import="model.shoppingCart"%>
<%@page import="model.user"%>
a<%-- 
    Document   : order-confirmation
    Created on : 29 Oct 2023, 01:22:27
    Author     : I586662
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Oct 28 2023 18:31:07 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="653d5357bdd0b1ea6ca43754" data-wf-site="653d5357bdd0b1ea6ca43697">
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
    <%shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");%>
    <% Payment payment = (Payment)session.getAttribute("payment"); %>
    <% Order confirmOrder = (Order)session.getAttribute("order"); %>
       <%
        session.setAttribute("ConfirmShipping", null);
        session.setAttribute("Delivery Type", null);
        session.setAttribute("ConfirmPayment", null);
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
              <a href="#" data-node-type="commerce-cart-open-link" class="w-commerce-commercecartopenlink cart-button w-inline-block" role="button" aria-haspopup="dialog" aria-label="Open cart">
                <div class="w-inline-block">Cart</div><img src="images/cart-icon.svg" alt="" class="cart-icon">
                <div class="w-commerce-commercecartopenlinkcount item-count">0</div>
              </a>
              <div data-node-type="commerce-cart-container-wrapper" style="display:none" class="w-commerce-commercecartcontainerwrapper w-commerce-commercecartcontainerwrapper--cartType-modal">
                <div data-node-type="commerce-cart-container" role="dialog" class="w-commerce-commercecartcontainer cart-container">
                  <div class="w-commerce-commercecartheader cart-header">
                    <h4 class="w-commerce-commercecartheading">Your Cart</h4>
                    <a href="#" data-node-type="commerce-cart-close-link" class="w-commerce-commercecartcloselink w-inline-block" role="button" aria-label="Close cart"><svg width="16px" height="16px" viewbox="0 0 16 16">
                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                          <g fill-rule="nonzero" fill="#333333">
                            <polygon points="6.23223305 8 0.616116524 13.6161165 2.38388348 15.3838835 8 9.76776695 13.6161165 15.3838835 15.3838835 13.6161165 9.76776695 8 15.3838835 2.38388348 13.6161165 0.616116524 8 6.23223305 2.38388348 0.616116524 0.616116524 2.38388348 6.23223305 8"></polygon>
                          </g>
                        </g>
                      </svg></a>
                  </div>
                  <div class="w-commerce-commercecartformwrapper">
                    <form data-node-type="commerce-cart-form" style="display:none" class="w-commerce-commercecartform">
                      <script type="text/x-wf-template" id="wf-template-9336d8a7-ba52-2880-0c69-78271ccadf80"></script>
                      <div class="w-commerce-commercecartlist cart-list" data-wf-collection="database.commerceOrder.userItems" data-wf-template-id="wf-template-9336d8a7-ba52-2880-0c69-78271ccadf80"></div>
                      <div class="w-commerce-commercecartfooter cart-footer">
                        <div aria-live="" aria-atomic="false" class="w-commerce-commercecartlineitem">
                          <div>Subtotal</div>
                          <div class="w-commerce-commercecartordervalue"></div>
                        </div>
                        <div>
                          <div data-node-type="commerce-cart-quick-checkout-actions">
                            <a role="button" aria-haspopup="dialog" aria-label="Apple Pay" data-node-type="commerce-cart-apple-pay-button" style="background-image:-webkit-named-image(apple-pay-logo-white);background-size:100% 50%;background-position:50% 50%;background-repeat:no-repeat" class="w-commerce-commercecartapplepaybutton cart-pay-button" tabindex="0">
                              <div></div>
                            </a>
                            <a role="button" tabindex="0" aria-haspopup="dialog" data-node-type="commerce-cart-quick-checkout-button" style="display:none" class="w-commerce-commercecartquickcheckoutbutton cart-pay-button"><svg class="w-commerce-commercequickcheckoutgoogleicon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16" height="16" viewbox="0 0 16 16">
                                <defs>
                                  <polygon id="google-mark-a" points="0 .329 3.494 .329 3.494 7.649 0 7.649"></polygon>
                                  <polygon id="google-mark-c" points=".894 0 13.169 0 13.169 6.443 .894 6.443"></polygon>
                                </defs>
                                <g fill="none" fill-rule="evenodd">
                                  <path fill="#4285F4" d="M10.5967,12.0469 L10.5967,14.0649 L13.1167,14.0649 C14.6047,12.6759 15.4577,10.6209 15.4577,8.1779 C15.4577,7.6339 15.4137,7.0889 15.3257,6.5559 L7.8887,6.5559 L7.8887,9.6329 L12.1507,9.6329 C11.9767,10.6119 11.4147,11.4899 10.5967,12.0469"></path>
                                  <path fill="#34A853" d="M7.8887,16 C10.0137,16 11.8107,15.289 13.1147,14.067 C13.1147,14.066 13.1157,14.065 13.1167,14.064 L10.5967,12.047 C10.5877,12.053 10.5807,12.061 10.5727,12.067 C9.8607,12.556 8.9507,12.833 7.8887,12.833 C5.8577,12.833 4.1387,11.457 3.4937,9.605 L0.8747,9.605 L0.8747,11.648 C2.2197,14.319 4.9287,16 7.8887,16"></path>
                                  <g transform="translate(0 4)">
                                    <mask id="google-mark-b" fill="#fff">
                                      <use xlink:href="#google-mark-a"></use>
                                    </mask>
                                    <path fill="#FBBC04" d="M3.4639,5.5337 C3.1369,4.5477 3.1359,3.4727 3.4609,2.4757 L3.4639,2.4777 C3.4679,2.4657 3.4749,2.4547 3.4789,2.4427 L3.4939,0.3287 L0.8939,0.3287 C0.8799,0.3577 0.8599,0.3827 0.8459,0.4117 C-0.2821,2.6667 -0.2821,5.3337 0.8459,7.5887 L0.8459,7.5997 C0.8549,7.6167 0.8659,7.6317 0.8749,7.6487 L3.4939,5.6057 C3.4849,5.5807 3.4729,5.5587 3.4639,5.5337" mask="url(#google-mark-b)"></path>
                                  </g>
                                  <mask id="google-mark-d" fill="#fff">
                                    <use xlink:href="#google-mark-c"></use>
                                  </mask>
                                  <path fill="#EA4335" d="M0.894,4.3291 L3.478,6.4431 C4.113,4.5611 5.843,3.1671 7.889,3.1671 C9.018,3.1451 10.102,3.5781 10.912,4.3671 L13.169,2.0781 C11.733,0.7231 9.85,-0.0219 7.889,0.0001 C4.941,0.0001 2.245,1.6791 0.894,4.3291" mask="url(#google-mark-d)"></path>
                                </g>
                              </svg><svg class="w-commerce-commercequickcheckoutmicrosofticon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewbox="0 0 16 16">
                                <g fill="none" fill-rule="evenodd">
                                  <polygon fill="#F05022" points="7 7 1 7 1 1 7 1"></polygon>
                                  <polygon fill="#7DB902" points="15 7 9 7 9 1 15 1"></polygon>
                                  <polygon fill="#00A4EE" points="7 15 1 15 1 9 7 9"></polygon>
                                  <polygon fill="#FFB700" points="15 15 9 15 9 9 15 9"></polygon>
                                </g>
                              </svg>
                              <div>Pay with browser.</div>
                            </a>
                          </div>
                          <div style="position:relative" data-wf-paypal-button="{&quot;layout&quot;:&quot;horizontal&quot;,&quot;color&quot;:&quot;blue&quot;,&quot;shape&quot;:&quot;pill&quot;,&quot;label&quot;:&quot;paypal&quot;,&quot;tagline&quot;:false,&quot;note&quot;:false}" class="cart-pay-button">
                            <div style="position:absolute;top:0;left:0;width:100%;height:100%;opacity:0;z-index:999;cursor:auto"></div>
                          </div>
                          <a href="checkout.jsp" value="Continue to Checkout" data-node-type="cart-checkout-button" class="w-commerce-commercecartcheckoutbutton button" data-loading-text="Hang Tight...">Continue to Checkout</a>
                        </div>
                      </div>
                    </form>
                    <div class="w-commerce-commercecartemptystate">
                      <div>No items found.</div>
                    </div>
                    <div aria-live="" style="display:none" data-node-type="commerce-cart-error" class="w-commerce-commercecarterrorstate form-error">
                      <div class="w-cart-error-msg" data-w-cart-quantity-error="Product is not available in this quantity." data-w-cart-general-error="Something went wrong when adding this item to the cart." data-w-cart-checkout-error="Checkout is disabled on this site." data-w-cart-cart_order_min-error="The order minimum was not met. Add more items to your cart to continue." data-w-cart-subscription_error-error="Before you purchase, please use your email invite to verify your address so we can send order updates.">Product is not available in this quantity.</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section no-padding-vertical">
      <div class="wrapper side-paddings">
        <div class="breadcrumbs">
          <a href="ProductHomeServlet?action=HomeShow" class="link-grey">Home</a><img src="images/arrow-right-mini-icon.svg" alt="" class="breadcrumbs-arrow">
          <div>Order Confirmation</div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="wrapper">
        <div data-node-type="commerce-order-confirmation-wrapper" data-wf-order-query="" data-wf-page-link-href-prefix="" class="w-commerce-commerceorderconfirmationcontainer order-confirmation-container">
          <div class="w-commerce-commerceorderconfirmation full-width">
            <div class="w-commerce-commerceorderconfirmationheaderwrapper full-width">
              <div class="w-commerce-commercelayoutcontainer order-confirmation w-container">
                <div class="w-commerce-commercelayoutmain order-main-column">
                  <div class="w-commerce-commercecheckoutcustomerinfosummarywrapper order-block">
                    <div class="w-commerce-commercecheckoutsummaryblockheader order-block-header">
                      <h4 id="targetElementConfirmation" class="order-block-heading">Customer Information</h4>
                    </div>
                    <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
                      <div class="w-commerce-commercecheckoutrow">
                        <div class="w-commerce-commercecheckoutcolumn">
                          <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Email</label>
                            <div><%=User.getCEmail()%></div>
                            <div><%=User.getcPhoneNumber()%></div>
                          </div>
                        </div>
                        <div class="w-commerce-commercecheckoutcolumn">
                          <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Shipping Address</label>
                            <div>Delivery Name: <%=User.getfName()%> <%=User.getlName()%></div>
                            <div>Delivery Address: <%=User.getcDeliveryAddress()%></div>
                             <div>Delivery Address: <%=User.getcDeliveryAddress2()%></div>
                             <div>Delivery City: <%=User.getcCity()%></div>
                              <div>Delivery Province: <%=User.getcProvince()%></div>
                               <div>Delivery Zip Code: <%=User.getcZipCode()%></div>
                            <div>Delivery Country <%=User.getcCountry()%></div>
                            <div class="w-commerce-commercecheckoutsummaryflexboxdiv">
                              <div class="w-commerce-commercecheckoutsummarytextspacingondiv"></div>
                              <div class="w-commerce-commercecheckoutsummarytextspacingondiv"></div>
                              <div class="w-commerce-commercecheckoutsummarytextspacingondiv"></div>
                            </div>
                            <div></div>
                          </div>
                        </div>
                      </div>
                    </fieldset>
                  </div>
                  <div class="w-commerce-commercecheckoutshippingsummarywrapper order-block">
                    <div class="w-commerce-commercecheckoutsummaryblockheader order-block-header">
                      <h4 class="order-block-heading">Order Info</h4>
                    </div>
                    <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
                      <div class="w-commerce-commercecheckoutrow">
                        <div class="w-commerce-commercecheckoutcolumn">
                          <div class="w-commerce-commercecheckoutsummaryitem">
                            <div>Order Quantity:<%=payment.getPaymentQuantity()%></div>
                            
                            <%
                            if (confirmOrder.getDeliveryType() == "Standard"){
                            %>
                            <div>Standard Delivery Applied</div>
                            <% } else if (confirmOrder.getDeliveryType() == "Turbo"){ %>
                            <div>Turbo Delivery Applied</div>
                            <% } else if (confirmOrder.getDeliveryType() == "Lightning"){ %>
                            <div>Turbo Delivery Applied</div>
                            <% } %>
                            <div>Order Delivery Date: <%=Formatter.formatAsYearMonthDay(confirmOrder.getOrderDeliveryDate())%></div>
                            <div></div>
                          </div>
                        </div>
                      </div>
                    </fieldset>
                  </div>
                  <div class="w-commerce-commercecheckoutcustomerinfosummarywrapper order-block">
                    <div class="w-commerce-commercecheckoutsummaryblockheader order-block-header">
                      <h4 class="order-block-heading">Payment Information</h4>
                    </div>
                    <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
                      <div class="w-commerce-commercecheckoutrow">
                        <div class="w-commerce-commercecheckoutcolumn">
                          <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Payment Details</label>
                            <div>Payment Number: <%=payment.getPaymentID()%></div>
                            <div>Payment Date: <%=payment.getPaymentDate()%> </div>
                             <div>Payment Total: €<%=Formatter.formatDouble(payment.getPaymentTotal())%></div>
                          </div>
                        </div>
                       
                      </div>
                    </fieldset>
                  </div>
                          <center> <iframe width="560" height="315" src="https://www.youtube.com/embed/D9bwnJclcas?si=HqLys1U9Smo0FuoT&autoplay=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>
                </div>
                <div class="w-commerce-commercelayoutsidebar order-sidebar">
                  <div class="w-commerce-commercecheckoutorderitemswrapper order-block-side">
                    <div class="w-commerce-commercecheckoutsummaryblockheader order-block-side-header">
                      <h5 class="no-margin">Items in Order</h5>
                    </div>
                    <fieldset class="w-commerce-commercecheckoutblockcontent order-block-side-content">
                     
                      <div role="list" class="w-commerce-commercecheckoutorderitemslist" data-wf-collection="database.commerceOrder.userItems" data-wf-template-id="wf-template-625b37c8-6975-63ff-0314-a6d689476c2b"></div>
                        <%
      for (LineItem item: checkBasket.getCartItems()){
   %>
   <div class="custom-product-container">
     <div class="custom-product-image">
       <img src="data:image/jpeg;base64,<%=item.get64BaseEncoding()%>" alt="Product Image">
     </div>
     <div class="custom-product-info">
         <div class="custom-product-name"><%=item.getProductName()%></div>
         <div class="custom-product-name">Qty:<%=item.getItemQuantity()%></div>
       <div class="custom-product-price">€<%=Formatter.formatDouble(item.getItemTotalPrice())%></div>
     </div>
   </div>
   <% } %>
  
                    </fieldset>
                  </div>
                  <div class="w-commerce-commercecheckoutordersummarywrapper order-block-side">
                    <div class="w-commerce-commercecheckoutsummaryblockheader order-block-side-header">
                      <h5 class="no-margin">Order Summary</h5>
                    </div>
                    <fieldset class="w-commerce-commercecheckoutblockcontent order-block-side-content">
                      <div class="w-commerce-commercecheckoutsummarylineitem">
                        <div>Subtotal (Including Delivery Charge): €<%=Formatter.formatDouble(checkBasket.getCartPrice())%></div>
                        <div></div>
                      </div>
                      <script type="text/x-wf-template" id="wf-template-625b37c8-6975-63ff-0314-a6d689476c3f">%3Cdiv%20class%3D%22w-commerce-commercecheckoutordersummaryextraitemslistitem%22%3E%3Cdiv%3E%3C%2Fdiv%3E%3Cdiv%3E%3C%2Fdiv%3E%3C%2Fdiv%3E</script>
                      <div class="w-commerce-commercecheckoutordersummaryextraitemslist" data-wf-collection="database.commerceOrder.extraItems" data-wf-template-id="wf-template-625b37c8-6975-63ff-0314-a6d689476c3f">
                        <div class="w-commerce-commercecheckoutordersummaryextraitemslistitem">
                          <div></div>
                          <div></div>
                        </div>
                      </div>
                      <div class="w-commerce-commercecheckoutsummarylineitem">
                        <div>Total (Including VAT + additional Charges): €<%=Formatter.formatDouble(checkBasket.cartTotalPriceVAT(0.23) + checkBasket.getCartPrice())%></div>
                         <%checkBasket.ClearCart();%>
                        <div class="w-commerce-commercecheckoutsummarytotal"></div>
                      </div>
                    </fieldset>
                  </div>
                  <a href="ProductHomeServlet?action=HomeShow" class="button full-width w-button">Continue Shopping</a>
                </div>
              </div>
            </div>
          </div>
        </div>
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
  </div>
                        <script>
                           var targetElementConfirmation = document.getElementById('targetElementConfirmation');

        // Scroll to the target element when the page is loaded
        if (targetElementConfirmation) {
            targetElementConfirmation.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        }
        </script>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=653d5357bdd0b1ea6ca43697" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
