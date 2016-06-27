<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function cancelmodify(){
	location.href="${pageContext.request.contextPath }/user/maintest.do";
	
}


</script>

</head>
<body>

<form action="${pageContext.request.contextPath }/user/modify.do" name="u">
<table>
<tr><td colspan="2">deposco 회원수정양식. </tr>
<tr><td>아이디 :</td><td><input type="text" name="user_id" value="${u.user_id }" readonly="readonly"/></td></tr>
<tr><td>패스워드 :</td><td><input type="text" name="pwd" value="${u.pwd }"/></td></tr>
<tr><td>이름 :</td><td><input type="text" name="name" value="${u.name }"/></td></tr>
<tr><td>이메일 :</td><td><input type="text" name="email" value="${u.email }"/></td></tr>
<tr><td>주소 :</td><td><input type="text" name="address" value="${u.address }"/></td></tr>
<tr><td>전화번호:</td><td><input type="text" name="phone" value="${u.phone }"/></td></tr>
<tr><td>회원등급:</td><td><input type="text" name="type" value="${u.type }" readonly="readonly"/></td></tr>
<tr><td>포 인 트:</td><td><input type="text" name="point" value="${u.point }" readonly="readonly"/></td></tr>




<tr><td><input type="submit" value="변경요청"></td><td><input type="button" value="변경취소" onclick="cancelmodify()" /></td></tr>
</table>

</form>
</body>
</html>