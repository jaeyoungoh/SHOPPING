<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function addProduct() {
		location.href="${pageContext.request.contextPath}/product/addForm.do";
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="list" items="${list}">
			<Tr>
			
				<td><a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${list.product_id}"><img
						src="${pageContext.request.contextPath}/img/${list.img_url}"
						style="width: 100px; height: 100px;"></a></td>
				<td><a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${list.product_id}">${list.name}</a>
					<br>
				<c:choose>
			<c:when test="${list.sale_pct>0}">
			<font style="text-decoration: line-through;font-size: 14px;">
			<fmt:formatNumber value="${list.price}" type="number"/>원</font><br>
				<font style=" font-weight: bold;">
				<fmt:formatNumber value="${list.sale_price}" pattern="#,##0"/>원</font>
			</c:when>
			<c:otherwise>
			<font style="font-weight: bold;">
					<fmt:formatNumber value="${list.sale_price}" type="number"/>원</font>
			</c:otherwise>
			</c:choose></td>
				<td>${list.user_id}</td>
			</Tr>
		</c:forEach>
		<tfoot>
		<tr><td><input type="button" value="등록" onclick="addProduct()"></td>
		</tr>
		</tfoot>
	</table>
</body>
</html>