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
@WebServlet("/Login")

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {


/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {

try
{	    

	
	 String action = request.getParameter("action");
	 

     UserBean user = new UserBean();
     user.setUserName(request.getParameter("un"));
     user.setPassword(request.getParameter("pw"));
     
     user = UserDAO.doRetrieve(user);
     
    
     
     if (user.isValid())
     {
          HttpSession session = request.getSession(true);
          
          
          session.setAttribute("currentSessionUser",user); 
          
          
          if (action == null) {
        	  response.sendRedirect("ProductView.jsp");
          }
          
        	  request.setAttribute("action", "checkout");
        	  if (action.equalsIgnoreCase("checkout")) {
            	  response.sendRedirect("ConfirmOrderPage.jsp");   
              }
          
     }
	        
     else 
          response.sendRedirect("invalidLogin.jsp"); //error page 
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }
	}
