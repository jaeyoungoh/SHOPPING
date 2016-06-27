<%@page import="com.kitri.shopping.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function product_list(){
		location.href="${pageContext.request.contextPath}/product/list.do";
	}
	function quantityAdd() {
		var max=${product.quantity};
		if(Number(document.getElementById("quantity").value)+1<=max){
		document.getElementById("quantity").value=Number(document.getElementById("quantity").value)+1;
		document.getElementById("sum_price").value=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${(product.price-(product.price*product.sale_pct/100))}');
		//
		
		}
		else if(Number(document.getElementById("quantity").value)+1>max){
			alert("최대 수량("+max+")을 초과할 수 없습니다.");
		}
	}
	function quantityM() {
		if(Number(document.getElementById("quantity").value)-1>=1){
		document.getElementById("quantity").value=Number(document.getElementById("quantity").value)-1;
		var sum=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${(product.price-(product.price*product.sale_pct/100))}');
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
			document.getElementById("sum_price").value=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${(product.price-(product.price*product.sale_pct/100))}');
		}else{
		document.getElementById("sum_price").value=new Intl.NumberFormat().format(document.getElementById("quantity").value*'${(product.price-(product.price*product.sale_pct/100))}');
		}
	}
	</script>
	<form action="" method="post">
<table>

	<tr>
		<td><%Product product=(Product)request.getAttribute("product");
				String category[]=product.getCategory().split(">");
				out.print("홈 &gt");
				for(int i=0;i<category.length;i++){
					if(i!=0){
					out.print("<a href='"+request.getContextPath()+"/product/category.do?category="+category[i-1]+"&gt"+category[i]+"'>"+category[i]+"</a> ");
					}else{
						out.print("<a href='"+request.getContextPath()+"/product/category.do?category="+category[i]+"'>"+category[i]+"</a>");
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
		<td colspan="2"> <BR>
		<c:choose>
			<c:when test="${product.sale_pct>0}">
			<fmt:formatNumber value="${product.price}" type="number"/>원<br>
				<font style="color: red; font-weight: bold;font-size: 25px;">
				<fmt:formatNumber value="${product.price-(product.price*product.sale_pct/100)}" type="number"/>원</font>
			</c:when>
			<c:otherwise>
			<font style="color: red; font-weight: bold;font-size: 25px;">
					<fmt:formatNumber value="${product.price}" type="number"/>원</font>
			</c:otherwise>
			</c:choose>
			</td>
	</Tr>
	<tr>
		<td>판매자</td>
		<td>${product.user_id}</td>
	</tr>
	<tr>
		<td>등록일자</td>
		<td>${product.product_date}</td>
	</tr>
	<tr>
		<td>수량</td>
		<td><input type="button" value="-" onclick="quantityM()"><input
			type="text" value=1 name="quantity" id="quantity"
			style="width: 35px;text-align: center;" onchange="chack_q()" ><input
			type="button" value="+" onclick="quantityAdd()"></td>
	</tr>
	<tr>
		<td>총금액</td>
		<td style="border: none;color: red; font-weight: bold;font-size: 25px;text-align: right;" colspan="2"><input type="text" value="<fmt:formatNumber value="${(product.price-(product.price*product.sale_pct/100))*1}" type="number"/>"
			name="sum_price" id="sum_price" style="border: none;color: red; font-weight: bold;font-size: 25px;text-align: right;" readonly="readonly">원</td>
	</tr>
	<tr>
		<td><input type="button"
			onclick="orderAdd(${product.product_id},this.form)" value="구매하기"></td>
		<td><input type="button" onclick="cartAdd(${product.product_id},this.form)"
			value="장바구니"></td>
		<td><input type="button" onclick="product_list()" value="목록"></td>
	</tr>
	<tr>
		<td colspan="6"><h3>상품정보</h3>${product.intro_content}<br>
		<br></td>
	</tr>


</table>
</form>