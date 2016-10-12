<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Book Page</title>
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
	<div id="page">
		<header>
			<div id="logo">
				<a href="<c:url value='/home'/>"> <img
					src="http://logos.textgiraffe.com/logos/logo-name/Mira-designstyle-summer-m.png"
					style="width: 70px; height: 71px;">
				</a>
			</div>
			<h1>Myrah's Page</h1>
		</header>
		<nav>
			<ul>
				<li><a style="color: green; font-size: 14;"
					href="<c:url value='/home'/>"> HOME </a></li>
				<li><a href="<c:url value='http://www.google.com' />">Google
						Search</a></li>
				<li><a href="#">London</a></li>
				<li><a href="#">Paris</a></li>
				<li><a href="#">Tokyo</a></li>
				<li><a href="<c:url value='/book/view/all' />">View all
						books details </a></li>
				<li><a href="<c:url value='/bookList' />">View a list of
						books</a></li>
				<li><a href="<c:url value='/books' />">Submit a book</a></li>
				<li><a href="<c:url value='/books' />">Submit contact
						information</a></li>
			</ul>
		</nav>
		<article>
			<h2 style="color: purple">Welcome to this page</h2>
			<br>
			<h1>Add a Book</h1>

			<c:url var="addAction" value="/book/addd"></c:url>

			<form:form enctype="multipart/form-data" action="${addAction}"
				commandName="book">
				<table class="tg">
					<c:if test="${!empty book.bookName}">
						<tr>
							<td><form:label path="id">
									<spring:message text="Book ID" />
								</form:label></td>
						</tr>
						<tr>
							<td><form:input path="id" readonly="true" size="8"
									disabled="true" /> <form:hidden path="id" /></td>
						</tr>
					</c:if>
					<tr>
						<td><form:label path="bookName">
								<spring:message text="Book Name" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="bookName" /></td>
					</tr>

					<tr>
						<td><form:label path="bookAuthor">
								<spring:message text="Author Name" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="bookAuthor" /></td>
					</tr>

					<tr>
						<td><form:label path="content">
								<spring:message text="Content" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="content" /></td>
					</tr>
					<!-- File upload -->
					<tr>
						<td>Pick file #1:</td>
						<td><input type="file" name="fileUpload" size="50" /></td>
					</tr>
					<!--  -->
					<tr>
						<td colspan="2"><c:if test="${!empty book.bookName}">
								<input type="submit" value="<spring:message text="Edit Book"/>"
									style="color: white; background-color: #2ecc71; font-size: 14px; width: 100%; height: 70px;" />
							</c:if> <c:if test="${empty book.bookName}">
								<input type="submit" value="<spring:message text="Add a Book"/>"
									style="color: white; background-color: #2ecc71; font-size: 14px; width: 100%; height: 70px;" />
							</c:if></td>
					</tr>
				</table>
			</form:form>
			<p>
				<br>
			</p>
			<h3>Books List</h3>

			<h4>
				To view the list of books, click <a
					href="<c:url value='/bookList' />">here</a>
			</h4>

		</article>

		<footer>
			<h6>© 2016 Sanjeev's page</h6>
		</footer>
	</div>
</body>
</html>
