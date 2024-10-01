/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.CustomerQueryDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerQuery;

/**
 *
 * @author I586662
 */
@WebServlet(name = "CustomerQueryServlet", urlPatterns = {"/CustomerQueryServlet"})
public class CustomerQueryServlet extends HttpServlet {
    
         @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // showing queries admin
       String action = request.getParameter("action");
        
             if ("queryShow".equals(action)) {
            
             ArrayList<CustomerQuery> CustomerQueryList = new ArrayList();
             
             CustomerQueryDAO cDAO = new CustomerQueryDAO();
             
             CustomerQueryList = cDAO.getAllQueries();
             
             request.setAttribute("QueryList", CustomerQueryList);
             
             RequestDispatcher rd = request.getRequestDispatcher("customer-queries.jsp");
             rd.forward(request, response);
        }

    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //filling out query
        String fullName = request.getParameter("Contact-Name");
        String emailAddress = request.getParameter("Contact-Email");
        String messageText = request.getParameter("Contact-Message");
        
        
       // create query
       CustomerQuery queryGuest = new CustomerQuery();
       
       queryGuest.setFullName(fullName);
       queryGuest.setUserEmail(emailAddress);
       queryGuest.setQueryMessage(messageText);
       
        RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
             dispatcher.forward(request, response);
        
   
    }
}
