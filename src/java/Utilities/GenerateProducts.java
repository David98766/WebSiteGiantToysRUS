/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilities;

import dao.dBActions;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import model.StuffedAnimal;
import model.boardGame;
import model.paymentDetails;
import model.product;

/**
 *
 * @author I586662
 */
public class GenerateProducts extends HttpServlet {
    
     @Override
    public void init() throws ServletException {
        super.init();

            
        dBActions dbaction = new dBActions();

        
        paymentDetails receipt1 = new paymentDetails();
        receipt1.setUserID(1);
        receipt1.setPaymentID(1);
        receipt1.setItemID(1);
        receipt1.setItemName("Giant Panda Bear");
        receipt1.setItemQuantity(2);
        receipt1.setItemPrice(50.00);
        
        paymentDetails receipt2 = new paymentDetails();
        receipt2.setUserID(1);
        receipt2.setPaymentID(1);
        receipt2.setItemID(4);
        receipt2.setItemName("Extra Massive Giraffe");
        receipt2.setItemQuantity(1);
        receipt2.setItemPrice(28.00);
        
        paymentDetails receipt3 = new paymentDetails();
        receipt3.setUserID(2);
        receipt3.setPaymentID(2);
        receipt3.setItemID(8);
        receipt3.setItemName("Huge Connect Four");
        receipt3.setItemQuantity(1);
        receipt3.setItemPrice(80.00);
        
        paymentDetails receipt4 = new paymentDetails();
        receipt4.setUserID(2);
        receipt4.setPaymentID(2);
        receipt4.setItemID(10);
        receipt4.setItemName("Jelly Jinga");
        receipt4.setItemQuantity(1);
        receipt4.setItemPrice(110.00);
        
        paymentDetails receipt5 = new paymentDetails();
        receipt5.setUserID(1);
        receipt5.setPaymentID(1);
        receipt5.setItemID(7);
        receipt5.setItemName("Giant Chess");
        receipt5.setItemQuantity(2);
        receipt5.setItemPrice(120.00);
     
        
        dbaction.Create(receipt1);
        dbaction.Create(receipt2);
        dbaction.Create(receipt3);
        dbaction.Create(receipt4);
        dbaction.Create(receipt5);
    
        

        
}
}