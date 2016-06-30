<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function cancelOrder(form1){
	var chkCancel = window.confirm("정말로 구매를 취소 하시겠습니까?");
	if(chkCancel){
	form1.action = "${pageContext.request.contextPath}/order/update.do";
	form1.product_status.value='구매취소';
	form1.submit();
	}
	
}
function payOrder(form1){
	var chkCancel = window.confirm("정말로 결제를 하시겠습니까?");
	if(chkCancel){
	form1.action = "${pageContext.request.contextPath}/order/update.do";
	form1.product_status.value='결제완료';
	form1.submit();
	}
	
}
function decideOrder(form1){
	var chkCancel = window.confirm("정말로 '구매확정'을 하시겠습니까?");
	if(chkCancel){
	form1.action = "${pageContext.request.contextPath}/order/update.do";
	form1.product_status.value='구매확정';
	form1.submit();
	}
	
}
function addReview(form1){
	form1.action = "${pageContext.request.contextPath}/order/update.do";
	form1.product_status.value='리뷰보기';
	form1.submit();
	
}

</script>
<meta charset="UTF-8">
<title>:: 최근 주문 정보 - 쇼핑몰 ::</title>
</head>
<body>
<%@include file="../main.jsp" %>
<table id="list" style="width: 800px;">
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
<form name="orderFRM" method="post" >
	<tr>
		<td style="text-align: center;">${list.order_num}</td>
		<td style="text-align: center;">
		<img src="${pageContext.request.contextPath}/img/${list.img_url}" style="width:90px;height: 90px;"><br>
		${list.name} 
		</td>
		<td>${list.order_date}</td>
		<td style="text-align: center;">${list.product_cnt}</td>
		<td style="border: none; font-weight: bold; font-size: 15px; text-align: right;">
			<fmt:formatNumber value="${list.price}" pattern="#,##0"/>원</td>
		<td style="text-align: center;">${list.product_status}</td>
		<td>
		
		<input type="hidden" name="product_status" value="${list.product_status}" />
		<input type="hidden" name="order_num" value="${list.order_num}" />
			<c:choose>
				<c:when test="${list.product_status eq '결제완료'}">
					<input type="button" onclick="decideOrder(this.form)" value="구매결정" id="a"> <br/><br/>
					<input type="button" onclick="cancelOrder(this.form)" value="구매취소" id="a"> <br/>
				</c:when>
				<c:when test="${list.product_status eq '결제 대기중'}">
					<input type="button" onclick="payOrder(this.form)" value="결제하기" id="a"> <br/>
				</c:when>
				<c:when test="${list.product_status ne '구매취소' && list.product_status ne '리뷰보기' && list.product_status ne '구매확정' && list.product_status ne '리뷰작성완료'}">
					<input type="button" onclick="cancelOrder(this.form)" value="구매취소" id="a"> <br/>
				</c:when>
				<c:when test="${list.product_status eq '구매확정'}">
						<input type="button" onclick="addReview(this.form)" value="리뷰작성" id="a"><br/> 
				</c:when>
				<c:when test="${list.product_status eq '리뷰작성완료'}">
						<input type="button" onclick="addReview(this.form)" value="리뷰보기" id="a"> <br/>
				</c:when>
			</c:choose>
		</td>
	</tr>
</form>
	</c:forEach>
</thead>
</table>

</body>
</html>