/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

/**
 *
 * @author I586662
 */
import dao.UserDAO;
import dao.dBActions;
import model.user;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LineItem;
import model.SessionManager;
import model.shoppingCart;

/**
 *
 * @author 117776119
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        //Create variables for name and password and assign value of the "name" and "password" entered in the login form
        String username = request.getParameter("email");
        String password = request.getParameter("pass");
        String remeberMe = request.getParameter("remember-me");
        dBActions dbaction = new dBActions();
   
   
       

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) { // check if the values entered are empty
            request.getRequestDispatcher("checkout.jsp").forward(request, response);// if they are, go back to the login page
        } else { //if they are not empty (i.e. the user entered a username and password)

            UserDAO uServ = new UserDAO(); //creating an object of the UserDAO class (i.e. getting access to the UserDAO class)
            user User = uServ.loginUser(username, password);//uses the loginUser method from Service class

            if (User == null) {
               
                request.setAttribute("incorrectLogin", "A user with that email and password was not found");// this is a custom message we cab show 
                RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");// if fail to find user then reload page and show a message saying why
                rd.forward(request, response);
                
            } else {
                
                HttpSession session = request.getSession(); //calls session
                SessionManager currentSession = (SessionManager)session.getAttribute("sessionManager");
                String lastVisitedPage = currentSession.getLastVisitedPage();
               
  
                if (User.isIsManager()) {// checks if the user is an admin
           
                    session.setAttribute("UserSession", User);
                   
      
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");// goes to admin
                    dispatcher.forward(request, response);
                    
                } else if (User.isIsManager() == false) { // checks if the user is normal user
                   
                    session.setAttribute("UserSession", User); // carry over user instance
                    
                    
                    ArrayList<LineItem> cartData = new ArrayList();
                    cartData = dbaction.getShoppingCart(User);
                    
                    shoppingCart currentBasket = (shoppingCart)session.getAttribute("basket");
                    
                    if (currentBasket != null && !cartData.isEmpty()){
                        
                       for (LineItem cartItem : cartData) {
                       
                           currentBasket.AddToBasket(cartItem);
                           currentBasket.cloneKiller(currentBasket.getCartItems());
                           session.setAttribute("basket", currentBasket);
                           
                       }
                    
                    }
                    else if (currentBasket == null && !cartData.isEmpty()){
                        
                           currentBasket = new shoppingCart();
                           currentBasket.setCartItems(cartData);
                           session.setAttribute("basket", currentBasket);
                    }
                    switch (lastVisitedPage) {
                        case "Home":
                            response.sendRedirect("index.jsp");
                            break;
                    // go to index.jsp which is what application looks for then redirects to servlet which goes to home
                        case "Checkout":
                            response.sendRedirect("checkout.jsp");
                            break;
                        case "Catalog":
                            response.sendRedirect("ProductHomeServlet?action=CatalogShow");
                            break;
                        case "About":
                            response.sendRedirect("about.jsp");
                            break;
                        case "Contact":
                            response.sendRedirect("contact.jsp");
                            break;
                        case "Delivery":
                            response.sendRedirect("delivery.jsp");
                            break;
                        case "Cart":
                            response.sendRedirect("Cart.jsp");
                            break;
                        default:
                            response.sendRedirect("index.jsp");
                            break;
                    }
                   
                }
            }
        }
    }
}
