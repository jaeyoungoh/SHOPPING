<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 최근 주문 정보 - 쇼핑몰 ::</title>
</head>
<body>

<table>
<thead>
	<tr>
		<th class="first" scope="col">주문번호</th>
		<th scope="col">주문 상품 정보</th>
		<th class="first" scope="col">주문일자</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col">주문상태</th>
		<th scope="col">확인/취소/리뷰</th>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td style="text-align: center;">${list.order_num}</td>
		<td>${list.name} <br>
		<img src="${list.img_url}" style="width:90px;height: 90px;">
		</td>
		<td>${list.order_date}</td>
		<td style="text-align: center;">${list.product_cnt}</td>
		<td style="border: none; font-weight: bold; font-size: 15px; text-align: right;">
		<fmt:formatNumber value="${list.price}" pattern="#,##0"/>원</td>
		<td style="text-align: center;">${list.product_status}</td>
		<td>
			<c:if test="${list.product_status ne '환불' && list.product_status ne '결제취소' && list.product_status ne '결제완료'}">
			<c:if test="${list.product_status eq '결제완료'}">
				<input type="button" value="구매결정"> <br/>
			</c:if>
				<input type="button" value="취소"> <br/>
			</c:if>
				<input type="button" value="리뷰작성"> 
		</td>
	</tr>
	</c:forEach>
</thead>

</table>
</body>
</html>