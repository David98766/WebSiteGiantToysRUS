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
import model.shoppingCart;

/**
 *
 * @author I586662
 */
@WebServlet(name = "TurboCostServlet", urlPatterns = {"/TurboCostServlet"})
public class TurboCostServlet extends HttpServlet {
    
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        String selectedShippingMethod = request.getParameter("selected-shipping-method");
        
        if (selectedShippingMethod.equals("standard")){
                shoppingCart basket = (shoppingCart) session.getAttribute("basket");
                double subTotal = 0.0;
                double basketPrice = basket.cartTotalPrice();
                subTotal = basketPrice + 3;
                basket.setCartPrice(subTotal);
                
                request.setAttribute("Standard Delivery", "yes");
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);

        }
        else if (selectedShippingMethod.equals("turbo")){
                shoppingCart basket = (shoppingCart) session.getAttribute("basket");
                double subTotal = 0.0;
                double basketPrice = basket.cartTotalPrice();
                subTotal = basketPrice + 10;
                basket.setCartPrice(subTotal);
                
                request.setAttribute("Turbo Delivery", "yes");
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
            
        }
        else if (selectedShippingMethod.equals("lightning")){
            
                shoppingCart basket = (shoppingCart) session.getAttribute("basket");
                double subTotal = 0.0;
                double basketPrice = basket.cartTotalPrice();
                subTotal = basketPrice + 15;
                basket.setCartPrice(subTotal);
                
                request.setAttribute("Lightning Delivery", "yes");
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
            
        }
        else {
            
            
             RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
        }
       
   
}
}
  
