package it.unisa.model;

import java.io.InputStream;
import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	String description;
	int price;
	int quantity;
	int occurrencies;
	float iva;
	String type;
	InputStream image;

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}

	public float getPriceWithIva() {
		return price + price * (iva / 100);
	}
	
	public float getIva() {
		return iva;
	}
	
	public void setIva(float x) {
		this.iva=x;
	}

	public ProductBean() {
		code = -1;
		name = "";
		description = "";
		quantity = 0;
		occurrencies = 1;
	}
	
	public int getOccurrencies() {
		return occurrencies;
	}
	
	public void incrementOccurrencies() {
		occurrencies++;
	}
	
	public void setOccurrencies(int occurrencies) {
		this.occurrencies = occurrencies;
	}

	public void decrementOccurrencies() {
		occurrencies--;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return name + " (" + code + "), " + price + " " + quantity + ". " + description;
	}

}
