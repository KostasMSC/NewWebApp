<%@ page import="java.sql.*,java.util.Random,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Statistics</title>
</head>
<body>
	<%

out.println("Your Statistics are reset to zero!");

Connection conn;

try {
	// obtain a connection to the DB, use DB driver, URL, credentials

	String connURL = "jdbc:mysql://172.22.0.1:3308/PAGE_VISITS";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(connURL, "root", "helloworld");

	/*
	 * reset the DB
	 */
	Statement stmt0 = conn.createStatement();

	stmt0.executeUpdate("TRUNCATE PAGE_VISITS");

	/*
	 * release resources
	 */
	stmt0.close();

	conn.close();
} catch (SQLException e) {
	e.printStackTrace();
} catch (InstantiationException e) {
	e.printStackTrace();
} catch (IllegalAccessException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
%>

</body>
</html>