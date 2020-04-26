<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rhombus</title>
</head>
<body bgcolor="FEF9E7">
<font face="verdana">
	<h1>Hello!</h1>

	<p>
	<p>This is a <font color="red">Rhombus</font>.
	<p>
	<p>
	<svg height="150" width="150" xmlns="http://www.w3.org/2000/svg">
	  <polygon points="0,-50 -50,0 0,50 50,0" 
	  	style="fill:red;stroke:black;stroke-width:1" transform="translate(100 100)" />
	</svg>
	<jsp:include page='InsertShapes.jsp'>
	    <jsp:param name="shapeName" value="<%=this.getClass().getSimpleName().replaceFirst(\"_jsp\", \"\")%>" />
	</jsp:include>
</font>
</body>
</html>