package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

public class CardDAO {
	static Connection currentCon = null;
	   static ResultSet rs = null; 
	   
	   public static synchronized ArrayList<CardBean> doRetrieveAll(String cf) throws SQLException {
		    Connection currentCon = null;
			PreparedStatement preparedStatement = null;

			ArrayList<CardBean> cards = new ArrayList<CardBean>();

			String selectSQL = "SELECT * FROM credit_card WHERE user = '" + cf + "'";

			System.out.println(selectSQL);
			try {
				currentCon = DriverManagerConnectionPool.getConnection();
				preparedStatement = currentCon.prepareStatement(selectSQL);

				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					CardBean bean = new CardBean();
					
					System.out.println("CHEST CA " + rs.getDate("scadenza"));
					
					bean.setCodice(rs.getString("codice"));
					bean.setScadenza(rs.getDate("scadenza"));
					bean.setRetro(rs.getString("retro"));

					cards.add(bean);
				}

			}catch(Exception e){
				e.printStackTrace();
				cards = null;
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
			return cards;
		}
	   
	   
	   static public void addCard(CardBean card, UserBean user) {
	   	   
		   try {
			     Connection currentCon = DriverManagerConnectionPool.getConnection();
			     
		         currentCon.setAutoCommit(false);
		         
		  		 PreparedStatement preparedStatement = null;
		  		 
		         String sql = "INSERT INTO credit_card VALUES (?,?,?,?)";
		         preparedStatement = currentCon.prepareStatement(sql);
		         
		         preparedStatement.setString(1, card.getCodice());
		         preparedStatement.setString(2, card.getRetro());
		         preparedStatement.setDate(3, card.getScadenza());
		         preparedStatement.setString(4, user.getCf());
		         
		         int changed = preparedStatement.executeUpdate();
		         currentCon.commit();
		         
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
		   
		   
	   }
}
