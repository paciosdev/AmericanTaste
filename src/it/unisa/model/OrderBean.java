package it.unisa.model;

public class OrderBean {
	private int orderId;
	private String userId;
	private java.sql.Date dataOrdine;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public java.sql.Date getDataOrdine() {
		return dataOrdine;
	}
	public void setDataOrdine(java.sql.Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	
	
	
}
