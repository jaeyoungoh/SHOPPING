<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){	
	 $("#chk_All").click(function(){
	        if($("#chk_All").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
	    });
	 $("#chk_All2").click(function(){
	        if($("#chk_All2").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
	    });
});

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

function addOrder(form1){
	//console.log("폼 이름 : "+form1.name);
	//console.log("form1 아이디 : "+form1.product_id.value+" 갯수 : "+form1.product_cnt.value);
	form1.action="${pageContext.request.contextPath}/order/add.do";
	form1.submit();
	
}

</script>
<meta charset="UTF-8">
<title>:: 장바구니 - 쇼핑몰 ::</title>
</head>
<body onload="msgUpdateCNTcheck()">
<%@include file="../main.jsp" %>
<div id="cf">
<form name="frmOrderMall" action="" method="POST">

<table id="list" style="
    width: 950px;
    margin: 30px;
">
<thead>
	<tr>	
		<th scope="col" class=""><label for="bcktSeq_All"><input id="chk_All" name="chk" type="checkbox" value="ALL" title="전체상품선택"></label></th>
		<th scope="col">상품정보</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col" class="thtype2">할인금액</th>
		<th scope="col" class="thtype2">할인적용금액</th>
		<th scope="col">주문</th>
	</tr>
</thead>
<tbody>

<c:if test="${list.size()==0}"><td colspan="7">장바구니가 비어있습니다.</td></c:if>
<c:forEach var="list"  items="${list}">
<form name="frm" action="${pageContext.request.contextPath}/cart/update.do" method="post">
	<tr id="cart_i_${list.cart_num}">
		<td class="chk"><!-- 체크박스(묶음상품) -->
			<label for="1295844927">
				<input type="checkbox" class="chk_All" name="chk" value="">
			</label>
	
		</td>
		<td class="td_prdwrap" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/product/view.do?product_id=${list.product_id}">
			<img src="${pageContext.request.contextPath}/img/${list.img_url}" style="width: 90px; height:90px;"/>
			<br/>
			${list.product_name}
			</a>
		</td>
		<td>
			<input type="text" name="cart_cnt" value="${list.cart_cnt}" style="width: 47px; height: 19px; text-align: right;">
				<input type="button" onclick="reqUpdate(this.form)" value="변경" id="a"/>
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
			<input type="button" value="주문하기" onclick="addOrder(this.form);" id="a"/>
			<input type="hidden" name = "product_cnt" value="${list.cart_cnt}" /> 
			<input type="button" value="삭제하기" onclick="deleteCart(${list.cart_num});" id="a"/>
		</td>
	</tr>
			</form>
</c:forEach>
	
</tbody>

</table>

<input type="checkbox" name="chk" id="chk_All2" value="ALL" title="장바구니 전체 상품 선택">선택상품 <b id="checkPrdCnt"></b>
<a href="javascript:funcCheckDel();"  onClick=""><span>전체 삭제하기</span></a>
</form>
</div>
</body>
</html>