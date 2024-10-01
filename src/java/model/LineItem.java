/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.swing.ImageIcon;

/**
 *
 * @author I586662
 */
//user to store products and quantity and to control duplication in cart
public class LineItem {
    
    private int itemQuantity;
    private double itemTotalPrice;
    private product Product;
    
    public LineItem(){
        
    }
    
    public LineItem(int itemQuantity, double itemTotalPrice, product Product){
        this.itemQuantity = itemQuantity;
        this.itemTotalPrice = itemTotalPrice;
        this.Product = Product;
    }
    
   /* public LineItem(int itemQuantity, double itemTotalPrice, product Product, double discount, String discountDescription){
        this.itemQuantity = itemQuantity;
        this.itemTotalPrice = itemTotalPrice;
        this.Product = new SalesDecorator(Product, discountDescription , discount);
    }*/

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

    /**
     * @return the itemTotalPrice
     */
    public double getItemTotalPrice() {
        return itemTotalPrice;
    }

    /**
     * @param itemTotalPrice the itemTotalPrice to set
     */
    public void setItemTotalPrice(double itemTotalPrice) {
        this.itemTotalPrice = itemTotalPrice;
    }

    /**
     * @return the Product
     */
    public product getProduct() {
        return Product;
    }

    /**
     * @param Product the Product to set
     */
    public void setProduct(product Product) {
        this.Product = Product;
    }
     public int getProductId() {
        // Assuming Product has a getId() method
        return Product.getProductID();
     }
        
     public String getProductName() {
        return Product.getProductName();
    }
    public byte[] getProductImage(){
        return Product.getImage();
    }
      public String get64BaseEncoding(){
        return Product.getBase64EncodedImage();
    }
    public String getProductCategory(){
        return Product.getProductCategory();
    }
     public double getProductPrice(){
        return Product.getProductPrice();
    }
    public void itemUpdate(int productID){
        
    }
}
