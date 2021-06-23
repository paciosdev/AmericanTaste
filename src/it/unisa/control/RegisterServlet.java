package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;
import javax.servlet.annotation.*;
@WebServlet("/Register")

/**
 * Servlet implementation class LoginServlet
 */
public class RegisterServlet extends HttpServlet {


/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {

try
{	    

     UserBean user = new UserBean();
     user.setUserName(request.getParameter("username"));
     user.setEmail(request.getParameter("email"));
     user.setPassword(request.getParameter("password"));
     user.setFirstName(request.getParameter("firstName"));
     user.setLastName(request.getParameter("lastName"));
	 user.setCf(request.getParameter("cf"));
     user.setRegione(request.getParameter("regione"));
	 user.setProvincia(request.getParameter("provincia"));
	 user.setCitta(request.getParameter("citta"));
	 user.setCivico(Integer.parseInt(request.getParameter("civico")));
	 
	 
	 user = UserDAO.register(user);
	   		    
     if (user.isValid())
     {
          HttpSession session = request.getSession(true);	    
          session.setAttribute("currentSessionUser",user); 
          response.sendRedirect("ProductView.jsp"); //home page    		
     } else {
         response.sendRedirect("RegisterPage.jsp"); //register page    		

     }
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }
	}
