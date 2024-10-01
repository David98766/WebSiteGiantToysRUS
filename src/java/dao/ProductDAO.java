/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Utilities.DBManager;
import Utilities.SessionTrigger;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import model.FireSale;
import model.NoSale;
import model.product;
import model.reducedToClearSale;
import model.StuffedAnimal;
import model.boardGame;
import org.apache.tomcat.util.codec.binary.Base64;


/**
 *
 * @author I586662
 */
public class ProductDAO {
     
    String noDiscount = "None";
    String reducedToClear = "Reduced to Clear";
    String fireSale = "Fire Sale!";
      
     public ArrayList<product> getAllProducts(){
        
        
        DBManager dm = new DBManager();
        Connection con = dm.getConnection();
        int productID = 0;
        String productName = null;
        double productPrice = 0.0;
        String productCategory = null;
        String productDescription = null;
        String productDimensions = null;
        int productInventory = 0;
        byte[] productImage = null;
        boolean isDeleted = false;
        String discountStatus = null;
        boolean containsPlastic = false;
        String stuffingMaterial = null;
        boolean suitableForKids = false;
        String ageRange = null;
        String publisher = null;
        String maxPlayers = null;
        ImageIcon image = null;
        
       
        
        ArrayList<product> productData = new ArrayList();
     
        String query = "SELECT * FROM PRODUCTS";
        
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
          
            while (rs.next()) {
              productID = rs.getInt(1);
              productName = rs.getString(2);
              productPrice = rs.getDouble(3);
              productCategory = rs.getString(4);
              productDescription = rs.getString(5);
              productDimensions = rs.getString(6);
              productInventory = rs.getInt(7);
              productImage = rs.getBytes(8);
              byte[] encodeBase64 = Base64.encodeBase64(productImage);
              String encode = java.util.Base64.getEncoder().encodeToString(encodeBase64);
              String base64Encoded = new String(encodeBase64, "UTF-8");
              isDeleted = rs.getBoolean(9);
              discountStatus = rs.getString(10);
              containsPlastic = rs.getBoolean(11);
              stuffingMaterial = rs.getString(12);
              suitableForKids = rs.getBoolean(13);
              ageRange = rs.getString(14);
              publisher = rs.getString(15);
              maxPlayers = rs.getString(16);
             
            
              
              if (productCategory.equals("Stuffed Animal")){
                  StuffedAnimal stuffedAnimal = new StuffedAnimal();
                  stuffedAnimal.setProductID(productID);
                  stuffedAnimal.setProductName(productName);
                  stuffedAnimal.setProductPrice(productPrice);
                  stuffedAnimal.setProductCategory(productCategory);
                  stuffedAnimal.setProductDescription(productDescription);
                  stuffedAnimal.setProductDimensions(productDimensions);
                  stuffedAnimal.setProductInventory(productInventory);
                  stuffedAnimal.setImage(productImage);
                  stuffedAnimal.setBase64EncodedImage(base64Encoded);
                  stuffedAnimal.setIsDeleted(isDeleted);
                  stuffedAnimal.setDiscountStatus(discountStatus);
                  stuffedAnimal.setContainsPlastic(containsPlastic);
                  stuffedAnimal.setStuffingMaterail(stuffingMaterial);
                  stuffedAnimal.setSuitableForKids(suitableForKids);
                  productData.add(stuffedAnimal);
                
              }
              
              else if (productCategory.equals("Board Game")){
                  boardGame BoardGame = new boardGame();
                  BoardGame.setProductID(productID);
                  BoardGame.setProductName(productName);
                  BoardGame.setProductPrice(productPrice);
                  BoardGame.setProductCategory(productCategory);
                  BoardGame.setProductDescription(productDescription);
                  BoardGame.setProductDimensions(productDimensions);
                  BoardGame.setProductInventory(productInventory);
                  BoardGame.setImage(productImage);
                  BoardGame.setBase64EncodedImage(base64Encoded);
                  BoardGame.setIsDeleted(isDeleted);
                  BoardGame.setDiscountStatus(discountStatus);
                  BoardGame.setAgeRange(ageRange);
                  BoardGame.setPublisher(publisher);
                  BoardGame.setMaxPlayers(maxPlayers);
                  productData.add(BoardGame);
                 
              }
            }
            
         } catch (SQLException ex) {
               Logger.getLogger(SessionTrigger.class.getName()).log(Level.SEVERE, null, ex);
           }
      catch (Exception e) {
            e.printStackTrace();
        }
         
         
        
              return productData;
         
      }
      public void Create(product Product, InputStream stream) throws SQLException {
    DBManager dm = new DBManager();

    try (Connection con = dm.getConnection()) {
        String query = "INSERT INTO PRODUCTS (\"productName\", \"productPrice\", \"productCategory\", \"productDescription\", \"productDimensions\", \"productInventory\", \"productImage\", \"isDeleted\", \"discountStatus\", \"containsPlastic\", \"stuffingMaterial\", \"suitableForKids\", \"ageRange\", \"publisher\", \"maxPlayers\") VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
         
                try {
                    stmt.setString(1, Product.getProductName());
                    stmt.setDouble(2, Product.getProductPrice());
                    stmt.setString(3, Product.getProductCategory());
                    stmt.setString(4, Product.getProductDescription());
                    stmt.setString(5, Product.getProductDimensions());
                    stmt.setInt(6, Product.getProductInventory());
              
                    stmt.setBinaryStream(7, stream);
                    stmt.setBoolean(8, Product.isIsDeleted());
                    stmt.setString(9, Product.getDiscountStatus());

                    if (Product instanceof StuffedAnimal) {
                        stmt.setBoolean(10, ((StuffedAnimal) Product).isContainsPlastic());
                        stmt.setString(11, ((StuffedAnimal) Product).getStuffingMaterail());
                        stmt.setBoolean(12, ((StuffedAnimal) Product).isSuitableForKids());
                        stmt.setString(13, null);
                        stmt.setString(14, null);
                        stmt.setString(15, null);
                    } else if (Product instanceof boardGame) {
                        
                        stmt.setBoolean(10, false);
                        stmt.setString(11, null);
                        stmt.setBoolean(12, false);
                        stmt.setString(13, ((boardGame) Product).getAgeRange());
                        stmt.setString(14, ((boardGame) Product).getPublisher());
                        stmt.setString(15, ((boardGame) Product).getMaxPlayers());
                    } 

                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        System.out.println("Product record inserted successfully!");
                        
                    } else {
                        System.out.println("Failed to insert product record.");
                    }
                    stmt.close();
                    con.close();
                } catch (SQLException se) {
                    // Handle SQLException (print stack trace, log, or handle as needed)
                    se.printStackTrace();
                } catch (Exception e) {
                    // Handle other exceptions (print stack trace, log, or handle as needed)
                    e.printStackTrace();
                }
            
        }
    }
    }
public void Update(product ProductOld, product ProductUpdate, InputStream streamOld, InputStream streamNew) throws SQLException {
    DBManager dm = new DBManager();
   StuffedAnimal ProductOldStuffed = null;
   boardGame ProductOldBoardGame = null;
   
   StuffedAnimal ProductNewStuffed = null;
   boardGame ProductNewBoardGame = null;
   
    if (ProductOld instanceof StuffedAnimal) {
    ProductOldStuffed = (StuffedAnimal) ProductOld;
   } else if (ProductOld instanceof boardGame) {
    ProductOldBoardGame = (boardGame) ProductOld;
    }
    if (ProductUpdate instanceof StuffedAnimal) {
    ProductNewStuffed = (StuffedAnimal) ProductUpdate;
   } else if (ProductUpdate instanceof boardGame) {
    ProductNewBoardGame = (boardGame) ProductUpdate;
    }
    
          StringBuilder sql = new StringBuilder("UPDATE PRODUCTS SET");
         
          boolean imageChange = !streamOld.equals(streamNew);
          boolean nameChange = !ProductOld.getProductName().equals(ProductUpdate.getProductName());
          boolean descriptionChange = !ProductOld.getProductDescription().equals(ProductUpdate.getProductDescription());
          boolean priceChange = ProductOld.getProductPrice() != ProductUpdate.getProductPrice();
          boolean dimensionsChange = !ProductOld.getProductDimensions().equals(ProductUpdate.getProductDimensions());
          boolean inventoryChange = ProductOld.getProductInventory() != ProductUpdate.getProductInventory();
          boolean discountChange = !ProductOld.getDiscountStatus().equals(ProductUpdate.getDiscountStatus());
          boolean ageRangeChange = false;
          boolean publisherChange = false;
          boolean maxPlayersChange = false;
          boolean containsPlasticChange = false;
          boolean suitableForKidsChange = false;
          boolean stuffingMaterialChange = false;
          if (ProductUpdate instanceof boardGame){
           ageRangeChange = !ProductOldBoardGame.getAgeRange().equals(ProductNewBoardGame.getAgeRange());
           publisherChange = !ProductOldBoardGame.getPublisher().equals(ProductNewBoardGame.getPublisher());
           maxPlayersChange = !ProductOldBoardGame.getMaxPlayers().equals(ProductNewBoardGame.getMaxPlayers());
          }
          if (ProductUpdate instanceof StuffedAnimal){
           containsPlasticChange = !ProductOldStuffed.isContainsPlastic() != ProductNewStuffed.isContainsPlastic();
           suitableForKidsChange = !ProductOldStuffed.isSuitableForKids() != ProductNewStuffed.isSuitableForKids();
           stuffingMaterialChange = !ProductOldStuffed.getStuffingMaterail().equals(ProductNewStuffed.getStuffingMaterail());
          }
    
          
 
            if (imageChange){
             
                sql.append("\"productImage\" = ?,");
            }
            if (nameChange){
              
                 sql.append("\"productName\" = ?,");
            }
            if (descriptionChange){
               
                  sql.append("\"productDescription\" = ?,");
            }
              
            if (priceChange){
               
                 sql.append("\"productPrice\" = ?,");
            }
            if (dimensionsChange){
              
                   sql.append("\"productDimensions\" = ?,");
            }
            if (inventoryChange){
            
                sql.append("\"productInventory\" = ?,");
            }
            if (discountChange){
              
                 sql.append("\"discountStatus\" = ?,");
            }
        if (ProductUpdate instanceof boardGame){
            if (ageRangeChange){
              
                  sql.append("\"ageRange\" = ?,");
            }
            if (publisherChange){
              
                 sql.append("\"publisher\" = ?,");
            }
            if (maxPlayersChange){
             
                 sql.append("\"maxPlayers\" = ?,");
            }
        } else if (ProductUpdate instanceof StuffedAnimal){
            if (containsPlasticChange){
              
                 sql.append("\"containsPlastic\" = ?,");
            }
            if (suitableForKidsChange){
              
                  sql.append("\"suitableForKids\" = ?,");
            }
            if (stuffingMaterialChange){
              
                sql.append("\"stuffingMaterial\" = ?,");
        }
            
            }
        sql.deleteCharAt(sql.lastIndexOf(","));
        sql.append("WHERE \"PRODUCT_ID\" = ? ");
        System.out.println(sql);
         try (Connection con = dm.getConnection()) {
      

        try (PreparedStatement stmt = con.prepareStatement(sql.toString())) {
         
                try {
                    int parameterIndex = 1;
                   
                    if (imageChange){
                        stmt.setBinaryStream(parameterIndex++, streamNew);
                    }
                    if (nameChange){
                        stmt.setString(parameterIndex++, ProductUpdate.getProductName());
                    }
                    if (descriptionChange){
                        stmt.setString(parameterIndex++, ProductUpdate.getProductDescription());
                    }
                    if (priceChange){
                         stmt.setDouble(parameterIndex++, ProductUpdate.getProductPrice());
                    }
                    if (dimensionsChange){
                        stmt.setString(parameterIndex++, ProductUpdate.getProductDimensions());
                    }
                    if (inventoryChange){
                        stmt.setInt(parameterIndex++, ProductUpdate.getProductInventory());
                    }
             
                     if (discountChange){
                        stmt.setString(parameterIndex++, ProductUpdate.getDiscountStatus());
                    }
                   if (ProductUpdate instanceof boardGame){
                       
                       if (ageRangeChange){
                           stmt.setString(parameterIndex++, ProductNewBoardGame.getAgeRange());
                       }
                       if (publisherChange){
                           stmt.setString(parameterIndex++, ProductNewBoardGame.getPublisher());
                       }
                       if (maxPlayersChange){
                           stmt.setString(parameterIndex++, ProductNewBoardGame.getMaxPlayers());
                       }
                   }
                   else if (ProductUpdate instanceof StuffedAnimal){
                       
                       if (containsPlasticChange){
                           stmt.setBoolean(parameterIndex++, ProductNewStuffed.isContainsPlastic());
                       }
                       if (suitableForKidsChange){
                           stmt.setBoolean(parameterIndex++, ProductNewStuffed.isSuitableForKids());
                       }
                       if (stuffingMaterialChange){
                           stmt.setString(parameterIndex++, ProductNewStuffed.getStuffingMaterail());
                       }
                   }
                   stmt.setInt(parameterIndex, ProductOld.getProductID());

                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        System.out.println("Product record inserted successfully!");
                        
                    } else {
                        System.out.println("Failed to insert product record.");
                    }
                    stmt.close();
                    con.close();
                } catch (SQLException se) {
                    // Handle SQLException (print stack trace, log, or handle as needed)
                    se.printStackTrace();
                } catch (Exception e) {
                    // Handle other exceptions (print stack trace, log, or handle as needed)
                    e.printStackTrace();
                }
            
        }
    }
}
public void DeleteOrActivate(int ProductID, boolean blnStatus){
        DBManager dm = new DBManager();
 
    try (Connection con = dm.getConnection()) {
        String query = "UPDATE PRODUCTS SET \"isDeleted\" = ? WHERE PRODUCT_ID = ? ";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setBoolean(1, blnStatus);
            stmt.setInt(2, ProductID);
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Product Status Changed!");
                
            } else {
                System.out.println("Failed Product Change!");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

}

      // getting product specifically
          public product getProductByID(int productID){

        for (product Product : getAllProducts()) {
            if (Product.getProductID() == productID) {
                return Product;
            }
        }
        return null;
    }
         public product getProductByName(String productName){
                for (product Product : getAllProducts()) {
            if (Product.getProductName().toLowerCase().equals(productName)) {
                return Product;
            }
        }
        return null;
         }
          //getting product based on category take it string to identify what to populate the list with
         public ArrayList<product> getAllProductCategory(String productCategory) {
             
         ArrayList<product> products = getAllProducts();
         ArrayList<product> categoryAllProduct = new ArrayList<>();

         for (product categoryProduct : products) {
              if (categoryProduct.getProductCategory().equals(productCategory)) {
                   categoryAllProduct.add(categoryProduct);
        }
    }
    return categoryAllProduct;
}
          // apply decoration to all the list of products to avoid repeating my self learnt the hard way
           public ArrayList<product> applyDecorator(ArrayList<product> Products){
             
                ArrayList<product> decorateAllProduct = new ArrayList();
                
                 for (product Product: Products){
                  
                  product decoratedProduct = Product; 
            
                            if (Product.getDiscountStatus().equals("No Discount")) {
                                decoratedProduct = new NoSale(Product, "No Discount", 0.0);
                            } else if (Product.getDiscountStatus().equals("Reduced To Clear")) {
                                decoratedProduct = new reducedToClearSale(Product, "Reduced to Clear", 0.2);
                            } else if (Product.getDiscountStatus().equals("Fire Sale")) {
                                decoratedProduct = new FireSale(Product, "Fire Sale!", 0.3);
                            } 
                            decorateAllProduct.add(decoratedProduct);
              }
                 return decorateAllProduct;
           } 
           //decorate specific product for single product jsp
           public product decorateProduct(product Product){
                  product decoratedProduct = Product; 
            
                            if (Product.getDiscountStatus().equals("No Discount")) {
                                decoratedProduct = new NoSale(Product, "No Discount", 0.0);
                            } else if (Product.getDiscountStatus().equals("Reduced To Clear")) {
                                decoratedProduct = new reducedToClearSale(Product, "Reduced to Clear", 0.2);
                            } else if (Product.getDiscountStatus().equals("Fire Sale")) {
                                decoratedProduct = new FireSale(Product, "Fire Sale!", 0.3);
                            } 
                            return decoratedProduct;
           }
          public ArrayList<product> decoratedList() {
                ArrayList<product> productList = applyDecorator(getAllProducts());
                Iterator<product> iterator = productList.iterator();

                while (iterator.hasNext()) {
                   product p = iterator.next();
                 if (p.isIsDeleted()) {
                   iterator.remove(); // Safely remove the element
                       }
                    }

              return productList;
           }
          public ArrayList<product> top5Sellers(){
        DBManager dm = new DBManager();
    Connection con = dm.getConnection();
    
   ProductDAO pdao = new ProductDAO();
   
    String query = "SELECT \"productsID\", \"itemName\", SUM(\"itemQuantity\") AS totalQuantity FROM \"PAYMENTDETAIL\" GROUP BY \"productsID\", \"itemName\" ORDER BY totalQuantity DESC FETCH FIRST 5 ROWS ONLY";
    
    
    ArrayList<product> top5Sellers = new ArrayList();
    
        
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()){
           product Product = pdao.getProductByID(rs.getInt(1));
           top5Sellers.add(Product);
            }
         } catch (SQLException e) {
            e.printStackTrace();
        }
         return top5Sellers;
}


        
}
