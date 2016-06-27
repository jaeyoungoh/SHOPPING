<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deposco에 오신 것을 환영합니다.</title>
<script type="text/javascript">


function join(){

	location.href="${pageContext.request.contextPath }/user/joinform.do"
}

function admin(){

	location.href="${pageContext.request.contextPath }/user/admin.do"
}


</script>
</head>
<body>

<h2>어서오세요</h2>
 

	<form action="${pageContext.request.contextPath }/user/login.do" method="post">
		<table>
			<tr>
				<c:if test="${sessionScope.id == null}">
					<td>아 이 디 </td><td> <input type="text" name="user_id" /></td>
				</c:if>
			</tr>
			<tr>
				<c:if test="${sessionScope.id == null}">
					<td>비밀번호 </td><Td><input type="text" name="pwd" /></Td>
				</c:if>
				<c:if test="${sessionScope.id != null}">
					<c:if test="${sessionScope.id == 'admin'}">
						<td><input type="button" onclick="adminpage()" /></td>
					</c:if>
				</c:if>
			</tr>
			<tr>
			<td><input type="submit" value="로그인" /></td><td><input type="button" value="회원가입" onclick="join()" /></td>
			</tr>
		</table>
	</form>

</body>
</html>