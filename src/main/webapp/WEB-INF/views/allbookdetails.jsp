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
				<li>
					<form method="post" name="frm" action="doSearch">
						<table border="0" align="center"">
							<tr>
								<td><input type="text" name="searchText"
									placeholder="Search for Books" id="text"></td>
								<td colspan=2 align="center"><input type="submit"
									name="submit" value="Search"></td>
							</tr>
						</table>
					</form>
				</li>
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
			<h3>Books List Details</h3>
			<c:if test="${!empty listBooks}">
				<table>
					<c:forEach items="${listBooks}" var="book">
						<p></p>
						<table style="border: 1px solid grey; background-color: #f2f3f4">
							<tr>
								<td width="120">Book Name:</td>
							</tr>
							<tr>
								<td width="120" style="background-color: White; color: #229954;">${book.bookName}</td>
							</tr>
							<tr>
								<td width="120">Author Name:</td>
							</tr>
							<tr>
								<td width="120" style="background-color: White; color: blue;">${book.bookAuthor}</td>
							</tr>
							<tr>
								<td width="120">Date:</td>
							</tr>
							<tr>
								<td width="120" style="background-color: White; color: red;">${book.bookDate}</td>
							</tr>
							<tr>
								<img src="/SpringMVCHibernate/view/image?id=${book.id}"
									height="200" width="250" />
							</tr>
							<tr>
								<td width="120">Content:</td>
							</tr>
							<tr>
								<td width="900" style="background-color: White; color: black;"
									height="100%" width="100%">${book.content}</td>
							</tr>

						</table>
						<p>
							<br>
						</p>
						<br>
					</c:forEach>
				</table>
			</c:if>
		</article>

		<footer>
			<h6>© 2016 Sanjeev's page</h6>
		</footer>
	</div>
</body>
</html>