<%
    String roleName = (String) session.getAttribute("roleName");
    if (roleName == null || !"admin".equalsIgnoreCase(roleName)) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
    String displayName = (String) session.getAttribute("displayName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../components/header-config.html" %>
<title>SilverCare | Admin Dashboard</title>
</head>
<body style="background-color: #F5F5F5;">
    <jsp:include page=".. 	/components/navBar.jsp"></jsp:include>

    <div class="container mt-5 mb-5">
        <div class="row mb-4">
            <div class="col-12">
                <h2 style="font-weight: 700; color: #1D3142;">Admin Dashboard</h2>
                <p class="text-muted">
                    Welcome, <strong><%= displayName != null ? displayName : "Admin" %></strong>.
                    Manage service categories, services, and users from here.
                </p>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card shadow-sm" style="border-radius: 16px;">
                    <div class="card-body">
                        <h5 class="card-title">Service Categories</h5>
                        <p class="card-text" style="font-size: 14px;">
                            View, add, edit, or remove service categories.
                        </p>
                        <button class="btn" style="background-color: #2C2C2C; color: white;"
                            onclick="window.location.href='<%= request.getContextPath() %>/admin/service-categories'">
                            Manage Categories
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm" style="border-radius: 16px;">
                    <div class="card-body">
                        <h5 class="card-title">Services</h5>
                        <p class="card-text" style="font-size: 14px;">
                            Maintain caregiving services, pricing, and durations.
                        </p>
                        <button class="btn" style="background-color: #2C2C2C; color: white;"
                            onclick="window.location.href='<%= request.getContextPath() %>/admin/services'">
                            Manage Services
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm" style="border-radius: 16px;">
                    <div class="card-body">
                        <h5 class="card-title">Users</h5>
                        <p class="card-text" style="font-size: 14px;">
                            Review registered clients and manage access.
                        </p>
                        <button class="btn" style="background-color: #2C2C2C; color: white;"
                            onclick="window.location.href='<%= request.getContextPath() %>/admin/users'">
                            Manage Users
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../../components/footer.html" %>
</body>
</html>
