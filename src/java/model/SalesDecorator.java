/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author I586662
 */

// where the magic happens SalesDecorator is a child of product and implements Decorator pattern
public abstract class SalesDecorator extends product {
    
    // declaring the three states that all products must be in to be able to apply discounts
 
    public String discountStatus;
    public product Product;
    private String saleDescription;
    private double salePercentage;
    
   // needed to call all methods of product here so that children instances could access them so decoratedProducts would just have null everything
    public SalesDecorator(product Product, String saleDescription){
        super(Product.getProductID(), Product.getProductName(), Product.getProductPrice(), Product.getProductCategory(), Product.getProductDescription(), Product.getProductDimensions(), Product.getProductInventory(), Product.getImage(), Product.getBase64EncodedImage(), Product.isIsDeleted(), Product.getDiscountStatus());
        this.Product = Product;
        this.saleDescription = saleDescription;
    }

    /**
     * @return the discountDescritption
     */
    //used to determine type of discount when database is introduced
  
 
    
    public product getProduct() {
        return Product;
    }
    // constantly overriden to get approriate price of wrapped product
  @Override
   public abstract double getCost();
   
  @Override
    public abstract String getDiscountDescritption();
        
      
}


