<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<script type="text/javascript">
window.onload = function(){
	
}


</script>
<meta charset="UTF-8">
<title>:: 장바구니 - 쇼핑몰 ::</title>
</head>
<body>

<table>
<thead>
	<tr>	
		<th scope="col" class="chk"><label for="bcktSeq_All"><input name="bcktSeq_All" type="checkbox" value="" id="bcktSeq_All" onclick="allCheckAction(this);" title="전체상품선택"></label></th>
		<th scope="col">상품정보</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col" class="thtype2">할인금액</th>
		<th scope="col" class="thtype2">할인적용금액</th>
		<th scope="col">주문</th>
	</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
	
	<tr>
		<td class="chk"><!-- 체크박스(묶음상품) -->
			<label for="1295844927">
				<input type="checkbox" name="bcktSeq_B_0" value="1010930558" id="1295844927" onclick="">
			</label>
						
		</td>
		<td class="td_prdwrap">
		
			<div class="OrderPrdW_Goods">
			 	<div class="dp_photo">
			 		<img src="${pageContext.request.contextPath}/img/${list.img_url}" style="width: 90px; height:90px;"/>
				</div>
			</div>
			${list.product_name}
		</td>
		<td><input type="text" name="cart_cnt" value="${list.cart_cnt }" style="width: 47px; height: 19px;"><br/>
			<a href="#"><span id=cartCnt>변경</span></a>
		</td>
		<td>${list.price}</td>
		<td>
			<span id="salePCT"></span>
		</td>
		<td>
			<span id="DiscountPrices"></span>
		</td>
		
		<td>
			<a href="#"><span>주문하기</span></a>
			<a href="#"><span>삭제하기</span></a>
		</td>
	</tr>
</c:forEach>
</tbody>

</table>


</body>
</html>