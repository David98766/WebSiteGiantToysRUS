/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Utilities.DBManager;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.StuffedAnimal;
import model.boardGame;
import model.product;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author I586662
 */
public class SearchReuslts {
    
    public ArrayList<product> SearchData(String input) {
        ArrayList<product> productList = new ArrayList<>();
         ArrayList<product> decorateList = new ArrayList<>();
        
        DBManager dm = new DBManager();
        Connection con = dm.getConnection();
        
      String query = "SELECT \"PRODUCT_ID\", \"productName\", \"productCategory\", \"productPrice\", \"productImage\", \"discountStatus\" FROM PRODUCTS WHERE LOWER(\"productName\") LIKE ? AND \"isDeleted\" = ?";

     try (PreparedStatement stmt = con.prepareStatement(query)) {
   
         stmt.setString(1, "%" + input.toLowerCase() + "%");
         stmt.setBoolean(2, false);

    // Rest of your code...

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int productID = rs.getInt(1);
                    String productNameRetrieve = rs.getString(2);
                    String productCategoryRetrieve = rs.getString(3);
                    double productPriceRetrieve = rs.getDouble(4);
                    byte[] imageRetrieve = rs.getBytes(5);
                    byte[] encodeBase64 = Base64.encodeBase64(imageRetrieve);
                    String encode = java.util.Base64.getEncoder().encodeToString(encodeBase64);
                    String base64Encoded = new String(encodeBase64, "UTF-8");
                    String discountRetrieve = rs.getString(6);

                    product newProduct;

                    if (productCategoryRetrieve.equals("Stuffed Animal")) {
                        newProduct = new StuffedAnimal();
                    } else if (productCategoryRetrieve.equals("Board Game")) {
                        newProduct = new boardGame();
                    } else {
                        // Handle other product categories if needed
                        continue; // Skip to the next iteration
                    }

                    newProduct.setProductID(productID);
                    newProduct.setProductName(productNameRetrieve);
                    newProduct.setProductCategory(productCategoryRetrieve);
                    newProduct.setProductPrice(productPriceRetrieve);
                    newProduct.setBase64EncodedImage(base64Encoded);
                    newProduct.setDiscountStatus(discountRetrieve);

                    productList.add(newProduct);
                    ProductDAO pdao = new ProductDAO();
                    decorateList = pdao.applyDecorator(productList);
                }
            }
        } catch (SQLException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return decorateList;
    }
}

