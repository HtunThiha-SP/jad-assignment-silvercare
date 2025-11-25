<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.UserManager" %>
<%@ page import="dto.UserUpdateDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Profile</title>
</head>
<body>
	<jsp:include page="../components/sessionTimeout.jsp"></jsp:include>
	<jsp:include page="../components/navBar.jsp"></jsp:include>
	<%
	    HttpSession currentSession = request.getSession(false);
	
	    if (currentSession == null || currentSession.getAttribute("userId") == null) {
	        return;
	    }
	
	    Integer sessionUserId = (Integer) currentSession.getAttribute("userId");
	    UserUpdateDto currentUser = UserManager.getUserProfileInfo(sessionUserId);
	
	    String username = currentUser.username();
	    String displayName = currentUser.displayName();
	    String email = currentUser.email();
	%>
    <div class="container mt-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-4">
            </div>
            <div class="col-5">
                <div class="card p-4 shadow-sm">
                   	<form action="<%= request.getContextPath() %>/update-user-profile" method="post">
                        <h5 class="mb-3"><i class="bi bi-info-circle-fill"></i>&ensp;Personal Information</h5>
                        <div class="mb-3">
                            <label class="form-label"><i class="bi bi-person-circle"></i>&ensp;Username</label>
                            <input type="text" class="form-control update-profile-input-field" name="username" value="<%= username %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="bi bi-person-badge"></i>&ensp;Display Name</label>
                            <input type="text" class="form-control update-profile-input-field" name="displayName" value="<%= displayName %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="bi bi-envelope-at-fill"></i>&ensp;Email</label>
                            <input type="email" class="form-control update-profile-input-field" name="email" value="<%= email %>" required>
                        </div>

                        <div class="d-flex gap-2 mb-4">
                            <button type="submit" id="update-profile-button" class="btn btn-primary w-50" disabled>Update Profile</button>
                        </div>
                    </form>
                    <form action="<%= request.getContextPath() %>/logout" method="post">
                        <button type="submit" class="btn btn-danger w-50"><i class="bi bi-box-arrow-left"></i>&ensp;Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="../components/footer.html" %>
    <script>
        const updateProfileInputFields = document.querySelectorAll(".update-profile-input-field");
        updateProfileInputFields.forEach(inputField => {
            inputField.addEventListener("keypress", (event) => {
                document.getElementById("update-profile-button").disabled = false;
            });
        });
    </script>
</body>
</html>