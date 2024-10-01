/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;


/**
 *
 * @author BEmerson
 */
public class DBCreationRunner extends HttpServlet{

    @Override
    public void init() throws ServletException {
        super.init();
        SetupDb sdb = new SetupDb();
        sdb.createTables();
        sdb.insertSetupData(); //To change body of generated methods, choose Tools | Templates.
        sdb.showData();// Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }


    
    
    
      
  

}
