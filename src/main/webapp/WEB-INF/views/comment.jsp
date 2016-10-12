<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Comment Page</title>
<style type="text/css">
nav {
	float: left;
	max-width: 260px;
	margin: 0;
	padding: 1em;
	color: blue;
	postion: fixed;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 2px solid black;
	margin-right: 170px;
	border-right: 2px solid black;
	padding: 1em;
	overflow: hidden;
	background-color: #EBF4FA;
	color: black;
	border-right: 2px solid black;
}

#page {
	margin: 0px;
	padding: 0px;
	background-color: #FFFFF5;
}

#logo {
	padding: 2px;
	color: purple;
	background-color: Red;
	position: relative;
	float: left;
}

header,footer {
	padding: 2px;
	color: #FFFF00;
	background-color: #5890ff;
	clear: left;
	text-align: center;
	postion: absolute;
}

.tg {
	color: black;
}
</style>
</head>
<body>
		<article>
			<h2 style="color: purple">Welcome to this page</h2>
			<br>
			<h1>Add a Comment</h1>

			<c:url var="addAction" value="/comment/add"></c:url>

			<form:form action="${addAction}" commandName="comment">
				<table class="tg">
					<c:if test="${!empty comment.commentText}">
						<tr>
							<td><form:label path="id">
									<spring:message text="Comment ID" />
								</form:label></td>
						</tr>
						<tr>
							<td><form:input path="id" readonly="true" size="8"
									disabled="true" /> <form:hidden path="id" /></td>
						</tr>
					</c:if>
					<tr>
						<td><form:label path="commentText">
								<spring:message text="Comment Text" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="commentText" /></td>
					</tr>
					<tr>
						<td colspan="2"><c:if test="${!empty comment.commentText}">
								<input type="submit"
									value="<spring:message text="Edit Comment"/>"
									style="color: white; background-color: #2ecc71; font-size: 14px; width: 100%; height: 70px;" />
							</c:if> <c:if test="${empty comment.commentText}">
								<input type="submit" value="<spring:message text="Add Comment"/>"
									style="color: white; background-color: #2ecc71; font-size: 14px; width: 100%; height: 70px;" />
							</c:if></td>
					</tr>
				</table>
			</form:form>
		</article>
</body>
</html>
