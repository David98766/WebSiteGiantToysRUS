/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Utilities.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.StuffedAnimal;
import model.boardGame;
import model.product;
import model.user;

/**
 *
 * @author I586662
 */
public class UserDAO {
    
        // grab users
        public static ArrayList<user> getAllUsers() {
        
        DBManager dm = new DBManager();
        Connection con = dm.getConnection();  
        
        
        ArrayList<user> userData = new ArrayList();
        
    String query = "SELECT * FROM USERDATA";
        
         try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
          
            while (rs.next()) {
              user retrieveUser = new user();
              retrieveUser.setUserID(rs.getInt(1));
              retrieveUser.setfName(rs.getString(2));
              retrieveUser.setlName(rs.getString(3));
              retrieveUser.setCEmail(rs.getString(4));
              retrieveUser.setcPhoneNumber(rs.getString(11));
              retrieveUser.setcPassword(rs.getString(12));
              retrieveUser.setIsLoggedIN(rs.getBoolean(13));
              retrieveUser.setRegisterDate(rs.getDate(14));
              retrieveUser.setIsManager(rs.getBoolean(15));
              retrieveUser.setUserDisable(rs.getBoolean(16));
              retrieveUser.setRememberMe(rs.getBoolean(17));
              userData.add(retrieveUser);
            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
              return userData;
      }
    
   // grab user by name
   public user getUserByID(int UserID) {
   
        ArrayList<user> users = getAllUsers();

        for (user User : users) {
            if (User.getUserID() == UserID) {
                return User; // Return the matching user
            }
        }

        return null; // Return null if no matching user is found after checking all users
    }
      public user getUserByEmail(String email) {
   
        ArrayList<user> users = getAllUsers();

        for (user User : users) {
            if (User.getCEmail().equals(email)) {
                return User; // Return the matching user
            }
        }

        return null; // Return null if no matching user is found after checking all users
    }
   
   public void Create (user User){
       DBManager dm = new DBManager();
    try (Connection con = dm.getConnection()) {
        String query =("INSERT INTO USERDATA (\"fName\", \"lName\", \"cEmail\", \"cPhoneNumber\", \"cPassword\", \"isManager\") VALUES(?, ?, ?, ?, ?, ?)");
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, User.getfName());
            stmt.setString(2, User.getlName());
            stmt.setString(3, User.getCEmail());
            stmt.setString(4, User.getcPhoneNumber());
            stmt.setString(5, User.getcPassword());
            stmt.setBoolean(6, User.isIsManager());
         

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("User record inserted successfully!");
            } else {
                System.out.println("Failed to insert User record.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
   public void Update(user User, user userOld) throws SQLException {
        DBManager dm = new DBManager();
        
         StringBuilder sql = new StringBuilder("UPDATE USERDATA SET");
         
         boolean fNameChange = !userOld.getfName().equals(User.getfName());
         boolean lNameChanger = !userOld.getlName().equals(User.getlName());
         boolean emailChange = !userOld.getCEmail().equals(User.getCEmail());
         boolean phoneNumberChange = !userOld.getcPhoneNumber().equals(User.getcPhoneNumber());
         boolean passwordChange = !userOld.getcPassword().equals(User.getcPassword());
         boolean managerChange = userOld.isIsManager() != User.isIsManager();
         
         if (fNameChange){
             sql.append("\"fName\" = ?,");
         }
         if (lNameChanger){
             sql.append("\"lName\" = ?,");
         }
         if (emailChange){
             sql.append("\"cEmail\" = ?,");
         }
         if (phoneNumberChange){
             sql.append("\"cPhoneNumber\" = ?,");
         }
         if (passwordChange){
             sql.append("\"cPassword\" = ?,");
         }
         if (managerChange){
             sql.append("\"isManager\" = ?,");
         }
        sql.deleteCharAt(sql.lastIndexOf(","));
        sql.append("WHERE \"USER_ID\" = ? ");
        System.out.println(sql);
          try (Connection con = dm.getConnection()) {
      

        try (PreparedStatement stmt = con.prepareStatement(sql.toString())) {
         
                try {
                    int parameterIndex = 1;
                   
                    if (fNameChange){
                        stmt.setString(parameterIndex++, User.getfName());
                    }
                    if (lNameChanger){
                        stmt.setString(parameterIndex++, User.getlName());
                    }
                    if (emailChange){
                        stmt.setString(parameterIndex++, User.getCEmail());
                    }
                    if (phoneNumberChange){
                         stmt.setString(parameterIndex++, User.getcPhoneNumber());
                    }
                    if (passwordChange){
                        stmt.setString(parameterIndex++, User.getcPassword());
                    }
                    if (managerChange){
                        stmt.setBoolean(parameterIndex++, User.isIsManager());
                    }
             
                   stmt.setInt(parameterIndex, userOld.getUserID());

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
   public void DeleteOrActivate(int userID, boolean blnDisable){
        DBManager dm = new DBManager();
 
    try (Connection con = dm.getConnection()) {
        String query = "UPDATE USERDATA SET \"userDisable\" = ? WHERE USER_ID = ? ";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setBoolean(1, blnDisable);
            stmt.setInt(2, userID);
            
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
   public void LogInOrOut(int userID, boolean status){
    DBManager dm = new DBManager();
 
    try (Connection con = dm.getConnection()) {
        String query = "UPDATE USERDATA SET \"isLoggedIN\" = ? WHERE USER_ID = ? ";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setBoolean(1, status);
            stmt.setInt(2, userID);
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("User Status Changed!");
                
            } else {
                System.out.println("User Status not Changed!");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
   }
   //make sure the primary key isnt duplicated completely irrelevant here but looks cool

 // Login User taking two arguments
   public user loginUser(String username, String password) { 
       
        UserDAO userDAO = new UserDAO();// creat object of dao class
        user User = userDAO.getUserByEmail(username); // create user object and assign value of method(username). This returns all attributes (id, username, password,type)
        if (User == null) { // if the user doesnt exist (via username check)
            return null;
        } else { // so if the user is found, then we need to check if the password is correct

            if (User.getcPassword().equals(password)) { // if user object password (from DAO) = password from method paramater are equal, return user.
                LogInOrOut(User.getUserID(), true);
            
                
                return User;
            }
        }
        return null;
    }
}

    


