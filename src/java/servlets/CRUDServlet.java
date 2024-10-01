/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.ProductDAO;
import dao.UserDAO;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.StuffedAnimal;
import model.boardGame;
import model.product;
import model.user;


/**
 *
 * @author I586662
 */
@WebServlet(name = "CRUDServlet", urlPatterns = {"/CRUDServlet"})
@MultipartConfig
public class CRUDServlet extends HttpServlet {
    
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         ProductDAO pDAO = new ProductDAO();
         UserDAO udao = new UserDAO();
         String method = request.getParameter("method");
         String Activate = request.getParameter("Activate");
         String userDisable = request.getParameter("DiableUser");
         String userActivate = request.getParameter("userEnable");
        
        if (method != null){
           
                int productID = Integer.parseInt(method);
                pDAO.DeleteOrActivate(productID, true); 
            }
        else if (Activate != null){
            int productID = Integer.parseInt(Activate);
            pDAO.DeleteOrActivate(productID, false);
        }
        else if (userDisable != null){
            int userID = Integer.parseInt(userDisable);
            boolean blnDisable = true;
            
            udao.DeleteOrActivate(userID, blnDisable);
           
        }
         else if (userActivate != null){
            int userID = Integer.parseInt(userActivate);
            boolean blnDisable = false;
            
            udao.DeleteOrActivate(userID, blnDisable);
                
        }
                RequestDispatcher dispatcher = request.getRequestDispatcher("ProductHomeServlet?action=EditProduct");
            dispatcher.forward(request, response);
                 
   
    }
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         response.setContentType("text/html;charset=UTF-8");
         ProductDAO pDAO = new ProductDAO();
         UserDAO udao = new UserDAO();
        
        String action = request.getParameter("action");
        String deleteAction = request.getParameter("Delete");
       
        
        if (action != null && action.equals("CreateProduct")){
            
            String productCategory = request.getParameter("category");
            String productImage = request.getParameter("file");
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            String productPrice = request.getParameter("productPrice");
            String productDimensions = request.getParameter("productDimensions");
            String ageRange = request.getParameter("ageRange");
            String publisher = request.getParameter("publisher");
            String maxPlayers = request.getParameter("maxPlayers");
            String containsPlastic = request.getParameter("containsPlastic");
            String suitability = request.getParameter("suitability");
            String StuffingMaterial = request.getParameter("StuffingMaterial");
            String productInventory = request.getParameter("productInventory");
            
            Part filePart = request.getPart("file");
           // String fileName = StringUtils.getFileName(filePart);
            InputStream iptStream = filePart.getInputStream();
            double dbProductPrice = Double.parseDouble(productPrice);
            int intproductInventory = Integer.parseInt(productInventory);
            boolean containsplastic = false;
            boolean bsuitability = false;
           
            if (containsPlastic != null && containsPlastic.equals("true")){
                 containsplastic = true;
            }
            if (suitability != null && suitability.equals("true")){
                bsuitability = true;
            }
            if (productCategory != null && productCategory.equals("Stuffed Animal")){
               StuffedAnimal Product = new StuffedAnimal();
               Product.setProductName(productName);
               Product.setProductCategory(productCategory);
               Product.setProductDimensions(productDimensions);
               Product.setProductDescription(productDescription);
               Product.setProductPrice(dbProductPrice);
               Product.setProductInventory(intproductInventory);
               Product.setIsDeleted(false);
               Product.setContainsPlastic(containsplastic);
               Product.setStuffingMaterail(StuffingMaterial);
               Product.setSuitableForKids(bsuitability);
               Product.setDiscountStatus("No Discount");
                try {
                    pDAO.Create(Product, iptStream);
                } catch (SQLException ex) {
                    Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
               
            }
            else if (productCategory != null && productCategory.equals("Board Game")){
               boardGame Product = new boardGame();
               Product.setProductName(productName);
               Product.setProductCategory(productCategory);
               Product.setProductDimensions(productDimensions);
               Product.setProductDescription(productDescription);
               Product.setProductPrice(dbProductPrice);
               Product.setProductInventory(intproductInventory);
               Product.setIsDeleted(false);
               Product.setDiscountStatus("No Discount");
               Product.setAgeRange(ageRange);
               Product.setMaxPlayers(maxPlayers);
               Product.setPublisher(publisher);
                   try {
                    pDAO.Create(Product, iptStream);
                } catch (SQLException ex) {
                    Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.sendRedirect("ProductHomeServlet?action=EditProduct");
                     
        }
            else if (action != null && action.equals("UpdateProduct")){
            String updateProductCategory = request.getParameter("Category");
            String updateProductImage = request.getParameter("file");
            String updateProductName = request.getParameter("productName");
            String updateProductDescription = request.getParameter("productDescription");
            String updateProductPrice = request.getParameter("productPrice");
            String updateProductDimensions = request.getParameter("productDimensions");
            String updateAgeRange = request.getParameter("ageRange");
            String updatePublisher = request.getParameter("publisher");
            String updateMaxPlayers = request.getParameter("maxPlayers");
            String updateContainsPlastic = request.getParameter("containsPlastic");
            String updateSuitability = request.getParameter("suitability");
            String updateStuffingMaterial = request.getParameter("StuffingMaterial");
            String updateProductInventory = request.getParameter("productInventory");
            String discountStatus = request.getParameter("Discount");
            String productID = request.getParameter("ID");
            
            Part updatefilePart = request.getPart("file");
           
           // String fileName = StringUtils.getFileName(filePart);
            InputStream updateIptStream = updatefilePart.getInputStream();
            double dbUpdateProductPrice = Double.parseDouble(updateProductPrice);
            int intUpdateproductInventory = Integer.parseInt(updateProductInventory);
            boolean updateDBContainsplastic = false;
            boolean updateBsuitability = false;
            int intProductID = Integer.parseInt(productID);
           
            if (updateContainsPlastic != null && updateContainsPlastic.equals("true")){
                 updateDBContainsplastic = true;
            }
            if (updateSuitability != null && updateSuitability.equals("true")){
                updateBsuitability = true;
            }
          
            ProductDAO pdao = new ProductDAO();
            StuffedAnimal stuffedAnimal = null;
            boardGame BoardGame = null;
            product Product = pdao.getProductByID(intProductID);
            InputStream existingImageStream = new ByteArrayInputStream(Product.getImage());
              if (updateProductImage == null){
                updateIptStream = existingImageStream;
            }
            
            
             if (updateProductCategory != null && updateProductCategory.equals("Stuffed Animal")){
               StuffedAnimal ProductUpdated = new StuffedAnimal();
               ProductUpdated.setProductCategory(updateProductCategory);
               ProductUpdated.setProductName(updateProductName);
               ProductUpdated.setProductDimensions(updateProductDimensions);
               ProductUpdated.setProductDescription(updateProductDescription);
               ProductUpdated.setProductPrice(dbUpdateProductPrice);
               ProductUpdated.setProductInventory(intUpdateproductInventory);
               ProductUpdated.setDiscountStatus(discountStatus);
               ProductUpdated.setContainsPlastic(updateDBContainsplastic);
               ProductUpdated.setStuffingMaterail(updateStuffingMaterial);
               ProductUpdated.setSuitableForKids(updateBsuitability);
                try {
                    pDAO.Update(Product, ProductUpdated, existingImageStream, updateIptStream);
                } catch (SQLException ex) {
                    Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
               
            }
            else if (updateProductCategory != null && updateProductCategory.equals("Board Game")){
               boardGame ProductUpdated = new boardGame();
               ProductUpdated.setProductCategory(updateProductCategory);
               ProductUpdated.setProductName(updateProductName);
               ProductUpdated.setProductDimensions(updateProductDimensions);
               ProductUpdated.setProductDescription(updateProductDescription);
               ProductUpdated.setProductPrice(dbUpdateProductPrice);
               ProductUpdated.setProductInventory(intUpdateproductInventory);
               ProductUpdated.setDiscountStatus(discountStatus);
               ProductUpdated.setDiscountStatus("No Discount");
               ProductUpdated.setAgeRange(updateAgeRange);
               ProductUpdated.setMaxPlayers(updateMaxPlayers);
               ProductUpdated.setPublisher(updatePublisher);
                try {
                    pDAO.Update(Product, ProductUpdated, existingImageStream, updateIptStream);
                } catch (SQLException ex) {
                    Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
       
              response.sendRedirect("ProductHomeServlet?action=EditProduct");
            }
            else if (action != null && action.equals("CreateUser")){
                String fName = request.getParameter("firstName");
                String lName = request.getParameter("lastName");
                String userEmail = request.getParameter("email");
                String userPhoneNumber = request.getParameter("phoneNumber");
                String userPassword = request.getParameter("password");
                String strIsManager = request.getParameter("isManager");
                
                boolean isManager = false;
                
                if (strIsManager.equals("yes")){
                    isManager = true;
                }
                LocalDate today = LocalDate.now();
                java.sql.Date sqlDate = java.sql.Date.valueOf(today);
                        
                
                user CreateUser = new user();
                CreateUser.setfName(fName);
                CreateUser.setlName(lName);
                CreateUser.setCEmail(userEmail);
                CreateUser.setcPhoneNumber(userPhoneNumber);
                CreateUser.setcPassword(userPassword);
                CreateUser.setIsManager(isManager);
                CreateUser.setRegisterDate(sqlDate);
                
                udao.Create(CreateUser);
                

                
            }
            else if (action != null && action.equals("UpdateUser")){
                String userID = request.getParameter("ID");
                String fName = request.getParameter("firstName");
                String lName = request.getParameter("lastName");
                String userEmail = request.getParameter("email");
                String userPhoneNumber = request.getParameter("phoneNumber");
                String userPassword = request.getParameter("password");
                String strIsManager = request.getParameter("isManager");
                
                   boolean isManager = false;
                
                if (strIsManager.equals("yes")){
                    isManager = true;
                }
                int intuserID = Integer.parseInt(userID);
                user Userold = udao.getUserByID(intuserID);
                
                user userTOEdit = new user();
                userTOEdit.setfName(fName);
                userTOEdit.setlName(lName);
                userTOEdit.setCEmail(userEmail);
                userTOEdit.setcPhoneNumber(userPhoneNumber);
                userTOEdit.setcPassword(userPassword);
                userTOEdit.setIsManager(isManager);
                
             try {
                 udao.Update(userTOEdit, Userold);
             } catch (SQLException ex) {
                 Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
             }
        
           
            }
         
        
                
                   
               
           // ArrayList<product> Products = pDAO.getAllProducts();
           // request.setAttribute("productList", Products);
         
        
    }
    
    }


