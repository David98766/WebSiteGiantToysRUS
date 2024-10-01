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
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import model.StuffedAnimal;
import model.boardGame;
import model.product;
import model.shoppingCart;
import model.user;

/**
 *
 * @author I586662
 */
@WebListener
public class SessionTrigger implements HttpSessionListener {
    
       @Override
    public void sessionCreated(HttpSessionEvent event) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        // Session destroyed (expired), add your code here
        HttpSession session = event.getSession();
        user User = (user) session.getAttribute("UserSession");
        shoppingCart basketToBeStored = (shoppingCart)session.getAttribute("basket");
        if (User != null && basketToBeStored != null){
            dBActions dbactions = new dBActions();
            dbactions.Create(basketToBeStored, User);
        }
        
    
        
        // Add your custom code here to execute when the session expires
    }
}
    

