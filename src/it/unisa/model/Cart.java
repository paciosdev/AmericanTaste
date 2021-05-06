package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public double getTotalPrice(){
		double total = 0.0;
		
		for(ProductBean p : products) {
			total += p.getPrice();
		}
		
		return total;
	}
	
	
	
	public void addProduct(ProductBean product) {
		
		boolean trovato = false;
		
		for(ProductBean p : products) {
			if(p.getName().equals(product.getName())) {
				p.incrementOccurrencies();
				trovato = true;
			}
		}
		
		if (!trovato) products.add(product);
		
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				prod.decrementOccurrencies();
				
				if (prod.getOccurrencies() == 0) {
					products.remove(prod);
				}
				break;
			}
		}
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
}
