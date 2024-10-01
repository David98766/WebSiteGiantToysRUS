/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.dBActions;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author I586662
 */
//logic of how cart works
public class shoppingCart {

 //was going to leave out cartPrice came in handy later on when applying VAT
        private List<LineItem> cartItems = new ArrayList<>();
        private double cartPrice;
     
        
        
           public shoppingCart(){
        
    }

    /**
     * @return the cartItems
     */
 

    
    // will be needed when database is used
   
     // database method for phase 2 coming soon
     public void checkout(){
         dBActions dbAction = new dBActions();
       
         for (LineItem LineItem : getCartItems()) {
            
             dbAction.ProductInventoryDecrement(LineItem.getProductId(), LineItem.getItemQuantity());
         }
         
         
     }
    
     public int cartQuantity(){
         
         int cartQuantity = 0;
         
         for (LineItem lineItem : getCartItems()) {
             
            cartQuantity += lineItem.getItemQuantity();
             
         }
         
         return cartQuantity;
     }
     
     public double cartTotalPrice(){
         
         double totalPrice = 0.0;
         
         
         for (LineItem lineItem : getCartItems()){
             
             totalPrice += lineItem.getItemTotalPrice();
         }
       
         return totalPrice; 
     }
     
     public double cartTotalPriceVAT(double VAT){
         double subTotalPrice = 0.0;
         double totalPrice = 0.0;
         double VATPrice = 0.0;
         
         for (LineItem lineItem : getCartItems()){
             
             subTotalPrice += lineItem.getItemTotalPrice();
         }
      
         return VATPrice =  subTotalPrice * VAT;
       
     }
     // using iterator and checking with id to figure out whats removed
     public void remove(int productID) {
    Iterator<LineItem> iterator = getCartItems().iterator();
    while (iterator.hasNext()) {
        LineItem item = iterator.next();
        if (item.getProductId() == productID) {
            iterator.remove();
        }
    }
}
     public void Update(int productQuantity){
         for (LineItem item: getCartItems()){
             item.setItemQuantity(productQuantity);
         }
    
     }
     
     public LineItem getLineItemByProductID(int productID) {
    for (LineItem item : getCartItems()) {
        if (item.getProductId() == productID) {
            return item;
        }
    }
    // If no matching LineItem is found, return null or throw an exception based on your requirements
    return null;
}
     // used for update quantity in cart.jsp 
    public void addMoreProduct(int productID, int productQuantity) {
    Iterator<LineItem> iterator = getCartItems().iterator();
     
    while (iterator.hasNext()) {
        LineItem item = iterator.next();
        if (item.getProductId() == productID) {
            // If the product ID matches, update the quantity
            item.setItemQuantity(productQuantity);
            // Assuming item.getProductPrice() returns the unit price of the product
     
        }
    }
    LineItem itemNewPrice = getLineItemByProductID(productID);
    itemNewPrice.setItemTotalPrice(itemNewPrice.getItemTotalPrice() * itemNewPrice.getItemQuantity());
    
}

     //noticed when clicking add to basket again after going back to home page lineitem cloned this deals with it ruthlessly
public void cloneKiller(List<LineItem> list) {
    Map<Integer, LineItem> productMap = new HashMap<>();



    Iterator<LineItem> iterator = list.iterator();
    while (iterator.hasNext()) {
        LineItem item = iterator.next();
        int productId = item.getProductId();

        if (productMap.containsKey(productId)) {
            // If the product ID already exists, merge quantities and update total price
            LineItem existingItem = productMap.get(productId);
            existingItem.setItemQuantity(existingItem.getItemQuantity() + item.getItemQuantity());
            
            // Update total price based on the merged quantity
            double mergedTotalPrice = existingItem.getItemTotalPrice() + item.getItemTotalPrice();
            existingItem.setItemTotalPrice(mergedTotalPrice);
            
            iterator.remove(); // Remove the current item from the original list
        } else {
            // If the product ID doesn't exist, add it to the map
            productMap.put(productId, item);
        }
    }
}

    // Convert the values of the map (merged LineItems) to a list

     
     public void AddToBasket(LineItem lineItem){
         getCartItems().add(lineItem);
     }
     
     public void ClearCart(){
         getCartItems().clear();
     }
   

    /**
     * @return the cartItems
     */
    public List<LineItem> getCartItems() {
        return cartItems;
    }

    /**
     * @param cartItems the cartItems to set
     */
    public void setCartItems(List<LineItem> cartItems) {
        this.cartItems = cartItems;
    }
    
       /**
     * @return the cartPrice
     */
    public double getCartPrice() {
        return cartPrice;
    }

    /**
     * @param cartPrice the cartPrice to set
     */
    public void setCartPrice(double cartPrice) {
        this.cartPrice = cartPrice;
    }
    


}
