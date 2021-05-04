package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public interface ProductModel {
	public void doSave(ProductBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ProductBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException;
}
