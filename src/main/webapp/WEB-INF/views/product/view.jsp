<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<script type="text/javascript">
	function product_list(){
		location.href="${pageContext.request.contextPath}/product/list.do";
	}
	function quantityAdd() {
		var max=${product.quantity};
		if(Number(document.getElementById("quantity").value)+1<=max){
		document.getElementById("quantity").value=Number(document.getElementById("quantity").value)+1;
		document.getElementById("sum_price").value=document.getElementById("quantity").value*${product.price};
		
		}
		else if(Number(document.getElementById("quantity").value)+1>max){
			alert("최대 수량("+max+")을 초과할 수 없습니다.");
		}
	}
	function quantityM() {
		if(Number(document.getElementById("quantity").value)-1>=1){
		document.getElementById("quantity").value=Number(document.getElementById("quantity").value)-1;
		document.getElementById("sum_price").value=document.getElementById("quantity").value*${product.price};
		}
		else if(Number(document.getElementById("quantity").value)-1<1){
			alert("최소 수량은 1이상입니다.");
		}
	}
	function chack_q(){
		var max=${product.quantity};
		if(document.getElementById("quantity").value<1 || document.getElementById("quantity").value>max){
			alert("잘못된 숫자가 들어갔습니다. 1~"+max+"값을 넣어주세요.");
			document.getElementById("quantity").value=1;
			document.getElementById("sum_price").value=document.getElementById("quantity").value*${product.price};
		}else{
		document.getElementById("sum_price").value=document.getElementById("quantity").value*${product.price};
		}
	}
	</script>

	<table>

<tr><td>${product.category}</td></tr>
<tr><Td><h2>${product.name}</h2></Td></tr>
<Tr><td rowspan="6"><img src="${pageContext.request.contextPath}/img/${product.img_url}" style="width: 300px;height: 300px;"></td><td style="color: red;font-weight: bold;'" colspan="2"> <br>${product.price}원</td></Tr>
<tr><td>판매자 </td><td> ${product.user_id}</td></tr>
<tr><td>등록일자</td><td>${product.product_date}</td></tr>
<tr><td>수량</td><td><input type="button" value="-" onclick="quantityM()"><input type="text" value=1 name="quantity" id="quantity" style="width: 35px;" onchange="chack_q()"><input type="button" value="+" onclick="quantityAdd()"></td></tr>
<tr><td>총금액</td><td><input type="text" value="${product.price*1}" name="sum_price" id="sum_price"></td></tr>
<tr><td><input type="button" onclick="orderAdd(${product.product_id})" value="구매하기"></td><td><input type="button" onclick="cartAdd(${product.product_id})" value="장바구니"></td><td><input type="button" onclick="product_list()" value="목록"></td></tr>
<tr><td colspan="2"><h3>상품정보</h3>${product.intro_content}<br><br></td></tr>


</table>