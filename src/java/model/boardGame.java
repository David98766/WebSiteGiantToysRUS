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
//child of Product
public class boardGame extends product {
    
    private String ageRange;
    private String publisher;
    private String maxPlayers;
    
    public boardGame(){
        
    }
    
    public boardGame(int productID, String productName, double productPrice, String productCategory, String productDescription, String productDimensions, int productInventory, byte[] image, String base64EncodedImage, String discountStatus, String ageRange, String publisher, String maxPlayers, boolean isDeleted){
        super(productID, productName, productPrice, productCategory, productDescription, productDimensions, productInventory, image, base64EncodedImage, isDeleted, discountStatus);
        this.ageRange = ageRange;
        this.publisher = publisher;
        this.maxPlayers = maxPlayers;
    }

    /**
     * @return the ageRange
     */
    public String getAgeRange() {
        return ageRange;
    }

    /**
     * @param ageRange the ageRange to set
     */
    public void setAgeRange(String ageRange) {
        this.ageRange = ageRange;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * @return the maxPlayers
     */
    public String getMaxPlayers() {
        return maxPlayers;
    }

    /**
     * @param maxPlayers the maxPlayers to set
     */
    public void setMaxPlayers(String maxPlayers) {
        this.maxPlayers = maxPlayers;
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
