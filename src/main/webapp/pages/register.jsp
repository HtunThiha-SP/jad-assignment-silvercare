<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		if (registerSuccess != null) {
			if (registerSuccess) {
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
            <div class="col-md-6 col-lg-5 mb-4">
                <div class="card p-4">
                    <h2 class="text-center">Register</h2>
                    <form action="<%= request.getContextPath() %>/register" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label"><i class="bi bi-person-circle"></i>&ensp;Username</label>
                            <input 
                                type="text" 
                                class="form-control" 
                                id="username" 
                                name="username" 
                                placeholder="Enter username" 
                                required
                                minlength="8"
                                maxlength="32"
                                pattern="^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$"
                                title="8-32 characters. Only letters, numbers, and single hyphens. Cannot start or end with a hyphen."
                            >
                            <small style="color: gray; font-size: 13px;">
        						Username may only contain alphanumeric characters or single hyphens, and cannot begin or end with a hyphen.
    						</small>
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
                            <input 
                                type="password" 
                                class="form-control" 
                                id="password" 
                                name="password" 
                                placeholder="Enter password" 
                                required
                                minlength="8"
                                title="Password must be at least 8 characters long."
                            >
                            <small style="color: gray; font-size: 13px;">
        						Password must be at least 8 characters long.
    						</small>
                        </div>
                        <div style="height: 10px;"></div>
                        <button type="submit" class="btn btn-primary w-100">Register account</button>
                        <p class="mt-3">Already have an account? 
                        	<i id="login-text" style="color: blue;" onclick="window.location.href='./login.jsp'">Login</i>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div style="
            position: fixed;
            bottom: 10px;
            padding-right: 15px;
            display: flex;
            justify-content: right;
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
