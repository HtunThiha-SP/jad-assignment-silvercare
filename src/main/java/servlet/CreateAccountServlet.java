package servlet;

import model.User;
import service.UserManager;
import util.OperationResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class CreateAccountServlet
 */
@WebServlet("/register")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String displayName = request.getParameter("displayName");
		String password = request.getParameter("password");
		
		User newUser = new User(username, email, displayName, password);
		var operationResponse = UserManager.registerUser(newUser);
		var session = request.getSession();

		Boolean registerCompleteStatus = operationResponse.getSuccess();
		session.setAttribute("registerSuccess", registerCompleteStatus);
		
		
		if(registerCompleteStatus) {
			session.setAttribute("username", username);
		} else {
			session.setAttribute("errorMessage", operationResponse.getMessage());
		}
		response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
	}

}
