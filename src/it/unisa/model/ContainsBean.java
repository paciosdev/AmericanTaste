package it.unisa.model;

public class ContainsBean {
	
	private int orderId;
	private double prezzo;
	private double iva;
	private int quantita;
	private int product;
	private String productName;
	
	public void setProductName(String newName) {
		this.productName = newName;
	}
	
	public String getProductName(){
		return productName;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public double getIva() {
		return iva;
	}
	public void setIva(double iva) {
		this.iva = iva;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	public int getProduct() {
		return product;
	}
	public void setProduct(int product) {
		this.product = product;
	}	

}
