/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilities;

import java.util.List;

/**
 *
 * @author I586662
 */
public class Validater {
    
    public static boolean checkFieldIsEmpty(List<String> fieldNames){
        
        boolean allFieldsFilled = false;
        for (String checkField: fieldNames){
            
            if (checkField == null || checkField.trim().isEmpty()){
                return false;
            }
        }
        return true;
        

    }
    
}
