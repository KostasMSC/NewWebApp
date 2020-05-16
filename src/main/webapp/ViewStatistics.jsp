<%@ page import="java.sql.*,java.util.Random,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Statistics</title>
</head>
<body>
<%

Connection conn;

try {
	
	// obtain a connection to the DB, use DB driver, URL, credentials
	String connURL = "jdbc:mysql://172.19.0.1:3308/PAGE_VISITS";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	//conn = DriverManager.getConnection(connURL, "exercise1", "exEr(1se$");
	conn = DriverManager.getConnection(connURL, "root", "helloworld");
	
	Statement stmt0 = conn.createStatement();

	/*
	 * generate statistics
	 */
	Statement stmt1 = conn.createStatement();
	// calculate number of visits per shape
	ResultSet rs1 = stmt1
			.executeQuery("SELECT SHAPE, COUNT(*) NUM FROM PAGE_VISITS GROUP BY SHAPE ORDER BY SHAPE");
	
	Statement stmt2 = conn.createStatement();
	// calculate visit timestamps per shape
	ResultSet rs2 = stmt2.executeQuery("SELECT SHAPE, TS FROM PAGE_VISITS ORDER BY SHAPE asc ,TS asc");
	
	while (rs1.next()) {
		int num = rs1.getInt("NUM");
		out.println("<h3>" + rs1.getString("SHAPE") + ": " + num + " visit(s).</h3>");
		out.println("<ul>");
		for (int idx = 0; idx < num; idx++) {
			rs2.next();
			out.println("<li>" + rs2.getTimestamp("TS") + "</li>");
		}
		out.println("</ul>");
	}

	/*
	 * release resources
	 */
	stmt0.close();
	rs1.close();
	stmt1.close();
	rs2.close();
	stmt2.close();
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
