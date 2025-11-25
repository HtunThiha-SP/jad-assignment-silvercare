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
 * Servlet implementation class UpdateUserProfileServlet
 */
@WebServlet("/update-user-profile")
public class UpdateUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String displayName = request.getParameter("displayName");
		String email = request.getParameter("email");
		var session = request.getSession();
		String oldUsername = (String) session.getAttribute("username");
		
		User updatedUser = new User(username, email, displayName);
		
		OperationResponse operationResponse = UserManager.updateUserProfileInfo(updatedUser, oldUsername);
		
		Boolean registerCompleteStatus = operationResponse.getSuccess();
		
		if(registerCompleteStatus) {
			session.setAttribute("username", username);
		} else {
			session.setAttribute("errorMessage", operationResponse.getMessage());
		}
		response.sendRedirect(request.getContextPath() + "/pages/profile.jsp");
	}

}
