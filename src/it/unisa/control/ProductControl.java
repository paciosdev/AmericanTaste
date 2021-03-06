package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.unisa.model.ProductModel;
import it.unisa.model.ProductModelDM;
import it.unisa.model.ProductModelDS;
import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
/**
 * Servlet implementation class ProductControl
 */
@MultipartConfig
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			model = new ProductModelDM();
		}
	}
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean product = model.doRetrieveByKey(id);
					if (product.getOccurrencies() < product.getQuantity()) {
						cart.addProduct(model.doRetrieveByKey(id));
					}
					request.getSession().setAttribute("cart", cart);
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean product = model.doRetrieveByKey(id);
					if (product.getOccurrencies() > 0) {
						cart.deleteProduct(model.doRetrieveByKey(id));
					}
					request.getSession().setAttribute("cart", cart);
				} else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				} else if(action.equalsIgnoreCase("checkout")) {
					
				} else if (action.equalsIgnoreCase("insert")) {
					System.out.println("SI STO QUA insert");

					String name = request.getParameter("name");
					String description = request.getParameter("description");
					String type = request.getParameter("type");
					float iva = Integer.parseInt(request.getParameter("iva"));
					int price = Integer.parseInt(request.getParameter("price"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					
					ProductBean bean = new ProductBean();
					
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setType(type);
					bean.setIva(iva);
					bean.setQuantity(quantity);
					bean.setImage(request.getPart("image").getInputStream());
					model.doSave(bean);
				}
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		System.out.println("DEBUG: - " + action);
		
		if(action != null) {

			if(action.equalsIgnoreCase("deleteC") || action.equalsIgnoreCase("addC")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
				dispatcher.forward(request, response);
			}else if(action.equalsIgnoreCase("checkout")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginPage.jsp?action=checkout");
				//TODO 
				dispatcher.forward(request, response);
			}else{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
				dispatcher.forward(request, response);
			}
		
		} else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
