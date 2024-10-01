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
import model.CustomerQuery;
import model.user;

/**
 *
 * @author I586662
 */
public class CustomerQueryDAO {
    
    // retrieving list of queries
    public static ArrayList<CustomerQuery> getAllQueries() { 
        
        DBManager dm = new DBManager();
        Connection con = dm.getConnection(); 
        
         ArrayList<CustomerQuery> CustomerQuerys = new ArrayList();
         
         String query = "SELECT * FROM CUSTOMERQUERY";
         
       try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
          
            while (rs.next()) {
              CustomerQuery guestQuery = new CustomerQuery();
              guestQuery.setQueryID(rs.getInt(1));
              guestQuery.setFullName(rs.getString(2));
              guestQuery.setUserEmail(rs.getString(3));
              guestQuery.setQueryMessage(rs.getString(4));
           
              CustomerQuerys.add(guestQuery);
            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
              return CustomerQuerys;
    }
    public CustomerQuery Retrieve(int queryID){
        ArrayList<CustomerQuery> list = getAllQueries();
        
        for (CustomerQuery cq : list){
            if (cq.getQueryID() == queryID){
                return cq;
            }
        }
           return null;
    }
}
