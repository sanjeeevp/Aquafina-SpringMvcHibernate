<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<table width="700px" align="center" style="border: 1px solid #000000;">
		<tr>
			<td colspan=4 align="center" style="background-color: teal"><b>User
					Record</b></td>
		</tr>
		<tr style="background-color: lightgrey;">
			<td><b>User Name</b></td>
			<td><b>Password</b></td>
			<td><b>Email</b></td>
			<td><b>Registration Date</b></td>
		</tr>
		<%
			int count = 0;
			String color = "#F9EBB3";
			if (request.getAttribute("piList") != null) {
				ArrayList al = (ArrayList) request.getAttribute("piList");
				System.out.println(al);
				Iterator itr = al.iterator();
				while (itr.hasNext()) {

					if ((count % 2) == 0) {
						color = "#eeffee";
					}
					count++;
					ArrayList pList = (ArrayList) itr.next();
		%>
		<tr style="background-color:<%=color%>;">
			<td><%=pList.get(0)%></td>
			<td><%=pList.get(1)%></td>
			<td><%=pList.get(2)%></td>
			<td><%=pList.get(3)%></td>
		</tr>
		<%
			}
			}
			if (count == 0) {
		%>
		<tr>
			<td colspan=4 align="center" style="background-color: #eeffee"><b>No
					Record Found..</b></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>