<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Welcome Page</title>
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
				<li><a href="<c:url value='/comments' />">Submit a Comment</a></li>
				<li><a href="<c:url value='/books' />">Submit contact
						information</a></li>
			</ul>
		</nav>
		<article>
			<h2 style="color: purple">Welcome to this page</h2>
			<p>Nepal is bordered by China to the north and India to the
				south, east, and west. It is separated from Bangladesh by a narrow
				Indian corridor and from Bhutan by the Indian state of Sikkim. Nepal
				is located in the Himalayas and is home to eight of the world's ten
				tallest mountains, including Mount Everest, the highest point on
				Earth. Its southern Madhesh region is fertile and humid.[11] The
				country has an area of 147,181 square kilometres (56,827 sq mi),
				making it the world's 93rd largest country by area.[12] It is also
				the 41st most populous country. Nepal has a diverse ancient cultural
				heritage. The name Nepal is first recorded in texts from the Vedic
				Age, the era that founded Hinduism, the country's predominant
				religion. Nepal was the world's last Hindu monarchy.[13] Siddharta
				Gautama, the founder of Buddhism, was born in Lumbini in southern
				Nepal. The main minorities are Tibetan Buddhists, Muslims, Kiratans
				and Christians. The Nepalese are also known as Gurkhas. They have
				been reputed for their valour in World War I and World War II.</p>

			<p>Nepal is bordered by China to the north and India to the
				south, east, and west. It is separated from Bangladesh by a narrow
				Indian corridor and from Bhutan by the Indian state of Sikkim. Nepal
				is located in the Himalayas and is home to eight of the world's ten
				tallest mountains, including Mount Everest, the highest point on
				Earth. Its southern Madhesh region is fertile and humid.[11] The
				country has an area of 147,181 square kilometres (56,827 sq mi),
				making it the world's 93rd largest country by area.[12] It is also
				the 41st most populous country. Nepal has a diverse ancient cultural
				heritage. The name Nepal is first recorded in texts from the Vedic
				Age, the era that founded Hinduism, the country's predominant
				religion. Nepal was the world's last Hindu monarchy.[13] Siddharta
				Gautama, the founder of Buddhism, was born in Lumbini in southern
				Nepal. The main minorities are Tibetan Buddhists, Muslims, Kiratans
				and Christians. The Nepalese are also known as Gurkhas. They have
				been reputed for their valour in World War I and World War II.</p>

			<p>Nepal is bordered by China to the north and India to the
				south, east, and west. It is separated from Bangladesh by a narrow
				Indian corridor and from Bhutan by the Indian state of Sikkim. Nepal
				is located in the Himalayas and is home to eight of the world's ten
				tallest mountains, including Mount Everest, the highest point on
				Earth. Its southern Madhesh region is fertile and humid.[11] The
				country has an area of 147,181 square kilometres (56,827 sq mi),
				making it the world's 93rd largest country by area.[12] It is also
				the 41st most populous country. Nepal has a diverse ancient cultural
				heritage. The name Nepal is first recorded in texts from the Vedic
				Age, the era that founded Hinduism, the country's predominant
				religion. Nepal was the world's last Hindu monarchy.[13] Siddharta
				Gautama, the founder of Buddhism, was born in Lumbini in southern
				Nepal. The main minorities are Tibetan Buddhists, Muslims, Kiratans
				and Christians. The Nepalese are also known as Gurkhas. They have
				been reputed for their valour in World War I and World War II.</p>

			<h4>
				To submit your contact information, click <a
					href="<c:url value='/persons' />">here</a>
			</h4>
			<br>
			<h4>
				To submit a book, click <a href="<c:url value='/books' />">here</a>
			</h4>
			<br>
			<h4>
				To view the list of books, click <a
					href="<c:url value='/book/view/all' />">here</a>
			</h4>
		</article>

		<footer>
			<h6>© 2016 Sanjeev's page</h6>
		</footer>
	</div>
</body>
</html>