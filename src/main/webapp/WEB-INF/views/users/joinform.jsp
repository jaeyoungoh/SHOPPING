<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function canceljoin(){
	location.href="${pageContext.request.contextPath }/user/main.do";
	
}

</script>


</head>
<body>
<form action="${pageContext.request.contextPath }/user/adduser.do">
<table>
<tr><td colspan="2">deposco 회원가입양식. 환영합니다.</tr>
<tr><td>아이디 :</td><td><input type="text" name="user_id" /></td></tr>
<tr><td>패스워드 :</td><td><input type="text" name="pwd" /></td></tr>
<tr><td>이름 :</td><td><input type="text" name="name" /></td></tr>
<tr><td>이메일 :</td><td><input type="text" name="email" /></td></tr>
<tr><td>주소 :</td><td><input type="text" name="address" /></td></tr>
<tr><td>전화번호:</td><td><input type="text" name="phone" /></td></tr>


<tr><td><input type="submit" value="가입요청"></td><td><input type="button" value="가입취소" onclick="canceljoin()" /></td></tr>
</table>

</form>

</body>
</html>