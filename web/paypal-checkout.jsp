<%-- 
    Document   : paypal-checkout.jsp
    Created on : 29 Oct 2023, 01:24:31
    Author     : I586662
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Oct 28 2023 18:31:07 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="653d5357bdd0b1ea6ca43755" data-wf-site="653d5357bdd0b1ea6ca43697">
<head>
  <meta charset="utf-8">
  <base target="_parent">
  <title>ToyStore — Webflow Ecommerce HTML website template</title>
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
          <a href="home.jsp" class="brand w-nav-brand">
            <div>ToyStore</div>
          </a>
          <div class="navigation">
            <nav role="navigation" class="nav-menu w-nav-menu">
              <a href="catalog.jsp" class="nav-link w-nav-link">Catalog</a>
              <a href="delivery.jsp" class="nav-link w-nav-link">Delivery</a>
              <a href="about.jsp" class="nav-link w-nav-link">About</a>
              <a href="contact.jsp" class="nav-link w-nav-link">Contacts</a>
              <a href="Login.jsp" class="nav-link w-nav-link">login</a>
              <a href="SignUp.jsp" class="nav-link w-nav-link">Sign Up</a>
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
          <a href="home.jsp" class="link-grey">Home</a><img src="images/arrow-right-mini-icon.svg" alt="" class="breadcrumbs-arrow">
          <div>Checkout</div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="wrapper">
        <div data-node-type="commerce-paypal-checkout-form-container" data-wf-checkout-query="" data-wf-page-link-href-prefix="" class="w-commerce-commercepaypalcheckoutformcontainer checkout-form">
          <div class="w-commerce-commercelayoutmain order-main-column">
            <form data-node-type="commerce-checkout-shipping-methods-wrapper" class="w-commerce-commercecheckoutshippingmethodswrapper order-block">
              <div class="w-commerce-commercecheckoutblockheader order-block-header">
                <h4 class="no-margin">Shipping Method</h4>
              </div>
              <fieldset>
                <script type="text/x-wf-template" id="wf-template-5dbd9db9c2ce7860a55450a6000000000012">%3Clabel%20class%3D%22w-commerce-commercecheckoutshippingmethoditem%20shipping-method-item%22%3E%3Cinput%20type%3D%22radio%22%20required%3D%22%22%20class%3D%22shipping-method-radio-button%22%20name%3D%22shipping-method-choice%22%2F%3E%3Cdiv%20class%3D%22w-commerce-commercecheckoutshippingmethoddescriptionblock%22%3E%3Cdiv%20class%3D%22w-commerce-commerceboldtextblock%22%3E%3C%2Fdiv%3E%3Cdiv%3E%3C%2Fdiv%3E%3C%2Fdiv%3E%3Cdiv%3E%3C%2Fdiv%3E%3C%2Flabel%3E</script>
                <div data-node-type="commerce-checkout-shipping-methods-list" class="w-commerce-commercecheckoutshippingmethodslist shipping-methods-list" data-wf-collection="database.commerceOrder.availableShippingMethods" data-wf-template-id="wf-template-5dbd9db9c2ce7860a55450a6000000000012"><label class="w-commerce-commercecheckoutshippingmethoditem shipping-method-item"><input type="radio" required="" class="shipping-method-radio-button" name="shipping-method-choice">
                    <div class="w-commerce-commercecheckoutshippingmethoddescriptionblock">
                      <div class="w-commerce-commerceboldtextblock"></div>
                      <div></div>
                    </div>
                    <div></div>
                  </label></div>
                <div data-node-type="commerce-checkout-shipping-methods-empty-state" style="display:none" class="w-commerce-commercecheckoutshippingmethodsemptystate">
                  <div>No shipping methods are available for the address given.</div>
                </div>
              </fieldset>
            </form>
            <div class="w-commerce-commercecheckoutcustomerinfosummarywrapper order-block">
              <div class="w-commerce-commercecheckoutsummaryblockheader order-block-header">
                <h4 class="no-margin">Customer Information</h4>
              </div>
              <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
                <div class="w-commerce-commercecheckoutrow">
                  <div class="w-commerce-commercecheckoutcolumn">
                    <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Email</label>
                      <div></div>
                    </div>
                  </div>
                  <div class="w-commerce-commercecheckoutcolumn">
                    <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Shipping Address</label>
                      <div></div>
                      <div></div>
                      <div></div>
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
            <div class="w-commerce-commercecheckoutpaymentsummarywrapper order-block">
              <div class="w-commerce-commercecheckoutsummaryblockheader order-block-header">
                <h4 class="no-margin">Payment Info</h4>
              </div>
              <fieldset class="w-commerce-commercecheckoutblockcontent order-block-content">
                <div class="w-commerce-commercecheckoutrow">
                  <div class="w-commerce-commercecheckoutcolumn">
                    <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Payment Info</label>
                      <div class="w-commerce-commercecheckoutsummaryflexboxdiv">
                        <div class="w-commerce-commercecheckoutsummarytextspacingondiv"></div>
                      </div>
                    </div>
                  </div>
                  <div class="w-commerce-commercecheckoutcolumn">
                    <div class="w-commerce-commercecheckoutsummaryitem"><label class="w-commerce-commercecheckoutsummarylabel">Billing Address</label>
                      <div></div>
                      <div></div>
                      <div></div>
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
          </div>
          <div class="w-commerce-commercelayoutsidebar order-sidebar">
            <div class="w-commerce-commercecheckoutorderitemswrapper order-block-side">
              <div class="w-commerce-commercecheckoutsummaryblockheader order-block-side-header">
                <h5 class="no-margin">Items in Order</h5>
              </div>
              <fieldset class="w-commerce-commercecheckoutblockcontent order-block-side-content">
                <script type="text/x-wf-template" id="wf-template-5dbd9db9c2ce7860a55450a6000000000050"></script>
                <div role="list" class="w-commerce-commercecheckoutorderitemslist" data-wf-collection="database.commerceOrder.userItems" data-wf-template-id="wf-template-5dbd9db9c2ce7860a55450a6000000000050"></div>
              </fieldset>
            </div>
            <form data-node-type="commerce-checkout-discount-form" class="w-commerce-commercecheckoutdiscounts order-block-side discount-block"><label for="" class="w-commerce-commercecheckoutdiscountslabel">Discount Code</label><input type="text" data-node-type="commerce-checkout-discount-input" class="w-commerce-commercecheckoutdiscountsinput input small w-input" maxlength="256" name="field" data-name="field" placeholder="" id="field"><button aria-label="Apply Discount" class="w-commerce-commercecheckoutdiscountsbutton button small">Apply</button></form>
            <div class="w-commerce-commercecheckoutordersummarywrapper order-block-side">
              <div class="w-commerce-commercecheckoutsummaryblockheader order-block-side-header">
                <h5 class="no-margin">Order Summary</h5>
              </div>
              <fieldset class="w-commerce-commercecheckoutblockcontent order-block-side-content">
                <div class="w-commerce-commercecheckoutsummarylineitem">
                  <div>Subtotal</div>
                  <div></div>
                </div>
                <script type="text/x-wf-template" id="wf-template-5dbd9db9c2ce7860a55450a600000000006a">%3Cdiv%20class%3D%22w-commerce-commercecheckoutordersummaryextraitemslistitem%22%3E%3Cdiv%3E%3C%2Fdiv%3E%3Cdiv%3E%3C%2Fdiv%3E%3C%2Fdiv%3E</script>
                <div class="w-commerce-commercecheckoutordersummaryextraitemslist" data-wf-collection="database.commerceOrder.extraItems" data-wf-template-id="wf-template-5dbd9db9c2ce7860a55450a600000000006a">
                  <div class="w-commerce-commercecheckoutordersummaryextraitemslistitem">
                    <div></div>
                    <div></div>
                  </div>
                </div>
                <div class="w-commerce-commercecheckoutsummarylineitem">
                  <div>Total</div>
                  <div class="w-commerce-commercecheckoutsummarytotal"></div>
                </div>
              </fieldset>
            </div>
            <a href="#" value="Place Order" data-node-type="commerce-checkout-place-order-button" class="w-commerce-commercecheckoutplaceorderbutton button" data-loading-text="Placing Order...">Place Order</a>
            <div data-node-type="commerce-checkout-error-state" style="display:none" class="w-commerce-commercepaypalcheckouterrorstate">
              <div aria-live="polite" class="w-checkout-error-msg" data-w-info-error="There was an error processing your customer info. Please try again, or contact us if you continue to have problems." data-w-shipping-error="Sorry. We can’t ship your order to the address provided." data-w-billing-error="Your payment could not be completed with the payment information provided. Please make sure that your card and billing address information is correct, or try a different payment card, to complete this order. Contact us if you continue to have problems." data-w-minimum-error="The order minimum was not met. Add more items to your cart to continue." data-w-payment-error="There was an error processing your payment. Please try again, or contact us if you continue to have problems." data-w-pricing-error="The prices of one or more items in your cart have changed. Please refresh this page and try again." data-w-extras-error="A merchant setting has changed that impacts your cart. Please refresh and try again." data-w-product-error="One or more of the products in your cart have been removed. Please refresh the page and try again." data-w-invalid-discount-error="This discount is invalid." data-w-expired-discount-error="This discount is no longer available." data-w-usage-reached-discount-error="This discount is no longer available." data-w-requirements-not-met-error="Your order does not meet the requirements for this discount.">There was an error processing your customer info. Please try again, or contact us if you continue to have problems.</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section color no-padding-vertical">
      <div class="wrapper text-white">
        <div class="footer">
          <div class="footer-left">
            <a href="home.jsp" class="footer-brand w-nav-brand">
              <div>ToyStore</div>
            </a>
          </div>
          <div class="footer-nav">
            <a href="home.jsp" class="footer-link">Home</a>
            <a href="catalog.jsp" class="footer-link">Catalog</a>
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
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=653d5357bdd0b1ea6ca43697" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>
