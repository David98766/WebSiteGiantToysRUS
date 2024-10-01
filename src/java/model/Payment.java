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
//creates the payment after order placed
public class Payment {


    private int paymentID;
    private int userID;
    private int paymentQuantiy;
    private double paymentTotal;
    private double VATAmount;
    private Date paymentDate;

    public Payment() {

    }

    public Payment(int paymentID, int userID,int paymentQuantiy, double paymentTotal, double VATAmount, Date paymentDate) {
        this.paymentID = paymentID;
        this.userID = userID;
        this.paymentQuantiy = paymentQuantiy;
        this.VATAmount = VATAmount;
        this.paymentTotal = paymentTotal;
        this.paymentDate = paymentDate;
    }
    
      public Payment(int userID,int paymentQuantiy, double paymentTotal, double VATAmount, Date paymentDate) {
        this.userID = userID;
        this.paymentQuantiy = paymentQuantiy;
        this.VATAmount = VATAmount;
        this.paymentTotal = paymentTotal;
        this.paymentDate = paymentDate;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID){
        this.paymentID = paymentID;
    }

    public int getUserID(){
        return userID;
    }

    public void setUserID(int userID){
        this.userID = userID;
    }

    public double getPaymentTotal(){
        return paymentTotal;
    }

    public void setPaymentTotal(double paymentTotal){
        this.paymentTotal = paymentTotal;
    }
   
    public double getVATTotal(){
        return VATAmount;
    }

    public void setVATTotal(double VATAmount){
        this.VATAmount = VATAmount;
    }


    public Date getPaymentDate(){
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate){
        this.paymentDate = paymentDate;
    }
       /**
     * @return the paymentQuantiy
     */
    public int getPaymentQuantity() {
        return paymentQuantiy;
    }

    /**
     * @param paymentQuantiy the paymentQuantiy to set
     */
    public void setPaymentQuantiy(int paymentQuantiy) {
        this.paymentQuantiy = paymentQuantiy;
    }

    public void ConfirmPayment() {

    }

    public void PaymentRefund(int paymentID) {

    }

    // Method to retrieve the associated user ID
    public int getAssociatedUserID() {
        // Implement logic to retrieve the user ID based on the payment ID
        // This might involve accessing a database or using a data access object
        return userID;
    }

}
