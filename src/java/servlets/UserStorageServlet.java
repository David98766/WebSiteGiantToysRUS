/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import dao.UserDAO;
import dao.dBActions;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user;

/**
 *
 * @author I586662
 */
@WebServlet(name = "UserStorageServlet", urlPatterns = {"/UserStorageServlet"})
public class UserStorageServlet extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // display the users to the admin
        String action = request.getParameter("action");
        
        UserDAO userdao = new UserDAO();
        
        if ("UserShow".equals(action)){
            
             ArrayList<user> userList = new ArrayList();
             
             userList = userdao.getAllUsers();
             
             request.setAttribute("UserList", userList);
             
             RequestDispatcher rd = request.getRequestDispatcher("editUser.jsp");
             rd.forward(request, response);
        }
    }
       

    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //used in sign up to create a user
       String firstName = request.getParameter("firstNameInput");
       String lastName = request.getParameter("lastNameInput");
       String email = request.getParameter("emailInput");
       String phoneNumber = request.getParameter("phoneInput");
       String password = request.getParameter("passwordInput");
       String confirmPassword = request.getParameter("confirmPasswordInput");



        
        if (firstName == null){
            RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");// if fail to find user then reload page and show a message saying why
                rd.forward(request, response);
        }
        
        if (!password.equals(confirmPassword)){
            
              request.setAttribute("incorrectPassword", "Passwords do not Match");// this is a custom message we cab show 
                RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");// if fail to find user then reload page and show a message saying why
                rd.forward(request, response);
        }
        
        LocalDate today = LocalDate.now();
        java.sql.Date sqlDate = java.sql.Date.valueOf(today);
        
        user createUser = new user(firstName, lastName, email, phoneNumber, password, sqlDate, false, false);
        UserDAO udao = new UserDAO();
        udao.Create(createUser);
        
        response.sendRedirect("Login.jsp");
}
}
