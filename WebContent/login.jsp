<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.EEEN3010J.UserDAO" %>
<%@ page import="ie.ucd.EEEN3010J.User" %>
    
<script>
function alertFailed(){
	alert("Wrong Username or Password. Please Try Again!");
	window.document.location.href="index.html";
}
</script> 
<%
String username = request.getParameter("usrName");
String password = request.getParameter("usrPwd");

// Debug Code
/* out.print(username);
out.print(password); */

User u = UserDAO.login(username, password);

if(u==null){ 
	
}else{
	session.setAttribute("user", u);
	response.sendRedirect("overview.jsp");
}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Whoops! </title>
</head>
<body>

<script type="text/javascript">alertFailed();</script>
<%-- <%response.sendRedirect("index.jsp"); %> --%>
</body>
</html>