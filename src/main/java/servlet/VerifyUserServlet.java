package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.UserManager;
import util.OperationResponse;

import java.io.IOException;

/**
 * Servlet implementation class VerifyUserServlet
 */
@WebServlet("/verify-user")
public class VerifyUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		var operationResponse = UserManager.loginUser(new User(username, password));
		
		var session = request.getSession();

		Boolean registerCompleteStatus = operationResponse.getSuccess();
		session.setAttribute("loginSuccess", registerCompleteStatus);
		
		
		if(registerCompleteStatus) {
			session.setAttribute("username", username);
		} else {
			session.setAttribute("errorMessage", operationResponse.getMessage());
		}
		response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	}

}
