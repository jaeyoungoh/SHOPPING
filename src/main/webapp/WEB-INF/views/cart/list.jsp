<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
<script type="text/javascript">
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

function msgUpdateCNTcheck(){
	var msg = "${param.update_msg}";
	if(msg =="success"){
		alert("수량이 변경되었습니다.");
	}else if(msg =="fail"){
		alert("최대수량은 "+"${param.max_cnt}"+" 입니다. 수량을 다시 확인해주세요.");
	}
}

function reqUpdate(form1){
	form1.action="${pageContext.request.contextPath}/cart/update.do";
	form1.submit();
}

function allCheckAction(){
}

</script>
<meta charset="UTF-8">
<title>:: 장바구니 - 쇼핑몰 ::</title>
</head>
<body onload="msgUpdateCNTcheck()">
<form name="frmOrderMall" action="" method="POST">

<table>
<thead>
	<tr>	
		<th scope="col" class="chk"><label for="bcktSeq_All"><input name="bcktSeq_All" type="checkbox" value="" id="bcktSeq_All" onclick="allCheckAction();" title="전체상품선택"></label></th>
		<th scope="col">상품정보</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col" class="thtype2">할인금액</th>
		<th scope="col" class="thtype2">할인적용금액</th>
		<th scope="col">주문</th>
	</tr>
</thead>
<tbody>
<c:forEach var="list"  items="${list}">
<form name="frm" action="${pageContext.request.contextPath}/cart/update.do" method="post">
	<tr id="cart_i_${list.cart_num}">
		<td class="chk"><!-- 체크박스(묶음상품) -->
			<label for="1295844927">
				<input type="checkbox" name="cartList" value="${list.cart_num}">
			</label>
						
		</td>
		<td class="td_prdwrap">
			${list.product_name}
			<br/>
			 	<div class="dp_photo">
			 		<img src="${pageContext.request.contextPath}/img/${list.img_url}" style="width: 90px; height:90px;"/>
				</div>
			
		</td>
		<td>
			<input type="text" name="cart_cnt" value="${list.cart_cnt}" style="width: 47px; height: 19px;"><br/>
				<input type="button" onclick="reqUpdate(this.form)" value="변경" />
				<input type="hidden"  name="cart_num" value="${list.cart_num}"/>
				<input type="hidden"  name="product_id" value="${list.product_id}"/>
		</td>
		<td><fmt:formatNumber value="${list.price}" type="number"/>원</td>
		<td>
		
			<span id="salePCT"><fmt:formatNumber value="${list.sale_pct}" type="number"/>원</span>
		</td>
		<td>
			<span id="DiscountPrices"><fmt:formatNumber value="${list.sale_price}" type="number"/>원</span>
		</td>
		
		<td>
			<a href="#"><span>주문하기</span></a><br/>
			<a href="#" onclick="deleteCart(${list.cart_num});"><span>삭제하기</span></a>
		</td>
	</tr>
			</form>
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