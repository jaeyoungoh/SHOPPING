<%@page import="com.kitri.shopping.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

	function product_list(){
		location.href="${pageContext.request.contextPath}/product/list.do";
	}
	function product_slist(){
		location.href="${pageContext.request.contextPath}/product/slist.do";
	}
	function quantityAdd() {
		var max=${product.quantity};
		if(Number(document.getElementById("quantity").value)+1<=max){
		document.getElementById("quantity").value=Number(document.getElementById("quantity").value)+1;
		document.getElementById("sum_price").value=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${product.sale_price}');
		//
		
		}
		else if(Number(document.getElementById("quantity").value)+1>max){
			alert("최대 수량("+max+")을 초과할 수 없습니다.");
		}
	}
	function quantityM() {
		if(Number(document.getElementById("quantity").value)-1>=1){
		document.getElementById("quantity").value=Number(document.getElementById("quantity").value)-1;
		var sum=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${product.sale_price}');
		document.getElementById("sum_price").value=sum;
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
			document.getElementById("sum_price").value=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${product.sale_price}');
		}else{
		document.getElementById("sum_price").value=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${product.sale_price}');
		}
	}
	
	function cartAdd(product_id , fmt){
		
		var chkCartMove = window.confirm("장바구니에 담은 것을 확인 하시겠습니까?");
		if(chkCartMove){
				fmt.cart_cnt.value = document.getElementById("quantity").value;
				fmt.action = "${pageContext.request.contextPath}/cart/add.do";
				fmt.submit();
		}else {
			
		}
		
	}
	function product_st(product_id,status){
		location.href="${pageContext.request.contextPath}/product/editStatus.do?product_id="+product_id+"&status="+status;
		
	}
	function product_edit(product_id){
		location.href="${pageContext.request.contextPath}/product/editForm.do?product_id="+product_id;
	}
	
	function orderAdd(product_id , fmt){
		var chkCartMove = window.confirm("해당 상품을 주문하시겠습니까?");
		if(chkCartMove){
			fmt.action="${pageContext.request.contextPath}/order/addDirect.do";
			fmt.product_cnt = document.getElementById("quantity").value;
			fmt.cart_cnt = document.getElementById("quantity").value;
			fmt.submit();
		}
	}
	</script>
	<%@include file="../main.jsp" %>
<div id="cf" style="left: 
-30px;">
<form action="" method="post">
	<table>

		<tr>
			<td>
				<%
					Product product = (Product) request.getAttribute("product");
					String category[] = product.getCategory().split(">");
					out.print("홈 &gt");
					for (int i = 0; i < category.length; i++) {
						if (i != 0) {
							out.print("<a href='" + request.getContextPath() + "/product/category.do?category="
									+ category[i - 1] + "&gt" + category[i] + "'>" + category[i] + "</a> ");
						} else {
							out.print("<a href='" + request.getContextPath() + "/product/category.do?category=" + category[i]
									+ "'>" + category[i] + "</a>");
						}
						out.print("&gt");
					}
				%>
			</td>
		</tr>
		<tr>
			<Td><h2>${product.name}</h2></Td>
		</tr>
		<Tr>
			<td rowspan="6"><img
				src="${pageContext.request.contextPath}/img/${product.img_url}"
				style="width: 300px; height: 300px;"></td>
			<td colspan="2"><BR> <c:choose>
					<c:when test="${product.sale_pct>0}">
						<fmt:formatNumber value="${product.price}" type="number" />원<br>
						<font style="color: red; font-weight: bold; font-size: 25px;">
							<fmt:formatNumber value="${product.sale_price}" pattern="#,##0" />원
						</font>
					</c:when>
					<c:otherwise>
						<font style="color: red; font-weight: bold; font-size: 25px;">
							<fmt:formatNumber value="${product.sale_price}" pattern="#,##0" />원
						</font>
					</c:otherwise>
				</c:choose></td>
		</Tr>
		<tr>
			<td>판매상태</td>
			<td>${product.status}</td>
		</tr>
		<tr>
			<td>판매자</td>
			<td>${product.user_id}</td>
		</tr>
		<tr>
			<td>등록일자</td>
			<td><fmt:formatDate value="${product.product_date}"
					pattern="YYYY-MM-dd" /></td>
		</tr>
		<tr>
			<td>수량</td>
			<td><i class="fa fa-minus fa-1" onclick="quantityM()" style="font-size: 10px;    color: #b8d4db;
			" ></i> <input
				type="text" value=1 name="quantity" id="quantity"
				style="width: 35px;     border:0px;
				 text-align: center;" onchange="chack_q()">
				<input type="hidden" name="cart_cnt" value="0" /> 
				<i class="fa fa-plus fa-1" style="font-size: 10px;color: #b8d4db;" onclick="quantityAdd()" ></i> </td>
		</tr>
		<tr>
			<td>총금액</td>
			<td
				style="border: none; color: red; font-weight: bold; font-size: 25px; text-align: right;"
				><input type="text"
				value="<fmt:formatNumber value="${product.sale_price}" pattern="#,##0"/>"
				name="sum_price" id="sum_price"
				style="border: none; color: red; font-weight: bold; font-size: 25px; text-align: right;"
				readonly="readonly">원</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" onclick="orderAdd(${product.product_id},this.form)" value="구매하기" id="a">
				<input type="hidden" name="product_cnt" value="0" /> 
				
			
				</td>
				
			<td><input type="button"
				onclick="cartAdd(${product.product_id},this.form)" value="장바구니" id="a"></td>
			<td colspan="2"><c:if
					test="${sessionScope.type=='판매자' and sessionScope.user_id==product.user_id}">
					<input type="button" onclick="product_edit(${product.product_id})"
						value="수정" id="a">
						<c:choose>
					<c:when test="${product.status=='판매중'}">
					<input type="button" onclick="product_st(${product.product_id},'판매중지')"
						value="판매중지" id="a">
					</c:when>
					<c:when test="${product.status=='판매중지'}">
					<input type="button" onclick="product_st(${product.product_id},'판매중')"
						value="판매시작" id="a">
					</c:when>
					</c:choose>
					<input type="button" onclick="product_slist()" value="판매목록" id="a">
				</c:if><input type="button" onclick="product_list()" value="목록" id="a"></td>
		</tr>
		<tr>
			<td colspan="6"><h2>상품정보</h3>${product.intro_content}<br> <br></td>
		</tr>
	</table>
	<input type="hidden" name="product_id" value="${product.product_id}" />
</form>
</div>