<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function cancelmodify(){
	location.href="${pageContext.request.contextPath }/user/maintest.do";
	
}

function modify(){
	
var str = document.getElementById('pw');
var strn = document.getElementById('n');
var stre = document.getElementById('e');
var strp = document.getElementById('p');
var stra = document.getElementById('ad');
	
	if( str.value == '' || str.value == null ){
	    alert( '비밀번호 값을 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( str.value.replace( blank_pattern, '' ) == "" ){
	    alert('비밀번호에 공백만 입력되었습니다 ');
	    return false;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if( special_pattern.test(str.value) != true ){
	    alert('비밀번호에 특수문자가 들어있지 않습니다.');
	    return false;
	}
	
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( str.value) == true){
	    alert('비밀번호에 공백은 사용할 수 없습니다. ');
	    return false;
	}
	
	
	
	
	
	if( str.value == '' || strn.value == null ){
	    alert( '이름을 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( strn.value.replace( blank_pattern, '' ) == "" ){
	    alert('이름에 공백만 입력되었습니다 ');
	    return false;
	}
	 
	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( strn.value) == true){
	    alert('이름에 공백은 사용할 수 없습니다. ');
	    return false;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if( special_pattern.test(strn.value) == true ){
	    alert('이름에 특수문자는 사용할 수 없습니다.');
	    return false;
	}
	
	
	
	
	
	if( str.value == '' || stre.value == null ){
	    alert( '이메일을 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( stre.value.replace( blank_pattern, '' ) == "" ){
	    alert('이메일에 공백만 입력되었습니다 ');
	    return false;
	}
	 
	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( stre.value) == true){
	    alert('이메일에 공백은 사용할 수 없습니다. ');
	    return false;
	}

	var special_pattern = /[`~!#$%^&*|\\\'\";:\/?]/gi;
	if( special_pattern.test(stre.value) == true ){
	    alert('이메일에 @제외 특수문자는 사용할 수 없습니다.');
	    return false;
	}
	
	
	
	
	
	if( str.value == '' || stra.value == null ){
	    alert( '주소를 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( stra.value.replace( blank_pattern, '' ) == "" ){
	    alert('주소에 공백만 입력되었습니다 ');
	    return false;
	}
	 
	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( stra.value) == true){
	    alert('주소에 공백은 사용할 수 없습니다. ');
	    return false;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if( special_pattern.test(stra.value) == true ){
	    alert('주소에 특수문자는 사용할 수 없습니다.');
	    return false;
	}
	
	
	
	
	
	
	if( str.value == '' || strp.value == null ){
	    alert( '전화번호를 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( strp.value.replace( blank_pattern, '' ) == "" ){
	    alert('전화번호에 공백만 입력되었습니다 ');
	    return false;
	}
	 
	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( strp.value) == true){
	    alert('전화번호에 공백은 사용할 수 없습니다. ');
	    return false;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if( special_pattern.test(strp.value) == true ){
	    alert('전화번호에 특수문자는 사용할 수 없습니다.');
	    return false;
	}
	
	document.u.submit();
	
}


</script>

</head>
<body>
<%@include file="../main.jsp" %>
<form action="${pageContext.request.contextPath }/user/modify.do" name="u">
<table id="list">
<tr><td colspan="2">회원 정보수정</td> </tr>
<tr><td>아이디 :</td><td><input type="text" name="user_id" value="${u.user_id }" readonly="readonly"/></td></tr>
<tr><td>패스워드 :</td><td><input type="password" name="pwd" id="pw" value="${u.pwd }"/></td></tr>
<tr><td>이름 :</td><td><input type="text" name="name" id="n" value="${u.name }"/></td></tr>
<tr><td>이메일 :</td><td><input type="text" name="email" id="e" value="${u.email }"/></td></tr>
<tr><td>주소 :</td><td><input type="text" name="address" id="ad" value="${u.address }"/></td></tr>
<tr><td>전화번호:</td><td><input type="text" name="phone" id="p" value="${u.phone }"/></td></tr>
<tr><td>회원등급:</td><td><input type="text" name="type" value="${u.type }" readonly="readonly"/></td></tr>
<tr><td>포 인 트:</td><td><input type="text" name="point" value="${u.point }" readonly="readonly"/><input type="hidden" value="user" name="msg"></td></tr>




<tr><td><input type="button" value="변경요청" onclick="modify()" id="a"></td><td><input type="reset" value="변경취소" /></td></tr>
</table>

</form>
</body>
</html>