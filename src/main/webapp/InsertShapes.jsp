<%@ page import="java.sql.*,java.util.Random,java.io.*"%>
			<%
				// shape names
// 				String shape = this.getClass().getSimpleName().replaceFirst("_jsp", "");
				String shape = request.getParameter("shapeName");

				Connection conn;

				try {
					// obtain a connection to the DB, use DB driver, URL, credentials
					String connURL = "jdbc:mysql://localhost:3306/page_visits";
					Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(connURL, "exercise1", "exEr(1se$");

					Statement stmt0 = conn.createStatement();

					// add the corresponding shape into the DB along with timestamp
					stmt0.executeUpdate("INSERT INTO PAGE_VISITS (SHAPE, TS) VALUES ('" + shape + "', NOW())");

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