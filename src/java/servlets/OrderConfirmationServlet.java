/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;
import java.time.LocalDate;
import model.LineItem;
import model.Payment;
import model.paymentDetails;
import model.shoppingCart;
import Utilities.Formatter;
import dao.dBActions;

/**
 *
 * @author I586662
 */
import java.util.Date;
import model.Order;
@WebServlet(name = "OrderConfirmationServlet", urlPatterns = {"/OrderConfirmationServlet"})
public class OrderConfirmationServlet extends HttpServlet {
    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        //used so that place order cant be pressed until details are given
        String param1 = (String)session.getAttribute("ConfirmShipping");
        String param2 = (String)session.getAttribute("ConfirmPayment");

       
        
          
      // check if user logged if not force redirect
        user User = (user) session.getAttribute("UserSession");
        
      
        // now gather all variables needed
             String username = request.getParameter("email");
             String fullName = request.getParameter("name");
             String addressLine1 = request.getParameter("address_line1");
             String addressLine2 = request.getParameter("address_line2");
             String addressCity = request.getParameter("address_city"); 
             String addressState = request.getParameter("address_state");
             String addressZip = request.getParameter("address_zip");
             String selectedCountry = request.getParameter("address_country");
             String cardName = request.getParameter("cardholder-name");
             String cardNumber = request.getParameter("card-number");
             String cardSecurity = request.getParameter("card-security");
             String selectedShippingMethod = request.getParameter("selected-shipping-method");
           
             
        
             // only does it if all details filled in
           if (param1 == "ConfirmShippingCompleted" && param2 == "ConfirmPaymentCompleted") {
                
            shoppingCart basket = (shoppingCart) session.getAttribute("basket");
            LocalDate today = LocalDate.now();
            java.sql.Date sqlDate = java.sql.Date.valueOf(today);
            double VATAmount = basket.cartTotalPriceVAT(0.23);
            double totalPayment = VATAmount + basket.getCartPrice();
         
          
            // create payment instance store transaction
            Payment payment = new Payment(User.getUserID(), basket.cartQuantity(), totalPayment, VATAmount , sqlDate);
            dBActions dbActions = new dBActions();
            dbActions.Create(payment);
            int paymentID = dbActions.getPaymentID(User.getUserID());
          
            
            //create multiple records in database table for amount in cart
            for (LineItem shopItem : basket.getCartItems()){
            paymentDetails payDetail = new paymentDetails();
            payDetail.setUserID(User.getUserID());
            payDetail.setPayment(paymentID);
            payDetail.setItemID(shopItem.getProductId());
            payDetail.setItemName(shopItem.getProductName());
            payDetail.setItemQuantity(shopItem.getItemQuantity());
            payDetail.setItemPrice(shopItem.getItemTotalPrice());
            dbActions.Create(payDetail);
            }
            // checking what delviery it is dont need attribute values because discount can be worked out here
            String deliveryType = "";
            Date deliveryDate = null;
         if (basket.cartTotalPrice() + 3.00 == basket.getCartPrice()) {
            deliveryType = "Standard";
            deliveryDate = Formatter.addDaysToFormattedDate(sqlDate, 7);
        } else if (basket.cartTotalPrice() + 10.00 == basket.getCartPrice()) {
            deliveryType = "Turbo";
            deliveryDate = Formatter.addDaysToFormattedDate(sqlDate, 3);
        } else if (basket.cartTotalPrice() + 15.00 == basket.getCartPrice()) {
            deliveryType = "Lightning";
            deliveryDate = Formatter.addDaysToFormattedDate(sqlDate, 1);
        }else {
            deliveryType = "Poor Delivery";
            deliveryDate = Formatter.addDaysToFormattedDate(sqlDate, 100);
        }
            basket.checkout();
            //create an order instance
            Order confirmedOrder = new Order(paymentID, User.getUserID(), deliveryType, deliveryDate, false);
            dbActions.Create(confirmedOrder);
            
            session.setAttribute("payment", payment);
            session.setAttribute("order", confirmedOrder);
            session.setAttribute("ConfirmShipping", "NotConfirmShippingCompleted");
            session.setAttribute("ConfirmPayment", "NotConfirmPaymentCompleted");
            
            RequestDispatcher rd = request.getRequestDispatcher("order-confirmation.jsp");// if fail to find user then reload page and show a message saying why
            rd.forward(request, response);
        
                
            }
           // to set the delivery details for future so can be displayed on confiramtion page
           else  if(addressLine1 != null){
                 
            User.setcDeliveryAddress(addressLine1);
            User.setcDeliveryAddress2(addressLine2);
            User.setcCity(addressCity);
            User.setcProvince(addressState);
            User.setcZipCode(addressZip);
            User.setcCountry(selectedCountry);
           // shippingCompleted = true;
            
            session.setAttribute("ConfirmShipping", "ConfirmShippingCompleted");
            
            RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");// if fail to find user then reload page and show a message saying why
            rd.forward(request, response);
             }
           
           else if ( selectedShippingMethod!= null){
               
                shoppingCart basket = (shoppingCart) session.getAttribute("basket");
                double subTotal = 0.0;
                double basketPrice = basket.cartTotalPrice();
                
                switch(selectedShippingMethod){
                    
                    case "standard" -> {
                        subTotal = basketPrice + 3;
                        basket.setCartPrice(subTotal);
                        session.setAttribute("Delivery Type", "Standard");
                }
                    case "turbo" -> {
                        subTotal = basketPrice + 10;
                        basket.setCartPrice(subTotal);
                        session.setAttribute("Delivery Type", "Turbo");
                    }
                    
                    case "lightning" -> {
                        subTotal = basketPrice + 15;
                        basket.setCartPrice(subTotal);
                        session.setAttribute("Delivery Type", "Lightning");
                    }
                }
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
              
           }
            //verify the card details are filled in
            else if (cardName != null){
                
                session.setAttribute("ConfirmPayment", "ConfirmPaymentCompleted");
                
                          RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");// if fail to find user then reload page and show a message saying why
            rd.forward(request, response);
            }
            else {
                 RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
            }
           
    
        
    }
}

