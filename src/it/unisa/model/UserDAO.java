package it.unisa.model;

import java.text.*;
import java.util.*;
import java.sql.*;

public class UserDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
	
   public static UserBean doRetrieve(UserBean bean) {
	
      //preparing some objects for connection 
      Statement stmt = null;    
      PreparedStatement preparedStatement = null;
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
      
      String searchQuery =
            "select * from user where username='"
                     + username
                     + "' AND password='"
                     + password
                     + "'";
	    
   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("Your user name is " + username);          
   System.out.println("Your password is " + password);
   System.out.println("Query: "+searchQuery);
   
 
	    
   try 
   {
      //connect to DB 
      Connection currentCon = DriverManagerConnectionPool.getConnection();
      preparedStatement=currentCon.prepareStatement(searchQuery);
      rs = preparedStatement.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
         String firstName = rs.getString("FirstName");
         String lastName = rs.getString("LastName");
         String cf = rs.getString("cf");
	     	
         System.out.println("Welcome " + firstName);
         bean.setFirstName(firstName);
         bean.setLastName(lastName);
         bean.setCf(cf);
         bean.setValid(true);
         
         if (bean.getUsername().equalsIgnoreCase("admin") && bean.getPassword().equalsIgnoreCase("nimda")) {
        	 bean.setIsAdmin();
         }
         
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

return bean;
	
   }	

   public static void register(UserBean bean) {
	   Statement stmt = null;    
	      PreparedStatement preparedStatement = null;
		
	      String username = bean.getUsername();    
	      String password = bean.getPassword();
	      
	      String insertQuery =
	              "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?,?)";
	      
	      try 
	      {
	         //connect to DB 
	         Connection currentCon = DriverManagerConnectionPool.getConnection();
	         currentCon.setAutoCommit(false);
	         preparedStatement=currentCon.prepareStatement(insertQuery);
	         
	         preparedStatement.setString(1, bean.getUsername());
	         preparedStatement.setString(2, bean.getEmail());
	         preparedStatement.setString(3, bean.getPassword());
	         preparedStatement.setString(4, bean.getFirstName());
	         preparedStatement.setString(5, bean.getLastName());
	         preparedStatement.setString(6, bean.getCf());
	         preparedStatement.setString(7, bean.getRegione());
	         preparedStatement.setString(8, bean.getProvincia());
	         preparedStatement.setString(9, bean.getCitta());
	         preparedStatement.setInt(10, bean.getCivico());
	         
	         System.out.println(preparedStatement);
	         
	         int changed = preparedStatement.executeUpdate();
	         currentCon.commit();
	         
	         System.out.println("DEBUG: REGISTRATO -> Changed +" + changed);
	      } 

	      catch (Exception ex) 
	      {
	         System.out.println("Error " + ex);
	      } 
	   	    
	      //some exception handling
	      finally 
	      {
	         if (rs != null)	{
	            try {
	               rs.close();
	            } catch (Exception e) {}
	               rs = null;
	            }
	   	
	         if (stmt != null) {
	            try {
	               stmt.close();
	            } catch (Exception e) {}
	               stmt = null;
	            }
	   	
	         if (currentCon != null) {
	            try {
	               currentCon.close();
	            } catch (Exception e) {
	            }

	            currentCon = null;
	         }
	      }
   }
}

