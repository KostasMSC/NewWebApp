<%@ page import="java.sql.*,java.util.Random,java.io.*"%>
			<%
				// shape names

				String shape = request.getParameter("shapeName");

				Connection conn;

			
				try {
					// obtain a connection to the DB, use DB driver, URL, credentials
					String connURL = "jdbc:mysql://172.22.0.1:3308/PAGE_VISITS";
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(connURL, "root", "helloworld");

					Statement stmt0 = conn.createStatement();

					// add the corresponding shape into the DB along with timestamp
					stmt0.executeUpdate("INSERT INTO PAGE_VISITS (SHAPE, TS) VALUES ('" + shape + "', NOW())");

					/*
					 * release resources
					 */
					stmt0.close();
					conn.close();
				} catch (SQLException e) {
					out.println("SQLException: " + e.getMessage());
				} catch (InstantiationException e) {
					out.println("InstantiationException: " + e.getMessage());
				} catch (IllegalAccessException e) {
					out.println("IllegalAccessException: " + e.getMessage());
				} catch (ClassNotFoundException e) {
					out.println("ClassNotFoundException: " + e.getMessage());
				}
			%>