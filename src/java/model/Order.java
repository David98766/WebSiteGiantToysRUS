/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author I586662
 */
//creates order after transaction
public class Order {


    private int orderID;
    private int paymentID;
    private int UserID;
    private String deliveryType;
    private Date orderDeliveryDate;
    private boolean orderDelivered;
    
    
    public Order(){
        
    }
    
   public Order(int orderID, int paymentID, int UserID, String deliveryType, Date orderDeliveryDate, boolean orderDelivered) {
        this.orderID = orderID;
        this.paymentID = paymentID;
        this.UserID = UserID;
        this.deliveryType = deliveryType;
        this.orderDeliveryDate = orderDeliveryDate;
        this.orderDelivered = orderDelivered;
    }
    public Order(int paymentID, int UserID, String deliveryType, Date orderDeliveryDate, boolean orderDelivered) {
        
        this.paymentID = paymentID;
        this.UserID = UserID;
        this.deliveryType = deliveryType;
        this.orderDeliveryDate = orderDeliveryDate;
        this.orderDelivered = orderDelivered;
    }

    /**
     * @return the orderID
     */
    public int getOrderID() {
        return orderID;
    }

    /**
     * @param orderID the orderID to set
     */
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    /**
     * @return the orderDeliveryDate
     */
    public Date getOrderDeliveryDate() {
        return orderDeliveryDate;
    }

    /**
     * @param orderDeliveryDate the orderDeliveryDate to set
     */
    public void setOrderDeliveryDate(Date orderDeliveryDate) {
        this.orderDeliveryDate = orderDeliveryDate;
    }

    /**
     * @return the payment
     */
    public int getPaymentID() {
        return paymentID;
    }

    
    public void setPayment(int paymentID) {
        this.paymentID = paymentID;
    }

    /**
     * @return the User
     */
    public int getUserID() {
        return UserID;
    }

    public void setUser(int UserID) {
        this.UserID = UserID;
    }

    /**
     * @return the orderDelivered
     */
    public boolean isOrderDelivered() {
        return orderDelivered;
    }

    /**
     * @param orderDelivered the orderDelivered to set
     */
    public void setOrderDelivered(boolean orderDelivered) {
        this.orderDelivered = orderDelivered;
    }
    
        /**
     * @return the turboDelivery
     */
    public String getDeliveryType() {
        return deliveryType;
    }

  
    public void setDeliveryType(String deliveryType) {
        this.deliveryType = deliveryType;
    }
    
      public int getAssociatedUserID() {
        // Implement logic to retrieve the user ID based on the payment ID
        // This might involve accessing a database or using a data access object
        return UserID;
    }
        public int getAssociatedPaymentID() {
        // Implement logic to retrieve the user ID based on the payment ID
        // This might involve accessing a database or using a data access object
        return paymentID;
    }
    
}
