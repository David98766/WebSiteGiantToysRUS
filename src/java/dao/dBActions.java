/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Utilities.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.CustomerQuery;
import model.Order;
import model.Payment;
import model.paymentDetails;
import model.user;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.LineItem;
import model.StuffedAnimal;
import model.boardGame;
import model.product;
import model.shoppingCart;
import model.reportCriteria;

/**
 *
 * @author I586662
 */
public class dBActions {
    
    String query = "";
    public void generateProducts(List<product> productList) throws SQLException {
    DBManager dm = new DBManager();

    try (Connection con = dm.getConnection()) {
        String query = "INSERT INTO PRODUCTS (\"productName\", \"productPrice\", \"productCategory\", \"productDescription\", \"productDimensions\", \"productInventory\", \"productImage\", \"isDeleted\", \"discountStatus\", \"containsPlastic\", \"stuffingMaterial\", \"suitableForKids\", \"ageRange\", \"publisher\", \"maxPlayers\") VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            for (product product : productList) {
                try {
                    stmt.setString(1, product.getProductName());
                    stmt.setDouble(2, product.getProductPrice());
                    stmt.setString(3, product.getProductCategory());
                    stmt.setString(4, product.getProductDescription());
                    stmt.setString(5, product.getProductDimensions());
                    stmt.setInt(6, product.getProductInventory());
                  
           
                    
                    stmt.setBytes(7, product.getImage());
                    stmt.setBoolean(8, product.isIsDeleted());
                    stmt.setString(9, product.getDiscountStatus());

                    if (product instanceof StuffedAnimal) {
                        stmt.setBoolean(10, ((StuffedAnimal) product).isContainsPlastic());
                        stmt.setString(11, ((StuffedAnimal) product).getStuffingMaterail());
                        stmt.setBoolean(12, ((StuffedAnimal) product).isSuitableForKids());
                        stmt.setString(13, null);
                        stmt.setString(14, null);
                        stmt.setString(15, null);
                    } else if (product instanceof boardGame) {
                        
                        stmt.setBoolean(10, false);
                        stmt.setString(11, null);
                        stmt.setBoolean(12, false);
                        stmt.setString(13, ((boardGame) product).getAgeRange());
                        stmt.setString(14, ((boardGame) product).getPublisher());
                        stmt.setString(15, ((boardGame) product).getMaxPlayers());
                    } 

                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        System.out.println("Product record inserted successfully!");
                        
                    } else {
                        System.out.println("Failed to insert product record.");
                    }
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
    }
        
    
public void Create(Payment payment) {
    DBManager dm = new DBManager();
 
    try (Connection con = dm.getConnection()) {
         query = "INSERT INTO PAYMENT (\"userID\", \"paymentQuantity\", \"paymentTotal\", \"paymentDate\") VALUES(?, ?, ?, ?)";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, payment.getUserID());
            stmt.setInt(2, payment.getPaymentQuantity());
            stmt.setDouble(3, payment.getPaymentTotal());
            stmt.setDate(4, new java.sql.Date(payment.getPaymentDate().getTime()));

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Payment record inserted successfully!");
                
            } else {
                System.out.println("Failed to insert payment record.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public void Create (paymentDetails PaymentDetail){
       DBManager dm = new DBManager();
    try (Connection con = dm.getConnection()) {
        String query = "INSERT INTO PAYMENTDETAIL (\"userID\", \"paymentID\", \"productsID\", \"itemName\", \"itemPrice\", \"itemQuantity\") VALUES(?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, PaymentDetail.getUserID());
            stmt.setInt(2, PaymentDetail.getPaymentID());
            stmt.setInt(3, PaymentDetail.getItemID());
            stmt.setString(4, PaymentDetail.getItemName());
            stmt.setDouble(5, PaymentDetail.getItemPrice());
            stmt.setInt(6, PaymentDetail.getItemQuantity());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Payment Detail record inserted successfully!");
            } else {
                System.out.println("Failed to insert payment detail record.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public void Create (Order order){
       DBManager dm = new DBManager();
    try (Connection con = dm.getConnection()) {
        String query = "INSERT INTO \"ORDER\" (\"paymentID\", \"userID\", \"deliveryType\", \"orderDeliveryDate\", \"orderDelivered\") VALUES(?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, order.getPaymentID());
            stmt.setInt(2, order.getUserID());
            stmt.setString(3, order.getDeliveryType());
            stmt.setDate(4, new java.sql.Date(order.getOrderDeliveryDate().getTime()));
            stmt.setBoolean(5, order.isOrderDelivered());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Order Detail record inserted successfully!");
            } else {
                System.out.println("Failed to insert Order record.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}


public void Create (CustomerQuery Query){
       DBManager dm = new DBManager();
    try (Connection con = dm.getConnection()) {
        String query = "INSERT INTO CUSTOMERQUERY (\"fullName\", \"userEmail\", \"queryMessage\") VALUES(?, ?, ?)";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, Query.getFullName());
            stmt.setString(2, Query.getUserEmail());
            stmt.setString(3, Query.getQueryMessage());
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Customer Query inserted successfully!");
            } else {
                System.out.println("Failed to insert Customer Query record.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public void Create(shoppingCart cart, user user) {
    DBManager dm = new DBManager();

    try (Connection con = dm.getConnection()) {
        String query = "INSERT INTO SHOPPINGCART (\"userID\", \"productsID\", \"cartItemName\", \"cartItemPrice\", \"cartItemQuantity\") VALUES(?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            for (LineItem cartItem : cart.getCartItems()) { // Assuming your ShoppingCart class has a method to get the list of items
                stmt.setInt(1, user.getUserID());
                stmt.setInt(2, cartItem.getProductId()); // Adjust this according to your CartItem class
                stmt.setString(3, cartItem.getProductName()); // Adjust this according to your CartItem class
                stmt.setDouble(4, cartItem.getItemTotalPrice()); // Adjust this according to your CartItem class
                stmt.setInt(5, cartItem.getItemQuantity()); // Adjust this according to your CartItem class

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("CartItem inserted successfully!");
                } else {
                    System.out.println("Failed to insert CartItem record.");
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}


public int getPaymentID(int userID){
    
    DBManager dm = new DBManager();
    Connection con = dm.getConnection();
    int retrievedID = 0;
    query = "SELECT MAX(PAYMENT_ID) FROM PAYMENT WHERE \"userID\" = ?";
    
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userID); 
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()){
                retrievedID = rs.getInt(1);
            }
} catch (SQLException e) {
            e.printStackTrace();
        }
         return retrievedID;
}
public void ProductInventoryDecrement(int productID, int quantityUpdate) {
    DBManager dm = new DBManager();
    Connection con = dm.getConnection();
    
    // Use a parameterized query to update the product inventory
    String query = "UPDATE PRODUCTS SET \"productInventory\" = \"productInventory\" - ? WHERE PRODUCT_ID = ?";
    
    try {
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, quantityUpdate); // Decrement by the specified quantity
        stmt.setInt(2, productID); // Specify the product ID for the WHERE clause

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            System.out.println("Product inventory decremented successfully.");
        } else {
            System.out.println("No rows updated. Product ID not found.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public ArrayList<LineItem> getShoppingCart(user User){
    DBManager dm = new DBManager();
    Connection con = dm.getConnection();
    
    double cartItemPrice = 0.0;
    int cartItemQuantity = 0;
    
    String query = "SELECT \"productsID\", \"cartItemPrice\", \"cartItemQuantity\" FROM SHOPPINGCART WHERE \"userID\" = ?";
    String deleteQuery = "DELETE FROM SHOPPINGCART WHERE \"userID\" = ?";
    
    ArrayList<LineItem> cartData = new ArrayList();
    
        
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, User.getUserID()); 
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()){
                
                ProductDAO pdao = new ProductDAO();
                product retrievedItem = pdao.getProductByID(rs.getInt(1));
                cartItemPrice = rs.getDouble(2);
                cartItemQuantity = rs.getInt(3);
                
                LineItem cartItem = new LineItem(cartItemQuantity, cartItemPrice, retrievedItem);
                cartData.add(cartItem);
                
            }
            
              PreparedStatement deleteStmt = con.prepareStatement(deleteQuery);
              deleteStmt.setInt(1, User.getUserID());
              deleteStmt.executeUpdate();
        
} catch (SQLException e) {
            e.printStackTrace();
        }
         return cartData;
}

public ArrayList<paymentDetails> GenerateSales(){
        DBManager dm = new DBManager();
    Connection con = dm.getConnection();
    
   

    String query = "SELECT\n" +
"    \"userID\",\n" +
"    \"paymentID\",\n" +
"    \"productsID\",\n" +
"    \"itemName\",\n" +
"    \"itemPrice\",\n" +
"    \"itemQuantity\"\n" +
"FROM\n" +
"    \"PAYMENTDETAIL\"";
    
    
    ArrayList<paymentDetails> receiptData = new ArrayList();
    
        
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()){
                paymentDetails pd = new paymentDetails();
                pd.setUserID(rs.getInt(1));
                pd.setPaymentID(rs.getInt(2));
                pd.setItemID(rs.getInt(3));
                pd.setItemName(rs.getString(4));
                pd.setItemPrice(rs.getDouble(5));
                pd.setItemQuantity(rs.getInt(6));
                receiptData.add(pd);
            }
         } catch (SQLException e) {
            e.printStackTrace();
        }
         return receiptData;
} 

       public int getOrdersNotDleivered(){
        DBManager dm = new DBManager();
    Connection con = dm.getConnection();
    
   ProductDAO pdao = new ProductDAO();
   
  String query = "SELECT COUNT(*) FROM \"ORDER\" WHERE \"orderDelivered\" = ?";

    
   int orderNotDelivered = 0;
    
        
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setBoolean(1, false);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()){
             orderNotDelivered = rs.getInt(1);
            }
         } catch (SQLException e) {
            e.printStackTrace();
        }
         return orderNotDelivered;
}


}
