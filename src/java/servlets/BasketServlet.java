/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.ProductDAO;
import dao.dBActions;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FireSale;
import model.LineItem;
import model.NoSale;
import model.SessionManager;

import model.product;
import model.reducedToClearSale;
import model.shoppingCart;

/**
 *
 * @author I586662
 */
@WebServlet(name = "BasketServlet", urlPatterns = {"/BasketServlet"})
public class BasketServlet extends HttpServlet {
  
  
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String actionCreate = request.getParameter("product");
        String actionRemove = request.getParameter("productNo");
        String actionUpdate = request.getParameter("productUpdate");
        dBActions dbaction = new dBActions();
        SessionManager currentSession = (SessionManager)session.getAttribute("sessionManager");
        String lastVisitedPage = currentSession.getLastVisitedPage();
        
        //check if session exists/if user is logged in
        if (actionCreate != null){
        

            //get parameters from form action
            int itemID = Integer.parseInt(request.getParameter("product"));
            ProductDAO pDAO = new ProductDAO();
            product basketProduct = pDAO.getProductByID(itemID);
            product decoratedProduct = pDAO.decorateProduct(basketProduct);
             
           
            //calculate other 2 attribute of lineItem
            int itemQuantity = Integer.parseInt(request.getParameter("Quantity"));
          
            double itemPrice = decoratedProduct.getCost()* itemQuantity;
            
            //instantiate lineItem
            LineItem lineItem = new LineItem(itemQuantity, itemPrice, decoratedProduct);
           
            //check if cart exists if not make one
            shoppingCart basket = (shoppingCart) session.getAttribute("basket");// calls on basket session
            if (basket == null) { // if basket doesn't already exist
                basket = new shoppingCart();
                ArrayList<LineItem> cartItems = new ArrayList<>();
                basket.setCartItems(cartItems);
                
            }
            // add prodcut and chck for clones and then set the session
            basket.AddToBasket(lineItem); // uses custom method in the ShoppingCart class to add a product to the basket
            basket.cloneKiller(basket.getCartItems());
            
            session.setAttribute("basket", basket);
            if (lastVisitedPage.equals("Catalog")){
                
            RequestDispatcher dispatcher = request.getRequestDispatcher("ProductHomeServlet?action=CatalogShow");
            dispatcher.forward(request, response);
            
            }
            else if (lastVisitedPage.equals("Catagory1")){
                
            RequestDispatcher dispatcher = request.getRequestDispatcher("CategoryProductServlet?categoryID=Stuffed Animal");
            dispatcher.forward(request, response);
            }
            else if (lastVisitedPage.equals("Catagory2")){
                
            RequestDispatcher dispatcher = request.getRequestDispatcher("CategoryProductServlet?categoryID=Board Game");
            dispatcher.forward(request, response);
            }
            else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("ProductHomeServlet?action=HomeShow");
            dispatcher.forward(request, response);
            }
        }
         
         // remove by checking what id was sent
         if (actionRemove != null){
            
        
         
         int productID = Integer.parseInt(actionRemove);
         
         shoppingCart basket = (shoppingCart) session.getAttribute("basket");
         
         basket.remove(productID);
         
          RequestDispatcher dispatcher = request.getRequestDispatcher("Cart.jsp");
          dispatcher.forward(request, response);
         }
         // whatever number is in the incrementer make that the amount of product now
         if (actionUpdate != null){
             
             
             int productID = Integer.parseInt(actionUpdate);
             int itemQuantity = Integer.parseInt(request.getParameter("Quantity"));
            
             
             shoppingCart basket = (shoppingCart) session.getAttribute("basket");
             
             basket.addMoreProduct(productID,itemQuantity);
             
             
             RequestDispatcher dispatcher = request.getRequestDispatcher("Cart.jsp");
             dispatcher.forward(request, response);
             
         }
         
        }
        

     
    

    // for basket - don't use DAO. Just create session and pass the products into it and onto
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // your doPost logic, if any
    }
}
