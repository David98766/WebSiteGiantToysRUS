/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author I586662
 */

// Logic for how customer Queries work
public class CustomerQuery {

 
    private int queryID;
    private String fullName;
    private String userEmail;
    private String queryMessage;
    
    public CustomerQuery(){
        
    }
    public CustomerQuery(int queryID, String fullName, String userEmail, String queryMessage){
        
        this.queryID = queryID;
        this.fullName = fullName;
        this.userEmail = userEmail;
        this.queryMessage = queryMessage;
        
    }
     public CustomerQuery( String fullName, String userEmail, String queryMessage){
        
    
        this.fullName = fullName;
        this.userEmail = userEmail;
        this.queryMessage = queryMessage;
        
    }
    
    
    
    /**
     * @return the fullName
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName the fullName to set
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * @return the userEmail
     */
    public String getUserEmail() {
        return userEmail;
    }

    /**
     * @param userEmail the userEmail to set
     */
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    /**
     * @return the queryMessage
     */
    public String getQueryMessage() {
        return queryMessage;
    }

    /**
     * @param queryMessage the queryMessage to set
     */
    public void setQueryMessage(String queryMessage) {
        this.queryMessage = queryMessage;
    }
       /**
     * @return the queryID
     */
    public int getQueryID() {
        return queryID;
    }

    /**
     * @param queryID the queryID to set
     */
    public void setQueryID(int queryID) {
        this.queryID = queryID;
    }
    
}
