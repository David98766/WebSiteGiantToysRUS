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
public abstract class product {

    
    private int productID;
    private String productName;
    private double productPrice;
    private String productCategory;
    private String productDescription;
    private String productDimensions;
    private int productInventory;
    private byte[] image;
    private String base64EncodedImage;
    private boolean isDeleted;
    private String discountStatus;
    
    public product() {
    
    }
    
     public product(int productID, String productName, double productPrice, String productCategory, String productDescription, String productDimensions, int productInventory, byte[] image, String base64EncodedImage, boolean isDeleted, String discountStatus) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
        this.productDescription = productDescription;
        this.productDimensions = productDimensions;
        this.productInventory = productInventory;
        this.image = image;
        this.base64EncodedImage = base64EncodedImage;
        this.isDeleted = isDeleted;
        this.discountStatus = discountStatus;
    }
    

    /**
     * @return the productID
     */
    public int getProductID() {
        return productID;
    }

    /**
     * @param productID the productID to set
     */
    public void setProductID(int productID) {
        this.productID = productID;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the productPrice
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * @param productPrice the productPrice to set
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }
    
        public String getProductCategory() {
        return productCategory;
    }

 
    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    /**
     * @return the productDescription
     */
    public String getProductDescription() {
        return productDescription;
    }

    /**
     * @param productDescription the productDescription to set
     */
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    /**
     * @return the productDimensions
     */
    public String getProductDimensions() {
        return productDimensions;
    }

    /**
     * @param productDimensions the productDimensions to set
     */
    public void setProductDimensions(String productDimensions) {
        this.productDimensions = productDimensions;
    }

    /**
     * @return the productInventory
     */
    public int getProductInventory() {
        return productInventory;
    }

    /**
     * @param productInventory the productInventory to set
     */
    public void setProductInventory(int productInventory) {
        this.productInventory = productInventory;
    }

  /**
     * @return the image
     */

       public byte[] getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(byte[] image) {
        this.image = image;
    }

    /**
     * @return the base64EncodedImage
     */
    public String getBase64EncodedImage() {
        return base64EncodedImage;
    }

    /**
     * @param base64EncodedImage the base64EncodedImage to set
     */
    public void setBase64EncodedImage(String base64EncodedImage) {
        this.base64EncodedImage = base64EncodedImage;
    }

    
        /**
     * @return the isDeleted
     */
    public boolean isIsDeleted() {
        return isDeleted;
    }

    /**
     * @param isDeleted the isDeleted to set
     */
    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    /**
     * @return the discountStatus
     */
    public String getDiscountStatus() {
        return discountStatus;
    }

    /**
     * @param discountStatus the discountStatus to set
     */
    public void setDiscountStatus(String discountStatus) {
        this.discountStatus = discountStatus;
    }
    // used to be override in child instances for decorator
  public abstract double getCost();
   
  public abstract String getDiscountDescritption();
    
    
    
}
