<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<body>
	<center>Welcome ${loggedInUser}</center>




	<div id="content">


		<p>Displaying table contents: </p>

		<table border="0" cellpadding="10">
			<thead>
			<tr>
				<th>Id</th>
				<th>Username</th>
				<th>Password</th>
				</tr>
			</thead>
			<tbody>


			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = null;
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/accounts", "root", "root");
				Statement stmt = null;
				stmt = conn.createStatement();
				String query = "select * from user";
				ResultSet rs = null;
				rs = stmt.executeQuery(query);
				while(rs.next()){
			%>
			<tr>
				<%
					int id = rs.getInt("id");
					String name = rs.getString("username");
					String password = rs.getString("password");

				%>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=password %></td>
			</tr>

			<%
				}
			%>

			</tbody>
		</table>
	</div>

</body>
</html>