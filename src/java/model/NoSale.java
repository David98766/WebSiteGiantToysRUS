/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author I586662
 */
// child of SalesDecorator used for wrapping around product instance
public class NoSale extends SalesDecorator {

    
    private double noSalePercentage;
    
    public NoSale(product Product, String saleDescription, double noSalePercentage){
        super(Product, saleDescription);
        this.noSalePercentage = noSalePercentage;
    }
    // no discount just returns price
   @Override
    public double getCost() {
    
        return getProduct().getProductPrice();  
    }
    // to figure out what discount product gets
         @Override
public String getDiscountDescritption() {
    
    return "";
}


    /**
     * @param noSalePercentage the noSalePercentage to set
     */
    public void setNoSalePercentage(double noSalePercentage) {
        this.noSalePercentage = noSalePercentage;
    }
    
    
}
