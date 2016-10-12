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
			<h1>Add a Person</h1>

			<c:url var="addAction" value="/person/add"></c:url>

			<form:form action="${addAction}" commandName="person">
				<table class="tg">
					<c:if test="${!empty person.firstName}">
						<tr>
							<td><form:label path="id">
									<spring:message text="Person ID" />
								</form:label></td>
						</tr>
						<tr>
							<td><form:input path="id" readonly="true" size="8"
									disabled="true" /> <form:hidden path="id" /></td>
						</tr>
					</c:if>
					<tr>
						<td><form:label path="firstName">
								<spring:message text="First Name" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="firstName" /></td>
					</tr>
					<tr>
						<td><form:label path="lastName">
								<spring:message text="Last Name" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="lastName" /></td>
					</tr>
					<tr>
						<td><form:label path="addressLine1">
								<spring:message text="Address Line 1" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="addressLine1" /></td>
					</tr>
					<tr>
						<td><form:label path="addressLine2">
								<spring:message text="Address Line 2" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="addressLine2" /></td>
					</tr>
					<tr>
						<td><form:label path="cityName">
								<spring:message text="City Name" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="cityName" /></td>
					</tr>
					<tr>
						<td><form:label path="stateName">
								<spring:message text="State Name" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="stateName" /></td>
					</tr>
					<tr>
						<td><form:label path="zipCode">
								<spring:message text="Zip Code" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="zipCode" /></td>
					</tr>
					<tr>
						<td><form:label path="phoneNumber">
								<spring:message text="Phone Number" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="phoneNumber" /></td>
					</tr>
					<tr>
						<td><form:label path="emailId">
								<spring:message text="Email Id" />
							</form:label></td>
					</tr>
					<tr>
						<td><form:input path="emailId" /></td>
					</tr>
					<tr>
						<td colspan="2"><c:if test="${!empty person.firstName}">
								<input type="submit"
									value="<spring:message text="Edit Person"/>"
									style="color: white; background-color: #2ecc71; font-size: 14px; width: 100%; height: 70px;" />
							</c:if> <c:if test="${empty person.firstName}">
								<input type="submit" value="<spring:message text="Add Person"/>"
									style="color: white; background-color: #2ecc71; font-size: 14px; width: 100%; height: 70px;" />
							</c:if></td>
					</tr>
				</table>
			</form:form>
			<p>
				<br>
			</p>
			<h3>Persons List</h3>

			<h4>
				To view the list of persons, click <a
					href="<c:url value='/personList' />">here</a>
			</h4>

		</article>

		<footer>
			<h6>© 2016 Sanjeev's page</h6>
		</footer>
	</div>
</body>
</html>
