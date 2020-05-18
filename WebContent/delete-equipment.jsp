<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ie.ucd.EEEN3010J.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function alertSuccess(){
	alert("Equipment has been deleted successfully!");
	window.document.location.href="equipment-list.jsp";
}
function alertFailed(){
	alert("Unexpected error happened while delete equipment, try again and if still does not work, contact server admin.");
	window.document.location.href="equipment-list.jsp";
}
</script>
<title>Importing Equipment</title>
</head>
<body>
<%
/*  if(session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
}  */

String EquipID = request.getParameter("EquipID");


if(EquipmentDAO.deleteEquipment(EquipID)) %> <script type="text/javascript"> alertSuccess();</script>
<% else %> <script type="text/javascript">alertFailed();</script>
</body>
</html>