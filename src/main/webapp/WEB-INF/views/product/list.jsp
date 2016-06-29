<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function addProduct() {
		
		location.href="${pageContext.request.contextPath}/product/addForm.do";
	}
	$(document).ready(function(){
		
		 var test="";
	     $("input[value=삭제]").click(function(){
	   		 $("#chk:checked").each(function(){
	    	test+=$(this).val()+",";
	    	});
	 	location.href="${pageContext.request.contextPath}/product/dels.do?product_id="+test;
	    });
		
		
		
	    $("#chk_All").click(function(){
	        if($("#chk_All").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
	    });
	   
	    
	})
</script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../main.jsp" %>
<div id="cf">
	<table style="left: -20px;">
		<tr><td><c:if test="${list.size()!=0 and  sessionScope.type=='판매자'}"><input type="checkbox" id="chk_All" value="ALL" ></c:if></td></tr>
		
	
		<c:if test="${list.size()>0}">
		<c:set var="c" value="0"></c:set>
		<Tr>
		<c:forEach var="list" items="${list}">
			
				<td style="text-align:center;"><c:if test="${sessionScope.type=='판매자'}"><input type="checkbox" name="chk" id="chk" value="${list.product_id}"></c:if></td><td><a
					href="${pageContext.request.contextPath}/product/view.do?product_id=${list.product_id}"><img
						src="${pageContext.request.contextPath}/img/${list.img_url}"
						style="width: 200px; height: 200px;"></a><br>
						<a
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
			</c:choose>
						</td>
		<c:set var="c" value="${c+1}"/> 
		<c:if test="${c%4==0}"></tr><tr></c:if>	
		</c:forEach>
		</Tr>
		</c:if>
		<c:if test="${list.size()==0}">
		<tr><td>데이터가 없습니다.</td></tr>
		</c:if>
		<tfoot>
		<tr><td></td><td><c:if test="${msg=='s'}"><input type="button" value="등록" onclick="addProduct()"><input type="button" value="삭제" onclick="delProduct()"></c:if></td>
		</tr>
		</tfoot>
	</table>
	<br><BR><BR>
</div>
</body>
</html>