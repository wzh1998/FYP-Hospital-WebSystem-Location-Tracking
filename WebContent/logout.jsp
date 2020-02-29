<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.EEEN3010J.UserDAO" %>
<%@ page import="ie.ucd.EEEN3010J.User" %>
    
    
<%
User u = (User) session.getAttribute("user");

if(u==null){
	response.sendRedirect("index.html");
}
else{
	session.invalidate();
	response.sendRedirect("index.html");
}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
function alertSucceed(){
	alert("Log Out Successful!");
	window.document.location.href="index.jsp";
}
function alertFailed(){
	alert("Log Out Failed! Fetal Error!");
}
</script>

<title>Whoops! </title>
</head>
<body>
<script type="text/javascript">alertFailed();</script>
</body>
</html>