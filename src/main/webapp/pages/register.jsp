<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Register</title>
</head>
<body style="background-color: #1D3142;">
	<style>
		#login-text:hover {
			cursor: pointer;
			text-decoration: underline;
		}
	</style>
	<%
		Boolean registerSuccess = (Boolean) session.getAttribute("registerSuccess");
		String notificationBgColor = "#1D3142";
		String notificationMessage = "";
		if(registerSuccess != null) {
			if(registerSuccess) {
				notificationBgColor = "green";
				notificationMessage = "<i class=\"bi bi-arrow-up-right-square-fill\"></i>&ensp;Registration successful. Redirecting...";

				out.print("<script>");
				out.print("setTimeout(function() {");
				out.print("window.location.href = '" + request.getContextPath() + "/pages/index.jsp';");
				out.print("}, 1500);");
				out.print("</script>");
			} else {
				notificationBgColor = "red";
				String errorMessage = (String) session.getAttribute("errorMessage");
				notificationMessage = "<i class=\"bi bi-exclamation-triangle-fill\"></i>&ensp;" + errorMessage;
			}
			session.removeAttribute("registerSuccess");
		}
	%>
    <div class="container mt-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 col-lg-5 col-xl-4 mb-4">
                <div class="card p-4">
                    <h2 class="text-center">Register</h2>
                    <form action="<%= request.getContextPath() %>/register" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label"><i class="bi bi-person-circle"></i>&ensp;Username</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                        </div>
                        <div class="mb-3">
                            <label for="displayName" class="form-label"><i class="bi bi-person-badge"></i>&ensp;Display name (optional)</label>
                            <input type="text" class="form-control" id="displayName" name="displayName" placeholder="Enter display name">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="bi bi-envelope-at-fill"></i>&ensp;Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><i class="bi bi-person-fill-lock"></i>&ensp;Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                        </div>
                        <div style="height: 10px;"></div>
                        <button type="submit" class="btn btn-primary w-100">Register account</button>
                        <p class="mt-3">Already have an account? <i id="login-text" style="color: blue;"
                        	onclick="window.location.href='./login.jsp'"
                        >Login</i></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div style="
            position: fixed;
            bottom: 20;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
    ">
        <p style="
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            background-color: <%= notificationBgColor %>;
            color: white;
            font-size: 18px;
        ">&ensp;&ensp;<%= notificationMessage %>&ensp;&ensp;</p>
    </div>
</body>
</html>