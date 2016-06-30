<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
input[type="text"].aaa{
	width: 70px;
}
input[type="text"]{
	border: none;
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
 function ctype(form3){

	 form3.action="${pageContext.request.contextPath}/user/modify.do";
	 form3.submit();
/* 	 document.getElementsByName("aaa")[num].value
	if(i == 1){
		location.href="${pageContext.request.contextPath}/user/Approve1.do?user_id=${a.user_id}";	
		
	}else if(i == 2){
		location.href="${pageContext.request.contextPath}/user/Approve.do?user_id=${a.user_id}";
		
		
	}else if(i == 3){
		location.href="${pageContext.request.contextPath}/user/withdrawadmin.do?user_id=${a.user_id}";
		
	} */
		
		
	
}
 
function bbb(){	
	var list1=new Array();
	<c:forEach var="a" items="${list}">
	list1.push("${a.type}");
	</c:forEach>
	var type=document.getElementsByName("type");
	for(i=0;i<list1.length;i++){
		var node=type[i].childNodes;
		for(a=0;a<node.length;a++){
			if(node[a].value==list1[i]){
				node[a].setAttribute("selected","selected");
			}
		}
	}
 }
 


function listof(){
	location.href="${pageContext.request.contextPath}/user/listof.do?user_id=${a.user_id}";
}


function check() {
    if (document.search.keyword.value == "전체") {
    	location.href="${pageContext.request.contextPath}/user/admin.do";
    }else{
    	document.search.submit();	
    }
    
}


</script>

<style type="text/css">
td{
padding: 0px;
margin: 0;}

</style>

</head>
<body onload="bbb()">
<%@include file="../main.jsp" %>
<%-- <jsp:include page="${pageContext.request.contextPath}/resources/header.jsp"></jsp:include>
 --%>
여기는 관리자 페이지!

사람을 수정 할 수 있어요!
<div id="cf" style="left: -140px;">
<form action="${pageContext.request.contextPath}/user/search.do" name="search" method="post">
            
            <select name="keyword">
            	<option value="전체">전체보기</option>
				<option value="일반">일반</option>
				<option value="판매자">판매자</option>
				<option value="탈퇴" >탈퇴</option>
			</select>

                 <input type="button" value="검색" onClick="check()">
                 <input type="hidden" name="page" value="0">
    
    </form>  


<table >
	<tr>
		<th>사용자id</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>유형</th>
		<th>이메일</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>포인트</th>
		<th>가입일</th>
		<th>탈퇴일</th>
		<th colspan="3">등급변경</th>

	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="a" items="${list}">
	
	<tr id="tr_${i}">
	<form action="${pageContext.request.contextPath}/user/withdrawadmin.do?user_id=${a.user_id}">
		<td><input class="aaa" type="text" name="user_id" value="${a.user_id}" readonly="readonly" onclick="listof()"><input type="hidden" value="admin" name="msg"></td>
		<td><input class="aaa" type="text" name="pwd" value="${a.pwd }"></td>
		<td><input  type="text" name="name" value="${a.name }"></td>
		<c:set var="i" value="${i+1}"/>
		<td>
				<select name="type">
				<option value="일반">일반</option>
				<option value="판매자">판매자</option>
				<option value="탈퇴" >탈퇴</option>
				</select>
		</td>
		<td><input type="text" name="email" value="${a.email }"></td>
		<td><input type="text" name="address" value="${a.address }"></td>
		<td><input type="text" name="phone" value="${a.phone }"></td>
		<td><input class="aaa" type="text" name="point" value="${a.point }"></td>
		<td><input class="aaa" type="text" name="in_date" value="${a.in_date}"></td>
		<td><input class="aaa" type="text" name="out_date" value="${a.out_date }"></td>
				<%-- <th><a href="${pageContext.request.contextPath}/user/Approve1.do?user_id=${a.user_id}">일반</a></th>
				<th><a href="${pageContext.request.contextPath}/user/Approve.do?user_id=${a.user_id}">판매자</a></th>
				<th><a href="${pageContext.request.contextPath}/user/withdrawadmin.do?user_id=${a.user_id}">탈퇴</a></th>
				 --%>
				<td>
			<input type="button"  value="수정" onclick="ctype(this.form)">
				<input type="submit"  value="탈퇴">
				</td>
				
			<!-- 	<input type="button" onclick="ctype(1)" value="일반">
				<input type="button" onclick="ctype(2)" value="판매자">
				<input type="button" onclick="ctype(3)" value="탈퇴"> -->
				
				</form>
			</tr>
			
	</c:forEach>
	

</table>








<%-- <jsp:include page="${pageContext.request.contextPath}/resources/bottom.jsp"></jsp:include> --%>
</div>
</body>
</html>