<%
    String roleName = (String) session.getAttribute("roleName");
    if (roleName == null || !"admin".equalsIgnoreCase(roleName)) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
    String displayName = (String) session.getAttribute("displayName");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../components/header-config.html" %>
    <title>SilverCare | Admin Dashboard</title>
</head>
<body style="background-color: #F5F5F5;">

    <%-- TODO LATER: add session / role check here when backend is ready --%>
    <%-- 
    String roleName = (String) session.getAttribute("roleName");
    if (roleName == null || !"admin".equalsIgnoreCase(roleName)) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
    --%>

    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <div class="container mt-5 mb-5">
        <div class="row mb-4">
            <div class="col-12">
                <h2 style="font-weight: 700; color: #1D3142;">Admin Dashboard</h2>
                <p class="text-muted">
                    Use the panels below to manage care services and registered users.
                </p>
            </div>
        </div>

        <div class="row g-4">
            <!-- Manage Services card -->
            <div class="col-md-6">
                <div class="card shadow-sm" style="border-radius: 16px;">
                    <div class="card-body">
                        <h5 class="card-title">Manage Services</h5>
                        <p class="card-text" style="font-size: 14px;">
                            Create, view, update, and remove caregiving services and pricing details.
                        </p>
                        <button class="btn"
                                style="background-color:#2C2C2C; color:white;"
                                onclick="window.location.href='<%= request.getContextPath() %>/pages/adminServices.jsp'">
                            Go to Services
                        </button>
                    </div>
                </div>
            </div>

            <!-- Manage Users card -->
            <div class="col-md-6">
                <div class="card shadow-sm" style="border-radius: 16px;">
                    <div class="card-body">
                        <h5 class="card-title">Manage Users</h5>
                        <p class="card-text" style="font-size: 14px;">
                            View and manage registered client accounts.
                        </p>
                        <button class="btn"
                                style="background-color:#2C2C2C; color:white;"
                                onclick="window.location.href='<%= request.getContextPath() %>/pages/adminUsers.jsp'">
                            Go to Users
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../components/footer.html" %>
</body>
</html>
