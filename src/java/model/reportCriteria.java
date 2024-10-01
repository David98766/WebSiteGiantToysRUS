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
public class reportCriteria {


    private int orderID;
    private String orderfName;
    private String orderLName;
    private Date orderDate;
    
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
     * @return the orderfName
     */
    public String getOrderfName() {
        return orderfName;
    }

    /**
     * @param orderfName the orderfName to set
     */
    public void setOrderfName(String orderfName) {
        this.orderfName = orderfName;
    }

    /**
     * @return the orderLName
     */
    public String getOrderLName() {
        return orderLName;
    }

    /**
     * @param orderLName the orderLName to set
     */
    public void setOrderLName(String orderLName) {
        this.orderLName = orderLName;
    }

    /**
     * @return the orderDate
     */
    public Date getOrderDate() {
        return orderDate;
    }

    /**
     * @param orderDate the orderDate to set
     */
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}


