<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if("logout".equals(request.getParameter("logout"))){
	
	session.setAttribute("mobile_number",null);
	session.setAttribute("otp",null);
	session.setAttribute("user_id",null);
	session.setAttribute("first_name",null);
	
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="welcome.jsp" >

<input type="submit" name="logout" value="logout">
</form>
<h1>dhanybaad aapka swagt hai</h1>
</body>
</html>
<%=session.getAttribute("mobile_number") %><br>
<%=session.getAttribute("otp") %><br>
<%=session.getAttribute("user_id") %><br>
<%=session.getAttribute("first_name") %><br>

