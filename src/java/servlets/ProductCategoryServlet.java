/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product;

/**
 *
 * @author I586662
 */
@WebServlet(name = "CategoryProductServlet", urlPatterns = {"/CategoryProductServlet"})
public class ProductCategoryServlet extends HttpServlet {
    

    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

          
        
       // get the category id then use this send over the righ list of products
        String productCategory = request.getParameter("categoryID");
        
        
        ProductDAO pDAO = new ProductDAO();
        ArrayList<product> Products = pDAO.getAllProductCategory(productCategory);
        ArrayList<product> decoratedProducts = pDAO.applyDecorator(Products);
        
        request.setAttribute("CategoryProduct", decoratedProducts);

  
      
        
        //sending the request to the preffered page
        RequestDispatcher rd = request.getRequestDispatcher("detail_category.jsp");
        rd.forward(request, response);
        
    }

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}


