<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="container mt-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-4">
            </div>
            <div class="col-5">
                <div class="card p-4 shadow-sm">
                    <form action="<%= request.getContextPath() %>/logout" method="post">
                        <button type="submit" class="btn btn-danger w-50"><i class="bi bi-box-arrow-left"></i>&ensp;Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="../components/footer.html" %>
</body>
</html>