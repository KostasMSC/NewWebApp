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
	<p>This is a <font color="red"><strike>Green</strike>Red Rhombus</font>.
	<p>
	<p>
	<svg width="200" height="100" xmlns="http://www.w3.org/2000/svg">
  		<polygon 
  			points="100,0 200,50 100,100 0,50" 
  			style="fill:red;stroke:black;stroke-width:1" 
  		/>
	</svg>
	<jsp:include page='InsertShapes.jsp'>
	    <jsp:param name="shapeName" value="<%=this.getClass().getSimpleName().replaceFirst(\"_jsp\", \"\")%>" />
	</jsp:include>
</font>
</body>
</html>