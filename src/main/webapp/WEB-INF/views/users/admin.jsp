<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>



</head>
<body>

여기는 관리자 페이지!

사람을 마구 삭제할 수 있어요!

<table border="0" cellspacing="0">
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
	
	<c:forEach var="a" items="${list}">
	<tr>
		<th>${a.user_id}</th>
		<th><input type="text" name="pwd" value="${a.pwd }"></th>
		<th><input type="text" name="name" value="${a.name }"></th>
		<th><input type="text" name="type" value="${a.type }"></th>
		<th><input type="text" name="email" value="${a.email }"></th>
		<th><input type="text" name="address" value="${a.address }"></th>
		<th><input type="text" name="phone" value="${a.phone }"></th>
		<th><input type="text" name="point" value="${a.point }"></th>
		<th>${a.in_date }</th>
		<th>${a.out_date }</th>
		<th><a href="${pageContext.request.contextPath}/user/Approve1.do?user_id=${a.user_id}">일반</a></th>
		<th><a href="${pageContext.request.contextPath}/user/Approve.do?user_id=${a.user_id}">판매자</a></th>
		<th><a href="${pageContext.request.contextPath}/user/withdrawadmin.do?user_id=${a.user_id}">탈퇴</a></th>
	</tr>
	</c:forEach>
	

</table>
</form>


</body>
</html>