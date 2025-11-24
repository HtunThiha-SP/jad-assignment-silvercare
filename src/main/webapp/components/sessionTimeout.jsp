<% 
	String sessionUsername = (String) session.getAttribute("username");
	if(sessionUsername == null) {
		session.invalidate();
		out.print("<script>alert('Session timed out. Please login again.');\n"
				+ "window.location.href='./login.jsp';</script>");
	}
%>