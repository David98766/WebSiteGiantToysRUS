/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.CustomerQueryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dao.dBActions;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerQuery;
import model.Order;
import model.paymentDetails;
import model.product;
import model.user;

/**
 *
 * @author I586662
 */
@WebServlet(name = "dBActionsServlet", urlPatterns = {"/dBActionsServlet"})
public class dBActionsServlet extends HttpServlet {
     private ServletContext context;
     
     @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }
    
       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
         String createProduct = request.getParameter("CreateProd");
         String updateProduct = request.getParameter("updateAction");
         String viewQuery = request.getParameter("Retrieve");
         String CreateUser = request.getParameter("CreateUser");
         String editUser = request.getParameter("editUser");
         String TotalSales = request.getParameter("TotalSales");
         String top5Seller = request.getParameter("top5Seller");
         String ordersNotDelivered = request.getParameter("Orders");
         ProductDAO pdao = new ProductDAO();
         CustomerQueryDAO cdao = new CustomerQueryDAO();
         dBActions dba = new dBActions();
        
         
         if (createProduct != null){
             request.setAttribute("Action", createProduct);
              context.getRequestDispatcher("/Action.jsp").forward(request, response);
         }
         else if (updateProduct != null){
             int productID = Integer.parseInt(updateProduct);
             
             product Product = pdao.getProductByID(productID);
             if (Product.getProductCategory().equals("Stuffed Animal")){
             
                   request.setAttribute("Stuffed Animal", Product);
                    context.getRequestDispatcher("/Action.jsp").forward(request, response);
             }
             else if (Product.getProductCategory().equals("Board Game")){
                   request.setAttribute("Board Game", Product);
                    context.getRequestDispatcher("/Action.jsp").forward(request, response);
             }
            
         }
         else if (viewQuery != null){
             int queryID = Integer.parseInt(viewQuery);
             CustomerQuery cq = cdao.Retrieve(queryID);
             request.setAttribute("Query", cq);
              context.getRequestDispatcher("/Action.jsp").forward(request, response);
         }
         else if(CreateUser != null){
             request.setAttribute("CreateUser", CreateUser);
              context.getRequestDispatcher("/Action.jsp").forward(request, response);
         }
         else if (editUser != null){
             int userID = Integer.parseInt(editUser);
             UserDAO udao = new UserDAO();
             user updateUser = udao.getUserByID(userID);
             request.setAttribute("UpdateUser", updateUser);
             System.out.println(userID);
            context.getRequestDispatcher("/Action.jsp").forward(request, response);
         }
         else if (TotalSales != null){
               ArrayList<paymentDetails> receiptData = dba.GenerateSales();
               request.setAttribute("Total Sales", receiptData);
            context.getRequestDispatcher("/ReportShow.jsp").forward(request, response);
}
         else if (top5Seller != null){
             ArrayList<product> top5Sellers = pdao.top5Sellers();
             request.setAttribute("Top 5 Sellers", top5Sellers);
             context.getRequestDispatcher("/ReportShow.jsp").forward(request, response);
         }
        
         

             

        
    }
 
    
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
          
}
