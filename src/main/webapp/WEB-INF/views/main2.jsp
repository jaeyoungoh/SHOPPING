<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@include file="main.jsp" %><div id="cf">
<table id="list">
<tr><td><h3>Order Best</h3></td> </tr>
<tr>
	<c:forEach var="oblist" items="${oblist}">
	<td><a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${oblist.product_id}"><img
						src="${pageContext.request.contextPath}/img/${oblist.img_url}"
						style="width: 200px; height: 200px;"></a><br>
						<a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${oblist.product_id}">${oblist.name}</a>
					<br>
					 <c:choose>
			<c:when test="${oblist.sale_pct>0}">
			<font style="text-decoration: line-through;font-size: 14px;">
			<fmt:formatNumber value="${oblist.price}" type="number"/>원</font><br>
				<font style=" font-weight: bold;">
				<fmt:formatNumber value="${oblist.sale_price}" pattern="#,##0"/>원</font>
			</c:when>
			<c:otherwise>
			<font style="font-weight: bold;">
					<fmt:formatNumber value="${oblist.sale_price}" type="number"/>원</font>
			</c:otherwise>
			</c:choose>
						</td>
	</c:forEach>
</tr>
</table>


 
 <br><BR>
 <table><tr><td>
<table id="list">
<tr><td><h3>장바구니 Best</h3></td> </tr><tr>
<c:forEach var="cblist" items="${cblist}">
	<td><a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${cblist.product_id}"><img
						src="${pageContext.request.contextPath}/img/${cblist.img_url}"
						style="width: 200px; height: 200px;"></a><br>
						<a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${cblist.product_id}">${cblist.name}</a>
					<br>
					 <c:choose>
			<c:when test="${cblist.sale_pct>0}">
			<font style="text-decoration: line-through;font-size: 14px;">
			<fmt:formatNumber value="${cblist.price}" type="number"/>원</font><br>
				<font style=" font-weight: bold;">
				<fmt:formatNumber value="${cblist.sale_price}" pattern="#,##0"/>원</font>
			</c:when>
			<c:otherwise>
			<font style="font-weight: bold;">
					<fmt:formatNumber value="${cblist.sale_price}" type="number"/>원</font>
			</c:otherwise>
			</c:choose>
						</td>
	</c:forEach>
</tr>
</table>
</td>
<td>
<table id="list">
<tr><td><h3>NEW Item</h3></td> </tr><tr>
<c:forEach var="nlist" items="${nlist}">
	<td><a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${nlist.product_id}"><img
						src="${pageContext.request.contextPath}/img/${nlist.img_url}"
						style="width: 200px; height: 200px;"></a><br>
						<a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${nlist.product_id}">${nlist.name}</a>
					<br>
					 <c:choose>
			<c:when test="${nlist.sale_pct>0}">
			<font style="text-decoration: line-through;font-size: 14px;">
			<fmt:formatNumber value="${nlist.price}" type="number"/>원</font><br>
				<font style=" font-weight: bold;">
				<fmt:formatNumber value="${nlist.sale_price}" pattern="#,##0"/>원</font>
			</c:when>
			<c:otherwise>
			<font style="font-weight: bold;">
					<fmt:formatNumber value="${nlist.sale_price}" type="number"/>원</font>
			</c:otherwise>
			</c:choose>
						</td>
	</c:forEach>
	</tr>
</table>
</td>
</tr>
</table>
</div>
</body>
</html>