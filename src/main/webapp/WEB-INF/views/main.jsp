<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<LINK rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/css/menu.css">
	<ul class="nav">
		<li><a href="#">Home</a></li>
		<li class="dropdown"><a href="#">Work</a>
			<ul>
				<li><a href="#">Web Design</a></li>
				<li><a href="#">UX Design</a></li>
				<li><a href="#">Development</a></li>
				<li><a href="#">Identity</a></li>
				<li class="dropdown"><a href="#">Game Development</a>
					<ul>
						<li><a href="#">Level 2</a></li>
						<li><a href="#">Level 2</a></li>
						<li><a href="#">Level 2</a></li>
						<li><a href="#">Level 2</a></li>
						<li class="dropdown"><a href="#">Level 2</a>
							<ul>
								<li><a href="#">Level 3</a></li>
								<li class="dropdown"><a href="#">Level 3</a>
									<ul>
										<li><a href="#">Level 4</a></li>
										<li><a href="#">Level 4</a></li>
										<li><a href="#">Level 4</a></li>
									</ul></li>
								<li><a href="#">Level 3</a></li>
								<li><a href="#">Level 3</a></li>
								<li><a href="#">Level 3</a></li>
							</ul></li>
					</ul></li>
			</ul></li>
		<li><a href="#">Services</a></li>
		<li><a href="#">About</a></li>
		<li><a href="#">Contact</a></li>
	</ul>

	<div id="container"></div>
</body>
</html>