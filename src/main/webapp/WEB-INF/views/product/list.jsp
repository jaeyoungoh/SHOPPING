<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<c:forEach var="list" items="${list}">
<Tr><td><a href="${pageContext.request.contextPath}/product/view.do?product_id=${list.product_id}"><img src="${pageContext.request.contextPath}/img/${list.img_url}" style="width: 100px;height: 100px;"></a></td><td><a href="${pageContext.request.contextPath}/product/view.do?product_id=${list.product_id}">${list.name}</a> <br>${list.price}원</td><td>${list.user_id}</td></Tr>
</c:forEach>
</table>
</body>
</html>