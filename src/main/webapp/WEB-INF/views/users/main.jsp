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

function login(){
	var str = document.getElementById('i');
	
	if( str.value == '' || str.value == null ){
	    alert( '아이디 값을 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( str.value.replace( blank_pattern, '' ) == "" ){
	    alert('아이디란에 공백만 입력되었습니다 ');
	    return false;
	}
	 
	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( str.value) == true){
	    alert('아이디에 공백은 사용할 수 없습니다. ');
	    return false;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if( special_pattern.test(str.value) == true ){
	    alert('아이디에 특수문자는 사용할 수 없습니다.');
	    return false;
	}
	
	
	
	var strp = document.getElementById('p');
	
	if( strp.value == '' || str.value == null ){
	    alert( '비밀번호 값을 입력해주세요' );
	    return false;
	}
	

	document.lg.submit();
}

function findpwd(){
	location.href="${pageContext.request.contextPath }/user/findpwd.do"
	
}




</script>
</head>
<body>
<h2>어서오세요</h2>
 

	<form action="${pageContext.request.contextPath }/user/login.do" name="lg" method="post">
		<table>
			<tr>
				<c:if test="${sessionScope.user_id == null}">
					<td>아 이 디 </td><td> <input type="text" name="user_id" id="i" /></td>
				</c:if>				
				
			</tr>
			<tr>
				<c:if test="${sessionScope.user_id == null}">
					<td>비밀번호 </td><Td><input type="password" name="pwd" id="p"/></Td>
				</c:if>
				
			</tr>
			<tr>
			<td><input type="button" value="로그인" onclick="login()"/></td><td><input type="button" value="회원가입" onclick="join()" /></td>
			
			<td><input type="button" value="비밀번호 찾기" onclick="findpwd()" /></td>
			</tr>
		</table>
	</form>

</body>
</html>