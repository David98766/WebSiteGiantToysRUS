/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.StuffedAnimal;
import model.boardGame;
import model.product;

/**
 *
 * @author I586662
 */
@WebServlet(name = "SingleProductServlet", urlPatterns = {"/SingleProductServlet"})
public class SingleProductServlet extends HttpServlet  {
    private ServletContext context;
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        //retrieving and sending over the correct product decorated
         String productIDString = request.getParameter("productID");
        
        //convert to int 
        int productID = Integer.parseInt(productIDString);
        
        ProductDAO pDAO = new ProductDAO();
        product Product = pDAO.getProductByID(productID);
        product decoratedProduct = pDAO.decorateProduct(Product);
        ArrayList<product> top5Sellers = pDAO.top5Sellers();
        
        request.setAttribute("singleProduct", decoratedProduct);
        request.setAttribute("NormalProduct", Product);
        request.setAttribute("Top 5 Sellers", top5Sellers);
        

  
      
        
        //sending the request to the preffered page
      
        RequestDispatcher rd = request.getRequestDispatcher("detail_product.jsp");
        rd.forward(request, response);
        
    }

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
