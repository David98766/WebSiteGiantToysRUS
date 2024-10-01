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
// child of product
public class StuffedAnimal extends product {
    
    private boolean containsPlastic;
    private String stuffingMaterail;
    private boolean suitableForKids;

    public StuffedAnimal(){
        
    }
    
    public StuffedAnimal(int productID, String productName, double productPrice, String productCategory, String productDescription, String productDimensions, int productInventory, byte[] image, String base64EncodedImage, boolean isDeleted, String discountStatus, boolean containsPlastic, String stuffingMaterail, boolean suitableForKids){
        super(productID, productName, productPrice, productCategory, productDescription, productDimensions, productInventory, image, base64EncodedImage, isDeleted, discountStatus);
        this.containsPlastic = containsPlastic;
        this.stuffingMaterail = stuffingMaterail;
        this.suitableForKids = suitableForKids;
    }
    
    /**
     * @return the containsPlastic
     */
    public boolean isContainsPlastic() {
        return containsPlastic;
    }

    /**
     * @param containsPlastic the containsPlastic to set
     */
    public void setContainsPlastic(boolean containsPlastic) {
        this.containsPlastic = containsPlastic;
    }

    /**
     * @return the stuffingMaterail
     */
    public String getStuffingMaterail() {
        return stuffingMaterail;
    }

    /**
     * @param stuffingMaterail the stuffingMaterail to set
     */
    public void setStuffingMaterail(String stuffingMaterail) {
        this.stuffingMaterail = stuffingMaterail;
    }

    /**
     * @return the suitableForKids
     */
    public boolean isSuitableForKids() {
        return suitableForKids;
    }

    /**
     * @param suitableForKids the suitableForKids to set
     */
    public void setSuitableForKids(boolean suitableForKids) {
        this.suitableForKids = suitableForKids;
    }
  
    
    @Override
    public double getCost(){
        return getProductPrice();
    }
    
    @Override
    public  String getDiscountDescritption(){
        return "";
    }
    
}
