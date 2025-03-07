<%-- 
    Document   : checkout.jsp
    Created on : 29 Oct 2023, 01:12:11
    Author     : I586662
--%>

<%@page import="model.SessionManager"%>
<%@page import="model.Session"%>
<%@page import="dao.dBActions"%>
<%@page import="Utilities.Formatter"%>
<%@page import="model.user"%>
<%@page import="model.LineItem"%>
<%@page import="model.shoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Oct 28 2023 18:31:07 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="653d5357bdd0b1ea6ca4374d" data-wf-site="653d5357bdd0b1ea6ca43697">
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
     <% String confirmShipping = (String)session.getAttribute("ConfirmShipping");%>
     <% String deliveryType = (String)session.getAttribute("Delivery Type");%>
      <% String confirmPayment = (String)session.getAttribute("ConfirmPayment");%>
    <%shoppingCart checkBasket = (shoppingCart)session.getAttribute("basket");
     
      SessionManager currentSession = (SessionManager)session.getAttribute("sessionManager");
      currentSession.setLastVisitedPage("Checkout");
  
        
    %>
    <%
      if (User == null){
              
              request.setAttribute("ForceLogIn", "Must be Logged in to Confirm Purchase");// this is a custom message we cab show 
    
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");// if fail to find user then reload page and show a message saying why
                rd.forward(request, response);
              
        }
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
          <div>Checkout</div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="wrapper">
        <div data-node-type="commerce-checkout-form-container" data-wf-checkout-query="" data-wf-page-link-href-prefix="" class="w-commerce-commercecheckoutformcontainer checkout-form">
          <div class="w-commerce-commercelayoutmain order-main-column">
            <div class="order-block">
              <div class="pay-buttons">
                <div data-node-type="commerce-cart-quick-checkout-actions" class="payment-method">
                  <a data-node-type="commerce-cart-apple-pay-button" role="button" aria-haspopup="dialog" aria-label="Apple Pay" style="background-image:-webkit-named-image(apple-pay-logo-white);background-size:100% 50%;background-position:50% 50%;background-repeat:no-repeat" class="w-commerce-commercecartapplepaybutton pay-button" tabindex="0">
                    <div></div>
                  </a>
                  <a data-node-type="commerce-cart-quick-checkout-button" role="button" tabindex="0" aria-haspopup="dialog" style="display:none" class="w-commerce-commercecartquickcheckoutbutton pay-button"><svg class="w-commerce-commercequickcheckoutgoogleicon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16" height="16" viewbox="0 0 16 16">
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
                <div style="position:relative" data-wf-paypal-button="{&quot;layout&quot;:&quot;horizontal&quot;,&quot;color&quot;:&quot;blue&quot;,&quot;shape&quot;:&quot;pill&quot;,&quot;label&quot;:&quot;paypal&quot;,&quot;tagline&quot;:false,&quot;note&quot;:false}" class="payment-method">
                  <div style="position:absolute;top:0;left:0;width:100%;height:100%;opacity:0;z-index:999;cursor:auto"></div>
                </div>
              </div>
            </div>
                <%if (confirmShipping == null){%>
                <form id="shippingAddressForm" action="OrderConfirmationServlet" method="post" data-node-type="commerce-checkout-customer-info-wrapper" class="w-commerce-commercecheckoutcustomerinfowrapper order-block">
           <div>
             <div class="w-commerce-commercecheckoutblockheader order-block-header">
               <h4 class="order-block-heading">Customer Info</h4>
               <div>* Required</div>
             </div>
             <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
               <label for="" class="w-commerce-commercecheckoutlabel label">Email *</label>
               <input type="text" class="w-commerce-commercecheckoutemailinput input no-margin-bottom" name="email" required="">
             </fieldset>
           </div>
         </form>
        
            <form id="shippingAddressForm" action="OrderConfirmationServlet" method="post" data-node-type="commerce-checkout-shipping-address-wrapper" class="w-commerce-commercecheckoutshippingaddresswrapper order-block">
              <div>
                <div class="w-commerce-commercecheckoutblockheader order-block-header">
                  <h4 class="order-block-heading">Shipping Address</h4>
                  <div>* Required</div>
                </div>
                <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content"><label for="" class="w-commerce-commercecheckoutlabel label">Full Name *</label><input type="text" class="w-commerce-commercecheckoutshippingfullname input" name="name" required=""><label for="" class="w-commerce-commercecheckoutlabel label">Street Address *</label><input type="text" class="w-commerce-commercecheckoutshippingstreetaddress input" name="address_line1" required=""><input type="text" aria-label="" class="w-commerce-commercecheckoutshippingstreetaddressoptional input" name="address_line2">
                  <div class="w-commerce-commercecheckoutrow form-columns">
                    <div id="targetElement" class="w-commerce-commercecheckoutcolumn"><label for="" class="w-commerce-commercecheckoutlabel label">City *</label><input type="text" class="w-commerce-commercecheckoutshippingcity input" name="address_city" required=""></div>
                    <div class="w-commerce-commercecheckoutcolumn"><label for="" class="w-commerce-commercecheckoutlabel label">State/Province</label><input type="text" class="w-commerce-commercecheckoutshippingstateprovince input" name="address_state"></div>
                    <div class="w-commerce-commercecheckoutcolumn"><label for="" class="w-commerce-commercecheckoutlabel label">Zip/Postal Code *</label><input type="text" data-node-type="commerce-checkout-shipping-zip-field" class="w-commerce-commercecheckoutshippingzippostalcode input" name="address_zip" required=""></div>
                  </div><label for="" class="w-commerce-commercecheckoutlabel label">Country *</label>
                  <div class="select-wrapper no-margin-bottom"><select class="w-commerce-commercecheckoutshippingcountryselector select" name="address_country">
                      <option value="AF">Afghanistan</option>
                      <option value="AX">Aland Islands</option>
                      <option value="AL">Albania</option>
                      <option value="DZ">Algeria</option>
                      <option value="AS">American Samoa</option>
                      <option value="AD">Andorra</option>
                      <option value="AO">Angola</option>
                      <option value="AI">Anguilla</option>
                      <option value="AG">Antigua and Barbuda</option>
                      <option value="AR">Argentina</option>
                      <option value="AM">Armenia</option>
                      <option value="AW">Aruba</option>
                      <option value="AU">Australia</option>
                      <option value="AT">Austria</option>
                      <option value="AZ">Azerbaijan</option>
                      <option value="BS">Bahamas</option>
                      <option value="BH">Bahrain</option>
                      <option value="BD">Bangladesh</option>
                      <option value="BB">Barbados</option>
                      <option value="BY">Belarus</option>
                      <option value="BE">Belgium</option>
                      <option value="BZ">Belize</option>
                      <option value="BJ">Benin</option>
                      <option value="BM">Bermuda</option>
                      <option value="BT">Bhutan</option>
                      <option value="BO">Bolivia</option>
                      <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                      <option value="BA">Bosnia and Herzegovina</option>
                      <option value="BW">Botswana</option>
                      <option value="BR">Brazil</option>
                      <option value="IO">British Indian Ocean Territory</option>
                      <option value="VG">British Virgin Islands</option>
                      <option value="BN">Brunei</option>
                      <option value="BG">Bulgaria</option>
                      <option value="BF">Burkina Faso</option>
                      <option value="BI">Burundi</option>
                      <option value="CV">Cabo Verde</option>
                      <option value="KH">Cambodia</option>
                      <option value="CM">Cameroon</option>
                      <option value="CA">Canada</option>
                      <option value="KY">Cayman Islands</option>
                      <option value="CF">Central African Republic</option>
                      <option value="TD">Chad</option>
                      <option value="CL">Chile</option>
                      <option value="CN">China</option>
                      <option value="CX">Christmas Island</option>
                      <option value="CC">Cocos Islands</option>
                      <option value="CO">Colombia</option>
                      <option value="KM">Comoros</option>
                      <option value="CK">Cook Islands</option>
                      <option value="CR">Costa Rica</option>
                      <option value="HR">Croatia</option>
                      <option value="CU">Cuba</option>
                      <option value="CW">Curacao</option>
                      <option value="CY">Cyprus</option>
                      <option value="CZ">Czechia</option>
                      <option value="CD">Democratic Republic of the Congo</option>
                      <option value="DK">Denmark</option>
                      <option value="DJ">Djibouti</option>
                      <option value="DM">Dominica</option>
                      <option value="DO">Dominican Republic</option>
                      <option value="EC">Ecuador</option>
                      <option value="EG">Egypt</option>
                      <option value="SV">El Salvador</option>
                      <option value="GQ">Equatorial Guinea</option>
                      <option value="ER">Eritrea</option>
                      <option value="EE">Estonia</option>
                      <option value="SZ">Eswatini</option>
                      <option value="ET">Ethiopia</option>
                      <option value="FK">Falkland Islands</option>
                      <option value="FO">Faroe Islands</option>
                      <option value="FJ">Fiji</option>
                      <option value="FI">Finland</option>
                      <option value="FR">France</option>
                      <option value="GF">French Guiana</option>
                      <option value="PF">French Polynesia</option>
                      <option value="TF">French Southern Territories</option>
                      <option value="GA">Gabon</option>
                      <option value="GM">Gambia</option>
                      <option value="GE">Georgia</option>
                      <option value="DE">Germany</option>
                      <option value="GH">Ghana</option>
                      <option value="GI">Gibraltar</option>
                      <option value="GR">Greece</option>
                      <option value="GL">Greenland</option>
                      <option value="GD">Grenada</option>
                      <option value="GP">Guadeloupe</option>
                      <option value="GU">Guam</option>
                      <option value="GT">Guatemala</option>
                      <option value="GG">Guernsey</option>
                      <option value="GN">Guinea</option>
                      <option value="GW">Guinea-Bissau</option>
                      <option value="GY">Guyana</option>
                      <option value="HT">Haiti</option>
                      <option value="HN">Honduras</option>
                      <option value="HK">Hong Kong</option>
                      <option value="HU">Hungary</option>
                      <option value="IS">Iceland</option>
                      <option value="IN">India</option>
                      <option value="ID">Indonesia</option>
                      <option value="IR">Iran</option>
                      <option value="IQ">Iraq</option>
                      <option value="IE">Ireland</option>
                      <option value="IM">Isle of Man</option>
                      <option value="IL">Israel</option>
                      <option value="IT">Italy</option>
                      <option value="CI">Ivory Coast</option>
                      <option value="JM">Jamaica</option>
                      <option value="JP">Japan</option>
                      <option value="JE">Jersey</option>
                      <option value="JO">Jordan</option>
                      <option value="KZ">Kazakhstan</option>
                      <option value="KE">Kenya</option>
                      <option value="KI">Kiribati</option>
                      <option value="XK">Kosovo</option>
                      <option value="KW">Kuwait</option>
                      <option value="KG">Kyrgyzstan</option>
                      <option value="LA">Laos</option>
                      <option value="LV">Latvia</option>
                      <option value="LB">Lebanon</option>
                      <option value="LS">Lesotho</option>
                      <option value="LR">Liberia</option>
                      <option value="LY">Libya</option>
                      <option value="LI">Liechtenstein</option>
                      <option value="LT">Lithuania</option>
                      <option value="LU">Luxembourg</option>
                      <option value="MO">Macao</option>
                      <option value="MG">Madagascar</option>
                      <option value="MW">Malawi</option>
                      <option value="MY">Malaysia</option>
                      <option value="MV">Maldives</option>
                      <option value="ML">Mali</option>
                      <option value="MT">Malta</option>
                      <option value="MH">Marshall Islands</option>
                      <option value="MQ">Martinique</option>
                      <option value="MR">Mauritania</option>
                      <option value="MU">Mauritius</option>
                      <option value="YT">Mayotte</option>
                      <option value="MX">Mexico</option>
                      <option value="FM">Micronesia</option>
                      <option value="MD">Moldova</option>
                      <option value="MC">Monaco</option>
                      <option value="MN">Mongolia</option>
                      <option value="ME">Montenegro</option>
                      <option value="MS">Montserrat</option>
                      <option value="MA">Morocco</option>
                      <option value="MZ">Mozambique</option>
                      <option value="MM">Myanmar</option>
                      <option value="NA">Namibia</option>
                      <option value="NR">Nauru</option>
                      <option value="NP">Nepal</option>
                      <option value="NL">Netherlands</option>
                      <option value="NC">New Caledonia</option>
                      <option value="NZ">New Zealand</option>
                      <option value="NI">Nicaragua</option>
                      <option value="NE">Niger</option>
                      <option value="NG">Nigeria</option>
                      <option value="NU">Niue</option>
                      <option value="NF">Norfolk Island</option>
                      <option value="KP">North Korea</option>
                      <option value="MK">North Macedonia</option>
                      <option value="MP">Northern Mariana Islands</option>
                      <option value="NO">Norway</option>
                      <option value="OM">Oman</option>
                      <option value="PK">Pakistan</option>
                      <option value="PW">Palau</option>
                      <option value="PS">Palestinian Territory</option>
                      <option value="PA">Panama</option>
                      <option value="PG">Papua New Guinea</option>
                      <option value="PY">Paraguay</option>
                      <option value="PE">Peru</option>
                      <option value="PH">Philippines</option>
                      <option value="PN">Pitcairn</option>
                      <option value="PL">Poland</option>
                      <option value="PT">Portugal</option>
                      <option value="PR">Puerto Rico</option>
                      <option value="QA">Qatar</option>
                      <option value="CG">Republic of the Congo</option>
                      <option value="RE">Reunion</option>
                      <option value="RO">Romania</option>
                      <option value="RU">Russia</option>
                      <option value="RW">Rwanda</option>
                      <option value="BL">Saint Barthelemy</option>
                      <option value="SH">Saint Helena</option>
                      <option value="KN">Saint Kitts and Nevis</option>
                      <option value="LC">Saint Lucia</option>
                      <option value="MF">Saint Martin</option>
                      <option value="PM">Saint Pierre and Miquelon</option>
                      <option value="VC">Saint Vincent and the Grenadines</option>
                      <option value="WS">Samoa</option>
                      <option value="SM">San Marino</option>
                      <option value="ST">Sao Tome and Principe</option>
                      <option value="SA">Saudi Arabia</option>
                      <option value="SN">Senegal</option>
                      <option value="RS">Serbia</option>
                      <option value="SC">Seychelles</option>
                      <option value="SL">Sierra Leone</option>
                      <option value="SG">Singapore</option>
                      <option value="SX">Sint Maarten</option>
                      <option value="SK">Slovakia</option>
                      <option value="SI">Slovenia</option>
                      <option value="SB">Solomon Islands</option>
                      <option value="SO">Somalia</option>
                      <option value="ZA">South Africa</option>
                      <option value="GS">South Georgia and the South Sandwich Islands</option>
                      <option value="KR">South Korea</option>
                      <option value="SS">South Sudan</option>
                      <option value="ES">Spain</option>
                      <option value="LK">Sri Lanka</option>
                      <option value="SD">Sudan</option>
                      <option value="SR">Suriname</option>
                      <option value="SJ">Svalbard and Jan Mayen</option>
                      <option value="SE">Sweden</option>
                      <option value="CH">Switzerland</option>
                      <option value="SY">Syria</option>
                      <option value="TW">Taiwan</option>
                      <option value="TJ">Tajikistan</option>
                      <option value="TZ">Tanzania</option>
                      <option value="TH">Thailand</option>
                      <option value="TL">Timor Leste</option>
                      <option value="TG">Togo</option>
                      <option value="TK">Tokelau</option>
                      <option value="TO">Tonga</option>
                      <option value="TT">Trinidad and Tobago</option>
                      <option value="TN">Tunisia</option>
                      <option value="TR">Turkey</option>
                      <option value="TM">Turkmenistan</option>
                      <option value="TC">Turks and Caicos Islands</option>
                      <option value="TV">Tuvalu</option>
                      <option value="VI">U.S. Virgin Islands</option>
                      <option value="UG">Uganda</option>
                      <option value="UA">Ukraine</option>
                      <option value="AE">United Arab Emirates</option>
                      <option value="GB">United Kingdom</option>
                      <option value="US">United States</option>
                      <option value="UM">United States Minor Outlying Islands</option>
                      <option value="UY">Uruguay</option>
                      <option value="UZ">Uzbekistan</option>
                      <option value="VU">Vanuatu</option>
                      <option value="VA">Vatican</option>
                      <option value="VE">Venezuela</option>
                      <option value="VN">Vietnam</option>
                      <option value="WF">Wallis and Futuna</option>
                      <option value="EH">Western Sahara</option>
                      <option value="YE">Yemen</option>
                      <option value="ZM">Zambia</option>
                      <option value="ZW">Zimbabwe</option>
                    </select></div>
                </fieldset>
              </div>
                <button type="submit" class="w-commerce-commercecheckoutplaceorderbutton button"> Submit</button>
            </form>
       
            <% } %>
                 <%
             if (confirmShipping != null && deliveryType == null){
             %>
          <form id="methodChecker" action="OrderConfirmationServlet" method="post" class="w-commerce-commercecheckoutshippingmethodswrapper order-block">
    <div>
        <div class="w-commerce-commercecheckoutblockheader order-block-header">
            <h4 class="order-block-heading">Shipping Method</h4>
        </div>
        <fieldset>
            <div class="w-commerce-commercecheckoutshippingmethodslist shipping-methods-list">
                <label class="w-commerce-commercecheckoutshippingmethoditem shipping-method-item">
                    <input type="radio" required class="shipping-method-radio-button" name="selected-shipping-method" value="standard">
                    <div class="w-commerce-commercecheckoutshippingmethoddescriptionblock">
                        <div class="w-commerce-commerceboldtextblock">Standard Delivery</div>
                        <div class="text-grey">will add a cost of €3.00 (€<%=Formatter.formatDouble(checkBasket.cartTotalPrice() + 3) %>)</div>
                    </div>
                </label>
            </div>

            <div class="w-commerce-commercecheckoutshippingmethodslist shipping-methods-list">
                <label class="w-commerce-commercecheckoutshippingmethoditem shipping-method-item">
                    <input type="radio" required class="shipping-method-radio-button" name="selected-shipping-method" value="turbo">
                    <div class="w-commerce-commercecheckoutshippingmethoddescriptionblock">
                        <div class="w-commerce-commerceboldtextblock">Turbo Delivery</div>
                        <div class="text-grey">will add a cost of €10.00 (€<%=Formatter.formatDouble(checkBasket.cartTotalPrice() + 10) %>)</div>
                    </div>
                </label>
            </div>

            <div class="w-commerce-commercecheckoutshippingmethodslist shipping-methods-list">
                <label class="w-commerce-commercecheckoutshippingmethoditem shipping-method-item">
                    <input type="radio" required class="shipping-method-radio-button" name="selected-shipping-method" value="lightning">
                    <div class="w-commerce-commercecheckoutshippingmethoddescriptionblock">
                        <div class="w-commerce-commerceboldtextblock">Lightning Delivery</div>
                        <div class="text-grey">will add a cost of €15.00 (€<%=Formatter.formatDouble(checkBasket.cartTotalPrice() + 15) %>)</div>
                    </div>
                </label>
            </div>

            <div class="w-commerce-commercecheckoutshippingmethods-empty-state" style="display:none">
                <div>No shipping methods are available for the address given.</div>
            </div>
        </fieldset>
    </div>
    <button type="submit" class="w-commerce-commercecheckoutplaceorderbutton button">Submit</button>
</form>
          <%}%>
        
    <div class="w-commerce-commercecheckoutpaymentinfowrapper order-block">
    <div>
    <div style="display: none;" class="w-commerce-commercecheckoutblockheader order-block-header">
    <h4  class="order-block-heading">Payment Info</h4>
    <div>* Required</div>
    </div>
        
    <%if (confirmShipping != null && deliveryType != null && confirmPayment == null){%>
   <div class="w-commerce-commercecheckoutblockheader order-block-header">
   <h4 id="paymentInfoForm"  class="order-block-heading">Payment Info</h4>
   <div>* Required</div>
      </div>
 <form  action="OrderConfirmationServlet" method="post" data-node-type="commerce-checkout-payment-info-wrapper" class="w-commerce-commercecheckoutpaymentinfowrapper order-block">
  <div>

    <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
      <!-- Card Number -->
      <label for="card-number" class="w-commerce-commercecheckoutlabel label">Cardholder Name *</label>
      <input type="text" id="card-number" class="w-commerce-commercecheckoutemailinput input no-margin-bottom" name="cardholder-name" required>

      <!-- Security Code -->
      <label for="security-code" class="w-commerce-commercecheckoutlabel label">Card Number *</label>
      <input type="text" id="security-code" class="w-commerce-commercecheckoutemailinput input no-margin-bottom" name="card-number" required>

      <!-- Cardholder Name -->
      <label for="cardholder-name" class="w-commerce-commercecheckoutlabel label">Security Code *</label>
      <input type="text" id="cardholder-name" class="w-commerce-commercecheckoutemailinput input no-margin-bottom" name="card-security" required>
    </fieldset>
  </div>
     <button type="submit" class="w-commerce-commercecheckoutplaceorderbutton button">Submit</button>
</form>
 <% } %>
              </div>
            </div>
          </div>
          <div class="w-commerce-commercelayoutsidebar order-sidebar">
            <div class="w-commerce-commercecheckoutorderitemswrapper order-block-side">
              <div class="w-commerce-commercecheckoutsummaryblockheader order-block-side-header">
                <h5 class="no-margin">Items in Order</h5>
              </div>
                        <fieldset class="w-commerce-commercecheckoutblockcontent order-block-side-content">
                            
          <div role="list" class="custom-commerce-order-list" data-wf-collection="database.commerceOrder.userItems" data-wf-template-id="wf-template-3acf49e9-83bd-5521-6ac3-9bea26d75bf6">
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
</div>

           </fieldset>

            </div>
            <form data-node-type="commerce-checkout-discount-form" class="w-commerce-commercecheckoutdiscounts order-block-side discount-block"><label for="" class="w-commerce-commercecheckoutdiscountslabel">Discount Code</label><input type="text" data-node-type="commerce-checkout-discount-input" class="w-commerce-commercecheckoutdiscountsinput input small w-input" maxlength="256" name="field" data-name="field" placeholder="" id="field"><button aria-label="Apply Discount" class="w-commerce-commercecheckoutdiscountsbutton button small">Apply</button></form>
            <div class="w-commerce-commercecheckoutordersummarywrapper order-block-side">
              <div class="w-commerce-commercecheckoutsummaryblockheader order-block-side-header">
                <h5 class="no-margin">Order Summary</h5>
              </div>
              <fieldset class="w-commerce-commercecheckoutblockcontent order-block-side-content">
               
                <div class="w-commerce-commercecheckoutsummarylineitem">
                  <div>Subtotal: €<%=Formatter.formatDouble(checkBasket.getCartPrice())%></div>
                  <div></div>
                </div>
                <script type="text/x-wf-template" id="wf-template-3acf49e9-83bd-5521-6ac3-9bea26d75c0a">%3Cdiv%20class%3D%22w-commerce-commercecheckoutordersummaryextraitemslistitem%22%3E%3Cdiv%3E%3C%2Fdiv%3E%3Cdiv%3E%3C%2Fdiv%3E%3C%2Fdiv%3E</script>
                <div class="w-commerce-commercecheckoutordersummaryextraitemslist" data-wf-collection="database.commerceOrder.extraItems" data-wf-template-id="wf-template-3acf49e9-83bd-5521-6ac3-9bea26d75c0a">
                  <div class="w-commerce-commercecheckoutordersummaryextraitemslistitem">
                    <div></div>
                    <div></div>
                  </div>
                </div>
                <div class="w-commerce-commercecheckoutsummarylineitem">
                    <div>Total (Including VAT + additional Charges): €<%=Formatter.formatDouble(checkBasket.cartTotalPriceVAT(0.23) + checkBasket.getCartPrice())%></div>
                  <div class="w-commerce-commercecheckoutsummarytotal"></div>
                </div>
              </fieldset>
            </div>
<%
    if ("ConfirmShippingCompleted".equals(confirmShipping) && "ConfirmPaymentCompleted".equals(confirmPayment)) {
%>
    <form id="placeOrderForm" action="OrderConfirmationServlet" method="post" class="w-commerce-commercecheckoutplaceorderbutton-form">
        <input type="hidden" name="hiddenFieldName" id="hiddenFieldId" value="hiddenFieldValue">
     
        <button type="submit" id="placeOrderButtonFinal" class="w-commerce-commercecheckoutplaceorderbutton button" data-loading-text="Placing Order...">Place Order</button>
    </form>
<%
    } else {
%>
        <form id="placeOrderForm" action="OrderConfirmationServlet" method="post" class="w-commerce-commercecheckoutplaceorderbutton-form">
    <button type="submit" id="placeOrderButton" class="w-commerce-commercecheckoutplaceorderbutton button" data-loading-text="Placing Order..." title="Please fill in Credit Card and Delivery Inforamtion First." aria-disabled="true" disabled>Place Order</button>
        </form>
            <% } %>

            <div data-node-type="commerce-checkout-error-state" style="display:none" class="w-commerce-commercecheckouterrorstate form-error">
              <div aria-live="polite" class="w-checkout-error-msg" data-w-info-error="There was an error processing your customer info. Please try again, or contact us if you continue to have problems." data-w-shipping-error="Sorry. We can’t ship your order to the address provided." data-w-billing-error="Your payment could not be completed with the payment information provided. Please make sure that your card and billing address information is correct, or try a different payment card, to complete this order. Contact us if you continue to have problems." data-w-payment-error="There was an error processing your payment. Please try again, or contact us if you continue to have problems." data-w-pricing-error="The prices of one or more items in your cart have changed. Please refresh this page and try again." data-w-minimum-error="The order minimum was not met. Add more items to your cart to continue." data-w-extras-error="A merchant setting has changed that impacts your cart. Please refresh and try again." data-w-product-error="One or more of the products in your cart have been removed. Please refresh the page and try again." data-w-invalid-discount-error="This discount is invalid." data-w-expired-discount-error="This discount is no longer available." data-w-usage-reached-discount-error="This discount is no longer available." data-w-requirements-not-met-error="Your order does not meet the requirements for this discount.">There was an error processing your customer info. Please try again, or contact us if you continue to have problems.</div>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
  $(document).ready(function () {
    // Listen for changes to the shipping method radio buttons
    $('.shipping-method-radio-button').change(function () {
      // Update the hidden input field only if the selected value is different
      if ($(this).val() !== $('#selected-shipping-method').val()) {
        $('#selected-shipping-method').val($(this).val());
      }
    });
  });
</script>
         <script>
        // Get a reference to the target element
        var targetElement = document.getElementById('shippingAddressForm');
        var targetElement2 = document.getElementById('methodChecker');
        var targetElement3 = document.getElementById('paymentInfoForm');
        var targerElement4 = document.getElementById('placeOrderButtonFinal');

        // Scroll to the target element when the page is loaded
        if (targetElement) {
            targetElement.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        } else if (targetElement2) {
             targetElement2.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        } else if (targetElement3) {
               targetElement3.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        }  else if (targetElement4) {
               targetElement4.scrollIntoView({
                behavior: 'smooth' // Optional: Use smooth scrolling
            });
        }
    </script>

  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=653d5357bdd0b1ea6ca43697" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
