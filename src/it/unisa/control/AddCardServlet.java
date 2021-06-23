package it.unisa.control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.CardBean;
import it.unisa.model.CardDAO;
import it.unisa.model.UserBean;

/**
 * Servlet implementation class AddCardServlet
 */
@WebServlet("/AddCardServlet")
public class AddCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CardBean card = new CardBean();
		
		card.setCodice(request.getParameter("codice"));
		card.setRetro(request.getParameter("retro"));
		System.out.println("OCAZ " + request.getParameter("scadenza"));
		card.setScadenza(Date.valueOf(request.getParameter("scadenza")));
		
		CardDAO.addCard(card, (UserBean) request.getSession().getAttribute("currentSessionUser"));
		
		response.sendRedirect("ConfirmOrderPage.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
