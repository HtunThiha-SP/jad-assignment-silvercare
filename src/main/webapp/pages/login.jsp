<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Login</title>
</head>
<body style="background-color: #1D3142;">
	<style>
		#register-text:hover {
			cursor: pointer;
			text-decoration: underline;
		}
	</style>
	<%
		Boolean loginSuccess = (Boolean) session.getAttribute("loginSuccess");
		String notificationBgColor = "#1D3142";
		String notificationMessage = "";
		if(loginSuccess != null) {
			if(loginSuccess) {
				notificationBgColor = "green";
				notificationMessage = "<i class=\"bi bi-arrow-up-right-square-fill\"></i>&ensp;Login successful. Redirecting...";

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
			session.removeAttribute("loginSuccess");
		}
	%>
    <div class="container mt-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 col-lg-5 col-xl-4 mb-4">
                <div class="card p-4">
                    <h2 class="text-center">Login</h2>
                    <form action="<%= request.getContextPath() %>/verify-user" method="post">
                        <div class="mb-3">
                            <label for="text" class="form-label"><i class="bi bi-person-circle"></i>&ensp;Username</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><i class="bi bi-person-fill-lock"></i>&ensp;Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                        </div>
                        <div style="height: 10px;"></div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                        <p class="mt-3">New to SilverCare? <i id="register-text" style="color: blue;"
                        	onclick="window.location.href='./register.jsp'"
                        >Create an account</i></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
	<div class="mt-3" style="
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