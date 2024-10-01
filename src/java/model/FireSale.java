/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import Utilities.Formatter;

/**
 *
 * @author I586662
 */
//Child of SalesDecortor used for wrapping on product instances
public class FireSale extends SalesDecorator {
    
     Formatter util = new Formatter();
     private double fireSalePercentage;
     
     public FireSale(product Product, String saleDescription, double fireSalePercentage){
        super(Product, saleDescription);
        this.fireSalePercentage = fireSalePercentage;
    }
     
   //overrites getCost in product class to apply the discount
      @Override
    public double getCost() {
        // Implement the specific cost calculation for NoSale
        return getProduct().getProductPrice() * (1 - fireSalePercentage);  // or your custom logic
    }
    // will allow me to tell whic discount it is
       @Override
public String getDiscountDescritption() {
    // Inherit getDiscountDescritption and append specific information for ReducedToClearSale
    return "Fire Sale! Reduced from €" + util.formatDouble(getProduct().getProductPrice()) + " to";
}


    public void setFireSalePercentage(double fireSalePercentage) {
        this.fireSalePercentage = fireSalePercentage;
    }
}
