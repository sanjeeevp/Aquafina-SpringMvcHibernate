<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Person Page</title>
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
			<h3>Person Details</h3>
			<table class="tg">
				<tr>
					<td width="120">First Name:</td>
					<td>${person.firstName}</td>
				</tr>
				<tr>
					<td width="120">Last Name:</td>
					<td>${person.lastName}</td>
				</tr>
				<tr>
					<td width="120">Address Line 1:</td>
					<td>${person.addressLine1}</td>
				</tr>
				<tr>
					<td width="120">Address Line 2:</td>
					<td>${person.addressLine2}</td>
				</tr>
				<tr>
					<td width="120">City Name:</td>
					<td>${person.cityName}</td>
				</tr>
				<tr>
					<td width="120">State Name:</td>
					<td>${person.stateName}</td>
				</tr>
				<tr>
					<td width="120">Zip Code:</td>
					<td>${person.zipCode}</td>
				</tr>
				<tr>
					<td width="120">Phone Number:</td>
					<td>${person.phoneNumber}</td>
				</tr>
				<tr>
					<td width="120">Email Id:</td>
					<td>${person.emailId}</td>
				</tr>
				<tr>
					<td><a href=<%=request.getContextPath()%>/edit/${person.id} >Edit</a></td>
					<td><a href=<%=request.getContextPath()%>/remove/${person.id} >Delete</a></td>
				</tr>

			</table>
		</article>

		<footer>
			<h6>© 2016 Sanjeev's page</h6>
		</footer>
	</div>
</body>
</html>