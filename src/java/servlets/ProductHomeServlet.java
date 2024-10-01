/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

/**
 *
 * @author I586662
 */

import dao.ProductDAO;
import dao.SearchReuslts;
import model.product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
@WebServlet(name = "ProductHomeServlet", urlPatterns = {"/ProductHomeServlet"})
public class ProductHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           SearchReuslts searchData = new SearchReuslts();
       
        // get the right list of products and send to the destination depending on the action specified in the link
        String action = request.getParameter("action");
        
        ProductDAO pDAO = new ProductDAO();
        
         if ("CatalogShow".equals(action)) {
             
       
             ArrayList<product> productList = new ArrayList();
             ArrayList<product> decoratedList = new ArrayList();
             
             productList = pDAO.getAllProducts();
             decoratedList = pDAO.applyDecorator(productList);
             
             
             request.setAttribute("productList", decoratedList);
            
             
             RequestDispatcher rd = request.getRequestDispatcher("catalog.jsp");
             rd.forward(request, response);
        
         }
         
         else if ("HomeShow".equals(action)){
            
             ArrayList<product> productList = new ArrayList();
             ArrayList<product> decoratedList = new ArrayList();
             ArrayList<product> Products = new ArrayList();
                     
             Products = searchData.SearchData("Giant v");
             System.out.println(Products.isEmpty());
                     
             productList = pDAO.getAllProducts();
             decoratedList = pDAO.applyDecorator(productList);
             
             request.setAttribute("productList", decoratedList);
             
             
             RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
             rd.forward(request, response);
         }
         
         else if ("EditProduct".equals(action)){
             
             ArrayList<product> productList = new ArrayList();
             
             productList = pDAO.getAllProducts();
             
             request.setAttribute("productList", productList);
             
             RequestDispatcher rd = request.getRequestDispatcher("editProduct.jsp");
             rd.forward(request, response);
         }
     
         else if (action.equals("SearchProducts")){
             ArrayList<product> Products = (ArrayList<product>)request.getAttribute("Searched List");
             request.setAttribute("productList", Products);
              RequestDispatcher rd = request.getRequestDispatcher("catalog.jsp");
             rd.forward(request, response);
        
         }
   
             
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

}

}

