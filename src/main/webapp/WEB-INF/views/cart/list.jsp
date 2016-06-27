<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload = function(){
	
}
function allCheckAction(obj){
	var formObj = document.frmTmall;
	if(formObj.sellerCkeckKey || formObj.martSellerCkeckKey) {
		if(obj.checked){
			document.getElementById("bcktSeq_All").checked = true;
			document.getElementById("bcktSeq_All_bottom").checked = true;
			funcAllCheck(true);

			if (funcIsContainMart()) {
				funcMartAllCheck(true);
			}
		} else {
			document.getElementById("bcktSeq_All").checked = false;
			document.getElementById("bcktSeq_All_bottom").checked = false;
			funcAllCheck(false);

			if (funcIsContainMart()) {
				funcMartAllCheck(false);
			}
		}

		checkFuncCalReset();
	}
}


function deleteCart(cart_num){
	var params = "cart_num="+cart_num;
	var url = "delete.do";
	var delElement = document.getElementById("cart_i_"+cart_num);
	delElement.remove();
	
	sendRequest(url, params, receiveDel, "POST");
}
function receiveDel(){
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("정상 처리 완료");
		}
	}
}


</script>
<meta charset="UTF-8">
<title>:: 장바구니 - 쇼핑몰 ::</title>
</head>
<body>
<form name="frmOrderTmall" action="" method="POST">

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
	
	<tr id="cart_i_${list.cart_num}">
		<td class="chk"><!-- 체크박스(묶음상품) -->
			<label for="1295844927">
				<input type="checkbox" name="bcktSeq_B_0" value="1010930558" id="1295844927" onclick="allCheckAction(this)">
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
		<td><fmt:formatNumber value="${list.price*list.cart_cnt}" type="number"/>원</td>
		<td>
		
			<span id="salePCT"><fmt:formatNumber value="${list.price*list.cart_cnt*list.sale_pct/100}" type="number"/>원</span>
		</td>
		<td>
			<span id="DiscountPrices"><fmt:formatNumber value="${list.price*list.cart_cnt-(list.price*list.cart_cnt*list.sale_pct/100)}" type="number"/>원</span>
		</td>
		
		<td>
			<a href="#"><span>주문하기</span></a><br/>
			<a href="#" onclick="deleteCart(${list.cart_num});"><span>삭제하기</span></a>
		</td>
	</tr>
</c:forEach>
</tbody>

</table>

<div class="btnWrap">
			<input type="checkbox" name="bcktSeq_All_bottom" id="bcktSeq_All_bottom" onclick="allCheckAction(this);" title="장바구니 전체 상품 선택">선택상품 <b id="checkPrdCnt"></b>
			<a href="javascript:funcCheckDel();" class="defbtn_med mdtype6"  onClick="doCommonStat('SCSP001');"><span>삭제하기</span></a>
			<input type="hidden" name="sellerCkeckKey" value="false" />
		</div>

</form>

</body>
</html>