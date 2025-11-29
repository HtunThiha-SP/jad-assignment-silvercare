package servlet;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserManager;

@WebServlet("/verify-user")
public class VerifyUserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VerifyUserLoginServlet() {
        super();
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        var loginResponse = UserManager.loginUser(username, password);
        HttpSession session = request.getSession();

        // store basic info for the JSP (especially for failed logins)
        session.setAttribute("loginSuccess", loginResponse.isSuccess());
        session.setAttribute("message", loginResponse.getMessage());

        // if login failed, just go back to login page
        if (!loginResponse.isSuccess()) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        // login success: extract data from responseData map
        Map<String, Object> data = (Map<String, Object>) loginResponse.getResponseData();

        Integer userId = (Integer) data.get("userId");
        String displayName = (String) data.get("displayName");
        String roleName = (String) data.get("roleName"); // <-- we’ll add this in backend

        session.setAttribute("userId", userId);
        session.setAttribute("displayName", displayName);
        session.setAttribute("roleName", roleName);

        // redirect based on role
        if ("admin".equalsIgnoreCase(roleName)) {
            // admin goes to admin dashboard
            response.sendRedirect(request.getContextPath() + "/pages/adminDashboard.jsp");
        } else {
            // normal user goes to normal homepage
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}
