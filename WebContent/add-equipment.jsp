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
	alert("Equipment has been imported successfully!");
	window.document.location.href="equipment-list.jsp";
}
function alertFailed(){
	alert("Failed! Department code does not exists.");
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
String EquipType = request.getParameter("EquipType");
String DeptOwns = request.getParameter("DeptOwns");

if(EquipmentDAO.insertEquipment(EquipID, EquipType, DeptOwns)) %> <script type="text/javascript"> alertSuccess();</script>
<% else %> <script type="text/javascript">alertFailed();</script>
</body>
</html>