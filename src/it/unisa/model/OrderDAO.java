package it.unisa.model;

import java.text.*;
import java.util.*;
import java.sql.*;

public class OrderDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
	
   static public void addOrder(Cart cart, UserBean user) {
	   
	   try {
		     Connection currentCon = DriverManagerConnectionPool.getConnection();
	         currentCon.setAutoCommit(false);
	         
	  		 PreparedStatement preparedStatement = null;
	  		 
	         
	         for(ProductBean prod : cart.getProducts()) {
	  		   
	  		   String insertQuery = "INSERT INTO contains VALUES (?,?,?,?,?)";
	  		   
		       preparedStatement=currentCon.prepareStatement(insertQuery);
		       
		       System.out.println("Prezzo " + prod.getPrice());

		       preparedStatement.setDouble(2, prod.getPrice());
		       preparedStatement.setDouble(3, prod.getIva());
		       preparedStatement.setInt(4, prod.getOccurrencies());
	  		   preparedStatement.setString(5, user.getCf());
	  		   preparedStatement.setInt(6, prod.getCode());

	  		 int changed = preparedStatement.executeUpdate();
	  		 System.out.print("Aggiu mis " + changed);
	         currentCon.commit();
	  	   }
	         
	   } catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   
   }
}

