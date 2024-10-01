/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author I586662
 */
//Logic of how user works
public class user {



   
    private int userID;
    private String fName;
    private String lName;
    private String cEmail;
    private String cDeliveryAddress;
    private String cDeliveryAddress2;
    private String cCountry;
    private String cCity;
    private String cProvince;
    private String cZipCode;
    private String cPhoneNumber;
    private String cPassword;
    private boolean isLoggedIN;
    private Date registerDate;
    private boolean isManager;
    private String cCreditCardNumber;
    private String cCreditCardName;
    private Date cCardExpiryDate;
    private boolean userDisable;
    private boolean rememberMe;
    
    public  user(){
        
    }
   
    public user(int userID, String fName, String lName, String cEmail, String cDeliveryAddress, String cDeliveryAddress2, String cCountry, String cCity, String cProvince, String cZipCode, String cPhoneNumber, String cPassword, boolean isLoggedIN, Date registerDate, boolean isManager, String cCreditCardNumber, String cCreditCardName, Date cCardExpiryDate) {
        this.userID = userID;
        this.fName = fName;
        this.lName = lName;
        this.cEmail = cEmail;
        this.cDeliveryAddress = cDeliveryAddress;
        this.cDeliveryAddress2 = cDeliveryAddress2;
        this.cCountry = cCountry;
        this.cCity = cCity;
        this.cProvince = cProvince;
        this.cZipCode = cZipCode;
        this.cPhoneNumber = cPhoneNumber;
        this.cPassword = cPassword;
        this.isLoggedIN = isLoggedIN;
        this.registerDate = registerDate;
        this.isManager = isManager;
        this.cCreditCardNumber = cCreditCardNumber;
        this.cCreditCardName = cCreditCardName;
        this.cCardExpiryDate = cCardExpiryDate;
    }
    //construcor for when making users in UserDAO
    public user(int userId, String fName, String lName, boolean isManager, String cPassword, String cEmail){
        this.userID = userId;
        this.fName = fName;
        this.lName = lName;
        this.isManager = isManager;
        this.cPassword = cPassword;
        this.cEmail = cEmail;
    }
    //for when signing up
    public user(String fName, String lName, String cEmail, String cPhoneNumber, String cPassword, Date registerDate, boolean isManager, boolean userDisable){
       
        this.fName = fName;
        this.lName = lName;
        this.cEmail = cEmail;
        this.cPhoneNumber = cPhoneNumber;
        this.cPassword = cPassword;
        this.registerDate = registerDate;
        this.isManager = isManager;
        this.userDisable = userDisable;
    }
   
   

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * @return the fName
     */
    public String getfName() {
        return fName;
    }

    /**
     * @param fName the fName to set
     */
    public void setfName(String fName) {
        this.fName = fName;
    }

    /**
     * @return the lName
     */
    public String getlName() {
        return lName;
    }

    /**
     * @param lName the lName to set
     */
    public void setlName(String lName) {
        this.lName = lName;
    }
        public String getCEmail() {
        return cEmail;
    }

   
    public void setCEmail(String cEmail) {
        this.cEmail = cEmail;
    }


      public String getcDeliveryAddress2() {
        return cDeliveryAddress2;
    }

    /**
     * @param cDeliveryAddress2 the cDeliveryAddress2 to set
     */
    public void setcDeliveryAddress2(String cDeliveryAddress2) {
        this.cDeliveryAddress2 = cDeliveryAddress2;
    }

    /**
     * @return the cCountry
     */
    public String getcCountry() {
        return cCountry;
    }

    /**
     * @param cCountry the cCountry to set
     */
    public void setcCountry(String cCountry) {
        this.cCountry = cCountry;
    }

    /**
     * @return the cCity
     */
    public String getcCity() {
        return cCity;
    }

    /**
     * @param cCity the cCity to set
     */
    public void setcCity(String cCity) {
        this.cCity = cCity;
    }

    /**
     * @return the cProvince
     */
    public String getcProvince() {
        return cProvince;
    }

    /**
     * @param cProvince the cProvince to set
     */
    public void setcProvince(String cProvince) {
        this.cProvince = cProvince;
    }

    /**
     * @return the cZipCode
     */
    public String getcZipCode() {
        return cZipCode;
    }

    /**
     * @param cZipCode the cZipCode to set
     */
    public void setcZipCode(String cZipCode) {
        this.cZipCode = cZipCode;
    }

    /**
     * @return the cDeliveryAddress
     */
    public String getcDeliveryAddress() {
        return cDeliveryAddress;
    }

    /**
     * @param cDeliveryAddress the cDeliveryAddress to set
     */
    public void setcDeliveryAddress(String cDeliveryAddress) {
        this.cDeliveryAddress = cDeliveryAddress;
    }

    /**
     * @return the cPhoneNumber
     */
    public String getcPhoneNumber() {
        return cPhoneNumber;
    }

    /**
     * @param cPhoneNumber the cPhoneNumber to set
     */
    public void setcPhoneNumber(String cPhoneNumber) {
        this.cPhoneNumber = cPhoneNumber;
    }

    /**
     * @return the cPassword
     */
    public String getcPassword() {
        return cPassword;
    }

    /**
     * @param cPassword the cPassword to set
     */
    public void setcPassword(String cPassword) {
        this.cPassword = cPassword;
    }

    /**
     * @return the isLoggedIN
     */
    public boolean isIsLoggedIN() {
        return isLoggedIN;
    }

    /**
     * @param isLoggedIN the isLoggedIN to set
     */
    public void setIsLoggedIN(boolean isLoggedIN) {
        this.isLoggedIN = isLoggedIN;
    }

    /**
     * @return the registerDate
     */
    public Date getRegisterDate() {
        return registerDate;
    }

    /**
     * @param registerDate the registerDate to set
     */
    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    /**
     * @return the isManager
     */
    public boolean isIsManager() {
        return isManager;
    }

    /**
     * @param isManager the isManager to set
     */
    public void setIsManager(boolean isManager) {
        this.isManager = isManager;
    }
        /**
     * @return the userDisable
     */
    public boolean isUserDisable() {
        return userDisable;
    }

    /**
     * @param userDisable the userDisable to set
     */
    public void setUserDisable(boolean userDisable) {
        this.userDisable = userDisable;
    }

    /**
     * @return the rememberMe
     */
    public boolean isRememberMe() {
        return rememberMe;
    }

    /**
     * @param rememberMe the rememberMe to set
     */
    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }


    
}
