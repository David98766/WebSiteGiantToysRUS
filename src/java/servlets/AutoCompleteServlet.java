/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import Utilities.Formatter;
import dao.ProductDAO;
import dao.SearchReuslts;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FireSale;
import model.NoSale;
import model.product;
import model.reducedToClearSale;

/**
 *
 * @author I586662
 */

public class AutoCompleteServlet extends HttpServlet {
       private ServletContext context;
    SearchReuslts searchData = new SearchReuslts();
    private ArrayList<product> Products;

    ProductDAO pdao = new ProductDAO();
    

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        Formatter f = new Formatter();
        StringBuffer sb = new StringBuffer();


        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/about.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {
          
            // check if user sent empty string
            if (!targetId.equals("")) {

                

                 Products = searchData.SearchData(targetId);
               
                if (Products.isEmpty()) {
                   sb.append("<Products found=\"false\">");
                   sb.append("</Products>");
                   namesAdded = true;
                   }
                
                for (product p : Products){
            
                    
                  sb.append("<Product>");
                  sb.append("<id>" + p.getProductID() + "</id>");
                  sb.append("<ProductName>" + p.getProductName() + "</ProductName>");
                  sb.append("<Category>" + p.getProductCategory() + "</Category>");
                  sb.append("<Image>" + p.getBase64EncodedImage() + "</Image>");
                  sb.append("<ProductOriginalPrice>" +  f.formatDouble(p.getProductPrice()) + "</ProductOriginalPrice>");
                  sb.append("<Price>" +  f.formatDouble(p.getCost()) + "</Price>");
                  sb.append("<DiscountStatus>" + p.getDiscountStatus() + "</DiscountStatus>");
                  sb.append("</Product>");
                 
                  
                  namesAdded = true;
                }
                if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<Product>" + sb.toString() + "</Product>");
        }
            }
            else  {
                    
                    ProductDAO pdao = new ProductDAO();
                    Products = pdao.decoratedList();
                  
                  
                    
                    
                  for (product p : Products){
             
                      
                  sb.append("<Product>");
                  sb.append("<id>" + p.getProductID() + "</id>");
                  sb.append("<ProductName>" + p.getProductName() + "</ProductName>");
                  sb.append("<Category>" + p.getProductCategory() + "</Category>");
                  sb.append("<Image>" + p.getBase64EncodedImage() + "</Image>");
                  sb.append("<ProductOriginalPrice>" + f.formatDouble(p.getProductPrice()) + "</ProductOriginalPrice>");
                  sb.append("<Price>" + f.formatDouble(p.getCost()) + "</Price>");
                  sb.append("<DiscountStatus>" + p.getDiscountStatus() + "</DiscountStatus>");
                  sb.append("</Product>");
             
                  
                  namesAdded = true;
                //nothing to show
            
            }
                if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<Product>" + sb.toString() + "</Product>");
            
        }
            
            }
              
        }
             if (action.equals("lookup")) {
            
            String targetIdLookup = request.getParameter("id");
            product Product = pdao.getProductByName(targetIdLookup);
        
            if (Product == null){
                  context.getRequestDispatcher("/delivery.jsp").forward(request, response);
            }
            // put the target composer in the request scope to display 
       
            else {
                    
                        context.getRequestDispatcher("/SingleProductServlet?productID=" + Product.getProductID()).forward(request, response);
                        
            }
                
            }
        }
    }
    
    
