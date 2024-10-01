/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import Utilities.Formatter;
import javax.swing.text.Utilities;

/**
 *
 * @author I586662
 */
//child of Sales Decorator
public class reducedToClearSale extends SalesDecorator {

  Formatter util = new Formatter();
  private double reducedToClearPercentage;
  
  
  public reducedToClearSale(product Product, String saleDescription, double reducedToClearPercentage){
    super(Product, saleDescription);
    this.reducedToClearPercentage = reducedToClearPercentage;
  }
  // constanly overrite the descritpion unitl appropriate description is found

    /**
     *
     * @return
     */
  @Override
   public String getDiscountDescritption() {
        return "Reduced to Clear from €" + util.formatDouble(getProduct().getProductPrice()) + " to";
    }
   //same for price
    @Override
    public double getCost() {
        // Implement the specific cost calculation for NoSale
        return getProduct().getProductPrice() * (1 - reducedToClearPercentage);  // or your custom logic
    }

    

    
}
