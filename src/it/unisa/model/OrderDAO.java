package it.unisa.model;

import java.text.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.*;
import java.sql.*;
import java.sql.Date;

public class OrderDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
   
   public static synchronized ArrayList<OrderBean> doRetrieveAll(String cf) throws SQLException {
	    Connection currentCon = null;
		PreparedStatement preparedStatement = null;

		ArrayList<OrderBean> orders = new ArrayList<OrderBean>();

		String selectSQL = "SELECT * FROM ordine WHERE userId = '" + cf + "'";

		System.out.println(selectSQL);
		try {
			currentCon = DriverManagerConnectionPool.getConnection();
			preparedStatement = currentCon.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();
				
				bean.setOrderId(rs.getInt("orderId"));
				bean.setUserId(rs.getString("userId"));
				bean.setDataOrdine(rs.getDate("dataOrdine"));

				orders.add(bean);
			}

		}catch(Exception e){
			e.printStackTrace();
			orders = null;
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (currentCon != null)
					currentCon.close();
			}
		}
		return orders;
	}
   
   public static synchronized ArrayList<ProductBean> doRetrieveContains(String userId, String dataOrdine, int orderId) throws SQLException {
	    Connection currentCon = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "select * from ordine join contains on ordine.orderId = contains.orderId join product on contains.productId = product.id WHERE ordine.userId = '" +  userId + "' AND ordine.dataOrdine = '" + dataOrdine + "' AND ordine.orderId = " + orderId;

		System.out.println(selectSQL);
		try {
			currentCon = DriverManagerConnectionPool.getConnection();
			preparedStatement = currentCon.prepareStatement(selectSQL);


			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setCode(rs.getInt("product.id"));
				bean.setDescription(rs.getString("product.descrizione"));
				bean.setIva(rs.getFloat("contains.iva"));
				bean.setName(rs.getString("product.nome"));
				bean.setPrice(rs.getInt("contains.prezzo"));
				bean.setOccurrencies(rs.getInt("contains.quantita"));
				bean.setType(rs.getString("product.tipo"));
				
				products.add(bean);
			}

		}catch(Exception e){
			e.printStackTrace();
			products = null;
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (currentCon != null)
					currentCon.close();
			}
		}
		return products;
	}
	
   static public void addOrder(Cart cart, UserBean user) {
	   	   
	   try {
		     Connection currentCon = DriverManagerConnectionPool.getConnection();
		     
	         currentCon.setAutoCommit(false);
	         
	  		 PreparedStatement preparedStatement = null;
	  		 
	  		 //mi salvo l'ordine
	  		 
	  		 String insertQuery = "INSERT INTO ordine VALUES (?,?,?)";
	  		   
		       preparedStatement=currentCon.prepareStatement(insertQuery);
		       
		       int id = ThreadLocalRandom.current().nextInt(0, 999999999);

		       preparedStatement.setInt(1, id);
		       preparedStatement.setString(2, user.getCf());
	  		 java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
	  		 preparedStatement.setDate(3, date);

	  		 int changed = preparedStatement.executeUpdate();
	  		 
	  		 
	  		
	  		 
	  		 
	         
	         for(ProductBean prod : cart.getProducts()) {
	        	 
	        	 String sql = "INSERT INTO contains VALUES (?,?,?,?,?,?)";
	        	 
			     preparedStatement=currentCon.prepareStatement(sql);
			     
			     preparedStatement.setInt(1, id);
			     preparedStatement.setInt(2, prod.getCode());
			     preparedStatement.setInt(3, prod.getOccurrencies());
			     preparedStatement.setInt(4, prod.getPrice());
			     preparedStatement.setDouble(5, prod.getIva());
			     preparedStatement.setString(6, prod.getName());
			     
			     preparedStatement.executeUpdate();  	 
	        	 
	        	 System.out.println("sto facnedo UPDATE product set quantita = quantita - " + prod.getOccurrencies() + " where id = " + prod.getCode());
			     
	        	 String updateQuantity = "UPDATE product set quantita = quantita - " + prod.getOccurrencies() + " where id = " + prod.getCode();
		  		 preparedStatement = currentCon.prepareStatement(updateQuantity);
		  		 preparedStatement.executeUpdate();
		  		 
		         currentCon.commit();
	  		   
	  	   }
	         
	         
	         
	       
	         
	       
	         
	   } catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   
   }
   
   
}

