/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author I586662
 */
//associative entity for the database can make receipts stores all the information on the products bought in payment
public class paymentDetails {
    
    private int UserID;
    private int paymentID;
    private String itemName;
    private double itemPrice;
    private int itemQuantity;
    private int itemID;

    public paymentDetails(){
        
    }
      public paymentDetails(int UserID, int paymentID, int itemID, String itemName, int itemQuantity, double itemPrice) {
        this.UserID = UserID;
        this.paymentID = paymentID;
        this.itemID = itemID;
        this.itemName = itemName;
        this.itemQuantity = itemQuantity;
        this.itemPrice = itemPrice;
        
        
    }
    
    
    /**
     * @return the detailID
     */
    public int getUserID() {
        return UserID;
    }

    
    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    /**
     * @return the payment
     */
    public int getPayment() {
        return paymentID;
    }

   
    public void setPayment(int paymentID) {
        this.paymentID = paymentID;
    }
      public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    /**
     * @return the itemName
     */
    public String getItemName() {
        return itemName;
    }

    /**
     * @param itemName the itemName to set
     */
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    /**
     * @return the itemPrice
     */
    public double getItemPrice() {
        return itemPrice;
    }

    /**
     * @param itemPrice the itemPrice to set
     */
    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    /**
     * @return the itemQuantity
     */
    public int getItemQuantity() {
        return itemQuantity;
    }

    /**
     * @param itemQuantity the itemQuantity to set
     */
    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

  
    public int getItemID() {
        return itemID;
    }

 
    public void setItemID(int itemID) {
        this.itemID = itemID;
    }
}
