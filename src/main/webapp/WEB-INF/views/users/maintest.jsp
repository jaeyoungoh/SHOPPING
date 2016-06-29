<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">







</script>
</head>
<body>

	<c:if test="${sessionScope.user_id != null}">
		<c:if test="${sessionScope.user_id eq 'admin'}">
			<a href="${pageContext.request.contextPath }/user/admin.do">관리자	페이지로 갑시다.</a>
			<br>
		</c:if>
	</c:if>

	<br>
<br>
<br>
<br>
${sessionScope.user_id} 현재 접속자 계정<br> 
${sessionScope.user_id}${sessionScope.name} ${sessionScope.type}
${sessionScope.name} 님 어서오세요<br>
회원님의 등급은 ${sessionScope.type} 입니다.<br>
<input type="button" value="정보수정" onclick="modify()">
<input type="button" value="로그아웃" onclick="logout()">

<form action="${pageContext.request.contextPath }/user/withdraw.do" method="post">

<input type="submit" value="회원탈퇴">
<input type="hidden" value="${SessionScope.user_id}" name="user_id">
</form>

</body>
</html>


