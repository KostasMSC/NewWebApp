<%@ page import="java.sql.*,java.util.Random,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Circle</title>
</head>
<body bgcolor="FEF9E7">
	<font face="verdana">
		<h1>Hello Tomcat Container</h1>

		<p>
		<p>
			This is a <font color="red">RED Circle</font>.
		<p>
		<p>
			<svg width="150" height="150" xmlns="http://www.w3.org/2000/svg">
    	<circle cx="75" cy="75" r="75"
					style="fill:red;stroke:black;stroke-width:1" />
	</svg>
	<jsp:include page='InsertShapes.jsp'>
	    <jsp:param name="shapeName" value="<%=this.getClass().getSimpleName().replaceFirst(\"_jsp\", \"\")%>" />
	</jsp:include>
		
	</font>
</body>
</html>